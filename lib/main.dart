import 'package:agrost/general_bindings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'common/translations/stings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      title: "app_",
      translations: LocaleString(),
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('uk', 'UA'),
      ],
      locale: Get.deviceLocale,
      initialBinding: GeneralBinding(),
      initialRoute: Routes.SPLASH,
      getPages: AppPages.routes,
    ),
  );
}
