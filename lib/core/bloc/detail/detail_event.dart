part of 'detail_bloc.dart';

@immutable
abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object?> get props => [];
}

class FetchDetailEvent extends DetailEvent {
  final int id;

  const FetchDetailEvent(this.id);

  @override
  List<Object?> get props => [id];
}
