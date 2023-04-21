// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlantModel _$PlantModelFromJson(Map<String, dynamic> json) => PlantModel(
      plantDocId: json['plantDocId'] as String?,
      title: json['title'] as String,
      description: json['description'] as String?,
      authorDocId: json['authorDocId'] as String,
      stagesLength: json['stagesLength'] as int?,
      soilTypes: (json['soilTypes'] as List<dynamic>).map((e) => $enumDecode(_$SoilTypeEnumMap, e)).toList(),
      usesByUsersDocId: (json['usesByUsersDocId'] as List<dynamic>?)?.map((e) => e as String).toList(),
      plantType: $enumDecode(_$PlantTypeEnumMap, json['plantType']),
      public: json['public'] as bool,
      timesAddedByUsers: json['timesAddedByUsers'] as int?,
      createDate: DateTime.parse(json['createDate'] as String),
      lastUpdateDate: DateTime.parse(json['lastUpdateDate'] as String),
      version: json['version'] as String,
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$PlantModelToJson(PlantModel instance) => <String, dynamic>{
      'plantDocId': instance.plantDocId,
      'title': instance.title,
      'description': instance.description,
      'authorDocId': instance.authorDocId,
      'stagesLength': instance.stagesLength,
      'soilTypes': instance.soilTypes.map((e) => _$SoilTypeEnumMap[e]!).toList(),
      'usesByUsersDocId': instance.usesByUsersDocId,
      'plantType': _$PlantTypeEnumMap[instance.plantType]!,
      'public': instance.public,
      'timesAddedByUsers': instance.timesAddedByUsers,
      'createDate': instance.createDate.toIso8601String(),
      'lastUpdateDate': instance.lastUpdateDate.toIso8601String(),
      'version': instance.version,
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

const _$PlantTypeEnumMap = {
  PlantType.trees: 'Trees',
  PlantType.fruitTrees: 'Fruit trees',
  PlantType.shrubs: 'Shrubs',
  PlantType.vines: 'Vines',
  PlantType.grasses: 'Grasses',
  PlantType.ferns: 'Ferns',
  PlantType.mosses: 'Mosses',
  PlantType.algae: 'Algae',
  PlantType.lichens: 'Lichens',
  PlantType.succulents: 'Succulents',
  PlantType.aquaticPlants: 'Aquatic plants',
  PlantType.epiphytes: 'Epiphytes',
  PlantType.annuals: 'Annuals',
  PlantType.biennials: 'Biennials',
  PlantType.perennials: 'Perennials',
  PlantType.bulbs: 'Bulbs',
  PlantType.cacti: 'Cacti',
  PlantType.carnivorousPlants: 'Carnivorous plants',
  PlantType.deciduousPlants: 'deciduousPlants',
  PlantType.evergreenPlants: 'Evergreen plants',
};
