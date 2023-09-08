import 'package:fan_simple_app/routes/page_names.dart';
import 'package:fan_simple_app/utils/helper/shared_preference_manager.dart';
import 'package:fan_simple_app/utils/localization/app_translation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'initializer.dart';
import 'routes/page_routes.dart';
import 'themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Initializer.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            translations: AppTranslation(),
            locale: Locale(SharedPreferenceManager().getAppLocale()),
            fallbackLocale: Locale(SharedPreferenceManager().getAppLocale()),
            initialRoute: PageName.loader,
            getPages: PageRoutes.pages,
            theme: AppTheme.buildThemeData(false),
            builder: (BuildContext context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: child ?? Container(),
              );
            },
          ),
        );
      },
    );
  }
}
