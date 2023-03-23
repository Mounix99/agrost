import 'package:domain/repositories/user_repository.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  late UserRepository _authRepository;

  @override
  void onInit() {
    _authRepository = Get.find();
    super.onInit();
  }

  Future<void> checkAuth() async {
    final credentials = await _authRepository.signInWithGoogle();
    if (credentials != null) {
      _authRepository
          .checkUserData()
          .then((value) => value ? Get.offNamed(Routes.HOME) : Get.snackbar("Error", "credentials are null"));
    } else {
      Get.snackbar("Error", "credentials are null");
    }
  }
}
