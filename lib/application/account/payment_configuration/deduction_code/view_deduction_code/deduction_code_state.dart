part of 'deduction_code_bloc.dart';

@freezed
class DeductionCodeState with _$DeductionCodeState {
  const DeductionCodeState._();

  const factory DeductionCodeState({
    required List<DeductionCode> deductionCodeList,
    required bool isFetching,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _DeductionCodeState;

  factory DeductionCodeState.initial() => DeductionCodeState(
        deductionCodeList: <DeductionCode>[],
        isFetching: false,
        failureOrSuccessOption: none(),
      );
}
