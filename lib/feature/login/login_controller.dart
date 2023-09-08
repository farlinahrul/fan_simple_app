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

  void signInWithEmailAndPassword() async {
    loadingState();
    // await client().then((value) => value.login({
    //       "email": emailController.text,
    //       "password": passwordController.text
    //     }).then((value) async {
    //       if (value.status == 422) {
    //         throw value.result?.message?[0] ?? value.message;
    //       } else if (value.status == 200) {
    //         final token = value.result!.token!;
    //         final user = await getProfile(token);
    //         await authController.saveAuthData(
    //           user: user,
    //           token: token,
    //         );
    //         finishLoadData();
    //         var userData = AuthController.find.user;
    //         if (userData?.id != null)
    //           OneSignal.shared.setExternalUserId("${userData?.id}");
    //         authController.setAuth();
    //       } else {
    //         throw value.message;
    //       }
    //     }).handleError((onError) {
    //       debugPrint("Sign in with email password $onError");
    //       finishLoadData(errorMessage: onError);
    //     }));
  }
}
