import '../../../models/genre_model.dart';
import '../abstract/abstract_genres_repository.dart';
import 'genres_provider.dart';

class GenresRepository extends AbstractGenresRepository {
  final GenresProvider _genresProvider = GenresProvider();

  @override
  Future<List<GenreModel>> fetchGenresList() =>
      _genresProvider.fetchGenresList();

  @override
  List<GenreModel> filterGenresList(
    String keyword,
    List<GenreModel> genresList,
  ) =>
      _genresProvider.filterGenresList(keyword, genresList);
}
