import 'package:get/get.dart';

import '../controllers/fields_controller.dart';
import '../controllers/home_controller.dart';
import '../controllers/plants_controller.dart';
import '../controllers/profile_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<FieldsViewController>(
      () => FieldsViewController(),
    );
    Get.lazyPut<PlantsController>(
      () => PlantsController(),
    );
  }
}
