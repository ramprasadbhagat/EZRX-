part of 'manage_deduction_code_bloc.dart';

@freezed
class ManageDeductionCodeState with _$ManageDeductionCodeState {
  const ManageDeductionCodeState._();

  const factory ManageDeductionCodeState({
    required AddDeductionCodeData deductionCodeData,
    required bool isSubmitting,
    required bool showErrorMessages,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required AddDeductionCode response,
  }) = _DeductionCodeState;

  factory ManageDeductionCodeState.initial() => ManageDeductionCodeState(
        deductionCodeData: AddDeductionCodeData.empty(),
        isSubmitting: false,
        showErrorMessages: false,
        failureOrSuccessOption: none(),
        response: AddDeductionCode.empty(),
      );
}
