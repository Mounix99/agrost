import 'package:domain/data_source/auth_servise.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  late AuthService _authService;
  @override
  void onInit() {
    _authService = Get.find();
    checkUser();
    super.onInit();
  }

  checkUser() {
    _authService.user.listen((User? user) {
      if (user != null) {
        Get.offNamed(Routes.HOME);
    } else {
        Get.offNamed(Routes.LOGIN);
    }});
  }

}
