import 'dart:convert';

class MovieModel {
  final int id;
  final String title;
  final String releaseDate;
  final String posterPath;
  final List<int> genres;
  final bool favorite;

  MovieModel(this.id, this.title, this.releaseDate, this.posterPath,
      this.genres, this.favorite);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'release_date': releaseDate,
      'poster_path': posterPath,
      'genre_id': genres,
      'favorite': favorite,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      map['id'],
      map['title'],
      map['release_date'],
      map['http://image.tmdb.org/t/p/w200/${map['poster_path']}'],
      List<int>.from(map['genre_id']),
      map['favorite'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source));
}
