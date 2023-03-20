import 'package:json_annotation/json_annotation.dart';

part 'field_model.g.dart';

enum SoilType { sandy, sandyLoam, clay, loamy, calcareous, peaty, blackSoil, others }

@JsonSerializable(fieldRename: FieldRename.none)
class FieldModel {
  final String title;
  final String? subtitle;
  final int? length;
  final int? width;
  final DateTime lastStartDate;
  final SoilType soilType;
  final List<String>? sectionsIdentifiers;
  final double lng;
  final double lat;
  final Map<String, Map<String, double>>? polygon;
  final String userDocId;

  FieldModel(
      {required this.lastStartDate,
      required this.soilType,
      this.sectionsIdentifiers,
      required this.title,
      this.subtitle,
      this.length,
      this.width,
      required this.lng,
      required this.lat,
      this.polygon,
      required this.userDocId});

  factory FieldModel.fromJson(Map<String, dynamic> json) => _$FieldModelFromJson(json);

  Map<String, dynamic> toJson() => _$FieldModelToJson(this);

  FieldModel copyWith(
          {String? title,
          String? subtitle,
          int? length,
          int? width,
          DateTime? lastStartDate,
          SoilType? soilType,
          List<String>? sectionsIdentifiers,
          double? lng,
          double? lat,
          Map<String, Map<String, double>>? polygon,
          String? userDocId}) =>
      FieldModel(
          title: title ?? this.title,
          subtitle: subtitle ?? this.subtitle,
          length: length ?? this.length,
          width: width ?? this.width,
          lastStartDate: lastStartDate ?? this.lastStartDate,
          soilType: soilType ?? this.soilType,
          sectionsIdentifiers: sectionsIdentifiers ?? this.sectionsIdentifiers,
          lng: lng ?? this.lng,
          lat: lat ?? this.lat,
          polygon: polygon ?? this.polygon,
          userDocId: userDocId ?? this.userDocId);
}
