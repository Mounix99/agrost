import 'package:get/get.dart';

import '../controllers/fields_view_controller.dart';

class FieldsViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FieldsViewController>(
      () => FieldsViewController(),
    );
  }
}
