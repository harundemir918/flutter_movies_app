import '../models/genre_model.dart';
import '../models/movie_model.dart';
import 'movies_provider.dart';

class MoviesRepository {
  final MoviesProvider _moviesProvider = MoviesProvider();

  Future<List<GenreModel>> fetchGenresList() =>
      _moviesProvider.fetchGenresList();

  Future<List<MovieModel>> fetchMoviesList() =>
      _moviesProvider.fetchMoviesList();

  Future<MovieModel> fetchMovieDetail(int id) =>
      _moviesProvider.fetchMovieDetail(id);

  List<MovieModel> filterMoviesList(
    String keyword,
    List<MovieModel> moviesList,
  ) =>
      _moviesProvider.filterMoviesList(keyword, moviesList);

  List<GenreModel> filterGenresList(
    String keyword,
    List<GenreModel> genresList,
  ) =>
      _moviesProvider.filterGenresList(keyword, genresList);
}
