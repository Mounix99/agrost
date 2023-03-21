// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FieldModel _$FieldModelFromJson(Map<String, dynamic> json) => FieldModel(
      lastStartDate: DateTime.parse(json['lastStartDate'] as String),
      soilTypes: (json['soilTypes'] as List<dynamic>).map((e) => $enumDecode(_$SoilTypeEnumMap, e)).toList(),
      sectionsIdentifiers: (json['sectionsIdentifiers'] as List<dynamic>?)?.map((e) => e as String).toList(),
      title: json['title'] as String,
      subtitle: json['subtitle'] as String?,
      length: json['length'] as int?,
      width: json['width'] as int?,
      lng: (json['lng'] as num).toDouble(),
      lat: (json['lat'] as num).toDouble(),
      polygon: (json['polygon'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as Map<String, dynamic>).map(
              (k, e) => MapEntry(k, (e as num).toDouble()),
            )),
      ),
      userDocId: json['userDocId'] as String,
      connected: json['connected'] as bool,
      fieldDocId: json['fieldDocId'] as String?,
    );

Map<String, dynamic> _$FieldModelToJson(FieldModel instance) => <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'fieldDocId': instance.fieldDocId,
      'length': instance.length,
      'width': instance.width,
      'lastStartDate': instance.lastStartDate.toIso8601String(),
      'soilTypes': instance.soilTypes.map((e) => _$SoilTypeEnumMap[e]!).toList(),
      'sectionsIdentifiers': instance.sectionsIdentifiers,
      'lng': instance.lng,
      'lat': instance.lat,
      'polygon': instance.polygon,
      'userDocId': instance.userDocId,
      'connected': instance.connected,
    };

const _$SoilTypeEnumMap = {
  SoilType.sandy: 'sandy',
  SoilType.sandyLoam: 'sandy_loam',
  SoilType.clay: 'clay',
  SoilType.loamy: 'loamy',
  SoilType.calcareous: 'calcareous',
  SoilType.peaty: 'peaty',
  SoilType.blackSoil: 'black_soil',
  SoilType.others: 'others',
};
