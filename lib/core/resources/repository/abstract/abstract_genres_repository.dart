import '../../../models/genre_model.dart';

abstract class AbstractGenresRepository {
  Future<List<GenreModel>> fetchGenresList();

  List<GenreModel> filterGenresList(
    String keyword,
    List<GenreModel> genresList,
  );
}
