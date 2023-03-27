part of 'eligibility_bloc.dart';

@freezed
class EligibilityEvent with _$EligibilityEvent {
  const factory EligibilityEvent.initialized() = _Initialized;
  const factory EligibilityEvent.update({
    required User user,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrgConfigs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required OrderDocumentType selectedOrderType,
  }) = _Update;
}
