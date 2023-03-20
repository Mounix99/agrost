import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/models/fields_api_models/field_model.dart';
import 'package:domain/models/fields_api_models/sector_model.dart';
import 'package:domain/repositories/fields_repository.dart';

class FirebaseFieldsService extends FieldsService {
  late final FirebaseFirestore _store;

  FirebaseFieldsService(this._store);

  @override
  Future<bool> addField({required FieldModel fieldModel}) {
    // TODO: implement addField
    throw UnimplementedError();
  }

  @override
  Future<bool> addSection({required SectionModel sectionModel}) {
    // TODO: implement addSection
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteField({required String fieldDocId}) {
    // TODO: implement deleteField
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteSection({required String fieldDocId, required String sectionDocId}) {
    // TODO: implement deleteSection
    throw UnimplementedError();
  }

  @override
  Future<FieldModel> getFieldInfo({required String fieldDocId}) {
    // TODO: implement getFieldInfo
    throw UnimplementedError();
  }

  @override
  Future<List<FieldModel>> getListOfFields({required String userDocId}) {
    // TODO: implement getListOfFields
    throw UnimplementedError();
  }

  @override
  Future<List<SectionModel>> getListOfSections({required String fieldDocId}) {
    // TODO: implement getListOfSections
    throw UnimplementedError();
  }

  @override
  Future<SectionModel> getSectionInfo({required String fieldDocId, required String sectionDocId}) {
    // TODO: implement getSectionInfo
    throw UnimplementedError();
  }

  @override
  Future<bool> splitSection(
      {required String fieldDocId, required String sectionDocId, required SectionModel sectionModel}) {
    // TODO: implement splitSection
    throw UnimplementedError();
  }

  @override
  Future<bool> updateField({required FieldModel fieldModel}) {
    // TODO: implement updateField
    throw UnimplementedError();
  }

  @override
  Future<bool> updateSection({required SectionModel sectionModel}) {
    // TODO: implement updateSection
    throw UnimplementedError();
  }
}
