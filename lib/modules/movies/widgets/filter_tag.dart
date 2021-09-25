import 'package:dart_week/application/ui/theme_extensions.dart';
import 'package:dart_week/models/genre_model.dart';
import 'package:flutter/material.dart';

class FilterTag extends StatelessWidget {
  final GenreModel model;
  final bool selected;
  final VoidCallback onPressed;
  static double FONT_SIZE = 14;

  const FilterTag({
    Key? key,
    required this.model,
    this.selected = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //cria um tipo clicável
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        constraints: BoxConstraints(minWidth: 100, minHeight: 30),
        decoration: BoxDecoration(
            color: selected ? context.themeRed : Colors.black,
            borderRadius: BorderRadius.circular(30)),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            model.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: FONT_SIZE,
            ),
          ),
        ),
      ),
    );
  }
}
