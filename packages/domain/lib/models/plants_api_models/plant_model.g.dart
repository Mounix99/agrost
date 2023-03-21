// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlantModel _$PlantModelFromJson(Map<String, dynamic> json) => PlantModel(
      plantDocId: json['plantDocId'] as String?,
      title: json['title'] as String,
      description: json['description'] as String,
      authorDocId: json['authorDocId'] as String,
      stagesLength: json['stagesLength'] as int?,
      soilTypes: (json['soilTypes'] as List<dynamic>).map((e) => $enumDecode(_$SoilTypeEnumMap, e)).toList(),
      public: json['public'] as bool,
      timesAddedByUsers: json['timesAddedByUsers'] as int?,
      createDate: DateTime.parse(json['createDate'] as String),
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$PlantModelToJson(PlantModel instance) => <String, dynamic>{
      'plantDocId': instance.plantDocId,
      'title': instance.title,
      'description': instance.description,
      'authorDocId': instance.authorDocId,
      'stagesLength': instance.stagesLength,
      'soilTypes': instance.soilTypes.map((e) => _$SoilTypeEnumMap[e]!).toList(),
      'public': instance.public,
      'timesAddedByUsers': instance.timesAddedByUsers,
      'createDate': instance.createDate.toIso8601String(),
      'photoUrl': instance.photoUrl,
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
