import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/models/plants_api_models/plant_model.dart';
import 'package:domain/models/plants_api_models/stage_model.dart';

import '../repositories/plants_repository.dart';
import 'firebase_constants.dart';

class FirebasePlantsRepositoryImplementation extends PlantsRepository {
  late final FirebaseFirestore _store;

  FirebasePlantsRepositoryImplementation(this._store);

  CollectionReference<PlantModel> get _plantsRef =>
      _store.collection(CollectionsNaming.plants.serialize()).withConverter(
          fromFirestore: (snapshot, _) => PlantModel.fromJson(snapshot.data()!),
          toFirestore: (plantModel, _) => plantModel.toJson());

  CollectionReference<StageModel> _stageRef({required String plantDocId}) =>
      _plantsRef.doc(plantDocId).collection(CollectionsNaming.stages.serialize()).withConverter<StageModel>(
          fromFirestore: (snapshot, _) => StageModel.fromJson(snapshot.data()!),
          toFirestore: (stageModel, _) => stageModel.toJson());

  @override
  Future<bool> addPlant({required PlantModel plantModel}) async {
    final DocumentReference<Object?> plant = await _plantsRef.add(plantModel);
    return plant.get().then((value) async {
      await updatePlant(plantDocId: plant.id, plantModel: plantModel.copyWith(plantDocId: plant.id));
      return true;
    }).catchError((e) => false);
  }

  @override
  Future<bool> updatePlant({required String plantDocId, required PlantModel plantModel}) async {
    return await _plantsRef
        .doc(plantDocId)
        .update(plantModel.toJson())
        .then((value) => true)
        .catchError((error) => false);
  }

  @override
  Future<PlantModel?> getPlantInfo({required String plantDocId}) async {
    final DocumentSnapshot<PlantModel> snapshot = await _plantsRef.doc(plantDocId).get();
    return snapshot.data();
  }

  @override
  Future<bool> deletePlant({required String plantDocId}) async {
    return await _plantsRef.doc(plantDocId).delete().then((value) => true).catchError((error) => false);
  }

  @override
  Future<List<PlantModel>> getListOfMarketPlants() async {
    final plants = await _plantsRef.where('public', isEqualTo: true).get().then((s) => s.docs);
    return plants.map((e) => e.data()).toList();
  }

  @override
  Future<StageModel?> getStageInfo({required String plantDocId, required String stageDocId}) async {
    final DocumentSnapshot<StageModel> snapshot = await _stageRef(plantDocId: plantDocId).doc(stageDocId).get();
    return snapshot.data();
  }

  @override
  Future<bool> addStage({required StageModel stageModel}) async {
    final DocumentReference<Object?> stage = await _stageRef(plantDocId: stageModel.plantDocId).add(stageModel);
    return stage.get().then((value) async {
      await updateStage(stageDocId: stage.id, stageModel: stageModel.copyWith(stageDocId: stage.id));
      return true;
    }).catchError((e) => false);
  }

  @override
  Future<bool> updateStage({required String stageDocId, required StageModel stageModel}) async {
    return await _stageRef(plantDocId: stageModel.plantDocId)
        .doc(stageDocId)
        .update(stageModel.toJson())
        .then((value) => true)
        .catchError((error) => false);
  }

  @override
  Future<List<StageModel>> getListOfStages({required String plantDocId}) async {
    List<QueryDocumentSnapshot<StageModel>> stages = await _stageRef(plantDocId: plantDocId).get().then((s) => s.docs);
    return stages.map((e) => e.data()).toList();
  }

  @override
  Future<bool> deleteStage({required String plantDocId, required String stageDocId}) async {
    return await _stageRef(plantDocId: plantDocId)
        .doc(stageDocId)
        .delete()
        .then((value) => true)
        .catchError((error) => false);
  }

  @override
  Future<List<PlantModel>> getListOfMyPlants({required List<String>? plantDocIds}) async {
    late List<PlantModel> plants = [];
    if (plantDocIds?.isNotEmpty ?? false) {
      for (String id in plantDocIds!) {
        final plant = await _plantsRef.where('plantDocId', isEqualTo: id).get().then((s) => s.docs);
        plants.addAll(plant.map((e) => e.data()));
      }
    }
    return plants;
  }

  @override
  Query<PlantModel> getMarketPlantsCollection() {
    return _plantsRef.where('public', isEqualTo: true);
  }

  @override
  Query<StageModel> getPlantStagesCollection({required String plantDocId}) {
    return _stageRef(plantDocId: plantDocId).where('plantDocId', isEqualTo: plantDocId);
  }

  @override
  Query<PlantModel> getMyPlantsCollection({required String userDocId}) {
    return _plantsRef.where('usesByUsersDocId', arrayContains: userDocId);
  }
}
