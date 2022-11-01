part of 'sales_org_bloc.dart';

@freezed
class SalesOrgEvent with _$SalesOrgEvent {
  const factory SalesOrgEvent.initialized() = _Initialized;
  const factory SalesOrgEvent.selected({
    required SalesOrganisation salesOrganisation,
  }) = _Selected;
  const factory SalesOrgEvent.loadSavedOrganisation({
    required List<SalesOrganisation> salesOrganisations,
  }) = _LoadSavedOrganisation;
}
