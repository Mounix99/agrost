import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/fields/bindings/fields_binding.dart';
import '../modules/home/fields/views/fields_view.dart';
import '../modules/home/plants/bindings/plants_binding.dart';
import '../modules/home/plants/views/plants_view.dart';
import '../modules/home/profile/bindings/profile_binding.dart';
import '../modules/home/profile/views/profile_view.dart';
import '../modules/home/views/home_view.dart';
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
          binding: ProfileBinding(),
        ),
        GetPage(
          name: _Paths.PLANTS,
          page: () => const PlantsView(),
          binding: PlantsBinding(),
        ),
        GetPage(
          name: _Paths.FIELDS,
          page: () => const FieldsView(),
          binding: FieldsBinding(),
        ),
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
  ];
}
