import 'package:dart_week/application/ui/messages/messages_mixin.dart';
import 'package:dart_week/models/genre_model.dart';
import 'package:dart_week/services/genres/genres_service.dart';
import 'package:get/get.dart';

// uma forma de ter vários extends
class MoviesController extends GetxController with MessagesMixin {
  final GenresService _genresService;
  final _message = Rxn<MessageModel>();
  //uma variável para ser observável e acessável por outros locais
  final genres = <GenreModel>[].obs;

  MoviesController({
    required GenresService genresService,
  }) : _genresService = genresService;

  @override
  void onInit() {
    super.onInit();
    messageListener(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      final genres = await _genresService.getGenres();
      this.genres.assignAll(genres);
    } catch (e) {
      _message(MessageModel.error(
          title: 'Erro', message: 'Erro ao buscar as Categorias'));
    }
  }
}
