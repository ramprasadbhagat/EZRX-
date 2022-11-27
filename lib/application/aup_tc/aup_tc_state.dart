part of 'aup_tc_bloc.dart';

@freezed
class AupTcState with _$AupTcState {
  const factory AupTcState({
    required bool showTermsAndConditon,
    String? initialFile,
    required String url,
  }) = _AupTcState;

  factory AupTcState.initial() => const AupTcState(
        showTermsAndConditon: false,
        url: '',
      );
}
