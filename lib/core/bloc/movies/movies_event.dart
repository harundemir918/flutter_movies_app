part of 'movies_bloc.dart';

@immutable
abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object?> get props => [];
}

class FetchMoviesEvent extends MoviesEvent {
  final int id;

  const FetchMoviesEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class FilterMoviesEvent extends MoviesEvent {
  final String keyword;
  final List<MovieModel> moviesList;

  const FilterMoviesEvent(this.keyword, this.moviesList);

  @override
  List<Object?> get props => [keyword, moviesList];
}
