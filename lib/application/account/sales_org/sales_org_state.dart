part of 'sales_org_bloc.dart';

@freezed
class SalesOrgState with _$SalesOrgState {
  const SalesOrgState._();
  const factory SalesOrgState({
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs configs,
    required Option<Either<ApiFailure, dynamic>> salesOrgFailureOrSuccessOption,
  }) = _SalesOrgState;

  factory SalesOrgState.initial() => SalesOrgState(
        salesOrganisation: SalesOrganisation.empty(),
        configs: SalesOrganisationConfigs.empty(),
        salesOrgFailureOrSuccessOption: none(),
      );

  bool get haveSelectedSalesOrganisation =>
      salesOrganisation != SalesOrganisation.empty();

  SalesOrg get salesOrg => salesOrganisation.salesOrg;

  bool get hideCustomer => configs.hideCustomer;

  Currency get currency => configs.currency;

  bool get disableBundles => configs.disableBundles;
}
