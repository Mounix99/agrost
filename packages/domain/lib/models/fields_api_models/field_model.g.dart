// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FieldModel _$FieldModelFromJson(Map<String, dynamic> json) => FieldModel(
      lastStartDate: DateTime.parse(json['lastStartDate'] as String),
      soilType: $enumDecode(_$SoilTypeEnumMap, json['soilType']),
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
    );

Map<String, dynamic> _$FieldModelToJson(FieldModel instance) => <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'length': instance.length,
      'width': instance.width,
      'lastStartDate': instance.lastStartDate.toIso8601String(),
      'soilType': _$SoilTypeEnumMap[instance.soilType]!,
      'sectionsIdentifiers': instance.sectionsIdentifiers,
      'lng': instance.lng,
      'lat': instance.lat,
      'polygon': instance.polygon,
      'userDocId': instance.userDocId,
    };

const _$SoilTypeEnumMap = {
  SoilType.sandy: 'sandy',
  SoilType.sandyLoam: 'sandyLoam',
  SoilType.clay: 'clay',
  SoilType.loamy: 'loamy',
  SoilType.calcareous: 'calcareous',
  SoilType.peaty: 'peaty',
  SoilType.blackSoil: 'blackSoil',
  SoilType.others: 'others',
};
