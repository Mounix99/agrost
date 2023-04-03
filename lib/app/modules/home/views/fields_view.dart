import 'package:domain/models/fields_api_models/field_model.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/fields_controller.dart';

class FieldsView extends GetView<FieldsViewController> {
  const FieldsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('fieldsTitle'.tr),
      ),
      body: content(context),
      floatingActionButton: fab(),
    );
  }

  FloatingActionButton fab() {
    return FloatingActionButton(onPressed: controller.createMockField);
  }

  Widget content(BuildContext context) {
    return FutureBuilder(
        future: controller.fields,
        builder: (context, query) {
          if (query.hasData) {
            return FirestoreListView<FieldModel>(
              query: query.requireData,
              loadingBuilder: (context) => const CircularProgressIndicator(),
              errorBuilder: (context, object, stackTrace) => const CircularProgressIndicator(),
              emptyBuilder: (context) => const CircularProgressIndicator(),
              itemBuilder: (context, snapshot) {
                // Data is now typed!
                FieldModel fieldModel = snapshot.data();

                return ListTile(
                  title: Text(fieldModel.title),
                );
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
