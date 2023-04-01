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
        bottomNavigationBar: navigationBar(context),
      ),
    );
  }

  Widget navigationBar(BuildContext context) {
    return NavigationBar(
      selectedIndex: controller.selectedIndex.toInt(),
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      onDestinationSelected: controller.updateIndex,
      destinations: [
        NavigationDestination(icon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.list_outlined),
            const SizedBox(width: 8),
            if(controller.selectedIndex.toInt() == 0) Text("bottomNavigationFields".tr, style: Theme.of(context).textTheme.displayLarge)
          ],
        ), label: '',),
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
