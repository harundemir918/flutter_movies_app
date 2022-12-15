part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<GenreModel> genresList;

  const HomeLoaded(this.genresList);

  @override
  List<Object?> get props => [genresList];
}

class HomeFiltered extends HomeState {
  final List<GenreModel> genresList;

  const HomeFiltered(this.genresList);

  @override
  List<Object?> get props => [genresList];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
