import 'package:firebase_auth/firebase_auth.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_data_model.g.dart';

enum PaidPlans { noPlan, firstPlan, secondPlan, thirdPlan }

@JsonSerializable(fieldRename: FieldRename.none)
class UserDataModel {
  final String firstName;
  final String? lastName;
  final String? email;
  final List<String>? fieldsId;
  final List<String>? createdPlantsId;
  final List<String>? currentPlantsId;
  final String? fcmDeviceIdentifier;
  final String paidPlan;
  final DateTime? lastPayment;
  final String? companyName;
  final String? companyId;
  final String? userDocId;
  final String? userAvatarUrl;

  UserDataModel(
      {required this.paidPlan,
      required this.firstName,
      required this.email,
      this.lastName,
      this.fieldsId,
      this.createdPlantsId,
      this.currentPlantsId,
      this.fcmDeviceIdentifier,
      this.companyName,
      this.companyId,
      this.lastPayment,
      this.userDocId,
      required this.userAvatarUrl});

  factory UserDataModel.fromJson(Map<String, dynamic> json) => _$UserDataModelFromJson(json);

  factory UserDataModel.fromFirebaseUser(User? user) => UserDataModel(
      firstName: user?.displayName ?? "",
      email: user?.email,
      paidPlan: PaidPlans.noPlan.name,
      userAvatarUrl: user?.photoURL);

  Map<String, dynamic> toJson() => _$UserDataModelToJson(this);

  UserDataModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    List<String>? fieldsId,
    List<String>? createdPlantsId,
    List<String>? currentPlantsId,
    String? fcmDeviceIdentifier,
    String? paidPlan,
    DateTime? lastPayment,
    String? companyName,
    String? companyId,
    String? userDocId,
    String? userAvatarUrl,
  }) =>
      UserDataModel(
          firstName: firstName ?? this.firstName,
          lastName: lastName ?? this.lastName,
          email: email ?? this.email,
          fieldsId: fieldsId ?? this.fieldsId,
          createdPlantsId: createdPlantsId ?? this.createdPlantsId,
          currentPlantsId: currentPlantsId ?? this.currentPlantsId,
          fcmDeviceIdentifier: fcmDeviceIdentifier ?? this.fcmDeviceIdentifier,
          paidPlan: paidPlan ?? this.paidPlan,
          lastPayment: lastPayment ?? this.lastPayment,
          companyName: companyName ?? this.companyName,
          companyId: companyId ?? this.companyId,
          userDocId: userDocId ?? this.userDocId,
          userAvatarUrl: userAvatarUrl ?? this.userAvatarUrl);
}
