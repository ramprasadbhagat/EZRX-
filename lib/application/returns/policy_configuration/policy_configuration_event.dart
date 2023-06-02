part of 'policy_configuration_bloc.dart';

@freezed
class PolicyConfigurationEvent with _$PolicyConfigurationEvent {
  const factory PolicyConfigurationEvent.initialized() = _Initialized;

  const factory PolicyConfigurationEvent.fetch({
    required SalesOrganisation salesOrganisation,
    required String searchKey,
  }) = _Fetch;
  const factory PolicyConfigurationEvent.loadMorePolicyConfigurations({
    required SalesOrganisation salesOrganisation,
  }) = _LoadMorePolicyConfigurations;
  const factory PolicyConfigurationEvent.delete({
    required PolicyConfiguration policyConfigurationItem,
  }) = _Delete;
  const factory PolicyConfigurationEvent.add({
    required PolicyConfiguration policyConfigurationItems,
  }) = _Add;
  const factory PolicyConfigurationEvent.returnsAllowedSwitch() =
      _ReturnsAllowedSwitch;
  const factory PolicyConfigurationEvent.search({
    required SalesOrganisation salesOrganisation,
    required String searchKey,
  }) = _Search;
}
