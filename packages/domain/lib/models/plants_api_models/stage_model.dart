import 'package:json_annotation/json_annotation.dart';

part 'stage_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class StageModel {
  final String plantDocId;
  final String title;
  final Duration? duration;
  final String? stageDocId;

  StageModel({required this.plantDocId, required this.title, this.duration, this.stageDocId});

  factory StageModel.fromJson(Map<String, dynamic> json) => _$StageModelFromJson(json);

  Map<String, dynamic> toJson() => _$StageModelToJson(this);

  StageModel copyWith({String? plantDocId, String? title, Duration? duration, String? stageDocId}) => StageModel(
      plantDocId: plantDocId ?? this.plantDocId,
      title: title ?? this.title,
      duration: duration ?? this.duration,
      stageDocId: stageDocId ?? this.stageDocId);
}
