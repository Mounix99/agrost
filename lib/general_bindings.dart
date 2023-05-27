import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/firebase_data_source/firebase_fields_repository_implementation.dart';
import 'package:domain/firebase_data_source/firebase_image_repository.dart';
import 'package:domain/firebase_data_source/firebase_plants_repository_implementation.dart';
import 'package:domain/firebase_data_source/firebase_user_repository_implementation.dart';
import 'package:domain/repositories/fields_repository.dart';
import 'package:domain/repositories/image_repository.dart';
import 'package:domain/repositories/plants_repository.dart';
import 'package:domain/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class GeneralBinding implements Bindings {
  GeneralBinding();

  @override
  void dependencies() {
    _initSingletons();
    _initServices();
  }

  void _initServices() {
    Get.put<UserRepository>(FirebaseUserRepositoryImplementation(Get.find(), Get.find()));
    Get.put<FieldsRepository>(FirebaseFieldsRepositoryImplementation(Get.find()));
    Get.put<PlantsRepository>(FirebasePlantsRepositoryImplementation(Get.find()));
    Get.put<ImageRepository>(FirebaseImageRepositoryImplementation(Get.find()));
  }

  void _initSingletons() {
    Get.put<FirebaseAuth>(FirebaseAuth.instance);
    Get.put<FirebaseFirestore>(FirebaseFirestore.instance);
    Get.put<FirebaseStorage>(FirebaseStorage.instance);
  }
}
