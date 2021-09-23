// ignore_for_file: prefer_const_constructors

import 'package:dart_week/application/ui/filmes_app_icons.dart';
import 'package:dart_week/modules/favorites/favorites_page.dart';
import 'package:dart_week/modules/home/home_controller.dart';
import 'package:dart_week/modules/movies/movies_page.dart';
import 'package:flutter/material.dart';
import 'package:dart_week/application/ui/theme_extensions.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          selectedItemColor: context.themeRed,
          unselectedItemColor: Colors.grey,
          onTap: controller.goToPage,
          currentIndex: controller.pageIndex,
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'filmes'),
            BottomNavigationBarItem(
                icon: Icon(FilmesAppIcons.heart_empty), label: 'Favoritos'),
            BottomNavigationBarItem(
                icon: Icon(Icons.logout_outlined), label: 'Sair'),
          ],
        );
      }),
      body: Navigator(
          initialRoute: '/movies',
          key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
          onGenerateRoute: (settings) {
            if (settings.name == '/movies') {
              return GetPageRoute(
                settings: settings,
                page: () => MoviesPage(),
              );
            }

            if (settings.name == '/favorites') {
              return GetPageRoute(
                settings: settings,
                page: () => FavoritesPage(),
              );
            }

            return null;
          }),
    );
  }
}
