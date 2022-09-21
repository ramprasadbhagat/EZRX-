part of 'sales_org_bloc.dart';

@freezed
class SalesOrgState with _$SalesOrgState {
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
}
