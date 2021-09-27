import 'package:dart_week/models/movie_detail_model.dart';
import 'package:dart_week/modules/movie_detail/movie_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailHeader extends GetView<MovieDetailController> {
  final MovieDetailModel? movie;

  const MovieDetailHeader({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var movieData = movie; nessa atribuição, verifica a não nulidade posteriormente
    if (movie != null) {
      return SizedBox(
        height: 278,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movie!
              .urlImages.length, // força a aceitação da variável como não nula
          itemBuilder: (context, index) {
            final image = movie!.urlImages[index];
            return Padding(
              padding: EdgeInsets.all(2),
              child: Image.network(image),
            );
          },
        ),
      );
    } else {
      //retorna um componente minusculo
      return SizedBox.shrink();
    }
  }
}
