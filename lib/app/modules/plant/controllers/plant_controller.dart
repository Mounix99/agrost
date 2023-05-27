import 'package:domain/models/plants_api_models/plant_model.dart';
import 'package:domain/models/plants_api_models/stage_model.dart';
import 'package:domain/repositories/plants_repository.dart';
import 'package:domain/repositories/user_repository.dart';
import 'package:get/get.dart';

class PlantController extends GetxController {
  late UserRepository _userRepository;
  late PlantsRepository _plantsRepository;
  late PlantModel plant;

  @override
  void onInit() {
    super.onInit();
    _userRepository = Get.find();
    _plantsRepository = Get.find();
    plant = PlantModel.fromJson(Get.arguments);
  }

  Future<List<StageModel>> get stages => _plantsRepository.getListOfStages(plantDocId: plant.plantDocId ?? "");

  Future<String> get userDocId => _userRepository.getCurrentUserDocId();
}
