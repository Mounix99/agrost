import 'package:agrost/common/extentions/forms.dart';
import 'package:agrost/common/styles/plant_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../common/widgets/reacive_fields/reactive_text_field.dart';
import '../controllers/add_plant_controller.dart';

class AddPlantView extends GetView<AddPlantController> {
  const AddPlantView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('createPlantAppBarTitle'.tr),
      ),
      body: ReactiveForm(
        formGroup: controller.plantForm.value,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 40),
          child: ListView(
            children: _getContent(context, Theme.of(context)),
          ),
        ),
      ),
    );
  }

  List<Widget> _getContent(BuildContext context, ThemeData theme) => [
        _basicInfo(theme),
        const SizedBox(height: 16),
        _pictureBloc(theme),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'createPlantPlantName'.tr,
            style: theme.textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: 4),
        PlantTextField(
            theme: theme,
            control: controller.plantForm.value.ctrl<String>(PlantForm.name),
            hint: 'createPlantPlantNameHint'.tr),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'createPlantPlantFamily'.tr,
            style: theme.textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: 36),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'createPlantDescription'.tr,
            style: theme.textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: 4),
        PlantTextField(
            theme: theme,
            control: controller.plantForm.value.ctrl<String?>(PlantForm.description),
            hint: 'createPlantDescriptionHint'.tr),
      ];

  Widget _basicInfo(ThemeData theme) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('createPlantBasicInfo'.tr, style: theme.textTheme.displayMedium),
            const SizedBox(width: 5),
            const Icon(PlantIcons.pen)
          ],
        ),
      );

  Widget _pictureBloc(ThemeData theme) => Card(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(28))),
        elevation: 0,
        color: theme.colorScheme.onSurface,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
          child: Column(
            children: [
              Text(
                'createPlantAddPic'.tr,
                style: theme.textTheme.displaySmall,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _pictureOption(
                      theme: theme,
                      title: 'createPlantTakeACutePicture'.tr,
                      icon: PlantIcons.camera_1,
                      onPressed: () {}),
                  SizedBox(
                    height: 92,
                    child: VerticalDivider(
                      thickness: 2,
                      width: 56,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  _pictureOption(
                      theme: theme, title: 'createPlantUploadFromGallery'.tr, icon: PlantIcons.image, onPressed: () {}),
                ],
              )
            ],
          ),
        ),
      );

  Widget _pictureOption(
          {required ThemeData theme, required String title, required IconData icon, required Function() onPressed}) =>
      InkWell(
        onTap: onPressed,
        child: Column(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: theme.colorScheme.surface,
              child: Icon(icon),
            ),
            const SizedBox(height: 4),
            SizedBox(width: 127, child: Text(title, style: theme.textTheme.bodyMedium, textAlign: TextAlign.center))
          ],
        ),
      );
}
