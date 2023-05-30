part of 'manage_deduction_code_bloc.dart';

@freezed
class ManageDeductionCodeEvent with _$ManageDeductionCodeEvent {
  const factory ManageDeductionCodeEvent.initialized() = _Initialized;
  const factory ManageDeductionCodeEvent.addDeductionCode() = _AddDeductionCode;
  const factory ManageDeductionCodeEvent.onValueChange({
    required AddDeductionCodeLabel label,
    required String newValue,
  }) = _OnValueChange;
}

enum AddDeductionCodeLabel {
  salesOrg,
  salesDistrict,
  deductionCode,
  amountType,
  deductionDescription,
}
