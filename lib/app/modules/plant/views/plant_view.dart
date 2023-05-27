import 'package:domain/models/plants_api_models/plant_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:plant_icons/plant_icons_data.dart';

import '../../../../common/widgets/circular_icon_button.dart';
import '../controllers/plant_controller.dart';

class PlantView extends GetView<PlantController> {
  const PlantView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('plantDetails'.tr, style: theme.textTheme.displaySmall),
        actions: [
          CircularIconButton(
            theme: theme,
            icon: PlantIcons.editSquare,
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CircularIconButton(
              theme: theme,
              icon: PlantIcons.delete_1,
              onPressed: () {},
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(height: 16),
            if (controller.plant.photoPath != null) ...[
              Card(
                  margin: EdgeInsets.zero,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(28))),
                  elevation: 0,
                  color: theme.colorScheme.onSurface,
                  child: Image.network(controller.plant.photoPath!)),
              const SizedBox(height: 16),
            ],
            _plantInfoBloc(context, controller.plant)
          ],
        ),
      ),
    );
  }

  Widget _plantInfoBloc(BuildContext context, PlantModel plant) {
    final theme = Theme.of(context);
    const space = SizedBox(height: 8);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(plant.title, style: theme.textTheme.displayLarge),
          space,
          _infoField(context, "${"createPlantPlantFamily".tr}: ", plant.plantType.name),
          space,
          _infoField(context, "${"createPlantSoilType".tr}: ", plant.soilTypes.map((soil) => soil.name).join(", ")),
          space,
          _infoField(context, "${"createPlantDescription".tr}: ", plant.description ?? ""),
          space,
          if (plant.public)
            Row(
              children: [
                Text("plantPublishedPublicly".tr,
                    style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.primaryContainer)),
                const SizedBox(width: 6),
                Icon(PlantIcons.bag_3, color: theme.colorScheme.primaryContainer)
              ],
            )
        ],
      ),
    );
  }

  Widget _infoField(BuildContext context, String field, String value) {
    final theme = Theme.of(context);
    return Row(
      children: [Text(field, style: theme.textTheme.bodyMedium), Text(value, style: theme.textTheme.bodyMedium)],
    );
  }
}
