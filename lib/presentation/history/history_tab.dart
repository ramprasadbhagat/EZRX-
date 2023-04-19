import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter/order_history_filter_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter_by_status/order_history_filter_by_status_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_list/order_history_list_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_filter.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';

import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/presentation/core/filter_icon.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_button.dart';
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
    trackMixpanelEvent(
      MixpanelEvents.orderHistoryPageView,
    );
    const radius = 16.0;
    final buildToInformation =
        context.read<CustomerCodeBloc>().state.customerCodeInfo.billToInfos;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Order History'.tr(),
          locale: context.locale,
        ),
        automaticallyImplyLeading: false,
        actions: const [CartButton()],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30.0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
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
                              return GestureDetector(
                                key: const Key('orderDateFilter'),
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.apply(
                                            color: ZPColors.kPrimaryColor,
                                          ),
                                    ),
                                    Icon(
                                      state.sortDirection == 'desc'
                                          ? Icons.arrow_drop_down_outlined
                                          : Icons.arrow_drop_up_outlined,
                                      color: ZPColors.kPrimaryColor,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          GestureDetector(
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.apply(
                                        color: ZPColors.kPrimaryColor,
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
                          BlocBuilder<OrderHistoryFilterBloc,
                              OrderHistoryFilterState>(
                            buildWhen: (previous, current) =>
                                previous
                                    .orderHistoryFilter.appliedFilterCount !=
                                current.orderHistoryFilter.appliedFilterCount,
                            builder: (context, state) {
                              return FilterCountButton(
                                key: const Key('filterOrderHistory'),
                                filterCount:
                                    state.orderHistoryFilter.appliedFilterCount,
                                onTap: () {
                                  scaffoldKey.currentState!.openEndDrawer();
                                },
                              );
                            },
                          ),
                        ],
                      )
                    : const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
      endDrawer: const OrderHistoryFilterDrawer(),
      body: BlocListener<OrderHistoryFilterBloc, OrderHistoryFilterState>(
        key: const Key('orderHistoryTab'),
        listenWhen: (previous, current) =>
            previous.isSubmitting != current.isSubmitting &&
                current.isSubmitting ||
            previous.sortDirection != current.sortDirection ||
            !scaffoldKey.currentState!.isEndDrawerOpen,
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
                    orderHistoryFilter: state.orderHistoryFilter,
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
                  previous.isFetching != current.isFetching ||
                  previous.orderHistoryList != current.orderHistoryList,
              builder: (context, state) {
                return state.isFetching &&
                        state
                            .getFilterItem(orderHistoryFilterByStatusState
                                .filterByStatusName)
                            .isEmpty
                    ? LoadingShimmer.logo(key: const Key('loaderImage'))
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AccountSuspendedBanner(),
                          if (context
                              .read<OrderHistoryFilterByStatusBloc>()
                              .state
                              .filterByStatusName
                              .isNotEmpty)
                            const _SelectedStatusChip(),
                          context
                                  .read<OrderHistoryFilterBloc>()
                                  .state
                                  .orderHistoryFilter
                                  .anyFilterApplied
                              ? const SizedBox.shrink()
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Icon(
                                        Icons.info_outline_rounded,
                                        color: ZPColors.darkerGreen,
                                        size: 18,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Order dates pre-set for past 7 days. Change the date range from “Filter” for more data'
                                              .tr(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                                fontSize: 12,
                                                fontStyle: FontStyle.italic,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                          Expanded(
                            child: ScrollList<OrderHistoryItem>(
                              key: const Key('orderHistoryList'),
                              emptyMessage: 'No history found'.tr(),
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
                                  context.read<MaterialPriceDetailBloc>().add(
                                        const MaterialPriceDetailEvent
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
                                key: ValueKey('historyTitle$index'),
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

class _SelectedStatusChip extends StatelessWidget {
  const _SelectedStatusChip({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      key: const Key('SelectedStatusChip'),
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              'Filtering on the basis of : '.tr(),
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontSize: 12),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: BlocBuilder<OrderHistoryFilterByStatusBloc,
                OrderHistoryFilterByStatusState>(
              buildWhen: (previous, current) => previous != current,
              builder: (context, state) {
                return Row(
                  children: state.filterByStatusName
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Chip(
                            backgroundColor: ZPColors.lightGray,
                            label: Text(
                              e.getValue(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(fontSize: 12),
                            ).tr(),
                          ),
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
