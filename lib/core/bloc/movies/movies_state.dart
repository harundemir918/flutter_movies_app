part of 'movies_bloc.dart';

@immutable
abstract class MoviesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MoviesInitial extends MoviesState {}

class MoviesLoading extends MoviesState {}

class MoviesLoaded extends MoviesState {
  final List<MovieModel> moviesList;

  MoviesLoaded(this.moviesList);

  @override
  List<Object?> get props => [moviesList];
}

class MoviesFiltered extends MoviesState {
  final List<MovieModel> moviesList;

  MoviesFiltered(this.moviesList);

  @override
  List<Object?> get props => [moviesList];
}

class MoviesError extends MoviesState {
  final String message;

  MoviesError(this.message);

  @override
  List<Object?> get props => [message];
}
