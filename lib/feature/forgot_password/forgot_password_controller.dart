import 'package:flutter/material.dart';

import '../../data/remote/base/base_object_controller.dart';

class ForgotPasswordController extends BaseObjectController {
  TextEditingController emailController = TextEditingController();

  Future<void> postForgotPassword() async {
    Map<String, dynamic> requestBody = {};
    requestBody["email"] = emailController.text;

    loadingState();
  }
}
