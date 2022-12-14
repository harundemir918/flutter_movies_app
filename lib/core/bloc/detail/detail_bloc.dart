import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/movie_model.dart';
import '../../resources/repository/abstract/abstract_movies_repository.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final AbstractMoviesRepository moviesRepository;

  DetailBloc(this.moviesRepository) : super(DetailInitial()) {
    on<FetchDetailEvent>((event, emit) async {
      try {
        emit(DetailLoading());
        final movie = await moviesRepository.fetchMovieDetail(event.id);
        emit(DetailLoaded(movie));
      } catch (e) {
        emit(DetailError(e.toString()));
      }
    });
  }
}
