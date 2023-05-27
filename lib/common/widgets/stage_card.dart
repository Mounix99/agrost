import 'package:domain/models/plants_api_models/stage_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_icons/plant_icons_data.dart';

import '../extensions/duration.dart';

class StageCard extends StatelessWidget {
  final StageModel stage;
  final int stageNumber;
  final void Function()? onDeletePressed;
  const StageCard({Key? key, required this.stage, required this.stageNumber, this.onDeletePressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(28))),
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 16),
      color: theme.colorScheme.onSurface,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${"stage".tr} $stageNumber", style: theme.textTheme.displaySmall),
                if (onDeletePressed != null)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [IconButton(onPressed: onDeletePressed, icon: const Icon(PlantIcons.delete_1))],
                  )
              ],
            ),
            const SizedBox(height: 25),
            if (stage.description?.isNotEmpty ?? false)
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 27,
                    backgroundColor: theme.colorScheme.surface,
                    child: const Icon(PlantIcons.edit_2),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("stage".tr, style: theme.textTheme.titleLarge),
                      const SizedBox(height: 8),
                      Text(stage.title,
                          style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onPrimary)),
                      const SizedBox(height: 8),
                      if (stage.description != null)
                        Text(stage.description!,
                            style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onPrimary)),
                    ],
                  ),
                ],
              ),
            const SizedBox(height: 25),
            if (stage.durationDelta != null)
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 27,
                    backgroundColor: theme.colorScheme.surface,
                    child: const Icon(PlantIcons.calender_1),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('createStageDuration'.tr, style: theme.textTheme.titleLarge),
                      const SizedBox(height: 8),
                      Text(formatDuration(Duration(seconds: stage.durationDelta!)),
                          style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onPrimary)),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
