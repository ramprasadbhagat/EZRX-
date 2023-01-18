part of 'policy_configuration_bloc.dart';

@freezed
class PolicyConfigurationEvent with _$PolicyConfigurationEvent {
  const factory PolicyConfigurationEvent.initialized() = _initialized;

  const factory PolicyConfigurationEvent.fetch({
    required SalesOrganisation salesOrganisation,
  }) = _Fetch;
  const factory PolicyConfigurationEvent.delete({
    required PolicyConfiguration policyConfigurationItem,
  }) = _Delete;
  const factory PolicyConfigurationEvent.add({
    required PolicyConfiguration policyConfigurationItems,
  }) = _Add;
  const factory PolicyConfigurationEvent.returnsAllowedSwitch() =
      _ReturnsAllowedSwitch;
}
