part of 'sales_org_bloc.dart';

@freezed
class SalesOrgState with _$SalesOrgState {
  const factory SalesOrgState({
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrganisationConfigs,
  }) = _SalesOrgState;

  factory SalesOrgState.initial() => SalesOrgState(
        salesOrganisation: SalesOrganisation.empty(),
        salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
      );
}
