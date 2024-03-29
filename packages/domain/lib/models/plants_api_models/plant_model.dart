import 'package:json_annotation/json_annotation.dart';

import '../../values_and_extensions.dart';

part 'plant_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class PlantModel {
  final String? plantDocId;
  final String title;
  final String? description;
  final String authorDocId;
  final int? stagesLength;
  final List<SoilType> soilTypes;
  final List<String>? usesByUsersDocId;
  final PlantType plantType;
  final bool public;
  final int? timesAddedByUsers;
  final DateTime createDate;
  final DateTime lastUpdateDate;
  final String version;
  final String? photoPath;

  PlantModel(
      {this.plantDocId,
      required this.title,
      this.description,
      required this.authorDocId,
      this.stagesLength,
      required this.soilTypes,
      this.usesByUsersDocId,
      required this.plantType,
      required this.public,
      this.timesAddedByUsers,
      required this.createDate,
      required this.lastUpdateDate,
      required this.version,
      this.photoPath});

  factory PlantModel.fromJson(Map<String, dynamic> json) => _$PlantModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlantModelToJson(this);

  PlantModel copyWith(
          {String? plantDocId,
          String? title,
          String? description,
          String? authorDocId,
          int? stagesLength,
          List<SoilType>? soilTypes,
          List<String>? usesByUsersDocId,
          PlantType? plantType,
          bool? public,
          int? timesAddedByUsers,
          DateTime? createDate,
          DateTime? lastUpdateDate,
          String? version,
          String? photoPath}) =>
      PlantModel(
          plantDocId: plantDocId ?? this.plantDocId,
          title: title ?? this.title,
          description: description ?? this.description,
          authorDocId: authorDocId ?? this.authorDocId,
          stagesLength: stagesLength ?? this.stagesLength,
          soilTypes: soilTypes ?? this.soilTypes,
          usesByUsersDocId: usesByUsersDocId ?? this.usesByUsersDocId,
          plantType: plantType ?? this.plantType,
          public: public ?? this.public,
          timesAddedByUsers: timesAddedByUsers ?? this.timesAddedByUsers,
          createDate: createDate ?? this.createDate,
          lastUpdateDate: lastUpdateDate ?? this.lastUpdateDate,
          photoPath: photoPath ?? this.photoPath,
          version: version ?? this.version);
}
