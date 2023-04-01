import 'package:agrost/general_bindings.dart';
import 'package:antd_mobile/antd_mobile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'common/theme.dart';
import 'common/translations/stings.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: kIsWeb ? DefaultFirebaseOptions.currentPlatform : null,
  );
  runApp(
    AntApp(
      child: GetMaterialApp(
        title: "appTitle".tr,
        translations: LocaleString(),
        theme: generalTheme,
        supportedLocales: const [
          Locale.fromSubtags(languageCode: 'en'),
          Locale.fromSubtags(languageCode: 'uk'),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: Get.deviceLocale,
        initialBinding: GeneralBinding(),
        initialRoute: Routes.SPLASH,
        getPages: AppPages.routes,
      ),
    ),
  );
}
