import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_plant_controller.dart';

class AddPlantView extends GetView<AddPlantController> {
  const AddPlantView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddPlantView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddPlantView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
