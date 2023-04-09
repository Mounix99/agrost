import 'local_constructor.dart';

class English {
  Map<String, String> get strings => LocaleConstructor(
          appTitle: "AGROST",
          appSubtitle: "Let's plant and grow",
          bottomNavigationFields: 'Fields',
          bottomNavigationPlants: 'Plants',
          bottomNavigationProfile: 'Profile',
          profileTitle: 'loading your profile',
          fieldsTitle: 'Fields',
          plantsTitle: 'Plants',
          myPlantsSubtitle: 'My plants',
          marketPlantsSubtitle: 'Plants market',
          addPlant: 'Add plant',
          createPlantAddPic: 'Add a pic of your plant',
          createPlantAppBarTitle: 'Create plant',
          createPlantBasicInfo: 'Basic information',
          createPlantTakeACutePicture: 'Take a cute picture',
          createPlantUploadFromGallery: 'Upload from gallery',
          createPlantPlantName: 'Plant name',
          createPlantPlantNameHint: 'Potato',
          createPlantPlantFamily: 'Plant family',
          createPlantSoilType: 'Soil type',
          createPlantPublicPlant: 'Public plant',
          createPlantPublicPlantSubtitle: 'You can publish your plants so other agro-people can add it to their lists.',
          createPlantGrowthStages: 'Growth stages',
          createPlantGrowthStagesSubtitle:
              'You can add growth stages so when this plant is planted you can have a better overview of what actions should be taken.',
          createStageName: 'Stage name',
          createStageNameHint: 'Sprouting',
          createStageDescription: 'Stage description',
          createStageDescriptionHint: 'Will grow from...',
          createStageDuration: 'Duration',
          createStageTimeFormat: 'Time format',
          createStage: 'Create stage')
      .toStringMap();
}
