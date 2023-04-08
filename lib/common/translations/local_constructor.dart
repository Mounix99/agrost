import 'package:json_annotation/json_annotation.dart';

part 'local_constructor.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class LocaleConstructor {
  final String appTitle;
  final String appSubtitle;

  ///Bottom navigation
  final String bottomNavigationFields;
  final String bottomNavigationPlants;
  final String bottomNavigationProfile;

  final String profileTitle;

  final String fieldsTitle;

  ///Plant tab
  final String plantsTitle;
  final String myPlantsSubtitle;
  final String marketPlantsSubtitle;
  final String addPlant;

  ///Create plant
  final String createPlantAppBarTitle;
  final String createPlantBasicInfo;
  final String createPlantAddPic;
  final String createPlantTakeACutePicture;
  final String createPlantUploadFromGallery;
  final String createPlantPlantName;
  final String createPlantPlantNameHint;
  final String createPlantPlantFamily;
  final String createPlantSoilType;
  final String createPlantPublicPlant;
  final String createPlantPublicPlantSubtitle;
  final String createPlantGrowthStages;
  final String createPlantGrowthStagesSubtitle;

  final String createStage;
  final String createStageName;
  final String createStageNameHint;
  final String createStageDescription;
  final String createStageDescriptionHint;
  final String createStageDuration;
  final String createStageTimeFormat;

  LocaleConstructor({
    required this.bottomNavigationFields,
    required this.bottomNavigationPlants,
    required this.bottomNavigationProfile,
    required this.appTitle,
    required this.appSubtitle,
    required this.profileTitle,
    required this.fieldsTitle,
    required this.plantsTitle,
    required this.myPlantsSubtitle,
    required this.marketPlantsSubtitle,
    required this.addPlant,
    required this.createPlantAppBarTitle,
    required this.createPlantBasicInfo,
    required this.createPlantAddPic,
    required this.createPlantTakeACutePicture,
    required this.createPlantUploadFromGallery,
    required this.createPlantPlantName,
    required this.createPlantPlantNameHint,
    required this.createPlantPlantFamily,
    required this.createPlantSoilType,
    required this.createPlantPublicPlant,
    required this.createPlantPublicPlantSubtitle,
    required this.createPlantGrowthStages,
    required this.createPlantGrowthStagesSubtitle,
    required this.createStage,
    required this.createStageName,
    required this.createStageNameHint,
    required this.createStageDescription,
    required this.createStageDescriptionHint,
    required this.createStageDuration,
    required this.createStageTimeFormat,
  });

  factory LocaleConstructor.fromJson(Map<String, dynamic> json) => _$LocaleConstructorFromJson(json);

  Map<String, dynamic> toJson() => _$LocaleConstructorToJson(this);

  Map<String, String> toStringMap() {
    Map<String, String> strings = <String, String>{};
    _$LocaleConstructorToJson(this).forEach((key, value) => strings[key] = value.toString());
    return strings;
  }
}
