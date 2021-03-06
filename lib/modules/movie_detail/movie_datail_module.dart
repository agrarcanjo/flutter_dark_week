import 'package:dart_week/application/modules/module.dart';
import 'package:dart_week/modules/movie_detail/movie_detail_bindings.dart';
import 'package:dart_week/modules/movie_detail/movie_detail_page.dart';
import 'package:dart_week/modules/movies/movies_bindings.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class MovieDatailModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: 'movie/detail',
      page: () => MovieDetailPage(),
      binding: MovieDetailBindings(),
    )
  ];
}
