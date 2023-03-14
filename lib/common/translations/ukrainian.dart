import 'package:agrost/common/translations/local_constructor.dart';

class Ukrainian {
  Map<String, String> get strings => LocaleConstructor(
          appTitle: "AGROST",
          appSubtitle: "Саджаймо і вирощуймо",
          bottomNavigationFields: 'Ділянки',
          bottomNavigationPlants: 'Рослини',
          bottomNavigationProfile: 'Профіль')
      .toStringMap();
}
