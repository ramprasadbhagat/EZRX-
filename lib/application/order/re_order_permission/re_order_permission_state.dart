part of 're_order_permission_bloc.dart';

@freezed
class ReOrderPermissionState with _$ReOrderPermissionState {
  const ReOrderPermissionState._();

  const factory ReOrderPermissionState({
    required List<MaterialInfo> validOrderItems,
    required bool isFetching,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required OrderNumber orderNumberWillUpsert,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required User user,
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
        user: User.empty(),
      );

  List<MaterialInfo> availableProducts(
    Map<MaterialNumber, Price> materialPrice,
  ) {
    final bonusMaterials = validOrderItems
        .map(
          (e) => PriceAggregate.empty()
              .copyWith(
                materialInfo: e,
                price: materialPrice[e.materialNumber] ?? Price.empty(),
                quantity: e.quantity.intValue,
              )
              .dealBonusList,
        )
        .expand((bonusList) => bonusList)
        .toList();

    return [...validOrderItems, ...bonusMaterials];
  }
}
