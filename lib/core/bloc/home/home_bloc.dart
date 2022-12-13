import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/genre_model.dart';
import '../../resources/movies_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final MoviesRepository _moviesRepository = MoviesRepository();
  List<GenreModel> genresList = [];

  HomeBloc() : super(HomeInitial()) {
    on<FetchGenresEvent>((event, emit) async {
      try {
        emit(HomeLoading());
        genresList = await _moviesRepository.fetchGenresList();
        emit(HomeLoaded(genresList));
      } catch (e) {
        emit(HomeError(e.toString()));
      }
    });
    on<FilterGenresEvent>((event, emit) async {
      try {
        if (event.keyword.isEmpty) {
          emit(HomeFiltered(genresList));
        } else {
          final filteredGenresList = _moviesRepository.filterGenresList(
            event.keyword,
            event.genresList,
          );
          emit(HomeFiltered(filteredGenresList));
        }
      } catch (e) {
        emit(HomeError(e.toString()));
      }
    });
  }
}
