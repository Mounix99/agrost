import 'package:get/get.dart';

import '../controllers/fields_controller.dart';

class FieldsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FieldsViewController>(
      () => FieldsViewController(),
    );
  }
}
