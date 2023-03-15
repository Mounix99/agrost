import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'fields_view.dart';
import 'plants_view.dart';
import 'profile_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: getBody(),
        bottomNavigationBar: navigationBar(),
      ),
    );
  }

  Widget navigationBar() {
    return NavigationBar(
      selectedIndex: controller.selectedIndex.toInt(),
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      onDestinationSelected: controller.updateIndex,
      destinations: [
        NavigationDestination(icon: const Icon(Icons.list_outlined), label: "bottomNavigationFields".tr),
        NavigationDestination(icon: const Icon(Icons.energy_savings_leaf), label: "bottomNavigationPlants".tr),
        NavigationDestination(icon: const Icon(Icons.person_2), label: "bottomNavigationProfile".tr),
      ],
    );
  }

  Widget getBody() {
    switch (HomeTabs.values.elementAt(controller.selectedIndex.toInt())) {
      case HomeTabs.fields:
        return const FieldsView();
      case HomeTabs.plants:
        return const PlantsView();
      case HomeTabs.profile:
        return const ProfileView();
    }
  }
}
