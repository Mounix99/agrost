import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/firebase_data_source/firebase_constants.dart';
import 'package:domain/models/fields_api_models/field_model.dart';
import 'package:domain/models/fields_api_models/sector_model.dart';
import 'package:domain/repositories/fields_repository.dart';

class FirebaseFieldsRepositoryImplementation extends FieldsRepository {
  late final FirebaseFirestore _store;

  FirebaseFieldsRepositoryImplementation(this._store);

  CollectionReference<FieldModel> get _fieldsRef =>
      _store.collection(CollectionsNaming.fields.serialize()).withConverter(
          fromFirestore: (snapshot, _) => FieldModel.fromJson(snapshot.data()!),
          toFirestore: (fieldModel, _) => fieldModel.toJson());

  CollectionReference<SectionModel> _sectionRef({required String fieldDocId}) =>
      _fieldsRef.doc(fieldDocId).collection(CollectionsNaming.sections.serialize()).withConverter<SectionModel>(
          fromFirestore: (snapshot, _) => SectionModel.fromJson(snapshot.data()!),
          toFirestore: (sectionModel, _) => sectionModel.toJson());

  @override
  Future<bool> addField({required FieldModel fieldModel}) async {
    final DocumentReference<Object?> field = await _fieldsRef.add(fieldModel);
    return field.get().then((value) async {
      await updateField(fieldDocId: field.id, fieldModel: fieldModel.copyWith(fieldDocId: field.id));
      return true;
    }).catchError((e) => false);
  }

  @override
  Future<bool> updateField({required String fieldDocId, required FieldModel fieldModel}) async {
    return await _fieldsRef
        .doc(fieldDocId)
        .update(fieldModel.toJson())
        .then((value) => true)
        .catchError((error) => false);
  }

  @override
  Future<bool> deleteField({required String fieldDocId}) async {
    return await _fieldsRef.doc(fieldDocId).delete().then((value) => true).catchError((error) => false);
  }

  @override
  Future<FieldModel?> getFieldInfo({required String fieldDocId}) async {
    final DocumentSnapshot<FieldModel> snapshot = await _fieldsRef.doc(fieldDocId).get();
    return snapshot.data();
  }

  @override
  Future<List<FieldModel>> getListOfFields({required String userDocId}) async {
    final fieldsRef = await _fieldsRef.where('userDocId', isEqualTo: userDocId).get().then((s) => s.docs);
    return fieldsRef.map((e) => e.data()).toList();
  }

  @override
  Query<FieldModel> getUserFieldsCollection({required String userDocId}) {
    return _fieldsRef.where('userDocId', isEqualTo: userDocId);
  }

  @override
  Query<SectionModel> getFieldsSectionsCollection({required String fieldDocId}) {
    return _sectionRef(fieldDocId: fieldDocId).where('fieldDocId', isEqualTo: fieldDocId);
  }

  @override
  Future<List<SectionModel>> getListOfSections({required String fieldDocId}) async {
    List<QueryDocumentSnapshot<SectionModel>> fields =
        await _sectionRef(fieldDocId: fieldDocId).get().then((s) => s.docs);
    return fields.map((e) => e.data()).toList();
  }

  @override
  Future<SectionModel?> getSectionInfo({required String fieldDocId, required String sectionDocId}) async {
    DocumentSnapshot<SectionModel> section = await _sectionRef(fieldDocId: fieldDocId).doc(sectionDocId).get();
    return section.data();
  }

  @override
  Future<bool> deleteSection({required String fieldDocId, required String sectionDocId}) async {
    return await _sectionRef(fieldDocId: fieldDocId)
        .doc(sectionDocId)
        .delete()
        .then((value) => true)
        .catchError((error) => false);
  }

  @override
  Future<bool> updateSection({required String sectionDocId, required SectionModel sectionModel}) async {
    return await _sectionRef(fieldDocId: sectionModel.fieldDocId)
        .doc(sectionDocId)
        .update(sectionModel.toJson())
        .then((value) => true)
        .catchError((error) => false);
  }

  @override
  Future<bool> addSection({required SectionModel sectionModel}) async {
    DocumentReference<SectionModel> section = await _sectionRef(fieldDocId: sectionModel.fieldDocId).add(sectionModel);
    return section.get().then((value) async {
      await updateSection(sectionDocId: section.id, sectionModel: sectionModel.copyWith(fieldDocId: section.id));
      return true;
    }).catchError((e) => false);
  }

  @override
  Future<bool> splitSection({required SectionModel sectionModel}) async {
    final bool updateOld = await updateSection(
        sectionDocId: sectionModel.sectionDocId!,
        sectionModel: sectionModel.copyWith(rows: (sectionModel.rows / 2).floor()));
    final bool addNew = await addSection(sectionModel: sectionModel.copyWith(rows: (sectionModel.rows / 2).ceil()));
    return updateOld && addNew;
  }
}
