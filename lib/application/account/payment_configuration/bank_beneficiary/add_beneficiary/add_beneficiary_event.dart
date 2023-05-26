part of 'add_beneficiary_bloc.dart';

@freezed
class AddBeneficiaryEvent with _$AddBeneficiaryEvent {
  const factory AddBeneficiaryEvent.initialized() = _Initialized;
  const factory AddBeneficiaryEvent.fetchSalesDistrict({
    required SalesOrg salesOrg,
  }) = _FetchSalesDistrict;
  const factory AddBeneficiaryEvent.onValueChange({
    required AddBeneficiaryLabel label,
    required String newValue,
  }) = _AddBeneficiaryValueOnChange;
  const factory AddBeneficiaryEvent.addBankBeneficiary() = _AddBankBeneficiary;
}

enum AddBeneficiaryLabel {
  selectSalesOrg,
  selectSalesDistrict,
  beneficiaryName,
  bankName,
  branch,
  bankCode,
  bankAccount,
  hdbcSwiftCode,
  bankAddress,
  payNowUen,
  emailId,
}
