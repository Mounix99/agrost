import 'package:agrost/common/styles/plant_icons.dart';
import 'package:domain/models/plants_api_models/plant_model.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class HeroWidgets {
  static const String plantTag = 'plantTag_';

  Widget heroForPlantImage(BuildContext context, PlantModel plant) {
    final theme = Theme.of(context);
    late Widget image;
    // if (plant.photoBytes?.isNotEmpty ?? false) {
    //   image = FadeInImage.memoryNetwork(
    //     placeholder: kTransparentImage,
    //     image: plant.photoBytes!,
    //   );
    // } else {
    //   image = CircleAvatar(
    //     radius: 30,
    //     backgroundColor: theme.colorScheme.background,
    //     child: Icon(
    //       PlantIcons.plant,
    //       size: 30,
    //       color: theme.colorScheme.primary,
    //     ),
    //   );
    // }
    image = CircleAvatar(
      radius: 30,
      backgroundColor: theme.colorScheme.background,
      child: Icon(
        PlantIcons.plant,
        size: 30,
        color: theme.colorScheme.primary,
      ),
    );
    return Hero(
      tag: plantTag + (plant.plantDocId ?? ""),
      child: image,
    );
  }
}
