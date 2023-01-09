part of 'policy_configuration_list_bloc.dart';

@freezed
class PolicyConfigurationListState with _$PolicyConfigurationListState {
  const factory PolicyConfigurationListState({
    required List<PolicyConfigurationList> policyConfigurationList,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required bool isLoading,
  }) = _PolicyConfigurationListState;

  factory PolicyConfigurationListState.initial() =>
      PolicyConfigurationListState(
        failureOrSuccessOption: none(),
        isLoading: false,
        policyConfigurationList: <PolicyConfigurationList>[],
      );
}
