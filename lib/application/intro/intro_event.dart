part of 'intro_bloc.dart';

@freezed
class IntroEvent with _$IntroEvent {
  const factory IntroEvent.initialIndex() = _InitialIndex;
  const factory IntroEvent.setIndex({required int index}) = _SetIndex;
}
