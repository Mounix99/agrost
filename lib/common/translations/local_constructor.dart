import 'package:json_annotation/json_annotation.dart';

part 'local_constructor.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class LocaleConstructor {
  final String appTitle;
  final String appSubtitle;

  final String bottomNavigationFields;
  final String bottomNavigationPlants;
  final String bottomNavigationProfile;

  LocaleConstructor(
      {required this.bottomNavigationFields,
      required this.bottomNavigationPlants,
      required this.bottomNavigationProfile,
      required this.appTitle,
      required this.appSubtitle});

  factory LocaleConstructor.fromJson(Map<String, dynamic> json) => _$LocaleConstructorFromJson(json);

  Map<String, dynamic> toJson() => _$LocaleConstructorToJson(this);

  Map<String, String> toStringMap() {
    Map<String, String> strings = <String, String>{};
    _$LocaleConstructorToJson(this).forEach((key, value) => strings[key] = value.toString());
    return strings;
  }
}
