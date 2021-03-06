import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_week/application/rest_client/rest_client.dart';
import 'package:dart_week/models/movie_detail_model.dart';
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

  @override
  Future<MovieDetailModel?> getDetail(int id) async {
    //add response modify para adicionar parametros padrões
    final result =
        await _restClient.get<MovieDetailModel?>('/movie/$id', query: {
      'api_key': RemoteConfig.instance.getString('api_token'),
      'language': 'pt-br',
      'append_to_response': 'images, credits',
      'include_image_language': 'en, pt=br',
    }, decoder: (data) {
      return MovieDetailModel.fromMap(data);
    });

    if (result.hasError) {
      print('Erro ao detalhar o filme ${result.statusText}');
      throw Exception('Erro');
      //crash analitcs para análise de log
    }
    return result.body;
  }

  @override
  Future<void> addOrRemoveFavorite(String userId, MovieModel movie) async {
    try {
      var favoriteCollection = FirebaseFirestore.instance
          .collection('favorities')
          .doc(userId)
          .collection('movies');

      if (movie.favorite) {
        favoriteCollection.add(movie.toMap());
      } else {
        var favoriteData = await favoriteCollection
            .where('id', isEqualTo: movie.id)
            .limit(1)
            .get();
        //deleta na base do fire base
        favoriteData.docs.first.reference.delete();
      }
    } catch (e) {
      print('Erro ao favoritar um filme');
      //subir a excessão
      rethrow;
    }
  }

//buscar do firebase, os favoritos do usuários
  @override
  Future<List<MovieModel>> getFavoritiesMovies(String userId) async {
    var favoritesMovies = await FirebaseFirestore.instance
        .collection('favorities')
        .doc(userId)
        .collection('movies')
        .get();

    final listFavorites = <MovieModel>[];

    //pega os objetos dentro desse obj
    for (var movie in favoritesMovies.docs) {
      listFavorites.add(MovieModel.fromMap(movie.data()));
    }

    return listFavorites;
  }
}
