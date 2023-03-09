part of 'combo_deal_detail_bloc.dart';

@freezed
class ComboDealDetailEvent with _$ComboDealDetailEvent {
  const factory ComboDealDetailEvent.initialize() = _Initialize;
  const factory ComboDealDetailEvent.initComboDealItems({
    required List<PriceAggregate> items,
    required SalesOrganisationConfigs salesConfigs,
  }) = _InitComboDealItems;
  const factory ComboDealDetailEvent.initFromCartComboDealItems({
    required List<PriceAggregate> items,
    required SalesOrganisationConfigs salesConfigs,
  }) = _InitFromCartComboDealItems;
  const factory ComboDealDetailEvent.setPriceInfo({
    required Map<MaterialNumber, MaterialPriceDetail> priceMap,
    required PriceComboDeal comboDeal,
  }) = _SetPriceInfo;
  const factory ComboDealDetailEvent.setComboDealInfo({
    required ComboDeal comboDealInfo,
  }) = _SetComboDealInfo;
  const factory ComboDealDetailEvent.updateItemQuantity({
    required MaterialNumber item,
    required int qty,
  }) = _UpdateItemQuantity;
  const factory ComboDealDetailEvent.updateItemSelection({
    required MaterialNumber item,
  }) = _UpdateItemSelection;
}
