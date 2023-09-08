import 'package:fan_simple_app/routes/page_names.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController find = Get.find();
  @override
  void onReady() {
    super.onReady();
    init();
  }

  init() async {
    Get.offAllNamed(PageName.login);
  }
}
