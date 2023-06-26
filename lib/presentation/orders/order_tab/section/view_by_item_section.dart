import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter/order_history_filter_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_list/order_history_list_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_filter.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/common_tile_item.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewByItemsPage extends StatelessWidget {
  const ViewByItemsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderHistoryListBloc, OrderHistoryListState>(
      listenWhen: (previous, current) =>
          previous.failureOrSuccessOption != current.failureOrSuccessOption,
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
        return state.isFetching
            ? LoadingShimmer.logo(key: const Key('loaderImage'))
            : ScrollList<OrderHistoryItem>(
                controller: ScrollController(),
                emptyMessage: 'No order items found'.tr(),
                onRefresh: () {
                  context.read<OrderHistoryListBloc>().add(
                        OrderHistoryListEvent.fetch(
                          customerCodeInfo: context
                              .read<CustomerCodeBloc>()
                              .state
                              .customerCodeInfo,
                          salesOrgConfigs:
                              context.read<SalesOrgBloc>().state.configs,
                          shipToInfo:
                              context.read<CustomerCodeBloc>().state.shipToInfo,
                          user: context.read<UserBloc>().state.user,
                          sortDirection: context
                              .read<OrderHistoryFilterBloc>()
                              .state
                              .sortDirection,
                          orderHistoryFilter: OrderHistoryFilter.empty(),
                        ),
                      );
                },
                isLoading: state.isFetching,
                onLoadingMore: () => context.read<OrderHistoryListBloc>().add(
                      OrderHistoryListEvent.loadMore(
                        customerCodeInfo: context
                            .read<CustomerCodeBloc>()
                            .state
                            .customerCodeInfo,
                        salesOrgConfigs:
                            context.read<SalesOrgBloc>().state.configs,
                        shipToInfo:
                            context.read<CustomerCodeBloc>().state.shipToInfo,
                        user: context.read<UserBloc>().state.user,
                        sortDirection: context
                            .read<OrderHistoryFilterBloc>()
                            .state
                            .sortDirection,
                        orderHistoryFilter: context
                            .read<OrderHistoryFilterBloc>()
                            .state
                            .orderHistoryFilter,
                      ),
                    ),
                itemBuilder: (context, index, item) => _ViewByOrderItemGroup(
                  orderHistoryItem: item,
                  showDivider: index != 0,
                ),
                items: state.orderHistoryList.orderHistoryItems,
              );
      },
    );
  }
}

class _ViewByOrderItemGroup extends StatelessWidget {
  final OrderHistoryItem orderHistoryItem;
  final bool showDivider;
  const _ViewByOrderItemGroup({
    Key? key,
    required this.orderHistoryItem,
    required this.showDivider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showDivider)
          const Divider(
            indent: 0,
            height: 20,
            endIndent: 0,
            color: ZPColors.lightGray2,
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Ordered on ${orderHistoryItem.createdDate.toValidDateString}',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: ZPColors.darkerGrey,
                      ),
                ),
              ),
              _ViewByOrderItem(
                orderHistoryItem: orderHistoryItem,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ViewByOrderItem extends StatelessWidget {
  final OrderHistoryItem orderHistoryItem;
  const _ViewByOrderItem({Key? key, required this.orderHistoryItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTileItem(
          label: orderHistoryItem.materialNumber.displayMatNo,
          title: orderHistoryItem.materialDescription,
          subtitle: orderHistoryItem.manufactureName,
          headerText:
              'Order #${orderHistoryItem.orderNumber.getOrDefaultValue('')}',
          statusWidget: StatusLabel(
            status: StatusType(
              orderHistoryItem.status.getOrDefaultValue(''),
            ),
          ),
          quantity: orderHistoryItem.qty.toString(),
          footerWidget: orderHistoryItem.invoiceNumber.isNotEmpty
              ? _InvoiceNumber(
                  orderHistoryItem: orderHistoryItem,
                )
              : null,
          image: 'assets/svg/default_product_image.svg',
          isQuantityBelowImage: false,
          tag: orderHistoryItem.isBonusMaterial ? 'Bonus' : '',
        ),
      ],
    );
  }
}

class _InvoiceNumber extends StatelessWidget {
  final OrderHistoryItem orderHistoryItem;
  const _InvoiceNumber({Key? key, required this.orderHistoryItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: ZPColors.accentColor,
          height: 15,
          indent: 0,
          endIndent: 0,
        ),
        Text(
          'Invoice #${orderHistoryItem.invoiceNumber}',
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}
