import 'package:dart_week/repositories/login_repository.dart';
import 'package:dart_week/repositories/login_repository_impl.dart';
import 'package:dart_week/services/login/login_service_impl.dart';
import 'package:get/get.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginRepository>(() => LoginRepositoryImpl(), fenix: true);
    Get.lazyPut(() => LoginServiceImpl(loginRepository: Get.find()),
        fenix: true);
  }
}
