import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_morty_app/features/home/domain/entities/charter_entity.dart';
import 'package:rick_morty_app/features/home/domain/repository/charter_repository.dart';

part 'charter_event.dart';
part 'charter_state.dart';

class CharterBloc extends Bloc<CharterEvent, CharterState> {
  CharterBloc({required this.charterRepository})
      : super(CharterInitialState()) {
    on<FetchCharters>((event, emit) async {
      emit(CharterLoadingState());
      // final list = [...state.]
      try {
        final charters = await charterRepository.fetchCharters();

        emit(CharterSuccesState(charters: charters));
      } catch (_) {
        emit(CharterFealureState());
      }
    });
  }
  final CharterRepository charterRepository;
}
