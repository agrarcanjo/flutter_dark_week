import 'package:dart_week/models/genre_model.dart';

abstract class GenresService {
  Future<List<GenreModel>> getGenres();
}
