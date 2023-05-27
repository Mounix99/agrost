import 'package:domain/models/plants_api_models/plant_model.dart';
import 'package:domain/repositories/user_repository.dart';
import 'package:get/get.dart';

class PlantController extends GetxController {
  late UserRepository _userRepository;
  late PlantModel plant;

  @override
  void onInit() {
    super.onInit();
    _userRepository = Get.find();
    plant = PlantModel.fromJson(Get.arguments);
  }

  Future<String> get userDocId => _userRepository.getCurrentUserDocId();
}
