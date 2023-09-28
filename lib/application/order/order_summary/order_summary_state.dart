part of 'order_summary_bloc.dart';

@freezed
class OrderSummaryState with _$OrderSummaryState {
  const OrderSummaryState._();

  const factory OrderSummaryState({
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required bool isSubmitting,
    required bool isConfirming,
    required SubmitOrderResponse submitOrderResponse,
    required OrderHistoryDetails orderHistoryDetails,
    required User user,
    required ShipToInfo shipToInfo,
    required CustomerCodeInfo customerCodeInfo,
    required OrderDocumentType orderDocumentType,
    required SalesOrganisationConfigs salesOrgConfig,
    required SalesOrganisation salesOrganisation,
    required SalesOrg salesOrg,
    required bool isExpanded,
  }) = _OrderSummaryState;

  factory OrderSummaryState.initial() => OrderSummaryState(
        apiFailureOrSuccessOption: none(),
        isSubmitting: false,
        isConfirming: false,
        submitOrderResponse: SubmitOrderResponse.empty(),
        orderHistoryDetails: OrderHistoryDetails.empty(),
        user: User.empty(),
        shipToInfo: ShipToInfo.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        orderDocumentType: OrderDocumentType.empty(),
        salesOrgConfig: SalesOrganisationConfigs.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        salesOrg: SalesOrg(''),
        isExpanded: false,
      );

  bool get isOrderHistoryDetailsEmpty =>
      orderHistoryDetails == OrderHistoryDetails.empty();

  List<PoDocuments> get poDocumentsList => isExpanded
      ? orderHistoryDetails.orderHistoryDetailsPoDocuments
      : [orderHistoryDetails.orderHistoryDetailsPoDocuments.first];

  bool get displayShowMoreOrLess =>
      orderHistoryDetails.orderHistoryDetailsPoDocuments.length > 1;
}
