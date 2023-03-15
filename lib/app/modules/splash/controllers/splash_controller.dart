import 'package:domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  late AuthService _authService;

  @override
  void onInit() {
    _authService = Get.find();
    super.onInit();
  }

  checkUser() async {
    _authService.user.listen((User? user) {
      if (user != null) {
        Future.delayed(const Duration(seconds: 3)).then((value) => Get.offNamed(Routes.HOME));
      } else {
        Future.delayed(const Duration(seconds: 3)).then((value) => Get.offNamed(Routes.LOGIN));
      }
    });
  }
}
