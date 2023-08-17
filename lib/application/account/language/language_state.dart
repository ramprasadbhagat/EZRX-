part of 'language_bloc.dart';

@freezed
class LanguageState with _$LanguageState {
  const factory LanguageState({
    required List<Language> languages,
    required Language activeLanguage,
  }) = _LanguageState;

  factory LanguageState.initial() => LanguageState(
        languages: List<Language>.empty(),
        activeLanguage: Language.english(),
      );
}
