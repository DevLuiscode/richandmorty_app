part of 'detail_bloc.dart';

sealed class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class FetchIdCharterEnvent extends DetailEvent {
  final int id;

  const FetchIdCharterEnvent({required this.id});

  @override
  List<Object> get props => [id];
}
