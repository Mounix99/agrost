import 'package:get/get.dart';

import '../controllers/add_plant_controller.dart';

class AddPlantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPlantController>(
      () => AddPlantController(),
    );
  }
}
