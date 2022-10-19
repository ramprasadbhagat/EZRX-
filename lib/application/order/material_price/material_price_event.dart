part of 'material_price_bloc.dart';

@freezed
class MaterialPriceEvent with _$MaterialPriceEvent {
  const factory MaterialPriceEvent.initialized() = _Initialized;
  const factory MaterialPriceEvent.fetch({
    required CustomerCodeInfo customerCode,
    required SalesOrganisation salesOrganisation,
    required List<MaterialNumber> materialNumbers,
  }) = _Fetch;
}
