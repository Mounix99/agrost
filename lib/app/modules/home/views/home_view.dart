import 'package:agrost/common/widgets/hardcoded_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:plant_icons/plant_icons_data.dart';

import '../../../../common/styles/decorations.dart';
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
    final theme = Theme.of(context);
    return NavigationBar(
      selectedIndex: controller.selectedIndex.toInt(),
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      onDestinationSelected: controller.updateIndex,
      destinations: [
        _navigationWidget(context,
            icon: Icon(PlantIcons.graph, color: theme.colorScheme.primary),
            title: "bottomNavigationFields".tr,
            selected: controller.selectedIndex.toInt() == 0),
        _navigationWidget(context,
            icon: plantIcon(), title: "bottomNavigationPlants".tr, selected: controller.selectedIndex.toInt() == 1),
        _navigationWidget(context,
            icon: Icon(PlantIcons.profileCircle, color: theme.colorScheme.primary),
            title: "bottomNavigationProfile".tr,
            selected: controller.selectedIndex.toInt() == 2),
      ],
    );
  }

  Widget _navigationWidget(BuildContext context,
      {required Widget icon, required String title, required bool selected}) {
    final theme = Theme.of(context);
    return NavigationDestination(
      label: "",
      icon: DecoratedBox(
          decoration: roundedGrayDecorationForNavBar(theme, selected),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon,
                const SizedBox(width: 8),
                if (selected)
                  Text(
                    title,
                    style: theme.textTheme.displaySmall,
                  )
              ],
            ),
          )),
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
