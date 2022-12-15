import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/bloc/detail/detail_bloc.dart';
import 'core/bloc/home/home_bloc.dart';
import 'core/bloc/movies/movies_bloc.dart';
import 'core/constants/constants.dart';
import 'core/resources/repository/genres/genres_repository.dart';
import 'core/resources/repository/movies/movies_repository.dart';
import 'core/router/app_router.gr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  final _moviesRepository = MoviesRepository();
  final _genresRepository = GenresRepository();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              HomeBloc(_genresRepository)..add(FetchGenresEvent()),
        ),
        BlocProvider(create: (context) => MoviesBloc(_moviesRepository)),
        BlocProvider(create: (context) => DetailBloc(_moviesRepository)),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: appName,
        theme: ThemeData(
          primarySwatch: Colors.red,
          fontFamily: "Poppins",
        ),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}
