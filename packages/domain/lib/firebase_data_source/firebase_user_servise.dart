import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../models/users_api_models/user_data_model.dart';
import '../repositories/user_repository.dart';
import 'firebase_constants.dart';

class FirebaseUserService extends UserService {
  late final FirebaseAuth _auth;
  late final FirebaseFirestore _store;
  FirebaseUserService(this._auth, this._store);

  CollectionReference get _usersStoreCollection => _store.collection(CollectionsNaming.users.serialize());

  @override
  Stream<User?> get user => _auth.authStateChanges();

  @override
  String? get userId => _auth.currentUser?.uid;

  @override
  Future<UserCredential?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    try {
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  String generateNonce([int length = 32]) {
    const charset = '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)]).join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  @override
  Future<UserCredential> signInWithApple() async {
    // To prevent replay attacks with the credential returned from Apple, we
    // include a nonce in the credential request. When signing in with
    // Firebase, the nonce in the id token returned by Apple, is expected to
    // match the sha256 hash of `rawNonce`.
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    return await _auth.signInWithCredential(oauthCredential);
  }

  //sign out
  @override
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

  @override
  Future userPhotoUpdate(String url) async {
    try {
      User user = _auth.currentUser!;
      return await user.updatePhotoURL(url);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  @override
  Future userDisplayNameUpdate(String nickName) async {
    try {
      User user = _auth.currentUser!;
      return await user.updateDisplayName(nickName);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  @override
  Future userDelete() async {
    try {
      await _auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        if (kDebugMode) {
          print('The user must re-authenticate before this operation can be executed.');
        }
      }
    }
  }

  @override
  Future<bool> checkUserData() async {
    final UserDataModel userDataModel = UserDataModel.fromFirebaseUser(_auth.currentUser);
    final QuerySnapshot<Object?> snapshot =
        await _usersStoreCollection.where("email", isEqualTo: userDataModel.email).get();
    if (snapshot.docs.isEmpty) {
      final DocumentReference<Object?> ref = await _usersStoreCollection.add(userDataModel.toJson());
      return ref.get().then((value) async {
        await updateUserData(userDocId: ref.id, userDataModel: userDataModel.copyWith(userDocId: ref.id));
        return true;
      }).catchError((e) => false);
    } else {
      return snapshot.docs.isNotEmpty;
    }
  }

  @override
  Future<UserDataModel?> getUserData({required String userDocId}) async {
    final DocumentSnapshot<Object?> snapshot = await _usersStoreCollection.doc(userDocId).get();
    if (snapshot.exists) {
      return UserDataModel.fromJson(snapshot.data() as Map<String, dynamic>);
    } else {
      return null;
    }
  }

  @override
  Future<bool> updateUserData({required String userDocId, required UserDataModel userDataModel}) async {
    return await _usersStoreCollection
        .doc(userDocId)
        .update(userDataModel.toJson())
        .then((value) => true)
        .catchError((error) => false);
  }
}
