import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/models/fields_api_models/field_model.dart';
import 'package:domain/models/fields_api_models/sector_model.dart';

abstract class FieldsRepository {
  Future<bool> addField({required FieldModel fieldModel});

  Future<bool> updateField({required String fieldDocId, required FieldModel fieldModel});

  Future<List<FieldModel>> getListOfFields({required String userDocId});

  Future<Query<FieldModel>> getUserFieldsCollection({required String userDocId});

  Future<FieldModel?> getFieldInfo({required String fieldDocId});

  Future<bool> deleteField({required String fieldDocId});

  Future<bool> addSection({required SectionModel sectionModel});

  Future<bool> updateSection({required String sectionDocId, required SectionModel sectionModel});

  Future<List<SectionModel>> getListOfSections({required String fieldDocId});

  Future<SectionModel?> getSectionInfo({required String fieldDocId, required String sectionDocId});

  Future<bool> deleteSection({required String fieldDocId, required String sectionDocId});

  Future<bool> splitSection({required SectionModel sectionModel});
}
