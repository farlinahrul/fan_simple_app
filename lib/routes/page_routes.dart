import 'package:get/get.dart';
import '../feature/loader/loading_page.dart';
import '../feature/login/login_page.dart';
import 'page_names.dart';

class PageRoutes {
  static final pages = [
    GetPage(
      name: PageName.loader,
      page: () => const LoadingPage(),
    ),
    GetPage(
      name: PageName.login,
      page: () => LoginPage(),
    ),
  ];
}
