import 'package:fan_simple_app/data/remote/base/base_object_controller.dart';
import 'package:flutter/material.dart';

import '../auth/auth_controller.dart';

class LoginController extends BaseObjectController<String> {
  final AuthController authController = AuthController.find;
  bool hidePassword = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void tooglePasswordVisibility() {
    hidePassword = !hidePassword;
    update();
  }

  void login() async {
    loadingState();
    await authController.login(
        emailController.text.trim(), passwordController.text.trim());
    finishLoadData();
  }
}
