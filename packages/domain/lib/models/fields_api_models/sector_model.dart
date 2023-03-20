import 'package:json_annotation/json_annotation.dart';

part 'sector_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class SectionModel {
  final String fieldDocId;
  final String title;
  final String? plantIdentifier;
  final List<int>? plantStages;
  final int? currentPlantStage;
  final DateTime startDate;
  final int rows;
  final Map<String, Map<String, double>>? polygon;

  SectionModel(
      {required this.title,
      this.plantIdentifier,
      this.plantStages,
      this.currentPlantStage,
      required this.startDate,
      required this.fieldDocId,
      required this.rows,
      this.polygon});

  factory SectionModel.fromJson(Map<String, dynamic> json) => _$SectionModelFromJson(json);

  Map<String, dynamic> toJson() => _$SectionModelToJson(this);

  SectionModel copyWith(
          {String? fieldDocId,
          String? title,
          String? plantIdentifier,
          List<int>? plantStages,
          int? currentPlantStage,
          DateTime? startDate,
          int? rows,
          Map<String, Map<String, double>>? polygon}) =>
      SectionModel(
          fieldDocId: fieldDocId ?? this.fieldDocId,
          title: title ?? this.title,
          plantIdentifier: plantIdentifier ?? this.plantIdentifier,
          plantStages: plantStages ?? this.plantStages,
          currentPlantStage: currentPlantStage ?? this.currentPlantStage,
          startDate: startDate ?? this.startDate,
          rows: rows ?? this.rows,
          polygon: polygon ?? this.polygon);
}
