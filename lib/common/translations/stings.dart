import 'package:agrost/common/translations/ukrainian.dart';
import 'package:agrost/common/translations/english.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';

class LocaleString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': English().strings,
    'uk_UA': Ukrainian().strings
  };
}
