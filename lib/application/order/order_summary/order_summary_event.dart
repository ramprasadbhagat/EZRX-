part of 'order_summary_bloc.dart';

@freezed
class OrderSummaryEvent with _$OrderSummaryEvent {
  const factory OrderSummaryEvent.initialized({
    required SalesOrganisationConfigs config,
  }) = _Initialized;
  const factory OrderSummaryEvent.submitOrder({
    required ShipToInfo shipToInfo,
    required User user,
    required List<PriceAggregate> cartProducts,
    required double grandTotal,
    required double orderValue,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required DeliveryInfoData data,
    required OrderDocumentType orderDocumentType,
    required SalesOrganisationConfigs config,
  }) = _SubmitOrder;
}
