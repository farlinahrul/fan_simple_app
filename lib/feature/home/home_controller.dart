import 'package:fan_simple_app/data/remote/errorhandler/error_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../data/remote/api_services.dart';
import '../../data/remote/base/base_object_controller.dart';
import '../../model/user.dart' as model_user;
import '../auth/auth_controller.dart';

class HomeController extends BaseObjectController<model_user.User> {
  final AuthController authController = AuthController.find;

  @override
  void onInit() {
    getUser();
    super.onInit();
  }

  void logout() async {
    loadingState();
    await authController.logout();
    finishLoadData();
  }

  Future<void> getUser() async {
    await client()
        .then((value) => value
                .getUser(
                    FirebaseAuth.instance.currentUser?.uid.toString() ?? "")
                .then((value) {
              setFinishCallbacks(value);
            }))
        .handleError((onError) {
      debugPrint("On Error $onError");
      setErrorStatus(onError.toString());
    });
  }
}
