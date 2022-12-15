import 'package:auto_route/auto_route.dart';

import '../../view/detail/detail_view.dart';
import '../../view/home/home_view.dart';
import '../../view/movies/movies_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: HomeView, path: "/home", initial: true),
    AutoRoute(page: MoviesView, path: "/movies"),
    AutoRoute(page: DetailView, path: "/detail"),
  ],
  replaceInRouteName: "View,Route",
)
class $AppRouter {}
