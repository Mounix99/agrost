import 'package:domain/firebase_data_source/firebase_user_servise.dart';
import 'package:domain/repositories/user_repository.dart';
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
    Get.put<UserService>(FirebaseUserService(Get.find()));
  }

  void _initSingletons() {
    Get.put<FirebaseAuth>(FirebaseAuth.instance);
  }
}
