import 'package:flutter/material.dart';

import '../../data/remote/base/base_object_controller.dart';
import '../auth/auth_controller.dart';

class RegisterController extends BaseObjectController {
  final AuthController authController = AuthController.find;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  bool hidePassword = true;
  bool hidePasswordConfirmation = true;

  void tooglePasswordVisibility() {
    hidePassword = !hidePassword;
    update();
  }

  void tooglePasswordConfirmationVisibility() {
    hidePassword = !hidePassword;
    update();
  }

  String? validatePasswordConfirmation() {
    if (passwordController.text.isEmpty) {
      return "Password field empty";
    }
    if (passwordConfirmationController.text != passwordController.text) {
      return "password confirmation isn't match";
    }
    return null;
  }

  Future<void> register() async {
    loadingState();
    await authController.register(emailController.text.trim(),
        passwordController.text.trim(), nameController.text.trim());
    finishLoadData();
  }
}
