// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataModel _$UserDataModelFromJson(Map<String, dynamic> json) => UserDataModel(
      paidPlan: json['paidPlan'] as String,
      firstName: json['firstName'] as String,
      email: json['email'] as String?,
      lastName: json['lastName'] as String?,
      fieldsId: (json['fieldsId'] as List<dynamic>?)?.map((e) => e as int).toList(),
      createdPlantsId: (json['createdPlantsId'] as List<dynamic>?)?.map((e) => e as int).toList(),
      addedPlantsId: (json['addedPlantsId'] as List<dynamic>?)?.map((e) => e as int).toList(),
      fcmDeviceIdentifier: json['fcmDeviceIdentifier'] as String?,
      companyName: json['companyName'] as String?,
      companyId: json['companyId'] as String?,
      lastPayment: json['lastPayment'] == null ? null : DateTime.parse(json['lastPayment'] as String),
      userDocId: json['userDocId'] as String?,
      userAvatarUrl: json['userAvatarUrl'] as String?,
    );

Map<String, dynamic> _$UserDataModelToJson(UserDataModel instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'fieldsId': instance.fieldsId,
      'createdPlantsId': instance.createdPlantsId,
      'addedPlantsId': instance.addedPlantsId,
      'fcmDeviceIdentifier': instance.fcmDeviceIdentifier,
      'paidPlan': instance.paidPlan,
      'lastPayment': instance.lastPayment?.toIso8601String(),
      'companyName': instance.companyName,
      'companyId': instance.companyId,
      'userDocId': instance.userDocId,
      'userAvatarUrl': instance.userAvatarUrl,
    };
