import '../../../../models/genre_model.dart';
import '../../abstract/abstract_genres_repository.dart';
import 'fake_genres_provider.dart';

class FakeGenresRepository extends AbstractGenresRepository {
  final FakeGenresProvider _genresProvider = FakeGenresProvider();

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
