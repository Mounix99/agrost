import 'package:domain/data_source/auth_servise.dart';
import 'package:domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class GeneralBinding implements Bindings {
  GeneralBinding();

  @override
  void dependencies() {
    _initSingletons();
    _initServices();
  }

  void _initServices() {
    Get.put<AuthService>(FirebaseAuthService(Get.find()));
  }

  void _initSingletons() {
    Get.put<FirebaseAuth>(FirebaseAuth.instance);
  }
}
