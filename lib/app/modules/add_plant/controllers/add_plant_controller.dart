import 'dart:convert';
import 'dart:io';

import 'package:domain/models/plants_api_models/plant_model.dart';
import 'package:domain/models/plants_api_models/stage_model.dart';
import 'package:domain/repositories/plants_repository.dart';
import 'package:domain/repositories/user_repository.dart';
import 'package:domain/values_and_extensions.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../common/extensions/forms.dart';

enum PlantForm { name, description, family, soilType, public, stages, image }

enum StageForm { name, description, duration, timeFormat }

enum StageTimeFormats { day, week, month }

extension StageTimeFormatsConverter on StageTimeFormats {
  Duration convert(int value) {
    switch (this) {
      case StageTimeFormats.day:
        return Duration(days: value);
      case StageTimeFormats.week:
        return Duration(days: value * 7);
      case StageTimeFormats.month:
        return Duration(days: value * 30);
    }
  }
}

class AddPlantController extends GetxController {
  final PlantsRepository _plantsRepository = Get.find();
  final UserRepository _userRepository = Get.find();
  final ImagePicker _imagePicker = ImagePicker();
  final RxList<StageModel> actualStages = <StageModel>[].obs;
  late XFile? image;
  final RxBool showStageForm = true.obs;
  late Rx<FormGroup> plantForm;
  late Rx<FormGroup> stageForm;

  @override
  Future<void> onInit() async {
    super.onInit();
    image = null;
    stageForm = FormGroup({
      StageForm.name.name: FormControl<String>(validators: [Validators.required]),
      StageForm.description.name: FormControl<String?>(),
      StageForm.duration.name: FormControl<int>(value: 1, validators: [Validators.required]),
      StageForm.timeFormat.name:
          FormControl<StageTimeFormats>(value: StageTimeFormats.day, validators: [Validators.required]),
    }).obs;
    plantForm = FormGroup({
      PlantForm.name.name: FormControl<String>(value: "", validators: [Validators.required]),
      PlantForm.description.name: FormControl<String?>(),
      PlantForm.image.name: FormControl<String?>(),
      PlantForm.family.name: FormControl<PlantType>(validators: [Validators.required]),
      PlantForm.soilType.name: FormControl<SoilType>(validators: [Validators.required]),
      PlantForm.public.name: FormControl<bool>(value: false),
      PlantForm.stages.name: FormControl<List<StageModel>?>(value: []),
    }).obs;
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  Future<void> addStage() async {
    final List<StageModel> stages = plantForm.value.val<List<StageModel>?>(PlantForm.stages) ?? [];
    final StageModel stage = StageModel(
        plantDocId: '',
        stageDocId: '',
        title: stageForm.value.val<String>(StageForm.name)!,
        description: stageForm.value.val<String?>(StageForm.description),
        authorDocId: await _userRepository.getCurrentUserDocId(),
        durationDelta: stageForm.value
            .val<StageTimeFormats>(StageForm.timeFormat)!
            .convert(stageForm.value.val<int>(StageForm.duration)!)
            .inSeconds);
    stages.add(stage);
    actualStages.value = stages;
    showStageForm.value = false;
    showStageForm.refresh();
    actualStages.refresh();
    plantForm.value.setVal<List<StageModel>?>(PlantForm.stages, stages);
    stageForm.value.reset();
    stageForm.value.setVal<int>(StageForm.duration, 1);
  }

  Future<void> createPlant() async {
    final List<StageModel> stages = plantForm.value.val<List<StageModel>?>(PlantForm.stages) ?? [];
    final PlantModel plant = PlantModel(
        title: plantForm.value.val<String>(PlantForm.name)!,
        description: plantForm.value.val<String?>(PlantForm.description),
        authorDocId: await _userRepository.getCurrentUserDocId(),
        usesByUsersDocId: [await _userRepository.getCurrentUserDocId()],
        soilTypes: [plantForm.value.val<SoilType>(PlantForm.soilType)!],
        plantType: plantForm.value.val<PlantType>(PlantForm.family)!,
        public: plantForm.value.val<bool>(PlantForm.public)!,
        createDate: DateTime.now(),
        lastUpdateDate: DateTime.now(),
        version: "0.0.1",
        stagesLength: stages.length);
    final Either<String, String?> value = await _plantsRepository.addPlant(plantModel: plant);
    if (value.isLeft && value.left.isNotEmpty) {
      for (var stage in stages) {
        _plantsRepository.addStage(stageModel: stage.copyWith(plantDocId: value.left));
      }
    } else {
      Get.showSnackbar(GetSnackBar(title: value.right));
    }
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedFile = await _imagePicker.pickImage(source: source);
      if (pickedFile != null) {
        image = pickedFile;
        setImageInBytes();
        refresh();
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error picking image: $e");
      }
    }
  }

  Future<void> setImageInBytes() async {
    if (image != null) {
      final imageBytes = await File(image!.path).readAsBytes();
      plantForm.value.setVal<String?>(PlantForm.image, base64Encode(imageBytes));
    } else {
      plantForm.value.setVal<String?>(PlantForm.image, null);
    }
    plantForm.value.ctrl<String?>(PlantForm.image).markAsTouched();
  }

  void removeImage() async {
    image = null;
    setImageInBytes();
  }

  void removeStage(StageModel removedStage) async {
    final stageControl = plantForm.value.ctrl<List<StageModel>?>(PlantForm.stages);
    final List<StageModel> oldStages = stageControl.value ?? [];
    oldStages.removeWhere((stage) => stage == removedStage);
    actualStages.value = oldStages;
    actualStages.refresh();
  }

  @override
  void onClose() {
    plantForm.close();
    stageForm.close();
    super.onClose();
  }
}
