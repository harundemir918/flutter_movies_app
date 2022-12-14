import '../../../models/movie_model.dart';
import '../abstract/abstract_movies_repository.dart';
import 'movies_provider.dart';

class MoviesRepository extends AbstractMoviesRepository {
  final MoviesProvider _moviesProvider = MoviesProvider();

  @override
  Future<List<MovieModel>> fetchMoviesList() =>
      _moviesProvider.fetchMoviesList();

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
