import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

enum HomeTabs {
  fields,
  plants,
  profile;

  static bool isFields(int value) => HomeTabs.values[value] == HomeTabs.fields;
  static bool isPlants(int value) => HomeTabs.values[value] == HomeTabs.plants;
  static bool isProfile(int value) => HomeTabs.values[value] == HomeTabs.profile;

  static String route(int index) {
    final HomeTabs tab = HomeTabs.values.elementAt(index);
    switch (tab) {
      case HomeTabs.fields:
        return Routes.FIELDS_VIEW;
      case HomeTabs.plants:
        return Routes.PLANTS_VIEW;
      case HomeTabs.profile:
        return Routes.PROFILE_VIEW;
    }
  }
}

class HomeController extends GetxController {
  var selectedIndex = 0.obs;

  void updateIndex(int newIndex) => selectedIndex.value = newIndex;
}
