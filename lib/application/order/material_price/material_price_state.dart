part of 'material_price_bloc.dart';

@freezed
class MaterialPriceState with _$MaterialPriceState {
  const MaterialPriceState._();
  const factory MaterialPriceState({
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesConfigs,
    required ShipToInfo shipToInfo,
    required Map<MaterialNumber, Price> materialPrice,
    required bool isFetching,
  }) = _MaterialPriceState;

  factory MaterialPriceState.initial() => MaterialPriceState(
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesConfigs: SalesOrganisationConfigs.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        shipToInfo: ShipToInfo.empty(),
        isFetching: false,
        materialPrice: {},
      );

  Price getPriceForMaterial(MaterialNumber materialNumber) {
    return materialPrice[materialNumber] ?? Price.empty();
  }
}
