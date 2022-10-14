part of 'bonus_material_bloc.dart';

@freezed
class BonusMaterialEvent with _$BonusMaterialEvent {
  const factory BonusMaterialEvent.initialized() = _Initialized;
  const factory BonusMaterialEvent.fetch({
    required User user,
    required SalesOrganisationConfigs configs,
    required String searchKey,
    required SalesOrgCustomerInfo customerInfo,
    required SalesOrgShipToInfo shipInfo,
    required SalesOrganisation salesOrganisation,
    required bool pickandpack,
  }) = _Fetch;
}
