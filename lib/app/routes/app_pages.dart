import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/fields_view/bindings/fields_view_binding.dart';
import '../modules/home/fields_view/views/fields_view_view.dart';
import '../modules/home/plants_view/bindings/plants_view_binding.dart';
import '../modules/home/plants_view/views/plants_view_view.dart';
import '../modules/home/profile_view/bindings/profile_view_binding.dart';
import '../modules/home/profile_view/views/profile_view_view.dart';
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
          name: _Paths.PROFILE_VIEW,
          page: () => const ProfileView(),
          binding: ProfileViewBinding(),
          children: [
            GetPage(
              name: _Paths.PROFILE_VIEW,
              page: () => const ProfileView(),
              binding: ProfileViewBinding(),
            ),
          ],
        ),
        GetPage(
          name: _Paths.PLANTS_VIEW,
          page: () => const PlantsView(),
          binding: PlantsViewBinding(),
        ),
        GetPage(
          name: _Paths.FIELDS_VIEW,
          page: () => const FieldsView(),
          binding: FieldsViewBinding(),
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
