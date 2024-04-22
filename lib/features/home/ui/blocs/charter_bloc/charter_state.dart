part of 'charter_bloc.dart';

enum CharterStatus { initial, loading, succes, error }

class CharterState extends Equatable {
  final List<CharterEntity> charters;
  final CharterStatus status;

  const CharterState({required this.charters, required this.status});

  CharterState copyWith({
    List<CharterEntity>? charters,
    CharterStatus? status,
  }) =>
      CharterState(
          charters: charters ?? this.charters, status: status ?? this.status);

  @override
  List<Object> get props => [charters];
}
