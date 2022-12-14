import 'package:dio/dio.dart';

import '../../../constants/constants.dart';
import '../../../models/genre_model.dart';
import '../../../utils/string_utils.dart';
import '../abstract/abstract_genres_provider.dart';

class GenresProvider extends AbstractGenresProvider {
  Dio dio = Dio();

  @override
  Future<List<GenreModel>> fetchGenresList() async {
    List<GenreModel> genresList = [];
    final url = StringUtils.interpolate(getGenresUrl, params: {
      "apiKey": apiKey,
    });
    try {
      final response = await dio.get(url);
      final jsonResponse = response.data["genres"];
      for (final genre in jsonResponse) {
        genresList.add(GenreModel.fromJson(genre));
      }
      return genresList;
    } on DioError catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }

  @override
  List<GenreModel> filterGenresList(
    String keyword,
    List<GenreModel> genresList,
  ) {
    if (keyword.isEmpty) {
      return [];
    } else {
      return genresList
          .where((genre) => genre.name!.toLowerCase().contains(keyword))
          .toList();
    }
  }
}
