part of 'language_bloc.dart';

@freezed
class LanguageEvent with _$LanguageEvent {
  const factory LanguageEvent.initialized() = _Initialized;

  const factory LanguageEvent.setLanguages({
    required List<Language> languages,
    required Language defaultLanguage,
  }) = _SetLanguages;

  const factory LanguageEvent.changeLanguage(Language language) =
      _ChangeLanguage;

}
