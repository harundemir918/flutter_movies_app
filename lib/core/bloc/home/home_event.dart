part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class FetchGenresEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class FilterGenresEvent extends HomeEvent {
  final String keyword;
  final List<GenreModel> genresList;

  const FilterGenresEvent(this.keyword, this.genresList);

  @override
  List<Object?> get props => [keyword, genresList];
}
