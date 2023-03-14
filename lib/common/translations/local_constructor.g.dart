// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_constructor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocaleConstructor _$LocaleConstructorFromJson(Map<String, dynamic> json) => LocaleConstructor(
      bottomNavigationFields: json['bottomNavigationFields'] as String,
      bottomNavigationPlants: json['bottomNavigationPlants'] as String,
      bottomNavigationProfile: json['bottomNavigationProfile'] as String,
      appTitle: json['appTitle'] as String,
      appSubtitle: json['appSubtitle'] as String,
    );

Map<String, dynamic> _$LocaleConstructorToJson(LocaleConstructor instance) => <String, dynamic>{
      'appTitle': instance.appTitle,
      'appSubtitle': instance.appSubtitle,
      'bottomNavigationFields': instance.bottomNavigationFields,
      'bottomNavigationPlants': instance.bottomNavigationPlants,
      'bottomNavigationProfile': instance.bottomNavigationProfile,
    };
