part of 'material_price_bloc.dart';

@freezed
class MaterialPriceEvent with _$MaterialPriceEvent {
  const factory MaterialPriceEvent.initialized() = _Initialized;
  const factory MaterialPriceEvent.fetch({
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesConfigs,
    required ShipToInfo shipToInfo,
    required List<MaterialInfo> materials,
    required bool comboDealEligible,
  }) = _Fetch;
  const factory MaterialPriceEvent.fetchPriceCartProduct({
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesConfigs,
    required ShipToInfo shipToInfo,
    required List<MaterialInfo> products,
    required bool comboDealEligible,
  }) = _fetchPriceCartProduct;
}
