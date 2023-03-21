part of 'combo_deal_material_detail_bloc.dart';

@freezed
class ComboDealMaterialDetailEvent with _$ComboDealMaterialDetailEvent {
  const factory ComboDealMaterialDetailEvent.initialize() = _Initialize;
  const factory ComboDealMaterialDetailEvent.initComboDealItems({
    required List<PriceAggregate> items,
    required SalesOrganisationConfigs salesConfigs,
  }) = _InitComboDealItems;
  const factory ComboDealMaterialDetailEvent.initFromCartComboDealItems({
    required List<PriceAggregate> items,
    required SalesOrganisationConfigs salesConfigs,
  }) = _InitFromCartComboDealItems;
  const factory ComboDealMaterialDetailEvent.setPriceInfo({
    required Map<MaterialNumber, MaterialPriceDetail> priceMap,
    required PriceComboDeal comboDeal,
  }) = _SetPriceInfo;
  const factory ComboDealMaterialDetailEvent.setComboDealInfo({
    required ComboDeal comboDealInfo,
  }) = _SetComboDealInfo;
  const factory ComboDealMaterialDetailEvent.updateItemQuantity({
    required MaterialNumber item,
    required int qty,
  }) = _UpdateItemQuantity;
  const factory ComboDealMaterialDetailEvent.updateItemSelection({
    required MaterialNumber item,
  }) = _UpdateItemSelection;
}
