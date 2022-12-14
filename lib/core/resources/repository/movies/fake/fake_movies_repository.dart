import '../../../../models/movie_model.dart';
import '../../abstract/abstract_movies_repository.dart';
import 'fake_movies_provider.dart';

class FakeMoviesRepository extends AbstractMoviesRepository {
  final FakeMoviesProvider _moviesProvider = FakeMoviesProvider();

  @override
  Future<List<MovieModel>> fetchMoviesList({required int id}) =>
      _moviesProvider.fetchMoviesList(id: id);

  @override
  Future<MovieModel> fetchMovieDetail(int id) =>
      _moviesProvider.fetchMovieDetail(id);

  @override
  List<MovieModel> filterMoviesList(
    String keyword,
    List<MovieModel> moviesList,
  ) =>
      _moviesProvider.filterMoviesList(keyword, moviesList);
}
