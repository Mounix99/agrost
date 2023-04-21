import 'package:agrost/common/translations/local_constructor.dart';

class Ukrainian {
  Map<String, String> get strings => LocaleConstructor(
          appTitle: "AGROST",
          appSubtitle: "Саджаймо і вирощуймо",
          bottomNavigationFields: 'Ділянки',
          bottomNavigationPlants: 'Рослини',
          bottomNavigationProfile: 'Профіль',
          profileTitle: 'Завантажуемо профіль...',
          fieldsTitle: 'Ділянки',
          plantsTitle: 'Рослини',
          myPlantsSubtitle: 'Мої рослини',
          marketPlantsSubtitle: 'Магазин рослин',
          addPlant: 'Додай рослину',
          createPlantAddPic: 'Додайте фото вашої рослини',
          createPlantAppBarTitle: 'Створити рослину',
          createPlantBasicInfo: 'Основна інформація',
          createPlantTakeACutePicture: 'Зробіть миле фото',
          createPlantUploadFromGallery: 'Завантажте з галереї',
          createPlantPlantName: 'Назва рослини',
          createPlantPlantNameHint: 'Картопля',
          createPlantPlantFamily: 'Рослинна сім’я',
          createPlantSoilType: 'Тип ґрунту',
          createPlantDescription: 'Опис рослини',
          createPlantDescriptionHint: 'Розкажіть більше о рослині',
          createPlantPublicPlant: 'Доступна для всіх рослина',
          createPlantPublicPlantSubtitle:
              'Ви можете публікувати свої рослини, щоб інші люди могли додавати їх до своїх списків.',
          createPlantGrowthStages: 'Етапи росту',
          createPlantGrowthStagesSubtitle:
              'Ви можете додати стадії росту, щоб коли рослина буде висаджена, ви могли мати краще уявлення про те, які дії слід вжити.',
          createStageName: 'Імʼя стадії',
          createStageNameHint: 'Паростки',
          createStageDescription: 'Опис стадії',
          createStageDescriptionHint: 'Виросте з...',
          createStageDuration: 'Тривалість',
          createStageTimeFormat: 'Часовий формат',
          createStage: 'Створити стадію')
      .toStringMap();
}
