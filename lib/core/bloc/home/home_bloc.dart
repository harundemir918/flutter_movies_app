import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movies_app/core/resources/repository/abstract/abstract_genres_repository.dart';
import 'package:meta/meta.dart';

import '../../models/genre_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AbstractGenresRepository genresRepository;
  List<GenreModel> genresList = [];

  HomeBloc(this.genresRepository) : super(HomeInitial()) {
    on<FetchGenresEvent>((event, emit) async {
      try {
        emit(HomeLoading());
        genresList = await genresRepository.fetchGenresList();
        emit(HomeLoaded(genresList));
      } catch (e) {
        emit(HomeError(e.toString()));
      }
    });
    on<FilterGenresEvent>((event, emit) async {
      try {
        if (event.keyword.isEmpty) {
          emit(HomeFiltered(event.genresList));
        } else {
          final filteredGenresList = genresRepository.filterGenresList(
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
