part of 'deduction_code_bloc.dart';

@freezed
class DeductionCodeEvent with _$DeductionCodeEvent {
  const factory DeductionCodeEvent.initialized() = _Initialized;
  const factory DeductionCodeEvent.fetch() = _Fetch;
}
