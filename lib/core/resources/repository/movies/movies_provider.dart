import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../constants/constants.dart';
import '../../../models/movie_model.dart';
import '../../../utils/string_utils.dart';
import '../abstract/abstract_movies_provider.dart';

class MoviesProvider extends AbstractMoviesProvider {
  Dio dio = Dio();

  @override
  Future<List<MovieModel>> fetchMoviesList({required int id}) async {
    List<MovieModel> moviesList = [];
    try {
      final url = StringUtils.interpolate(getMoviesUrl, params: {
        "apiKey": apiKey,
        "id": id.toString(),
      });
      final response = await dio.get(url);
      final jsonResponse = response.data["results"];
      for (final movie in jsonResponse) {
        moviesList.add(MovieModel.fromJson(movie));
      }
      return moviesList;
    } on DioError catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }

  @override
  Future<MovieModel> fetchMovieDetail(int id) async {
    MovieModel movie = MovieModel();
    try {
      final url = StringUtils.interpolate(getMovieDetailUrl, params: {
        "apiKey": apiKey,
        "id": id.toString(),
      });
      final response = await dio.get(url);
      final jsonResponse = response.data;
      movie = MovieModel.fromJson(jsonResponse);
      return movie;
    } on DioError catch (e) {
      throw Exception("Failed to fetch data: $e");
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
