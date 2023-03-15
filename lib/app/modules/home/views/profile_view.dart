import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: controller.user,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            final user = snapshot.data!;
            return Scaffold(
              appBar: AppBar(
                title: Text(user.displayName ?? ""),
                centerTitle: true,
              ),
              body: _profileContent(user),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text('profileTitle'.tr),
                centerTitle: true,
              ),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }

  Widget _profileContent(User user) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [CircleAvatar(foregroundImage: NetworkImage(user.photoURL ?? ""), radius: 130)],
    );
  }
}
