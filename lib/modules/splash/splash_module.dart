import 'package:dart_week/application/modules/module.dart';
import 'package:dart_week/modules/splash/splash_page.dart';
import 'package:get/get.dart';

class SplashModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/',
      page: () => SplashPage(),
    )
  ];
}
