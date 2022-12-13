import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/movie_model.dart';
import '../../resources/movies_repository.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesRepository _moviesRepository = MoviesRepository();
  List<MovieModel> moviesList = [];

  MoviesBloc() : super(MoviesInitial()) {
    on<FetchMoviesEvent>((event, emit) async {
      try {
        emit(MoviesLoading());
        moviesList = await _moviesRepository.fetchMoviesList();
        emit(MoviesLoaded(moviesList));
      } catch (e) {
        emit(MoviesError(e.toString()));
      }
    });
    on<FilterMoviesEvent>((event, emit) async {
      try {
        if (event.keyword.isEmpty) {
          emit(MoviesFiltered(moviesList));
        } else {
          final filteredMoviesList = _moviesRepository.filterMoviesList(
            event.keyword,
            event.moviesList,
          );
          emit(MoviesFiltered(filteredMoviesList));
        }
      } catch (e) {
        emit(MoviesError(e.toString()));
      }
    });
  }
}
