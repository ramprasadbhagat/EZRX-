part of 're_order_permission_bloc.dart';

@freezed
class ReOrderPermissionState with _$ReOrderPermissionState {
  const factory ReOrderPermissionState({  
    required List<MaterialInfo> validOrderItems,
    required bool isFetching,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required OrderNumber orderNumberWillUpsert,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrganisationConfigs,
  }) = _ReOrderPermissionState;

  factory ReOrderPermissionState.initial() => ReOrderPermissionState(
        orderNumberWillUpsert: OrderNumber(''),
        validOrderItems: <MaterialInfo>[],
        isFetching: false,
        failureOrSuccessOption: none(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        shipToInfo: ShipToInfo.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
      );
}
