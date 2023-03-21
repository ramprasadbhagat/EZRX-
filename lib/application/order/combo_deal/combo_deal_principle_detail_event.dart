part of 'combo_deal_principle_detail_bloc.dart';

@freezed
class ComboDealPrincipleDetailEvent with _$ComboDealPrincipleDetailEvent {
  const factory ComboDealPrincipleDetailEvent.initialize() = _Initialize;
  const factory ComboDealPrincipleDetailEvent.fetch({
    required User user,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesConfigs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required List<String> principles,
  }) = _Fetch;
  const factory ComboDealPrincipleDetailEvent.setPriceInfo({
    required Map<MaterialNumber, MaterialPriceDetail> priceMap,
    required PriceComboDeal comboDeal,
  }) = _SetPriceInfo;
  const factory ComboDealPrincipleDetailEvent.setComboDealInfo({
    required ComboDeal comboDealInfo,
  }) = _SetComboDealInfo;
  const factory ComboDealPrincipleDetailEvent.updateItemQuantity({
    required MaterialNumber item,
    required int qty,
  }) = _UpdateItemQuantity;
  const factory ComboDealPrincipleDetailEvent.updateItemSelection({
    required MaterialNumber item,
  }) = _UpdateItemSelection;
}
