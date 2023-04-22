import 'package:domain/models/plants_api_models/plant_model.dart';
import 'package:domain/models/plants_api_models/stage_model.dart';
import 'package:domain/repositories/plants_repository.dart';
import 'package:domain/repositories/user_repository.dart';
import 'package:domain/values_and_extensions.dart';
import 'package:either_dart/either.dart';
import 'package:get/get.dart';

import '../../../../common/extensions/forms.dart';

enum PlantForm { name, description, family, soilType, public, stages }

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
  late PlantsRepository _plantsRepository;
  late UserRepository _userRepository;
  late RxList<StageModel> ctrlStages;
  late RxBool showStageForm;
  late Rx<FormGroup> plantForm;
  late Rx<FormGroup> stageForm;

  final count = 0.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    ctrlStages = <StageModel>[].obs;
    showStageForm = true.obs;
    _plantsRepository = Get.find();
    _userRepository = Get.find();
    stageForm = FormGroup({
      StageForm.name.name: FormControl<String>(validators: [Validators.required]),
      StageForm.description.name: FormControl<String?>(),
      StageForm.duration.name: FormControl<int>(value: 1, validators: [Validators.required]),
      StageForm.timeFormat.name: FormControl<StageTimeFormats>(value: StageTimeFormats.day),
    }).obs;
    plantForm = FormGroup({
      PlantForm.name.name: FormControl<String>(value: "", validators: [Validators.required]),
      PlantForm.description.name: FormControl<String?>(),
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
    ctrlStages.value = stages;
    showStageForm.value = false;
    showStageForm.refresh();
    ctrlStages.refresh();
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

  @override
  void onClose() {
    plantForm.close();
    stageForm.close();
    super.onClose();
  }
}
