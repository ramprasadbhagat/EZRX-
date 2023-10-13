part of 'view_by_order_details_bloc.dart';

@freezed
class ViewByOrderDetailsState with _$ViewByOrderDetailsState {
  const ViewByOrderDetailsState._();
  const factory ViewByOrderDetailsState({
    required User user,
    required SalesOrganisationConfigs configs,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required OrderHistoryDetails orderHistoryDetails,
    required bool isLoading,
    required Map<MaterialQueryInfo, bool> isLoadingTenderContract,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required Map<MaterialQueryInfo, PriceAggregate> materials,
    required bool isExpanded,
    required List<ProductDetailAggregate> productDetailAggregateList,
    required ShipToInfo shipToInfo,
    required bool isLoadingBundleDetail,
  }) = _ViewByOrderDetailsState;

  factory ViewByOrderDetailsState.initial() => ViewByOrderDetailsState(
        user: User.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        orderHistoryDetails: OrderHistoryDetails.empty(),
        failureOrSuccessOption: none(),
        isLoading: false,
        isLoadingTenderContract: {},
        materials: {},
        isExpanded: false,
        productDetailAggregateList: <ProductDetailAggregate>[],
        shipToInfo: ShipToInfo.empty(),
        isLoadingBundleDetail: false,
        configs: SalesOrganisationConfigs.empty(),
      );
  int get poDocumentCount =>
      orderHistoryDetails.orderHistoryDetailsPoDocuments.length;
  int get displayedPoDocumentCount => isExpanded ? poDocumentCount : 1;
  int get additionalItemCount => poDocumentCount > 1 ? 1 : 0;
  int get totalItemCount => displayedPoDocumentCount + additionalItemCount;
  bool get isOrderHistoryDetailsEmpty =>
      orderHistoryDetails == OrderHistoryDetails.empty();

  List<MaterialNumber> get bundleCodes =>
      orderHistoryDetails.orderHistoryDetailsOrderItem.bundleItemDetailsList
          .map((e) => e.parentId)
          .toList();

  //TODO:Need To Revisit when tender contract is implemented for V3
  // bool get loadingTenderContractSuccess => isLoadingTenderContract.values.every(
  //       (isLoading) => !isLoading,
  //     );
}
