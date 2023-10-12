part of 'combo_deal_material_detail_bloc.dart';

@freezed
class ComboDealMaterialDetailEvent with _$ComboDealMaterialDetailEvent {
  const factory ComboDealMaterialDetailEvent.initialize({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
  }) = _Initialize;
  const factory ComboDealMaterialDetailEvent.initFromCartComboDealItems({
    required List<PriceAggregate> items,
    required SalesOrganisationConfigs salesConfigs,
  }) = _InitFromCartComboDealItems;
  const factory ComboDealMaterialDetailEvent.setPriceInfo({
    required Map<MaterialNumber, MaterialPriceDetail> priceMap,
  }) = _SetPriceInfo;
  const factory ComboDealMaterialDetailEvent.updateItemQuantity({
    required MaterialNumber item,
    required int qty,
  }) = _UpdateItemQuantity;
  const factory ComboDealMaterialDetailEvent.updateItemSelection({
    required MaterialNumber item,
  }) = _UpdateItemSelection;
  const factory ComboDealMaterialDetailEvent.fetchComboDealDetail({
    required ComboDeal comboDeal,
    required SalesOrganisationConfigs salesConfigs,
    required Locale locale,
    required MaterialNumber parentMaterialNumber,
  }) = _FetchComboDealDetail;

  const factory ComboDealMaterialDetailEvent.search({
    required SearchKey searchKey,
  }) = _Search;

  const factory ComboDealMaterialDetailEvent.clearSearch() = _ClearSearch;
}
