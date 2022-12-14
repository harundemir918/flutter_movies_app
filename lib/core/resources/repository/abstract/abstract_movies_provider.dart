import '../../../models/movie_model.dart';

abstract class AbstractMoviesProvider {
  Future<List<MovieModel>> fetchMoviesList();

  Future<MovieModel> fetchMovieDetail(int id);

  List<MovieModel> filterMoviesList(
    String keyword,
    List<MovieModel> moviesList,
  );
}
