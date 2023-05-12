part of 'usage_code_bloc.dart';

@freezed
class UsageCodeState with _$UsageCodeState {
  const UsageCodeState._();
  const factory UsageCodeState({
    required List<Usage> usage,
    required Option<Either<ApiFailure, dynamic>> usageFailureOrSuccessOption,
  }) = _UsageCodeState;

  factory UsageCodeState.initial() => UsageCodeState(
        usageFailureOrSuccessOption: none(),
        usage: <Usage>[],
      );

  Usage getSelectedReturnRequest(String selectedDescription) =>
      usage.firstWhere(
        (element) => element.usageDescription == selectedDescription,
      );
}
