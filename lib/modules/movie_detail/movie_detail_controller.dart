import 'package:dart_week/application/ui/loader/loader_mixin.dart';
import 'package:dart_week/application/ui/messages/messages_mixin.dart';
import 'package:dart_week/models/movie_detail_model.dart';
import 'package:dart_week/services/movies/movies_service.dart';
import 'package:get/get.dart';

class MovieDetailController extends GetxController
    with LoaderMixin, MessagesMixin {
  final MoviesService _moviesService;

  var loading = false.obs;
  var message = Rxn<MessageModel>();
  var movie = Rxn<MovieDetailModel>();

  MovieDetailController({required MoviesService moviesService})
      : _moviesService = moviesService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    // recupera os parametros passados como parâmetros para essa página
    try {
      final movieId = Get.arguments;
      loading(true);
      final movieDetailData = await _moviesService.getDetail(movieId);
      movie.value = movieDetailData; // ou movie(movieDetailData);
      // bug ao movie.value(null);
      loading(false);
    } catch (e, s) {
      print(e);
      print(s);
      loading(false);
      message(MessageModel.error(
          title: 'Erro ao buscar',
          message: 'Erro ao buscar os detalhes dos filmes'));
    }
  }
}
