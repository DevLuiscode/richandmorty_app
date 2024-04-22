part of 'charter_bloc.dart';

sealed class CharterState extends Equatable {
  const CharterState();

  @override
  List<Object> get props => [];
}

class CharterInitialState extends CharterState {}

class CharterLoadingState extends CharterState {}

class CharterFealureState extends CharterState {}

class CharterSuccesState extends CharterState {
  final List<CharterEntity> charters;

  const CharterSuccesState({required this.charters});

  CharterSuccesState copyWith({
    List<CharterEntity>? charters,
  }) =>
      CharterSuccesState(
        charters: charters ?? this.charters,
      );

  @override
  List<Object> get props => [charters];
}
