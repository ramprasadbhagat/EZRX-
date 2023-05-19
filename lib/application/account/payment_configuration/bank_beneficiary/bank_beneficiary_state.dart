part of 'bank_beneficiary_bloc.dart';



@freezed
class BankBeneficiaryState with _$BankBeneficiaryState {
  const BankBeneficiaryState._();

  const factory BankBeneficiaryState({
    required List<BankBeneficiary> manageBenificiaryList,
    required bool isFetching,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _ManageBeneficiaryState;

  factory BankBeneficiaryState.initial() => BankBeneficiaryState(
        manageBenificiaryList: <BankBeneficiary>[],
        isFetching: false,
        failureOrSuccessOption: none(),
      );
}