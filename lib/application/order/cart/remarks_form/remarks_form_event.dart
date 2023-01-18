part of 'remarks_form_bloc.dart';

@freezed
class RemarksFormEvent with _$RemarksFormEvent {
  const factory RemarksFormEvent.remarksChanged(String message) =
      _RemarksChanged;
  const factory RemarksFormEvent.submit() = _Submit;
}
