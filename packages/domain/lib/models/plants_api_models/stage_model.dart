import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stage_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class StageModel extends Equatable {
  final String plantDocId;
  final String title;
  final String? description;
  final String authorDocId;
  final int? durationDelta;
  final String? stageDocId;

  const StageModel(
      {required this.plantDocId,
      required this.title,
      this.description,
      required this.authorDocId,
      this.durationDelta,
      this.stageDocId});

  factory StageModel.fromJson(Map<String, dynamic> json) => _$StageModelFromJson(json);

  Map<String, dynamic> toJson() => _$StageModelToJson(this);

  StageModel copyWith(
          {String? plantDocId,
          String? title,
          String? description,
          String? authorDocId,
          int? durationDelta,
          String? stageDocId}) =>
      StageModel(
          plantDocId: plantDocId ?? this.plantDocId,
          title: title ?? this.title,
          description: description ?? this.description,
          authorDocId: authorDocId ?? this.authorDocId,
          durationDelta: durationDelta ?? this.durationDelta,
          stageDocId: stageDocId ?? this.stageDocId);

  @override
  List<Object?> get props => [plantDocId, title, description, authorDocId, durationDelta, stageDocId];
}
