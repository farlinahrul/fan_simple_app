import 'package:flutter/material.dart';

import '../../data/remote/base/base_object_controller.dart';

class RegisterController extends BaseObjectController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  String? validatePasswordConfirmation() {
    if (passwordController.text.isEmpty) {
      return "Password field empty";
    }
    if (passwordConfirmationController.text != passwordController.text) {
      return "password confirmation isn't match";
    }
    return null;
  }
}
