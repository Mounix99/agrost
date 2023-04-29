import 'dart:math' as math;

import 'package:agrost/common/styles/plant_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'hardcoded_icons.dart';

void showRotatedDialog(BuildContext context, Widget Function(BuildContext) child) {
  final theme = Theme.of(context);
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return Dialog(
        backgroundColor: theme.colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28), color: theme.colorScheme.primary.withOpacity(0.4)),
            child: Transform.rotate(
              angle: -5 * math.pi / 180,
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(28), color: theme.colorScheme.surface),
                child: Transform.rotate(
                  angle: 5 * math.pi / 180,
                  child: child(dialogContext),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

void plantAddedDialog(BuildContext context) {
  return showRotatedDialog(
      context,
      (dialogContext) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(onPressed: () => Navigator.pop(dialogContext), icon: const Icon(PlantIcons.close))
                ],
              ),
              const SizedBox(height: 8),
              essentialsIcon(number: 1),
              const SizedBox(height: 16),
              Text('createPlantSuccessPopUp'.tr, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 20)
            ],
          ));
}
