import 'package:dart_week/application/rest_client/rest_client.dart';
import 'package:dart_week/repositories/login_repository.dart';
import 'package:dart_week/repositories/login_repository_impl.dart';
import 'package:dart_week/services/login/login_service_impl.dart';
import 'package:get/get.dart';

//guarda todos os bindings q serão acessados na aplicação como um todo
class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient());
    //fenix permite que o objeto não seja destruído ao sair da tela
    Get.lazyPut<LoginRepository>(() => LoginRepositoryImpl(), fenix: true);
    Get.lazyPut(() => LoginServiceImpl(loginRepository: Get.find()),
        fenix: true);
  }
}
