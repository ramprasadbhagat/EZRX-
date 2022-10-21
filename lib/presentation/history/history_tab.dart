import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_list/order_history_list_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/history/history_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History').tr(),
        automaticallyImplyLeading: false,
      ),
      body: BlocConsumer<OrderHistoryListBloc, OrderHistoryListState>(
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
                  emptyMessage: 'No history found'.tr().toString(),
                  onRefresh: () => context.read<OrderHistoryListBloc>().add(
                        OrderHistoryListEvent.fetch(
                          customerCodeInfo: context
                              .read<CustomerCodeBloc>()
                              .state
                              .customeCodeInfo,
                          salesOrgConfigs:
                              context.read<SalesOrgBloc>().state.configs,
                          shipToInfo:
                              context.read<ShipToCodeBloc>().state.shipToInfo,
                          user: context.read<UserBloc>().state.user,
                        ),
                      ),
                  isLoading: state.isFetching,
                  onLoadingMore: () => context.read<OrderHistoryListBloc>().add(
                        OrderHistoryListEvent.loadMore(
                          customerCodeInfo: context
                              .read<CustomerCodeBloc>()
                              .state
                              .customeCodeInfo,
                          salesOrgConfigs:
                              context.read<SalesOrgBloc>().state.configs,
                          shipToInfo:
                              context.read<ShipToCodeBloc>().state.shipToInfo,
                          user: context.read<UserBloc>().state.user,
                        ),
                      ),
                  itemBuilder: (context, index, item) => OrderHistoryListTile(
                    orderHistoryItem: item,
                    currency:
                        context.read<SalesOrgBloc>().state.configs.currency,
                  ),
                  items: state.orderHistoryList.orderHistoryItems,
                );
        },
      ),
    );
  }
}
