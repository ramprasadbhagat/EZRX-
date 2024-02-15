part of 'intro_bloc.dart';

@freezed
class IntroState with _$IntroState {
  const IntroState._();
  const factory IntroState({
    required int index,
    required bool isAppFirstLaunch,
    required bool isLoading,
  }) = _IntroState;

  factory IntroState.initial() => const IntroState(
        index: 0,
        isAppFirstLaunch: false,
        isLoading: false,
      );
}
