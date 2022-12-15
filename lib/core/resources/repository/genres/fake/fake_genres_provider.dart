import 'dart:math';

import 'package:flutter/foundation.dart';

import '../../../../models/genre_model.dart';
import '../../../mock/mock_movies.dart';
import '../../abstract/abstract_genres_provider.dart';

class FakeGenresProvider extends AbstractGenresProvider {
  @override
  Future<List<GenreModel>> fetchGenresList() async {
    List<GenreModel> genresList = [];
    var randomBool = Random().nextBool();
    debugPrint("bool: $randomBool");
    await Future.delayed(const Duration(seconds: 1));
    if (randomBool) {
      genresList = mockGenresList;
      return genresList;
    } else {
      throw Exception("Failed to fetch data.");
    }
  }

  @override
  List<GenreModel> filterGenresList(
    String keyword,
    List<GenreModel> genresList,
  ) {
    debugPrint("genresLength: ${genresList.length}");
    if (keyword.isEmpty) {
      return [];
    } else {
      return genresList
          .where((genre) => genre.name!.toLowerCase().contains(keyword))
          .toList();
    }
  }
}
