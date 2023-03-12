import 'package:domain/data_source/auth_servise.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Login',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _checkAuth, child: const Text("sign in with google"))
          ],
        ),
      ),
    );
  }

  Future<void> _checkAuth() async {
    final AuthService auth = Get.find();
    final credentials = await auth.signInWithGoogle();
    if (credentials != null) {
      Get.offNamed(Routes.HOME);
    } else {
      Get.snackbar("Error", "credentials are null");
    }
  }
}
