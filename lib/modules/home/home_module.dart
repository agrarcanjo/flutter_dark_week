import 'package:dart_week/application/modules/module.dart';
import 'package:dart_week/modules/home/home_bindings.dart';
import 'package:dart_week/modules/home/home_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class HomeModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/home',
      page: () => HomePage(),
      binding: HomeBindings(),
    )
  ];
}
