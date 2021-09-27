import 'package:dart_week/models/movie_detail_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDetailContentProduction extends StatelessWidget {
  final MovieDetailModel? movie;
  const MovieDetailContentProduction({Key? key, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(bottom: 5),
      //possível criar texto chave => valor
      child: RichText(
        text: TextSpan(
            text: 'Companhia(s) produtora(s): ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF222222),
            ),
            children: [
              TextSpan(
                  text: movie?.productionCompanies.join(', ') ?? '',
                  style: TextStyle(
                    color: Color(0xFF222222),
                    fontWeight: FontWeight.normal,
                  ))
            ]),
      ),
    );
  }
}
