import '../../../models/movie_model.dart';

abstract class AbstractMoviesRepository {
  Future<List<MovieModel>> fetchMoviesList({required int id});

  Future<MovieModel> fetchMovieDetail(int id);

  List<MovieModel> filterMoviesList(
    String keyword,
    List<MovieModel> moviesList,
  );
}
