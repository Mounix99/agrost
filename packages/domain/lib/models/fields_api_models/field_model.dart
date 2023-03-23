import 'package:json_annotation/json_annotation.dart';

import '../../values_and_extentions.dart';

part 'field_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class FieldModel {
  final String title;
  final String? subtitle;
  final String? fieldDocId;
  final int? length;
  final int? width;
  final DateTime lastStartDate;
  final List<SoilType> soilTypes;
  final List<String>? sectionsIdentifiers;
  final double lng;
  final double lat;
  final Map<String, Map<String, double>>? polygon;
  final String userDocId;
  final bool connected;

  FieldModel({
    required this.lastStartDate,
    required this.soilTypes,
    this.sectionsIdentifiers,
    required this.title,
    this.subtitle,
    this.length,
    this.width,
    required this.lng,
    required this.lat,
    this.polygon,
    required this.userDocId,
    required this.connected,
    this.fieldDocId,
  });

  factory FieldModel.fromJson(Map<String, dynamic> json) => _$FieldModelFromJson(json);

  Map<String, dynamic> toJson() => _$FieldModelToJson(this);

  FieldModel copyWith(
          {String? title,
          String? subtitle,
          int? length,
          int? width,
          DateTime? lastStartDate,
          List<SoilType>? soilTypes,
          List<String>? sectionsIdentifiers,
          double? lng,
          double? lat,
          Map<String, Map<String, double>>? polygon,
          String? userDocId,
          bool? connected,
          String? fieldDocId}) =>
      FieldModel(
          title: title ?? this.title,
          subtitle: subtitle ?? this.subtitle,
          length: length ?? this.length,
          width: width ?? this.width,
          lastStartDate: lastStartDate ?? this.lastStartDate,
          soilTypes: soilTypes ?? this.soilTypes,
          sectionsIdentifiers: sectionsIdentifiers ?? this.sectionsIdentifiers,
          lng: lng ?? this.lng,
          lat: lat ?? this.lat,
          polygon: polygon ?? this.polygon,
          userDocId: userDocId ?? this.userDocId,
          connected: connected ?? this.connected,
          fieldDocId: fieldDocId ?? this.fieldDocId);
}
