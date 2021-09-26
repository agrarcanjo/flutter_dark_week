import 'package:dart_week/modules/movies/movies_controller.dart';
import 'package:dart_week/repositories/genres/genres_repository.dart';
import 'package:dart_week/repositories/genres/genres_repository_impl.dart';
import 'package:dart_week/services/genres/genres_service.dart';
import 'package:dart_week/services/genres/genres_service_impl.dart';
import 'package:get/get.dart';

class MoviesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenresRepository>(
        () => GenresRepositoryImpl(restClient: Get.find()));
//a implementação é passada mas é do tipo abstrato
    Get.lazyPut<GenresService>(
        () => GenresServiceImpl(genresRepository: Get.find()));
    Get.lazyPut(() =>
        MoviesController(genresService: Get.find(), moviesService: Get.find()));
  }
}
