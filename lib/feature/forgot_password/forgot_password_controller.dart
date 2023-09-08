import 'package:flutter/material.dart';

import '../../data/remote/base/base_object_controller.dart';
import '../auth/auth_controller.dart';

class ForgotPasswordController extends BaseObjectController {
  final AuthController authController = AuthController.find;

  TextEditingController emailController = TextEditingController();

  Future<void> postForgotPassword() async {
    loadingState();
    await authController.forgotPassword(emailController.text.trim());
    finishLoadData();
  }
}
