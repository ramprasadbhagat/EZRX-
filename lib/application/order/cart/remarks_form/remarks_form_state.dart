part of 'remarks_form_bloc.dart';

@freezed
class RemarksFormState with _$RemarksFormState {
  const RemarksFormState._();

  const factory RemarksFormState({
    required Remarks remarks,
    required bool showErrorMessages,
    required bool isSubmitting,
  }) = _RemarksFormState;

   factory RemarksFormState.initial() => RemarksFormState(
     remarks: Remarks(''),
        showErrorMessages: false,
        isSubmitting: false,
      );
}
