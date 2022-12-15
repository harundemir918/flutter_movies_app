part of 'detail_bloc.dart';

@immutable
abstract class DetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DetailInitial extends DetailState {}

class DetailLoading extends DetailState {}

class DetailLoaded extends DetailState {
  final MovieModel movie;

  DetailLoaded(this.movie);

  @override
  List<Object?> get props => [movie];
}

class DetailError extends DetailState {
  final String message;

  DetailError(this.message);

  @override
  List<Object?> get props => [message];
}
