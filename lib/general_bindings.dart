import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/firebase_data_source/firebase_fields_service.dart';
import 'package:domain/firebase_data_source/firebase_user_servise.dart';
import 'package:domain/repositories/fields_repository.dart';
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
    Get.put<UserService>(FirebaseUserService(Get.find(), Get.find()));
    Get.put<FieldsService>(FirebaseFieldsService(Get.find()));
  }

  void _initSingletons() {
    Get.put<FirebaseAuth>(FirebaseAuth.instance);
    Get.put<FirebaseFirestore>(FirebaseFirestore.instance);
  }
}
