part of 'manage_deduction_code_bloc.dart';

@freezed
class ManageDeductionCodeState with _$ManageDeductionCodeState {
  const ManageDeductionCodeState._();

  const factory ManageDeductionCodeState({
    required DeductionCode deductionCodeData,
    required bool isSubmitting,
    required bool isFetching,
    required bool showErrorMessages,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required AddDeductionCode response,
    required List<DeductionCode> deductionCodeList,
  }) = _DeductionCodeState;

  factory ManageDeductionCodeState.initial() => ManageDeductionCodeState(
        deductionCodeData: DeductionCode.empty(),
        isSubmitting: false,
        isFetching: false,
        showErrorMessages: false,
        failureOrSuccessOption: none(),
        response: AddDeductionCode.empty(),
        deductionCodeList: <DeductionCode>[],
      );
}
