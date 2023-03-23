import 'package:firebase_auth/firebase_auth.dart';

import '../models/users_api_models/user_data_model.dart';

abstract class UserRepository {
  Stream<User?> get user;

  User? get currentUser;

  String? get userId;

  Future<UserCredential?> signInWithGoogle();

  Future<UserCredential> signInWithApple();

  Future signOut();

  Future userPhotoUpdate(String url);

  Future userDisplayNameUpdate(String nickName);

  Future userDelete();

  Future<bool> checkUserData();

  Future<UserDataModel?> getUserData({required String userDocId});

  Future<String> getCurrentUserDocId();

  Future<bool> updateUserData({required String userDocId, required UserDataModel userDataModel});
}
