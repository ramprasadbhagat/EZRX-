part of 'view_by_item_details_bloc.dart';

@freezed
class ViewByItemDetailsState with _$ViewByItemDetailsState {
  const ViewByItemDetailsState._();

  const factory ViewByItemDetailsState({
    required CustomerCodeInfo customerCodeInfo,
    required User user,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrgConfig,
    required OrderHistory orderHistory,
    required OrderHistoryItem orderHistoryItem,
    required List<OrderStatusTracker> orderHistoryStatuses,
    required bool isLoading,
    required bool isDetailsLoading,
    required bool isExpanded,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required ShipToInfo shipToInfo,
  }) = _ViewByItemDetailsState;

  factory ViewByItemDetailsState.initial() => ViewByItemDetailsState(
        user: User.empty(),
        salesOrgConfig: SalesOrganisationConfigs.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        orderHistory: OrderHistory.empty(),
        orderHistoryItem: OrderHistoryItem.empty(),
        orderHistoryStatuses: <OrderStatusTracker>[],
        failureOrSuccessOption: none(),
        isLoading: false,
        isDetailsLoading: false,
        isExpanded: false,
        shipToInfo: ShipToInfo.empty(),
      );

  List<PoDocuments> get poDocumentsList => isExpanded
      ? orderHistoryItem.orderHistoryItemPoAttachments
      : [orderHistoryItem.orderHistoryItemPoAttachments.first];

  bool get displayShowMoreOrLess =>
      orderHistoryItem.orderHistoryItemPoAttachments.length > 1;

  List<OrderHistoryItem> get otherItems => orderHistory.orderHistoryItems
      .where((e) => e.lineNumber != orderHistoryItem.lineNumber)
      .toList();

  bool get isCovidOrderType =>
      (salesOrgConfig.salesOrg.isPH &&
          orderHistoryItem.orderType.isCovidOrderTypeForPH) ||
      (salesOrgConfig.salesOrg.isSg &&
          orderHistoryItem.orderType.isCovidOrderTypeForSG);

  bool get isCovidForNonCustomer =>
      isCovidOrderType && !user.role.type.isCustomer;

  bool get displayBuyAgainButton {
    if (user.role.type.isSalesRepRole) {
      return false;
    }

    if (isCovidForNonCustomer) {
      return false;
    }

    if (customerCodeInfo.status.isEDI) {
      return false;
    }

    return true;
  }
}
