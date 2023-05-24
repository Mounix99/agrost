import 'package:agrost/common/widgets/hardcoded_icons.dart';
import 'package:agrost/common/widgets/hero_tags.dart';
import 'package:agrost/common/widgets/secondary_bar.dart';
import 'package:domain/models/plants_api_models/plant_model.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:plant_icons/plant_icons_data.dart';
import '../../../../common/theme.dart';
import '../../../routes/app_pages.dart';
import '../controllers/plants_controller.dart';

class PlantsView extends GetView<PlantsController> {
  const PlantsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [Text('plantsTitle'.tr), const SizedBox(width: 5), plantIcon()],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(38),
          child: SecondaryTabBar(
            tabs: controller.plantTabs,
            controller: controller.tabController,
          ),
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: [myPlantsContent(context), marketPlants(context)],
      ),
    );
  }

  Widget myPlantsContent(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: secondaryElevatedButton(context,
          onPressed: () => Get.toNamed(Routes.ADD_PLANT),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(PlantIcons.addCircle, color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: 9),
              Text('addPlant'.tr),
            ],
          )),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: controller.myPlants,
                builder: (context, query) {
                  if (query.hasData) {
                    return FirestoreListView<PlantModel>(
                      padding: const EdgeInsets.fromLTRB(8, 16, 8, 80),
                      query: query.requireData,
                      loadingBuilder: (context) => const Center(child: CircularProgressIndicator()),
                      errorBuilder: (context, object, stackTrace) => const CircularProgressIndicator(),
                      emptyBuilder: (context) => const CircularProgressIndicator(),
                      itemBuilder: (context, snapshot) =>
                          _plantTile(context, plant: snapshot.data(), publicAdded: false),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
          )
        ],
      ),
    );
  }

  Widget _plantTile(BuildContext context, {required PlantModel plant, required bool publicAdded}) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        elevation: 0,
        child: ListTile(
            leading: HeroWidgets().heroForPlantImage(context, plant),
            tileColor: publicAdded ? theme.colorScheme.secondary : theme.colorScheme.onSurface,
            contentPadding: const EdgeInsets.all(28),
            trailing: Icon(publicAdded ? PlantIcons.tick : PlantIcons.add, color: theme.colorScheme.primary),
            title: Text(plant.title, style: theme.textTheme.titleLarge)),
      ),
    );
  }

  Widget marketPlants(BuildContext context) {
    return FutureBuilder(
        future: controller.userDocId,
        builder: (context, userDocId) {
          if (userDocId.hasData) {
            return FirestoreListView<PlantModel>(
              query: controller.marketPlants,
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
              loadingBuilder: (context) => const CircularProgressIndicator(),
              errorBuilder: (context, object, stackTrace) => const CircularProgressIndicator(),
              emptyBuilder: (context) => const CircularProgressIndicator(),
              itemBuilder: (context, snapshot) {
                PlantModel plant = snapshot.data();
                return _plantTile(context,
                    plant: plant, publicAdded: plant.usesByUsersDocId?.contains(userDocId.requireData) ?? false);
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
