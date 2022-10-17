part of 'stock_information_bloc.dart';

@freezed
class StockInformationEvent with _$StockInformationEvent {
  const factory StockInformationEvent.initialized() = _Initialized;
  const factory StockInformationEvent.fetch({
    required MaterialInfo material,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
  }) = _FetchInfo;
}
