import 'package:dart_week/modules/movies/movies_controller.dart';
import 'package:dart_week/modules/movies/widgets/filter_tag.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesFilters extends GetView<MoviesController> {
  const MoviesFilters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        // como é uma variável observável, é necessário um OBX em todo o widget
        child: Obx(() {
          return Row(
            children: controller.genres
                .map(
                  (g) => FilterTag(
                    model: g,
                    onPressed: () {},
                    selected: false,
                  ),
                )
                .toList(),
          );
        }),
      ),
    );
  }
}
