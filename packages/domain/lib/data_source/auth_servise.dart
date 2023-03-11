import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  late final FirebaseAuth _auth;
  AuthService(this._auth);

  Stream<User?> get user => _auth.authStateChanges();

  String? get userId => _auth.currentUser?.uid;

  Future getUserData() async {
    try {
      User? user = _auth.currentUser;
      return user;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

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

  Future signInWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return result.user;
    } catch (e){
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

  Future registerWithEmailAndPassword(String email,String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return result.user;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try{
      return await _auth.signOut();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

  Future userPhotoUpdate(String url) async {
    try{
      User user = _auth.currentUser!;
      return await user.updatePhotoURL(url);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future userDisplayNameUpdate(String nickName) async{
    try{
      User user = _auth.currentUser!;
      return await user.updateDisplayName(nickName);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future userDelete() async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        if (kDebugMode) {
          print('The user must reauthenticate before this operation can be executed.');
        }
      }
    }
  }

}