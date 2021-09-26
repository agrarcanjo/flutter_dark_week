import 'package:dart_week/application/ui/widget/movie_card.dart';
import 'package:dart_week/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesGroup extends StatelessWidget {
  final List<MovieModel> movies;
  final String title;
  const MoviesGroup({Key? key, required this.title, required this.movies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          //criar uma lista com contexto
          SizedBox(
              height: 280,
              //serve para sempre atualizar o componente em tela com a atualização do conteúdo
              child: Obx(() {
                return ListView.builder(
                  //corrige a montagem de colunas dinâmicas (recalcula o list)
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return MovieCard(
                      movie: movies[index],
                    );
                  },
                );
              })),
        ],
      ),
    );
  }
}
