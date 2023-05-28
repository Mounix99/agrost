import 'dart:convert';
import 'dart:io';

import 'package:domain/models/plants_api_models/plant_model.dart';
import 'package:domain/models/plants_api_models/stage_model.dart';
import 'package:domain/repositories/image_repository.dart';
import 'package:domain/repositories/plants_repository.dart';
import 'package:domain/repositories/user_repository.dart';
import 'package:domain/values_and_extensions.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
  final PlantModel? passedPlantModel = Get.arguments != null ? Get.arguments["plantModel"] : null;
  final List<StageModel>? passedStages = Get.arguments != null ? Get.arguments["stages"] : null;
  final PlantsRepository _plantsRepository = Get.find();
  final ImageRepository _imageRepository = Get.find();
  final UserRepository _userRepository = Get.find();
  final ImagePicker _imagePicker = ImagePicker();
  final ScrollController scrollController = ScrollController();
  late Map<String, FocusNode> plantFocusNodes;
  late Map<String, FocusNode> stageFocusNodes;
  final RxList<StageModel> actualStages = <StageModel>[].obs;
  late XFile? image;
  final RxBool showStageForm = true.obs;
  late Rx<FormGroup> plantForm;
  late Rx<FormGroup> stageForm;

  @override
  Future<void> onInit() async {
    super.onInit();
    _nodes();
    image = null;
    stageForm = FormGroup({
      StageForm.name.name: FormControl<String>(validators: [Validators.required]),
      StageForm.description.name: FormControl<String?>(),
      StageForm.duration.name: FormControl<int>(value: 1, validators: [Validators.required]),
      StageForm.timeFormat.name:
          FormControl<StageTimeFormats>(value: StageTimeFormats.day, validators: [Validators.required]),
    }).obs;
    plantForm = FormGroup({
      PlantForm.name.name: FormControl<String>(value: passedPlantModel?.title ?? "", validators: [Validators.required]),
      PlantForm.description.name: FormControl<String?>(value: passedPlantModel?.description ?? ""),
      PlantForm.image.name: FormControl<String?>(value: passedPlantModel?.photoPath),
      PlantForm.family.name:
          FormControl<PlantType>(validators: [Validators.required], value: passedPlantModel?.plantType),
      PlantForm.soilType.name:
          FormControl<SoilType>(validators: [Validators.required], value: passedPlantModel?.soilTypes.first),
      PlantForm.public.name: FormControl<bool>(value: passedPlantModel?.public ?? false),
      PlantForm.stages.name: FormControl<List<StageModel>?>(value: []),
    }).obs;
    if (passedStages?.isNotEmpty ?? false) {
      actualStages.value = passedStages ?? [];
      showStageForm.value = false;
    }
  }

  void _nodes() {
    plantFocusNodes = {for (var field in PlantForm.values) field.name: FocusNode()};
    stageFocusNodes = {for (var field in StageForm.values) field.name: FocusNode()};
  }

  void _disposeNodes() {
    for (var node in plantFocusNodes.values) {
      node.dispose();
    }
    for (var node in stageFocusNodes.values) {
      node.dispose();
    }
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

  Future<void> save() async {
    if (passedPlantModel != null) {
      await editPlant();
    } else {
      await createPlant();
    }
  }

  Future<void> editPlant() async {
    final List<StageModel> stages = plantForm.value.val<List<StageModel>?>(PlantForm.stages) ?? [];
    final PlantModel plant = PlantModel(
        title: plantForm.value.val<String>(PlantForm.name)!,
        description: plantForm.value.val<String?>(PlantForm.description),
        authorDocId: passedPlantModel?.authorDocId ?? await _userRepository.getCurrentUserDocId(),
        usesByUsersDocId: passedPlantModel?.usesByUsersDocId ?? [await _userRepository.getCurrentUserDocId()],
        soilTypes: [plantForm.value.val<SoilType>(PlantForm.soilType)!],
        plantType: plantForm.value.val<PlantType>(PlantForm.family)!,
        public: plantForm.value.val<bool>(PlantForm.public)!,
        photoPath: await _uploadImageToStorage(),
        createDate: passedPlantModel?.createDate ?? DateTime.now(),
        lastUpdateDate: DateTime.now(),
        //TODO: parse and increase last last value on each update event
        version: "0.0.1",
        stagesLength: stages.length);
    final Either<String, String?> value =
        await _plantsRepository.updatePlant(plantModel: plant, plantDocId: plant.plantDocId ?? "");
    if (value.isLeft && !listEquals(passedStages, stages)) {
      //TODO: update only stages with changes
      if (passedStages != null) {
        for (var stage in passedStages!) {
          _plantsRepository.deleteStage(plantDocId: plant.plantDocId ?? "", stageDocId: stage.stageDocId ?? "");
        }
      }
      for (var stage in stages) {
        _plantsRepository.addStage(stageModel: stage.copyWith(plantDocId: plant.plantDocId));
      }
    } else {
      Get.showSnackbar(GetSnackBar(title: value.right));
    }
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
        photoPath: await _uploadImageToStorage(),
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

  Future<String?> _uploadImageToStorage() async {
    if (image != null) {
      final userId = await _userRepository.getCurrentUserDocId();
      final plantName = plantForm.value.val<String>(PlantForm.name)!;
      final fileName = "${plantName}_${image!.name}_$userId";
      final response = await _imageRepository.uploadPlantImage(file: File(image!.path), fileName: fileName);
      if (response.isRight) {
        Get.showSnackbar(GetSnackBar(title: response.right));
      } else {
        return response.left;
      }
    }
    return null;
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
    if (image != null) {
      image = null;
      if (passedPlantModel?.photoPath != null) {
        plantForm.value.setVal<String?>(PlantForm.image, passedPlantModel?.photoPath);
      } else {
        setImageInBytes();
      }
    } else {
      setImageInBytes();
    }
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
    _disposeNodes();
    plantForm.close();
    stageForm.close();
    super.onClose();
  }
}
