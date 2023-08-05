part of 'material_price_detail_bloc.dart';

@freezed
class MaterialPriceDetailEvent with _$MaterialPriceDetailEvent {
  const factory MaterialPriceDetailEvent.initialized() = _Initialized;
  const factory MaterialPriceDetailEvent.refresh({
    required User user,
    required CustomerCodeInfo customerCode,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required ShipToInfo shipToCode,
    required List<MaterialQueryInfo> materialInfoList,
    required String pickAndPack,
    @Default(false) bool skipFOCCheck,
  }) = _Refresh;
  const factory MaterialPriceDetailEvent.fetch({
    required User user,
    required CustomerCodeInfo customerCode,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required ShipToInfo shipToCode,
    required List<MaterialQueryInfo> materialInfoList,
    required String pickAndPack,
    @Default(false) bool skipFOCCheck,
  }) = _Fetch;
  const factory MaterialPriceDetailEvent.comboDealFetch({
    required User user,
    required CustomerCodeInfo customerCode,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required ShipToInfo shipToCode,
    required List<MaterialNumber> materialInfoList,
  }) = _ComboDealFetch;
}
