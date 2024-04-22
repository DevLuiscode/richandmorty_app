import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_morty_app/features/details/domain/entities/by_charter_entity.dart';
import 'package:rick_morty_app/features/details/domain/repository/detail_repository.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final DetailRepository detailRepository;
  DetailBloc({required this.detailRepository})
      : super(const DetailState(
          detailStatus: DetailStatus.initial,
          byCharterEntity: ByCharterEntity(
            name: "",
            status: "",
            specie: "",
            gender: "",
            image: "",
            create: "",
          ),
        )) {
    on<FetchIdCharterEnvent>(_fetchIdCharterState);
  }

  FutureOr<void> _fetchIdCharterState(
      FetchIdCharterEnvent event, Emitter<DetailState> emit) async {
    emit(state.copyWith(detailStatus: DetailStatus.loading));
    try {
      final charter = await detailRepository.fetchByIdCharter(id: event.id);
      emit(state.copyWith(
        detailStatus: DetailStatus.succes,
        byCharterEntity: charter,
      ));
    } catch (e) {
      emit(state.copyWith(detailStatus: DetailStatus.error));
    }
  }
}
