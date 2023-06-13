import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'intro_bloc.freezed.dart';
part 'intro_event.dart';
part 'intro_state.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  IntroBloc() : super(IntroState.initial()) {
    on<IntroEvent>(_onEvent);
  }

  void _onEvent(
    IntroEvent event,
    Emitter<IntroState> emit,
  ) {
    event.map(
      initialIndex: (_) => emit(IntroState.initial()),
      setIndex: (e) {
        emit(state.copyWith(index: e.index));
      },
    );
  }
}
