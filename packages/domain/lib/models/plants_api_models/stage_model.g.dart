// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StageModel _$StageModelFromJson(Map<String, dynamic> json) => StageModel(
      plantDocId: json['plantDocId'] as String,
      title: json['title'] as String,
      duration: json['duration'] == null ? null : Duration(microseconds: json['duration'] as int),
      stageDocId: json['stageDocId'] as String?,
    );

Map<String, dynamic> _$StageModelToJson(StageModel instance) => <String, dynamic>{
      'plantDocId': instance.plantDocId,
      'title': instance.title,
      'duration': instance.duration?.inMicroseconds,
      'stageDocId': instance.stageDocId,
    };