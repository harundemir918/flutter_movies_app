part of 'movies_bloc.dart';

@immutable
abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object?> get props => [];
}

class FetchMoviesEvent extends MoviesEvent {
  @override
  List<Object?> get props => [];
}

class FilterMoviesEvent extends MoviesEvent {
  final String keyword;
  final List<MovieModel> moviesList;

  const FilterMoviesEvent(this.keyword, this.moviesList);

  @override
  List<Object?> get props => [keyword, moviesList];
}
