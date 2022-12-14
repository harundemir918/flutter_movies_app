import 'dart:math';

import 'package:flutter/foundation.dart';

import '../../../models/movie_model.dart';
import '../../mock/mock_movies.dart';
import '../abstract/abstract_movies_provider.dart';

class MoviesProvider extends AbstractMoviesProvider {
  @override
  Future<List<MovieModel>> fetchMoviesList() async {
    List<MovieModel> moviesList = [];
    var randomBool = Random().nextBool();
    debugPrint("bool: $randomBool");
    await Future.delayed(const Duration(seconds: 1));
    if (randomBool) {
      moviesList = mockMoviesList;
      return moviesList;
    } else {
      throw Exception("Failed to fetch data.");
    }
  }

  @override
  Future<MovieModel> fetchMovieDetail(int id) async {
    MovieModel movie = MovieModel();
    var randomBool = Random().nextBool();
    debugPrint("bool: $randomBool");
    await Future.delayed(const Duration(seconds: 1));
    if (randomBool) {
      movie = mockMovieDetail;
      return movie;
    } else {
      throw Exception("Failed to fetch data.");
    }
  }

  @override
  List<MovieModel> filterMoviesList(
    String keyword,
    List<MovieModel> moviesList,
  ) {
    debugPrint("moviesLength: ${moviesList.length}");
    if (keyword.isEmpty) {
      return [];
    } else {
      return moviesList
          .where((movie) => movie.title!.toLowerCase().contains(keyword))
          .toList();
    }
  }
}
