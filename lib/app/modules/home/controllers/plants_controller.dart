import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/models/plants_api_models/plant_model.dart';
import 'package:domain/repositories/plants_repository.dart';
import 'package:domain/repositories/user_repository.dart';
import 'package:domain/values_and_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlantsController extends GetxController with GetSingleTickerProviderStateMixin {
  late PlantsRepository _plantsRepository;
  late UserRepository _userRepository;
  late TabController tabController;
  final List<Tab> plantTabs = <Tab>[
    Tab(
      text: 'myPlantsSubtitle'.tr,
    ),
    Tab(
      text: 'marketPlantsSubtitle'.tr,
    ),
  ];

  @override
  void onInit() {
    _plantsRepository = Get.find();
    _userRepository = Get.find();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {});
    super.onInit();
  }

  Future<String> get userDocId => _userRepository.getCurrentUserDocId();

  Future<Query<PlantModel>> get myPlants async => _plantsRepository.getMyPlantsCollection(userDocId: await userDocId);

  Query<PlantModel> get marketPlants => _plantsRepository.getMarketPlantsCollection();

  Future<void> createMockPublicPlant() async => _plantsRepository.addPlant(
      plantModel: PlantModel(
          title: "Plant",
          description: "public plant",
          authorDocId: "FFFFFFFFFFFFF",
          soilTypes: [SoilType.blackSoil],
          usesByUsersDocId: ["FFFFFFFFFFFFF", await userDocId],
          plantType: PlantType.cacti,
          public: true,
          createDate: DateTime.now(),
          lastUpdateDate: DateTime.now(),
          version: "0.0.1"));

  Future<void> createMockPrivatePlant() async => _plantsRepository.addPlant(
      plantModel: PlantModel(
          title: "Plant",
          description: "private plant",
          authorDocId: await userDocId,
          soilTypes: [SoilType.blackSoil],
          usesByUsersDocId: ["FFFFFFFFFFFFF", await userDocId],
          plantType: PlantType.cacti,
          public: false,
          createDate: DateTime.now(),
          lastUpdateDate: DateTime.now(),
          version: "0.0.1"));

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
