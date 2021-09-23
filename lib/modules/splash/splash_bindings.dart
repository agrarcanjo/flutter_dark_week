import 'package:dart_week/modules/splash/splash_controller.dart';
import 'package:get/get.dart';

//Ao entrar em um binding, ele constrói o controle e gerencia o ciclo de vida
class SplashBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
