import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter/order_history_filter_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_list/order_history_list_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_filter.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/presentation/core/cart_button.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/history/history_filter.dart';
import 'package:ezrxmobile/presentation/history/history_tile.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryTab extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  HistoryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const radius = 16.0;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text(
          'Order History',
        ).tr(),
        automaticallyImplyLeading: false,
        actions: const [
          CartButton(),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(
            30.0,
          ),
          child: BlocBuilder<ShipToCodeBloc, ShipToCodeState>(
            buildWhen: (previous, current) =>
                previous.haveShipTo != current.haveShipTo,
            builder: (context, state) {
              return state.haveShipTo
                  ? GestureDetector(
                      key: const Key('filterButton'),
                      onTap: () {
                        scaffoldKey.currentState!.openEndDrawer();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            'Filter',
                            style: TextStyle(
                              fontSize: 14,
                              color: ZPColors.kPrimaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ).tr(),
                          Padding(
                            padding: const EdgeInsets.all(
                              8.0,
                            ),
                            child: Stack(
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
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink();
            },
          ),
          // : const SizedBox.shrink(),
        ),
      ),
      endDrawer: const Drawer(child: OrderHistoryFilterDrawer()),
      body: BlocListener<OrderHistoryFilterBloc, OrderHistoryFilterState>(
        listenWhen: (previous, current) =>
            previous.isSubmitting != current.isSubmitting &&
                current.isSubmitting ||
            !scaffoldKey.currentState!.isEndDrawerOpen,
        listener: (context, state) {
          context.read<OrderHistoryListBloc>().add(
                OrderHistoryListEvent.fetch(
                  customerCodeInfo:
                      context.read<CustomerCodeBloc>().state.customerCodeInfo,
                  salesOrgConfigs: context.read<SalesOrgBloc>().state.configs,
                  shipToInfo: context.read<ShipToCodeBloc>().state.shipToInfo,
                  user: context.read<UserBloc>().state.user,
                  orderHistoryFilter: state.orderHistoryFilterList,
                ),
              );
        },
        child: BlocConsumer<OrderHistoryListBloc, OrderHistoryListState>(
          listenWhen: (previous, current) =>
              previous.failureOrSuccessOption != current.failureOrSuccessOption,
          listener: (context, state) {
            state.failureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  final failureMessage = failure.failureMessage;
                  showSnackBar(
                    context: context,
                    message: failureMessage.tr(),
                  );
                  if (failureMessage == 'authentication failed') {
                    context.read<AuthBloc>().add(const AuthEvent.logout());
                  }
                },
                (_) {
                  context.read<AuthBloc>().add(const AuthEvent.authCheck());
                },
              ),
            );
          },
          buildWhen: (previous, current) =>
              previous.isFetching != current.isFetching,
          builder: (context, state) {
            return state.isFetching &&
                    state.orderHistoryList.orderHistoryItems.isEmpty
                ? LoadingShimmer.withChild(
                    child: Image.asset(
                      'assets/images/ezrxlogo.png',
                      key: const Key('LoaderImage'),
                      width: 80,
                      height: 80,
                    ),
                  )
                : ScrollList<OrderHistoryItem>(
                    key: const Key('OrderHistoryList'),
                    emptyMessage: 'No history found',
                    onRefresh: () {
                      if (context.read<ShipToCodeBloc>().state.haveShipTo) {
                        context.read<OrderHistoryListBloc>().add(
                              OrderHistoryListEvent.fetch(
                                customerCodeInfo: context
                                    .read<CustomerCodeBloc>()
                                    .state
                                    .customerCodeInfo,
                                salesOrgConfigs:
                                    context.read<SalesOrgBloc>().state.configs,
                                shipToInfo: context
                                    .read<ShipToCodeBloc>()
                                    .state
                                    .shipToInfo,
                                user: context.read<UserBloc>().state.user,
                                orderHistoryFilter: OrderHistoryFilter.empty(),
                              ),
                            );
                      }
                    },
                    isLoading: state.isFetching,
                    onLoadingMore: () =>
                        context.read<OrderHistoryListBloc>().add(
                              OrderHistoryListEvent.loadMore(
                                customerCodeInfo: context
                                    .read<CustomerCodeBloc>()
                                    .state
                                    .customerCodeInfo,
                                salesOrgConfigs:
                                    context.read<SalesOrgBloc>().state.configs,
                                shipToInfo: context
                                    .read<ShipToCodeBloc>()
                                    .state
                                    .shipToInfo,
                                user: context.read<UserBloc>().state.user,
                                orderHistoryFilter: OrderHistoryFilter.empty(),
                              ),
                            ),
                    itemBuilder: (context, index, item) => OrderHistoryListTile(
                      orderHistoryItem: item,
                      customerCodeInfo: context
                          .read<CustomerCodeBloc>()
                          .state
                          .customerCodeInfo,
                      shipToInfo:
                          context.read<ShipToCodeBloc>().state.shipToInfo,
                      orderHistoryBasicInfo:
                          state.orderHistoryList.orderBasicInformation,
                      currency:
                          context.read<SalesOrgBloc>().state.configs.currency,
                      salesOrgConfigs:
                          context.read<SalesOrgBloc>().state.configs,
                    ),
                    items: state.orderHistoryList.orderHistoryItems,
                  );
          },
        ),
      ),
    );
  }
}
