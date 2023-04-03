import 'package:agrost/common/styles/plant_icons.dart';
import 'package:agrost/common/widgets/secondary_bar.dart';
import 'package:domain/models/plants_api_models/plant_model.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/plants_controller.dart';

class PlantsView extends GetView<PlantsController> {
  const PlantsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('plantsTitle'.tr),
            Icon(
              PlantIcons.plant,
              color: Theme.of(context).colorScheme.primary,
            )
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(38),
          child: SecondaryTabBar(
            tabs: controller.plantTabs,
            controller: controller.tabController,
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(onPressed: controller.createMockPrivatePlant),
          FloatingActionButton(onPressed: controller.createMockPublicPlant),
        ],
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: [myPlantsContent(context), marketPlants(context)],
      ),
    );
  }

  Widget myPlantsContent(BuildContext context) {
    return FutureBuilder(
        future: controller.myPlants,
        builder: (context, query) {
          if (query.hasData) {
            return FirestoreListView<PlantModel>(
              query: query.requireData,
              loadingBuilder: (context) => const CircularProgressIndicator(),
              errorBuilder: (context, object, stackTrace) => const CircularProgressIndicator(),
              emptyBuilder: (context) => const CircularProgressIndicator(),
              itemBuilder: (context, snapshot) {
                // Data is now typed!
                PlantModel plantModel = snapshot.data();

                return ListTile(
                  title: Text(plantModel.title),
                  subtitle: Text(plantModel.description),
                );
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }

  Widget marketPlants(BuildContext context) {
    return FirestoreListView<PlantModel>(
      query: controller.marketPlants,
      loadingBuilder: (context) => const CircularProgressIndicator(),
      errorBuilder: (context, object, stackTrace) => const CircularProgressIndicator(),
      emptyBuilder: (context) => const CircularProgressIndicator(),
      itemBuilder: (context, snapshot) {
        // Data is now typed!
        PlantModel plantModel = snapshot.data();

        return ListTile(
          title: Text(plantModel.title),
          subtitle: Text(plantModel.description),
        );
      },
    );
  }
}
