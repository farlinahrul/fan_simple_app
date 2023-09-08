import 'package:fan_simple_app/data/remote/errorhandler/error_handler.dart';
import 'package:fan_simple_app/routes/page_names.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/remote/api_services.dart';
import 'auth_state.dart';

class AuthController extends GetxController {
  static AuthController find = Get.find();
  late Rx<User?> currentUser;
  Rxn<AuthState> authState = Rxn<AuthState>();
  bool isNewAccount = false;

  @override
  void onInit() {
    currentUser = Rx<User?>(FirebaseAuth.instance.currentUser);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    currentUser.bindStream(FirebaseAuth.instance.userChanges());
    ever(currentUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    debugPrint("TOKEN: ");
    debugPrint(user?.getIdToken().toString());
    if (user == null) {
      Get.toNamed(PageName.login);
    } else {
      Get.toNamed(PageName.home);
      if (isNewAccount) {
        sendEmailVerification();
        isNewAccount = false;
      }
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (firebaseAuthException) {
      setErrorStatus(firebaseAuthException.toString());
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (firebaseAuthException) {
      setErrorStatus(firebaseAuthException.toString());
    }
  }

  Future<void> register(String email, String password, String name) async {
    try {
      isNewAccount = true;
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await client()
          .then((value) => value.addUser(
              FirebaseAuth.instance.currentUser?.uid.toString() ?? "",
              {'name': name}).then((value) {}))
          .handleError((onError) {
        debugPrint("On Error $onError");
        setErrorStatus(onError.toString());
      });
    } catch (firebaseAuthException) {
      setErrorStatus(firebaseAuthException.toString());
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await FirebaseAuth.instance.currentUser?.sendEmailVerification();
      Get.snackbar("Email Verification sended", "Verify Your Email!");
    } catch (firebaseAuthException) {
      setErrorStatus(firebaseAuthException.toString());
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Get.snackbar("Email Recovery sended", "Reset your password by email!");
    } catch (firebaseAuthException) {
      setErrorStatus(firebaseAuthException.toString());
    }
  }

  void setErrorStatus(String message) {
    message = (message.isNotEmpty) ? message : "Something when wrong..";
    Get.snackbar('txt_error_title'.tr, message.toString(),
        backgroundColor: Colors.red, colorText: Colors.white);
  }
}
