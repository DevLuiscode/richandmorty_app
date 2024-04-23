part of 'charter_bloc.dart';

sealed class CharterEvent extends Equatable {
  const CharterEvent();

  @override
  List<Object> get props => [];
}

class FetchCharters extends CharterEvent {
  const FetchCharters();
}

class RefreshEvent extends CharterEvent {
  const RefreshEvent(this.refresh);
  final bool refresh;

  @override
  List<Object> get props => [refresh];
}

class SearchChartersEvent extends CharterEvent {
  final String query;

  const SearchChartersEvent(this.query);

  @override
  List<Object> get props => [query];
}
