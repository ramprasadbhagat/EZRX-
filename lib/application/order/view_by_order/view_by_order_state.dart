part of 'view_by_order_bloc.dart';

@freezed
class ViewByOrderState with _$ViewByOrderState {
  const ViewByOrderState._();
  const factory ViewByOrderState({
    required SalesOrganisationConfigs salesOrgConfigs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required String sortDirection,
    required ViewByOrder viewByOrderList,
    required bool canLoadMore,
    required bool isFetching,
    required SearchKey searchKey,
    required int nextPageIndex,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required ViewByOrdersFilter appliedFilter,
  }) = _ViewByOrderState;
  factory ViewByOrderState.initial() => ViewByOrderState(
        salesOrgConfigs: SalesOrganisationConfigs.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
        shipToInfo: ShipToInfo.empty(),
        user: User.empty(),
        sortDirection: 'desc',
        viewByOrderList: ViewByOrder.empty(),
        canLoadMore: true,
        isFetching: false,
        nextPageIndex: 0,
        searchKey: SearchKey.searchFilter(''),
        failureOrSuccessOption: none(),
        appliedFilter: ViewByOrdersFilter.empty(),
      );
}
