import 'package:dart_week/application/ui/filmes_app_icons.dart';
import 'package:dart_week/application/ui/theme_extensions.dart';
import 'package:dart_week/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MovieCard extends StatelessWidget {
  final dateFormat = DateFormat('dd/MM/y');
  final MovieModel movie;
  final VoidCallback favoriteCallBack;

  MovieCard({Key? key, required this.movie, required this.favoriteCallBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('movie/detail', arguments: movie.id);
      },
      child: Container(
        width: 158,
        height: 280,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(20),
                    //faz o arredondamento
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      //utilizado para retirar cerilhado do border
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                          'http://image.tmdb.org/t/p/w200/${movie.posterPath}',
                          width: 148,
                          height: 184,
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    movie.title,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    //caso o texto sobreescreva o component
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    dateFormat.format(DateTime.parse(movie.releaseDate)),
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            //consegue posicionar esse componente em qualquer lugar
            Positioned(
              bottom: 90,
              right: -5,
              child: Material(
                elevation: 5,
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: SizedBox(
                  height: 30,
                  child: IconButton(
                      iconSize: 13,
                      onPressed: favoriteCallBack,
                      icon: Icon(
                        movie.favorite
                            ? FilmesAppIcons.heart
                            : FilmesAppIcons.heart_empty,
                        color: movie.favorite
                            ? context.themeRed
                            : context.themeGrey,
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
