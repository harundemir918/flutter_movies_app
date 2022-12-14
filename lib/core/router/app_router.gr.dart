// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../view/detail/detail_view.dart' as _i3;
import '../../view/home/home_view.dart' as _i1;
import '../../view/movies/movies_view.dart' as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomeView(),
      );
    },
    MoviesRoute.name: (routeData) {
      final args = routeData.argsAs<MoviesRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.MoviesView(
          key: args.key,
          id: args.id,
          genre: args.genre,
        ),
      );
    },
    DetailRoute.name: (routeData) {
      final args = routeData.argsAs<DetailRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.DetailView(
          key: args.key,
          id: args.id,
        ),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/home',
          fullMatch: true,
        ),
        _i4.RouteConfig(
          HomeRoute.name,
          path: '/home',
        ),
        _i4.RouteConfig(
          MoviesRoute.name,
          path: '/movies',
        ),
        _i4.RouteConfig(
          DetailRoute.name,
          path: '/detail',
        ),
      ];
}

/// generated route for
/// [_i1.HomeView]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.MoviesView]
class MoviesRoute extends _i4.PageRouteInfo<MoviesRouteArgs> {
  MoviesRoute({
    _i5.Key? key,
    required int id,
    required String genre,
  }) : super(
          MoviesRoute.name,
          path: '/movies',
          args: MoviesRouteArgs(
            key: key,
            id: id,
            genre: genre,
          ),
        );

  static const String name = 'MoviesRoute';
}

class MoviesRouteArgs {
  const MoviesRouteArgs({
    this.key,
    required this.id,
    required this.genre,
  });

  final _i5.Key? key;

  final int id;

  final String genre;

  @override
  String toString() {
    return 'MoviesRouteArgs{key: $key, id: $id, genre: $genre}';
  }
}

/// generated route for
/// [_i3.DetailView]
class DetailRoute extends _i4.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({
    _i5.Key? key,
    required int id,
  }) : super(
          DetailRoute.name,
          path: '/detail',
          args: DetailRouteArgs(
            key: key,
            id: id,
          ),
        );

  static const String name = 'DetailRoute';
}

class DetailRouteArgs {
  const DetailRouteArgs({
    this.key,
    required this.id,
  });

  final _i5.Key? key;

  final int id;

  @override
  String toString() {
    return 'DetailRouteArgs{key: $key, id: $id}';
  }
}
