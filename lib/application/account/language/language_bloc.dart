import 'dart:async';

import 'package:ezrxmobile/domain/auth/entities/language.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_event.dart';
part 'language_state.dart';
part 'language_bloc.freezed.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {

  LanguageBloc() : super(LanguageState.initial()) {
    on<LanguageEvent>(_onEvent);
  }

  Future<void> _onEvent(
    LanguageEvent event,
    Emitter<LanguageState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(LanguageState.initial()),
      setLanguages: (_SetLanguages e) async => emit(
        state.copyWith(
          languages: e.languages,
          activeLanguage: e.defaultLanguage,
        ),
      ),
      changeLanguage: (_ChangeLanguage e) async => emit(
        state.copyWith(
          activeLanguage: e.language,
        ),
      ),
    );
  }
}
