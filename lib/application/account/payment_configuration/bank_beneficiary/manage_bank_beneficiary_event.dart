part of 'manage_bank_beneficiary_bloc.dart';

@freezed
class ManageBankBeneficiaryEvent with _$ManageBankBeneficiaryEvent {
  const factory ManageBankBeneficiaryEvent.fetch() = _Fetch;
  const factory ManageBankBeneficiaryEvent.fetchSalesDistrict({
    required bool fromAdd,
    required SalesOrg salesOrg,
  }) = _FetchSalesDistrict;
  const factory ManageBankBeneficiaryEvent.onValueChange({
    required BeneficiaryLabel label,
    required String newValue,
  }) = _OnValueChange;
  const factory ManageBankBeneficiaryEvent.setBeneficiary({
    required BankBeneficiary beneficiary,
  }) = _EditBeneficiary;
  const factory ManageBankBeneficiaryEvent.addOrUpdateBeneficiary({
    required bool isEdit,
  }) = _AddOrUpdateBeneficiary;
  const factory ManageBankBeneficiaryEvent.deleteBeneficiary({
    required BankBeneficiary beneficiary,
  }) = _DeleteBeneficiary;
}

enum BeneficiaryLabel {
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
