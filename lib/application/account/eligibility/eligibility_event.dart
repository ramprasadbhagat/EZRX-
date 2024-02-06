part of 'eligibility_bloc.dart';

@freezed
class EligibilityEvent with _$EligibilityEvent {
  const factory EligibilityEvent.initialized() = _Initialized;
  const factory EligibilityEvent.update({
    required User user,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrgConfigs,
    required OrderDocumentType selectedOrderType,
  }) = _Update;

   const factory EligibilityEvent.selectedCustomerCode({
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
  }) = _SelectedCustomerCode;

   const factory EligibilityEvent.loadStoredCustomerCode() = _LoadStoredCustomerCode;

   const factory EligibilityEvent.fetchAndPreSelectCustomerCode() = _FetchAndPreSelectCustomerCode;
}
