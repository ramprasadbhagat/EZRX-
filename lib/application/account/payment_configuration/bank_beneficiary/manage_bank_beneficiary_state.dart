part of 'manage_bank_beneficiary_bloc.dart';



@freezed
class ManageBankBeneficiaryState with _$ManageBankBeneficiaryState {
  const ManageBankBeneficiaryState._();

  const factory ManageBankBeneficiaryState({
    required List<BankBeneficiary> beneficiaryList,
    required BankBeneficiary beneficiaryData,
    required List<SalesDistrict> salesDistrict,
    required bool isSubmitting,
    required bool showErrorMessages,
    required bool isFetching,
    required BankBeneficiaryResponse response,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _ManageBankBeneficiaryState;

  factory ManageBankBeneficiaryState.initial() => ManageBankBeneficiaryState(
        beneficiaryList: <BankBeneficiary>[],
        beneficiaryData: BankBeneficiary.empty(),
        salesDistrict: <SalesDistrict>[],
        isSubmitting: false,
        showErrorMessages: false,
        isFetching: false,
        response: BankBeneficiaryResponse.empty(),
        failureOrSuccessOption: none(),
      );

  String get salesDistrictLabel {
   return salesDistrict.isNotEmpty &&
    beneficiaryData.salesDistrict.isNotEmpty 
      ?salesDistrict.first.salesDistrictInfo.where(
        (element) =>
        element.salesDistrictHeader.getValue() == beneficiaryData.salesDistrict,
      ).first.salesDistrictLabel.getValue() : 'No Sales District';
  }
}