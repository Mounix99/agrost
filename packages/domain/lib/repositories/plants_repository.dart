import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/models/plants_api_models/stage_model.dart';
import 'package:either_dart/either.dart';

import '../models/plants_api_models/plant_model.dart';

abstract class PlantsRepository {
  Future<Either<String, String?>> addPlant({required PlantModel plantModel});

  Future<bool> updatePlant({required String plantDocId, required PlantModel plantModel});

  Future<List<PlantModel>> getListOfMyPlants({required List<String>? plantDocIds});

  Query<PlantModel> getMyPlantsCollection({required String userDocId});

  Future<List<PlantModel>> getListOfMarketPlants();

  Query<PlantModel> getMarketPlantsCollection();

  Future<PlantModel?> getPlantInfo({required String plantDocId});

  Future<bool> deletePlant({required String plantDocId});

  Future<Either<String, String?>> addStage({required StageModel stageModel});

  Future<bool> updateStage({required String stageDocId, required StageModel stageModel});

  Future<List<StageModel>> getListOfStages({required String plantDocId});

  Query<StageModel> getPlantStagesCollection({required String plantDocId});

  Future<StageModel?> getStageInfo({required String plantDocId, required String stageDocId});

  Future<bool> deleteStage({required String plantDocId, required String stageDocId});
}
