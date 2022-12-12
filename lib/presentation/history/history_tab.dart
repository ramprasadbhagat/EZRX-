import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter/order_history_filter_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter_by_status/order_history_filter_by_status_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_list/order_history_list_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_filter.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/cart_button.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/history/history_filter.dart';
import 'package:ezrxmobile/presentation/history/history_filter_by_status.dart';
import 'package:ezrxmobile/presentation/history/history_tile.dart';
import 'package:ezrxmobile/presentation/orders/core/account_suspended_warning.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryTab extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  HistoryTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const radius = 16.0;
    final buildToInformation =
        context.read<CustomerCodeBloc>().state.customerCodeInfo.billToInfos;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Order History'.tr()),
        automaticallyImplyLeading: false,
        actions: const [CartButton()],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30.0),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: BlocBuilder<ShipToCodeBloc, ShipToCodeState>(
              buildWhen: (previous, current) =>
                  previous.haveShipTo != current.haveShipTo,
              builder: (context, state) {
                return state.haveShipTo
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BlocBuilder<OrderHistoryFilterBloc,
                              OrderHistoryFilterState>(
                            builder: (context, state) {
                              return InkWell(
                                onTap: () {
                                  context.read<OrderHistoryFilterBloc>().add(
                                        OrderHistoryFilterEvent.sortByDate(
                                          state.sortDirection == 'desc'
                                              ? 'asc'
                                              : 'desc',
                                        ),
                                      );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Order Date'.tr(),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: ZPColors.kPrimaryColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Icon(
                                      state.sortDirection == 'desc'
                                          ? Icons.arrow_drop_down_outlined
                                          : Icons.arrow_drop_up_outlined,
                                      color: ZPColors.darkGray,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          InkWell(
                            key: const Key('statusFilterButton'),
                            onTap: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (_) {
                                  return const HistoryFilterByStatus();
                                },
                              );
                            },
                            child: Stack(
                              children: <Widget>[
                                Text(
                                  'Status'.tr(),
                                  key: const ValueKey('status'),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: ZPColors.kPrimaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                BlocBuilder<OrderHistoryFilterByStatusBloc,
                                    OrderHistoryFilterByStatusState>(
                                  builder: (context, state) {
                                    if (state.filterByStatusName.isNotEmpty) {
                                      return Positioned(
                                        key: const ValueKey(
                                          'Filter_by_status_list_not_empty',
                                        ),
                                        right: 0,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: ZPColors.kPrimaryColor,
                                          ),
                                          width: radius / 3,
                                          height: radius / 2,
                                        ),
                                      );
                                    }

                                    return const SizedBox.shrink();
                                  },
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            key: const Key('filterButton'),
                            onTap: () {
                              scaffoldKey.currentState!.openEndDrawer();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Filter'.tr(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: ZPColors.kPrimaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ).tr(),
                                Stack(
                                  children: <Widget>[
                                    const FittedBox(
                                      key: ValueKey('order_history_filter'),
                                      child: Icon(
                                        Icons.filter_alt,
                                      ),
                                    ),
                                    BlocBuilder<OrderHistoryFilterBloc,
                                        OrderHistoryFilterState>(
                                      buildWhen: (previous, current) =>
                                          previous.isAppliedFilter !=
                                          current.isAppliedFilter,
                                      builder: (context, state) {
                                        if (state.isAppliedFilter) {
                                          return Positioned(
                                            key: const ValueKey(
                                              'Filter_list_not_empty',
                                            ),
                                            right: 0,
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: ZPColors.kPrimaryColor,
                                              ),
                                              width: radius / 2,
                                              height: radius / 2,
                                            ),
                                          );
                                        }

                                        return const SizedBox.shrink();
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : const SizedBox.shrink();
              },
            ),
          ),
          // : const SizedBox.shrink(),
        ),
      ),
      endDrawer: const Drawer(child: OrderHistoryFilterDrawer()),
      body: BlocListener<OrderHistoryFilterBloc, OrderHistoryFilterState>(
        listenWhen: (previous, current) =>
            previous.isSubmitting != current.isSubmitting &&
                current.isSubmitting ||
            !scaffoldKey.currentState!.isEndDrawerOpen ||
            previous.sortDirection != current.sortDirection,
        listener: (context, state) {
          final hasCustomerCodeInfo = context
              .read<CustomerCodeBloc>()
              .state
              .customerCodeInfo
              .customerCodeSoldTo
              .isNotEmpty;
          final hasShipToInfo = context
              .read<ShipToCodeBloc>()
              .state
              .shipToInfo
              .shipToCustomerCode
              .isNotEmpty;
          if (hasCustomerCodeInfo && hasShipToInfo) {
            context.read<OrderHistoryListBloc>().add(
                  OrderHistoryListEvent.fetch(
                    customerCodeInfo:
                        context.read<CustomerCodeBloc>().state.customerCodeInfo,
                    salesOrgConfigs: context.read<SalesOrgBloc>().state.configs,
                    shipToInfo: context.read<ShipToCodeBloc>().state.shipToInfo,
                    user: context.read<UserBloc>().state.user,
                    orderHistoryFilter: state.orderHistoryFilterList,
                    sortDirection: state.sortDirection,
                  ),
                );
          }
        },
        child: BlocBuilder<OrderHistoryFilterByStatusBloc,
            OrderHistoryFilterByStatusState>(
          buildWhen: ((previous, current) =>
              previous.filterByStatusName != current.filterByStatusName),
          builder: (context, orderHistoryFilterByStatusState) {
            return BlocConsumer<OrderHistoryListBloc, OrderHistoryListState>(
              listenWhen: (previous, current) =>
                  previous.failureOrSuccessOption !=
                  current.failureOrSuccessOption,
              listener: (context, state) {
                state.failureOrSuccessOption.fold(
                  () {},
                  (either) => either.fold(
                    (failure) {
                      ErrorUtils.handleApiFailure(context, failure);
                    },
                    (_) {},
                  ),
                );
              },
              buildWhen: (previous, current) =>
                  previous.isFetching != current.isFetching,
              builder: (context, state) {
                return state.isFetching &&
                        state
                            .getFilterItem(orderHistoryFilterByStatusState
                                .filterByStatusName)
                            .isEmpty
                    ? LoadingShimmer.logo(key: const Key('loaderImage'))
                    : Column(
                        children: [
                          const AccountSuspendedBanner(),
                          Expanded(
                            child: ScrollList<OrderHistoryItem>(
                              key: const Key('orderHistoryList'),
                              emptyMessage: 'No history found',
                              onRefresh: () {
                                if (context
                                    .read<ShipToCodeBloc>()
                                    .state
                                    .haveShipTo) {
                                  context.read<OrderHistoryFilterBloc>().add(
                                        const OrderHistoryFilterEvent
                                            .initialized(),
                                      );
                                  context
                                      .read<OrderHistoryFilterByStatusBloc>()
                                      .add(
                                        const OrderHistoryFilterByStatusEvent
                                            .initialized(),
                                      );
                                  context.read<OrderHistoryListBloc>().add(
                                        OrderHistoryListEvent.fetch(
                                          customerCodeInfo: context
                                              .read<CustomerCodeBloc>()
                                              .state
                                              .customerCodeInfo,
                                          salesOrgConfigs: context
                                              .read<SalesOrgBloc>()
                                              .state
                                              .configs,
                                          shipToInfo: context
                                              .read<ShipToCodeBloc>()
                                              .state
                                              .shipToInfo,
                                          user: context
                                              .read<UserBloc>()
                                              .state
                                              .user,
                                          orderHistoryFilter:
                                              OrderHistoryFilter.empty(),
                                          sortDirection: context
                                              .read<OrderHistoryFilterBloc>()
                                              .state
                                              .sortDirection,
                                        ),
                                      );
                                }
                              },
                              isLoading: state.isFetching,
                              onLoadingMore: () => context
                                  .read<OrderHistoryListBloc>()
                                  .add(
                                    OrderHistoryListEvent.loadMore(
                                      customerCodeInfo: context
                                          .read<CustomerCodeBloc>()
                                          .state
                                          .customerCodeInfo,
                                      salesOrgConfigs: context
                                          .read<SalesOrgBloc>()
                                          .state
                                          .configs,
                                      shipToInfo: context
                                          .read<ShipToCodeBloc>()
                                          .state
                                          .shipToInfo,
                                      user: context.read<UserBloc>().state.user,
                                      sortDirection: context
                                          .read<OrderHistoryFilterBloc>()
                                          .state
                                          .sortDirection,
                                      orderHistoryFilter:
                                          OrderHistoryFilter.empty(),
                                    ),
                                  ),
                              itemBuilder: (context, index, item) =>
                                  OrderHistoryListTile(
                                key: const ValueKey('historyTitle'),
                                orderHistoryItem: item,
                                customerCodeInfo: context
                                    .read<CustomerCodeBloc>()
                                    .state
                                    .customerCodeInfo,
                                shipToInfo: context
                                    .read<ShipToCodeBloc>()
                                    .state
                                    .shipToInfo,
                                orderHistoryBasicInfo: state
                                    .orderHistoryList.orderBasicInformation,
                                currency: context
                                    .read<SalesOrgBloc>()
                                    .state
                                    .configs
                                    .currency,
                                salesOrgConfigs:
                                    context.read<SalesOrgBloc>().state.configs,
                                billToInfo: buildToInformation.isNotEmpty
                                    ? buildToInformation.first
                                    : BillToInfo.empty(),
                              ),
                              items: state.getFilterItem(
                                orderHistoryFilterByStatusState
                                    .filterByStatusName,
                              ),
                            ),
                          ),
                        ],
                      );
              },
            );
          },
        ),
      ),
    );
  }
}
