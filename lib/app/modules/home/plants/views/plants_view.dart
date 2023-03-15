import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/plants_controller.dart';

class PlantsView extends GetView<PlantsController> {
  const PlantsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PlantsViewView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PlantsViewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
