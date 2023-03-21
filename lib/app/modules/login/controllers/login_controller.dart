import 'package:domain/repositories/user_repository.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  late UserService _authService;

  @override
  void onInit() {
    _authService = Get.find();
    super.onInit();
  }

  Future<void> checkAuth() async {
    final credentials = await _authService.signInWithGoogle();
    if (credentials != null) {
      _authService
          .checkUserData()
          .then((value) => value ? Get.offNamed(Routes.HOME) : Get.snackbar("Error", "credentials are null"));
    } else {
      Get.snackbar("Error", "credentials are null");
    }
  }
}
