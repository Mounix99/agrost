import 'dart:io';

import 'package:agrost/common/styles/plant_icons.dart';
import 'package:agrost/common/widgets/hardcoded_icons.dart';
import 'package:agrost/common/widgets/reacive_fields/reactive_drop_down.dart';
import 'package:domain/models/plants_api_models/stage_model.dart';
import 'package:domain/values_and_extensions.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../common/extensions/duration.dart';
import '../../../../common/extensions/forms.dart';
import '../../../../common/theme.dart';
import '../../../../common/widgets/circular_icon_button.dart';
import '../../../../common/widgets/reacive_fields/reactive_text_field.dart';
import '../../../../common/widgets/rotated_dialogs.dart';
import '../controllers/add_plant_controller.dart';

class AddPlantView extends GetView<AddPlantController> {
  const AddPlantView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('createPlantAppBarTitle'.tr),
      ),
      body: Obx(() => ReactiveForm(
            formGroup: controller.plantForm.value,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 16, 8, 40),
              child: ListView(
                controller: controller.scrollController,
                children: [
                  ..._getPlantFormContent(context, theme),
                  const SizedBox(height: 16),
                  ...controller.actualStages.map((stage) => _stageCard(theme: theme, stage: stage)),
                  const SizedBox(height: 16),
                  if (controller.showStageForm.isTrue) ..._getStageFormContent(context, theme),
                  if (controller.showStageForm.isFalse)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 85),
                      child: secondaryElevatedButton(context,
                          onPressed: controller.showStageForm.toggle,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(PlantIcons.timeCircleCheck, color: Theme.of(context).colorScheme.primary),
                              const SizedBox(width: 9),
                              Text('addStage'.tr),
                            ],
                          )),
                    ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: primaryElevatedButton(context, onPressed: () {
                      controller.plantForm.value.markAllAsTouched();
                      if (controller.plantForm.value.valid) {
                        controller.createPlant();
                        Navigator.pop(context);
                        plantAddedDialog(context);
                      } else {
                        _scrollToError(context);
                      }
                    },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            plantIcon(color: theme.colorScheme.secondary),
                            const SizedBox(width: 9),
                            Text(
                              'addPlant'.tr,
                              style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.secondary),
                            ),
                            const SizedBox(width: 14),
                            Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                  color: theme.colorScheme.secondary, borderRadius: BorderRadius.circular(8)),
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
          )),
    );
  }

  List<Widget> _getPlantFormContent(BuildContext context, ThemeData theme) => [
        _title(theme, 'createPlantBasicInfo'.tr, PlantIcons.pen),
        const SizedBox(height: 16),
        _pictureBloc(theme),
        const SizedBox(height: 24),
        _subtitle(theme, 'createPlantPlantName'.tr),
        const SizedBox(height: 4),
        PlantTextField(
            theme: theme,
            focusNode: controller.plantFocusNodes[PlantForm.name.name],
            control: controller.plantForm.value.ctrl<String>(PlantForm.name),
            hint: 'createPlantPlantNameHint'.tr),
        const SizedBox(height: 16),
        _subtitle(theme, 'createPlantPlantFamily'.tr),
        const SizedBox(height: 4),
        _familyTypeDropDown(theme: theme),
        const SizedBox(height: 36),
        _subtitle(theme, 'createPlantSoilType'.tr),
        const SizedBox(height: 4),
        _soilTypeDropDown(theme: theme),
        const SizedBox(height: 36),
        _subtitle(theme, 'createPlantDescription'.tr),
        const SizedBox(height: 4),
        PlantTextField(
            theme: theme,
            focusNode: controller.plantFocusNodes[PlantForm.description.name],
            control: controller.plantForm.value.ctrl<String?>(PlantForm.description),
            hint: 'createPlantDescriptionHint'.tr),
        const SizedBox(height: 60),
        _title(theme, 'createPlantPublicPlant'.tr, PlantIcons.bag_3),
        const SizedBox(height: 4),
        ReactiveSwitchListTile(
          formControl: controller.plantForm.value.ctrl<bool>(PlantForm.public),
          contentPadding: const EdgeInsets.only(left: 8, right: 8),
          title: Text(
            'createPlantPublicPlantSubtitle'.tr,
            style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onPrimary),
          ),
          dense: true,
        ),
        const SizedBox(height: 40),
        _title(theme, 'createPlantGrowthStages'.tr, PlantIcons.moon),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text('createPlantGrowthStagesSubtitle'.tr,
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onPrimary)),
        )
      ];

  Widget _subtitle(ThemeData theme, String text) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          text,
          style: theme.textTheme.titleMedium,
        ),
      );

  Widget _title(ThemeData theme, String text, IconData icon) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [Text(text, style: theme.textTheme.displayMedium), const SizedBox(width: 5), Icon(icon)],
        ),
      );

  Widget _pictureBloc(ThemeData theme) {
    return ReactiveStatusListenableBuilder(
      formControl: controller.plantForm.value.ctrl<String?>(PlantForm.image),
      builder: (BuildContext context, AbstractControl<Object?> control, Widget? child) {
        if (control.value != null) {
          return _plantImage(theme);
        } else {
          return _getPictureBloc(theme);
        }
      },
    );
  }

  Widget _plantImage(ThemeData theme) => Stack(alignment: Alignment.topCenter, children: [
        Card(
            margin: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(28))),
            elevation: 0,
            color: theme.colorScheme.onSurface,
            child: Image.file(File(controller.image!.path))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircularIconButton(
                theme: theme,
                icon: PlantIcons.editSquare,
                onPressed: () => controller.pickImage(ImageSource.gallery),
              ),
              const SizedBox(width: 4),
              CircularIconButton(
                theme: theme,
                icon: PlantIcons.delete_1,
                onPressed: controller.removeImage,
              )
            ],
          ),
        )
      ]);

  Widget _getPictureBloc(ThemeData theme) => Card(
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _pictureOption(
                      theme: theme,
                      title: 'createPlantTakeACutePicture'.tr,
                      icon: PlantIcons.camera_1,
                      onPressed: () => controller.pickImage(ImageSource.camera)),
                  SizedBox(
                    height: 92,
                    child: VerticalDivider(
                      thickness: 2,
                      width: 56,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  _pictureOption(
                      theme: theme,
                      title: 'createPlantUploadFromGallery'.tr,
                      icon: PlantIcons.image,
                      onPressed: () => controller.pickImage(ImageSource.gallery)),
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
            CircularIconButton(theme: theme, icon: icon),
            const SizedBox(height: 4),
            SizedBox(width: 127, child: Text(title, style: theme.textTheme.bodyMedium, textAlign: TextAlign.center))
          ],
        ),
      );

  Widget _familyTypeDropDown({required ThemeData theme}) => PlantDropDown(
        focusNode: controller.plantFocusNodes[PlantForm.family.name],
        formControl: controller.plantForm.value.ctrl<PlantType>(PlantForm.family),
        icon: plantIcon(),
        theme: theme,
        hint: PlantType.values[0].name,
        items: PlantType.values
            .map((plantType) => DropdownMenuItem(
                  value: plantType,
                  child: Text(plantType.name, style: theme.textTheme.bodyMedium),
                ))
            .toList(),
        onChanged: (ctrl) => controller.plantForm.value.markAsDirty(),
      );

  Widget _soilTypeDropDown({required ThemeData theme}) => PlantDropDown(
        focusNode: controller.plantFocusNodes[PlantForm.soilType.name],
        formControl: controller.plantForm.value.ctrl<SoilType>(PlantForm.soilType),
        icon: Icon(PlantIcons.category, color: theme.colorScheme.primary),
        hint: SoilType.values[0].name,
        theme: theme,
        items: SoilType.values
            .map((soilType) => DropdownMenuItem(
                  value: soilType,
                  child: Text(soilType.name, style: theme.textTheme.bodyMedium),
                ))
            .toList(),
        onChanged: (ctrl) => controller.plantForm.value.markAsDirty(),
      );

  List<Widget> _getStageFormContent(BuildContext context, ThemeData theme) => [
        _subtitle(theme, 'createStageName'.tr),
        const SizedBox(height: 4),
        PlantTextField(
            theme: theme,
            validation: {"required": (v) => "required"},
            control: controller.stageForm.value.ctrl<String>(StageForm.name),
            hint: 'createStageNameHint'.tr),
        const SizedBox(height: 36),
        _subtitle(theme, 'createStageDescription'.tr),
        const SizedBox(height: 4),
        PlantTextField(
            theme: theme,
            control: controller.stageForm.value.ctrl<String?>(StageForm.description),
            hint: 'createStageDescriptionHint'.tr),
        const SizedBox(height: 36),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _subtitle(theme, 'createStageDuration'.tr),
                  const SizedBox(height: 4),
                  PlantTextField(
                      icon: PlantIcons.calender_1,
                      keyboardType: TextInputType.number,
                      theme: theme,
                      control: controller.stageForm.value.ctrl<int>(StageForm.duration)),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _subtitle(theme, 'createStageTimeFormat'.tr),
                  const SizedBox(height: 4),
                  _periodDropDown(theme: theme),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 36),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 85),
          child: secondaryElevatedButton(context, onPressed: () {
            controller.stageForm.value.markAllAsTouched();
            if (controller.stageForm.value.valid) {
              controller.addStage();
            }
          },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(PlantIcons.timeCircleCheck, color: Theme.of(context).colorScheme.primary),
                  const SizedBox(width: 9),
                  Text('createStage'.tr),
                ],
              )),
        )
      ];

  Widget _periodDropDown({required ThemeData theme}) => PlantDropDown(
        formControl: controller.stageForm.value.ctrl<StageTimeFormats>(StageForm.timeFormat),
        icon: Icon(PlantIcons.calender_1, color: theme.colorScheme.primary),
        hint: StageTimeFormats.values[0].name,
        theme: theme,
        items: StageTimeFormats.values
            .map((stageTimeFormats) => DropdownMenuItem(
                  value: stageTimeFormats,
                  child: Text(stageTimeFormats.name, style: theme.textTheme.bodyMedium),
                ))
            .toList(),
        onChanged: (ctrl) => controller.plantForm.value.markAsDirty(),
      );

  Widget _stageCard({required ThemeData theme, required StageModel stage}) => Card(
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
                  Text(stage.title, style: theme.textTheme.displaySmall),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: () => controller.removeStage(stage), icon: const Icon(PlantIcons.delete_1))
                    ],
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
                    Text(stage.description!,
                        style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onPrimary)),
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

  void _scrollToError(BuildContext context) {
    for (String controlName in controller.plantForm.value.controls.keys) {
      if (controller.plantForm.value.control(controlName).invalid) {
        final node = controller.plantFocusNodes[controlName];
        if (node != null) {
          node.requestFocus();
          plantAddedDialog(context);
        }
        controller.scrollController.animateTo(
          controller.scrollController.position.minScrollExtent,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 500),
        );
        break;
      }
    }
  }
}
