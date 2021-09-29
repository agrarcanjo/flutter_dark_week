import 'package:dart_week/application/ui/widget/movie_card.dart';
import 'package:dart_week/modules/favorites/favorites_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesPage extends GetView<FavoritesController> {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: SizedBox(
            width: Get.width,
            //coluna que quebra a linha
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              children: controller.movies
                  .map((element) => MovieCard(
                        movie: element,
                        favoriteCallBack: () =>
                            controller.removeFavorite(element),
                      ))
                  .toList(),
            ),
          ),
        );
      }),
    );
  }
}
