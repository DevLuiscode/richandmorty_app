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
  }

  late final ScrollController _scrollController;
  ScrollController get scrollController => _scrollController;
  var _page = 1;
  void init() {
    _scrollController = ScrollController()..addListener(_listener);
  }

  void _listener() {
    final position = _scrollController.position;
    final maxScrollExtent = position.maxScrollExtent;
    final pixel = position.pixels + 40;

    final hasPaginte = pixel >= maxScrollExtent;

    if (hasPaginte && state.status != CharterStatus.loading) {
      add(const FetchCharters());
    }
  }

  FutureOr<void> _fetchChartersState(
      FetchCharters event, Emitter<CharterState> emit) async {
    emit(state.copyWith(status: CharterStatus.loading));
    final charters = [...state.charters];
    try {
      final response = await charterRepository.fetchCharters(page: _page);
      charters.addAll(response);
      _page = _page + 1;
      print(_page);
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
}
