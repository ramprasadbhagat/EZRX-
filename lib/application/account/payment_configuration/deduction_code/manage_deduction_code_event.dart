part of 'manage_deduction_code_bloc.dart';

@freezed
class ManageDeductionCodeEvent with _$ManageDeductionCodeEvent {
  const factory ManageDeductionCodeEvent.fetch() = _Fetch;
  const factory ManageDeductionCodeEvent.addOrEditDeductionCode({
    required bool isEdit,
  }) = _AddDeductionCode;
  const factory ManageDeductionCodeEvent.deleteDeductionCode({
    required DeductionCode data,
  }) = _DeleteDeductionCode;
  const factory ManageDeductionCodeEvent.setDeductionCodeData({
    required DeductionCode data,
  }) = _SetDeductionCodeData;
  const factory ManageDeductionCodeEvent.onValueChange({
    required DeductionCodeLabel label,
    required String newValue,
  }) = _OnValueChange;
}

enum DeductionCodeLabel {
  salesOrg,
  salesDistrict,
  deductionCode,
  amountType,
  deductionDescription,
}
