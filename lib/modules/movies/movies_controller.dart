import 'package:dart_week/application/ui/messages/messages_mixin.dart';
import 'package:dart_week/models/genre_model.dart';
import 'package:dart_week/models/movie_model.dart';
import 'package:dart_week/services/genres/genres_service.dart';
import 'package:dart_week/services/movies/movies_service.dart';
import 'package:get/get.dart';

// uma forma de ter vários extends
class MoviesController extends GetxController with MessagesMixin {
  final GenresService _genresService;
  final MoviesService _moviesService;

  final _message = Rxn<MessageModel>();
  //uma variável para ser observável e acessável por outros locais
  final genres = <GenreModel>[].obs;
  final popularMovies = <MovieModel>[].obs;
  final topRatedMovies = <MovieModel>[].obs;

  var _popularMoviesOriginal = <MovieModel>[];
  var _topRatedMoviesOriginal = <MovieModel>[];

  final genreSelected = Rxn<GenreModel>();

  MoviesController(
      {required GenresService genresService,
      required MoviesService moviesService})
      : _genresService = genresService,
        _moviesService = moviesService;

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
      //substitui todos os itens da lista para os novos recebidos
      this.genres.assignAll(genres);

      final popularMoviesData = await _moviesService.getPopularMovies();
      final topRatedMoviesData = await _moviesService.getTopRated();

      popularMovies.assignAll(popularMoviesData);
      _popularMoviesOriginal = popularMovies;
      topRatedMovies.assignAll(topRatedMoviesData);
      _topRatedMoviesOriginal = topRatedMoviesData;
    } catch (e, s) {
      print(e);
      print(s);
      _message(MessageModel.error(
          title: 'Erro', message: 'Erro ao buscar as Categorias'));
    }
  }

  void filterByName(String title) {
    if (title.isNotEmpty) {
      //where faz um filtro como filter
      var newPopularMovies = _popularMoviesOriginal.where((movie) {
        return movie.title.toLowerCase().contains(title.toLowerCase());
      });

      var newTopRatedMovies = _topRatedMoviesOriginal.where(
          (movie) => movie.title.toLowerCase().contains(title.toLowerCase()));

      popularMovies.assignAll(newPopularMovies);
      topRatedMovies.assignAll(newTopRatedMovies);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRatedMovies.assignAll(_topRatedMoviesOriginal);
    }
  }

  void filterMoviesByGenre(GenreModel? genreModel) {
    var genreFilter = genreModel;

    if (genreFilter?.id == genreSelected.value?.id) {
      genreFilter = null;
    }

    genreSelected.value = genreFilter;

    if (genreFilter != null) {
      var newPopularMovies = _popularMoviesOriginal.where((movie) {
        return movie.genres.contains(genreFilter?.id);
      });

      var newTopRatedMovies = _topRatedMoviesOriginal
          .where((movie) => movie.genres.contains(genreFilter?.id));

      popularMovies.assignAll(newPopularMovies);
      topRatedMovies.assignAll(newTopRatedMovies);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRatedMovies.assignAll(_topRatedMoviesOriginal);
    }
  }
}
