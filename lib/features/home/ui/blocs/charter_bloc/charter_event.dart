part of 'charter_bloc.dart';

sealed class CharterEvent extends Equatable {
  const CharterEvent();

  @override
  List<Object> get props => [];
}

class FetchCharters extends CharterEvent {
  const FetchCharters();
}
