// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sector_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionModel _$SectionModelFromJson(Map<String, dynamic> json) => SectionModel(
      title: json['title'] as String,
      plantIdentifier: json['plantIdentifier'] as String?,
      plantStages: (json['plantStages'] as List<dynamic>?)?.map((e) => e as int).toList(),
      currentPlantStage: json['currentPlantStage'] as int?,
      startDate: DateTime.parse(json['startDate'] as String),
      fieldDocId: json['fieldDocId'] as String,
      rows: json['rows'] as int,
      polygon: (json['polygon'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as Map<String, dynamic>).map(
              (k, e) => MapEntry(k, (e as num).toDouble()),
            )),
      ),
      sectionDocId: json['sectionDocId'] as String?,
    );

Map<String, dynamic> _$SectionModelToJson(SectionModel instance) => <String, dynamic>{
      'fieldDocId': instance.fieldDocId,
      'sectionDocId': instance.sectionDocId,
      'title': instance.title,
      'plantIdentifier': instance.plantIdentifier,
      'plantStages': instance.plantStages,
      'currentPlantStage': instance.currentPlantStage,
      'startDate': instance.startDate.toIso8601String(),
      'rows': instance.rows,
      'polygon': instance.polygon,
    };
