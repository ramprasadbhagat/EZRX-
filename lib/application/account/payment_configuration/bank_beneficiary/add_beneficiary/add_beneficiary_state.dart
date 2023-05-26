part of 'add_beneficiary_bloc.dart';

@freezed
class AddBeneficiaryState with _$AddBeneficiaryState {
  const AddBeneficiaryState._();

  const factory AddBeneficiaryState({
    required BankBeneficiary addBeneficiaryData,
    required bool isFetching,
    required List<SalesDistrict> salesDistrict,
    required bool isSubmitting,
    required bool showErrorMessages,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _BeneficiaryState;

  factory AddBeneficiaryState.initial() => AddBeneficiaryState(
        addBeneficiaryData: BankBeneficiary.empty(),
        isFetching: false,
        salesDistrict: <SalesDistrict>[],
        isSubmitting: false,
        showErrorMessages: false,
        failureOrSuccessOption: none(),
      );
}