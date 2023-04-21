// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StageModel _$StageModelFromJson(Map<String, dynamic> json) => StageModel(
      plantDocId: json['plantDocId'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      authorDocId: json['authorDocId'] as String,
      durationDelta: json['durationDelta'] as int?,
      stageDocId: json['stageDocId'] as String?,
    );

Map<String, dynamic> _$StageModelToJson(StageModel instance) => <String, dynamic>{
      'plantDocId': instance.plantDocId,
      'title': instance.title,
      'description': instance.description,
      'authorDocId': instance.authorDocId,
      'durationDelta': instance.durationDelta,
      'stageDocId': instance.stageDocId,
    };
