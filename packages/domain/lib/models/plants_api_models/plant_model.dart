import 'package:json_annotation/json_annotation.dart';

import '../../values_and_extentions.dart';

part 'plant_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class PlantModel {
  final String? plantDocId;
  final String title;
  final String description;
  final String authorDocId;
  final int? stagesLength;
  final List<SoilType> soilTypes;
  final PlantType plantType;
  final bool public;
  final int? timesAddedByUsers;
  final DateTime createDate;
  final DateTime lastUpdateDate;
  final String version;
  final String? photoUrl;

  PlantModel(
      {this.plantDocId,
      required this.title,
      required this.description,
      required this.authorDocId,
      this.stagesLength,
      required this.soilTypes,
      required this.plantType,
      required this.public,
      this.timesAddedByUsers,
      required this.createDate,
      required this.lastUpdateDate,
      required this.version,
      this.photoUrl});

  factory PlantModel.fromJson(Map<String, dynamic> json) => _$PlantModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlantModelToJson(this);

  PlantModel copyWith(
          {String? plantDocId,
          String? title,
          String? description,
          String? authorDocId,
          int? stagesLength,
          List<SoilType>? soilTypes,
          PlantType? plantType,
          bool? public,
          int? timesAddedByUsers,
          DateTime? createDate,
          DateTime? lastUpdateDate,
          String? version,
          String? photoUrl}) =>
      PlantModel(
          plantDocId: plantDocId ?? this.plantDocId,
          title: title ?? this.title,
          description: description ?? this.description,
          authorDocId: authorDocId ?? this.authorDocId,
          stagesLength: stagesLength ?? this.stagesLength,
          soilTypes: soilTypes ?? this.soilTypes,
          plantType: plantType ?? this.plantType,
          public: public ?? this.public,
          timesAddedByUsers: timesAddedByUsers ?? this.timesAddedByUsers,
          createDate: createDate ?? this.createDate,
          lastUpdateDate: lastUpdateDate ?? this.lastUpdateDate,
          photoUrl: photoUrl ?? this.photoUrl,
          version: version ?? this.version);
}
