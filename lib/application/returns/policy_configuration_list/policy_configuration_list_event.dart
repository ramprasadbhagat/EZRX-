part of 'policy_configuration_list_bloc.dart';

@freezed
class PolicyConfigurationListEvent with _$PolicyConfigurationListEvent {
  const factory PolicyConfigurationListEvent.initialized() = _initialized;

  const factory PolicyConfigurationListEvent.fetch({
    required SalesOrganisation salesOrganisation,
  }) = _Fetch;
}
