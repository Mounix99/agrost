import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/models/fields_api_models/field_model.dart';
import 'package:domain/repositories/fields_repository.dart';
import 'package:domain/repositories/user_repository.dart';
import 'package:domain/values_and_extensions.dart';
import 'package:get/get.dart';

class FieldsViewController extends GetxController {
  late FieldsRepository _fieldsRepository;
  late UserRepository _userRepository;

  @override
  void onInit() {
    _fieldsRepository = Get.find();
    _userRepository = Get.find();
    super.onInit();
  }

  Future<String> get userDocId => _userRepository.getCurrentUserDocId();

  Future<Query<FieldModel>> get fields async => _fieldsRepository.getUserFieldsCollection(userDocId: await userDocId);

  Future<void> createMockField() async => _fieldsRepository.addField(
      fieldModel: FieldModel(
          lastStartDate: DateTime.now(),
          soilTypes: [SoilType.blackSoil],
          title: "Bad Mock field",
          lng: 0.1,
          lat: 0.1,
          userDocId: await userDocId,
          connected: true));
}
