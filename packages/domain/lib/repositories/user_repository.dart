import 'package:firebase_auth/firebase_auth.dart';

abstract class UserService {
  Stream<User?> get user;

  String? get userId;

  Future<UserCredential?> signInWithGoogle();

  Future<UserCredential> signInWithApple();

  Future signOut();

  Future userPhotoUpdate(String url);

  Future userDisplayNameUpdate(String nickName);

  Future userDelete();
}
