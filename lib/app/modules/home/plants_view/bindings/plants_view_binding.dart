import 'package:get/get.dart';

import '../controllers/plants_view_controller.dart';

class PlantsViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlantsViewController>(
      () => PlantsViewController(),
    );
  }
}
