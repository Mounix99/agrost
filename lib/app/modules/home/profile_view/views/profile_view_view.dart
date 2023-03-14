import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_view_controller.dart';

class ProfileView extends GetView<ProfileViewController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileViewView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfileViewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
