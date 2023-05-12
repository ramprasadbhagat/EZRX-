part of 'return_price_bloc.dart';

@freezed
class ReturnPriceEvent with _$ReturnPriceEvent {
  const factory ReturnPriceEvent.fetchReturnPrice({
    required SalesOrganisation salesOrg,
    required List<ReturnItem> returnItemList,
  }) = _FetchReturnPrice;
}