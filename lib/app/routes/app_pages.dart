import 'package:get/get.dart';

import '../modules/add_plant/bindings/add_plant_binding.dart';
import '../modules/add_plant/views/add_plant_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/fields_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/plants_view.dart';
import '../modules/home/views/profile_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  //ignore: constant_identifier_names
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.PROFILE,
          page: () => const ProfileView(),
        ),
        GetPage(name: _Paths.PLANTS, page: () => const PlantsView()),
        GetPage(name: _Paths.FIELDS, page: () => const FieldsView()),
      ],
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PLANT,
      page: () => const AddPlantView(),
      binding: AddPlantBinding(),
    ),
  ];
}
