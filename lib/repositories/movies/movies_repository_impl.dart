import 'package:dart_week/application/rest_client/rest_client.dart';
import 'package:dart_week/models/movie_model.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import './movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final RestClient _restClient;

  MoviesRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final result = await _restClient.get('/movies/popular', query: {
      'api_key': RemoteConfig.instance.getString('api_token'),
      'language': 'pt-br',
      'page': '1',
    }, decoder: (data) {
      final results = data['results'];
      if (results != null) {
        return results.map<MovieModel>((v) => MovieModel.fromMap(v)).toList();
      }
      return <MovieModel>[];
    });

    if (result.hasError) {
      print('Erro ao buscar os filmes ${result.statusText}');
      throw Exception('Erro');
    }
    return result.body ?? <MovieModel>[];
  }

  @override
  Future<List<MovieModel>> getTopRated() async {
    final result = await _restClient.get('/movies/top_rated ', query: {
      'api_key': RemoteConfig.instance.getString('api_token'),
      'language': 'pt-br',
      'page': '1',
    }, decoder: (data) {
      final results = data['results'];
      if (results != null) {
        return results.map<MovieModel>((v) => MovieModel.fromMap(v)).toList();
      }
      return <MovieModel>[];
    });

    if (result.hasError) {
      print('Erro ao buscar os filmes ${result.statusText}');
      throw Exception('Erro');
    }
    return result.body ?? <MovieModel>[];
  }
}
