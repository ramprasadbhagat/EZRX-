part of 'order_summary_bloc.dart';

@freezed
class OrderSummaryState with _$OrderSummaryState {
  const OrderSummaryState._();

  const factory OrderSummaryState({
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required bool isSubmitting,
    required bool isConfirming,
    required SubmitOrderResponse submitOrderResponse,
    required List<OrderHistoryDetails> orderHistoryDetailsList,
    required User user,
    required ShipToInfo shipToInfo,
    required CustomerCodeInfo customerCodeInfo,
    required OrderDocumentType orderDocumentType,
    required SalesOrganisationConfigs salesOrgConfig,
    required SalesOrganisation salesOrganisation,
    required bool isExpanded,
  }) = _OrderSummaryState;

  factory OrderSummaryState.initial() => OrderSummaryState(
        apiFailureOrSuccessOption: none(),
        isSubmitting: false,
        isConfirming: false,
        submitOrderResponse: SubmitOrderResponse.empty(),
        orderHistoryDetailsList: <OrderHistoryDetails>[],
        user: User.empty(),
        shipToInfo: ShipToInfo.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        orderDocumentType: OrderDocumentType.empty(),
        salesOrgConfig: SalesOrganisationConfigs.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        isExpanded: false,
      );

  OrderHistoryDetails get orderHistoryDetails =>
      orderHistoryDetailsList.firstOrNull ?? OrderHistoryDetails.empty();

  List<PoDocuments> get poDocumentsList => isExpanded
      ? orderHistoryDetails.orderHistoryDetailsPoDocuments
      : [orderHistoryDetails.orderHistoryDetailsPoDocuments.first];

  bool get displayShowMoreOrLess =>
      orderHistoryDetails.orderHistoryDetailsPoDocuments.length > 1;
}
