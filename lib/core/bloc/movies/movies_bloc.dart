import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/movie_model.dart';
import '../../resources/repository/abstract/abstract_movies_repository.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final AbstractMoviesRepository moviesRepository;
  List<MovieModel> moviesList = [];

  MoviesBloc(this.moviesRepository) : super(MoviesInitial()) {
    on<FetchMoviesEvent>((event, emit) async {
      try {
        emit(MoviesLoading());
        moviesList = await moviesRepository.fetchMoviesList(id: event.id);
        emit(MoviesLoaded(moviesList));
      } catch (e) {
        emit(MoviesError(e.toString()));
      }
    });
    on<FilterMoviesEvent>((event, emit) async {
      try {
        if (event.keyword.isEmpty) {
          emit(MoviesFiltered(event.moviesList));
        } else {
          final filteredMoviesList = moviesRepository.filterMoviesList(
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
