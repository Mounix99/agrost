import 'package:domain/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  late UserService _authService;

  @override
  void onInit() {
    _authService = Get.find();
    super.onInit();
  }

  Stream<User?> get user => _authService.user;
}
