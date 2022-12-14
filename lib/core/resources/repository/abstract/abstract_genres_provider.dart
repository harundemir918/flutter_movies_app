import '../../../models/genre_model.dart';

abstract class AbstractGenresProvider {
  Future<List<GenreModel>> fetchGenresList();

  List<GenreModel> filterGenresList(
    String keyword,
    List<GenreModel> genresList,
  );
}
