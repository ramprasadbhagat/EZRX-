part of 'order_summary_bloc.dart';

@freezed
class OrderSummaryEvent with _$OrderSummaryEvent {
  const factory OrderSummaryEvent.initialized({
    required User user,
    required ShipToInfo shipToInfo,
    required CustomerCodeInfo customerCodeInfo,
    required OrderDocumentType orderDocumentType,
    required SalesOrganisationConfigs salesOrgConfig,
    required SalesOrganisation salesOrganisation,
    required SalesOrg salesOrg,
  }) = _Initialized;

  const factory OrderSummaryEvent.submitOrder({
    required List<PriceAggregate> cartProducts,
    required double grandTotal,
    required double orderValue,
    required double totalTax,
    required DeliveryInfoData data,
  }) = _SubmitOrder;

  const factory OrderSummaryEvent.orderConfirmationDetail({
    required List<PriceAggregate> priceAggregate,
  }) = _OrderConfirmationDetail;

  const factory OrderSummaryEvent.confirmedOrderStockInfo({
    required OrderHistoryDetails orderHistoryDetails,
    required List<PriceAggregate> priceAggregate,
  }) = _ConfirmedOrderStockInfo;
}
