part of 'aup_tc_bloc.dart';

@freezed
class AupTcState with _$AupTcState {
  const AupTcState._();

  const factory AupTcState({
    required String tncFile,
    required String privacyFile,
    required bool tncConsent,
    required bool privacyConsent,
  }) = _AupTcState;

  factory AupTcState.initial() => const AupTcState(
        tncFile: '',
        privacyFile: '',
        tncConsent: false,
        privacyConsent: false,
      );

  bool get userConsentAll => tncConsent && privacyConsent;
}
