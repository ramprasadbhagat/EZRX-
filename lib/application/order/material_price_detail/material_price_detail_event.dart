part of 'material_price_detail_bloc.dart';

@freezed
class MaterialPriceDetailEvent with _$MaterialPriceDetailEvent {
  const factory MaterialPriceDetailEvent.initialized() = _Initialized;
  const factory MaterialPriceDetailEvent.fetch({
    required CustomerCodeInfo customerCode,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required ShipToInfo shipToCode,
    required List<MaterialQueryInfo> materialInfos,
  }) = _Fetch;
}
