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
      ).toStringMap();
}
