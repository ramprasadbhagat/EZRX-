part of 'policy_configuration_bloc.dart';

@freezed
class PolicyConfigurationState with _$PolicyConfigurationState {
  const factory PolicyConfigurationState({
    required List<PolicyConfiguration> policyConfigurationList,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required bool isLoading,
    required bool canLoadMorePolicyConfigurations,
    required SearchKey searchKey,
    required ReturnsAllowed returnsAllowed,
  }) = _PolicyConfigurationState;

  factory PolicyConfigurationState.initial() => PolicyConfigurationState(
        failureOrSuccessOption: none(),
        isLoading: false,
        canLoadMorePolicyConfigurations: true,
        searchKey: SearchKey(''),
        policyConfigurationList: <PolicyConfiguration>[],
        returnsAllowed: ReturnsAllowed(true),
      );
}
