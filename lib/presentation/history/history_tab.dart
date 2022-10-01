import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_list/order_history_list_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/history/history_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              },
              (_) {
                context.read<AuthBloc>().add(const AuthEvent.authCheck());
              },
            ),
          );
        },
        buildWhen: (previous, current) =>
            previous.orderHistoryList != current.orderHistoryList,
        builder: (context, state) {
          return state.isFetching && state.orderHistoryList.isEmpty
              ? LoadingShimmer.withChild(
                  child: Image.asset(
                    'assets/images/ezrxlogo.png',
                    key: const Key('LoaderImage'),
                    width: 80,
                    height: 80,
                  ),
                )
              : ScrollList<OrderHistory>(
                  emptyMessage: 'No history found',
                  onRefresh: () => context.read<OrderHistoryListBloc>().add(
                        const OrderHistoryListEvent.fetch(),
                      ),
                  isLoading: state.isFetching,
                  onLoadingMore: () => context.read<OrderHistoryListBloc>().add(
                        const OrderHistoryListEvent.loadMore(),
                      ),
                  itemBuilder: (context, index, item) => OrderHistoryListTile(
                    orderHistory: item,
                  ),
                  items: state.orderHistoryList,
                );
        },
      ),
    );
  }
}
