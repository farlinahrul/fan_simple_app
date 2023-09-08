import 'dart:async';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'feature/auth/auth_controller.dart';

class Initializer {
  static Future<void> init() async {
    try {
      await globalLocalData();
      Get.put<AuthController>(AuthController());
    } catch (err) {
      rethrow;
    }
  }

  static globalLocalData() async {
    // Global Local Database
    await Get.putAsync<SharedPreferences>(() async {
      return await SharedPreferences.getInstance();
    });
  }
}
