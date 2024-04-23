import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_morty_app/features/home/domain/entities/charter_entity.dart';
import 'package:rick_morty_app/features/home/domain/repository/charter_repository.dart';

part 'charter_event.dart';
part 'charter_state.dart';

class CharterBloc extends Bloc<CharterEvent, CharterState> {
  final CharterRepository charterRepository;
  CharterBloc({required this.charterRepository})
      : super(
          const CharterState(
            charters: [],
            status: CharterStatus.initial,
          ),
        ) {
    on<FetchCharters>(_fetchChartersState);
    on<RefreshEvent>(_refreshState);
    on<SearchChartersEvent>(_searchChartersState);
  }

  late final ScrollController _scrollController;
  ScrollController get scrollController => _scrollController;
  var _page = 1;
  var _hasNextPage = true;
  void init() {
    _scrollController = ScrollController()..addListener(_listener);
  }

  void _listener() {
    final position = _scrollController.position;
    final maxScrollExtent = position.maxScrollExtent;
    final pixel = position.pixels + 100;

    final hasPaginte = pixel >= maxScrollExtent;

    if (hasPaginte && state.status != CharterStatus.loading && _hasNextPage) {
      add(const FetchCharters());
    }
  }

  FutureOr<void> _fetchChartersState(
      FetchCharters event, Emitter<CharterState> emit) async {
    if (_page == 1) {
      emit(state.copyWith(status: CharterStatus.loading));
    }

    final charters = [...state.charters];
    try {
      emit(state.copyWith(charters: charters));

      final response = await charterRepository.fetchCharters(page: _page);

      if (_page <= 42) {
        _page++;
      }

      charters.addAll(response);

      emit(state.copyWith(charters: charters, status: CharterStatus.succes));
    } catch (e) {
      emit(
        state.copyWith(status: CharterStatus.error),
      );
    }
  }

  @override
  Future<void> close() {
    _scrollController
      ..removeListener(_listener)
      ..dispose();
    return super.close();
  }

  FutureOr<void> _refreshState(
      RefreshEvent event, Emitter<CharterState> emit) async {
    emit(state.copyWith(status: CharterStatus.loading));

    if (event.refresh) {
      _page = 1;
      add(const FetchCharters());
    }
  }

  FutureOr<void> _searchChartersState(
      SearchChartersEvent event, Emitter<CharterState> emit) async {
    if (event.query.isEmpty) {
      state.charters.clear();
      _page = 1;
      add(const FetchCharters());
    } else {
      final filteredCharters = state.charters.where((charter) {
        return charter.name.toLowerCase().contains(event.query.toLowerCase());
      }).toList();

      emit(CharterState(
        charters: filteredCharters,
        status: CharterStatus.succes,
      ));
    }
  }
}
