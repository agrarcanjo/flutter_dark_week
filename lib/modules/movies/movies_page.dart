import 'package:dart_week/modules/movies/widgets/movies_group.dart';
import 'package:dart_week/modules/movies/widgets/movies_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: ListView(
        children: [
          MoviesHeader(),
          MoviesGroup(
            title: '',
          ),
        ],
      ),
    );
  }
}
