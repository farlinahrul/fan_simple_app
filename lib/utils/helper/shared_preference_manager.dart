import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class SharedPreferenceManager {
  var _preference = Get.find<SharedPreferences>();
  String _appLocale = "app_locale";

  // app locale
  String getAppLocale() {
    return _preference.getString(_appLocale) ?? "en";
  }

  Future setAppLocale({required String locale}) async {
    return await _preference.setString(_appLocale, locale);
  }

  clearData() async {}
}
