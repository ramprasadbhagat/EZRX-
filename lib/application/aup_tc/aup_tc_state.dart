part of 'aup_tc_bloc.dart';

@freezed
class AupTcState with _$AupTcState {
  const factory AupTcState({
    required bool showTermsAndCondition,
    required String tncFile,
    required String privacyFile,
    required bool tncConsent,
    required bool privacyConsent,
  }) = _AupTcState;

  factory AupTcState.initial() => const AupTcState(
        showTermsAndCondition: false,
        tncFile: '',
        privacyFile: '',
        tncConsent: false,
        privacyConsent: false,
      );
}
