import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/fields_controller.dart';

class FieldsView extends GetView<FieldsViewController> {
  const FieldsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FieldsViewView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FieldsViewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
