import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter/order_history_filter_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_list/order_history_list_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_filter.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                              context.read<ShipToCodeBloc>().state.shipToInfo,
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
                            context.read<ShipToCodeBloc>().state.shipToInfo,
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
        CustomCard(
          child: ListTile(
            onTap: () {},
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Order #${orderHistoryItem.orderNumber.getOrDefaultValue('')}',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                    StatusLabel(
                      status: StatusType(
                        orderHistoryItem.status.getOrDefaultValue(''),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CustomCard(
                      showBorder: true,
                      showShadow: false,
                      margin: const EdgeInsets.fromLTRB(0, 10, 8, 0),
                      padding: const EdgeInsets.all(
                        10,
                      ),
                      child: SvgPicture.asset(
                        'assets/svg/default_product_image.svg', //TODO: will implement the getProduct api to display the iamge
                        height: MediaQuery.of(context).size.height * 0.06,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  orderHistoryItem.materialNumber.displayMatNo,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: ZPColors.darkGray,
                                      ),
                                ),
                                if (orderHistoryItem.isBonusMaterial)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    decoration: const BoxDecoration(
                                      color: ZPColors.darkerGreen,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    child: Text(
                                      'Bonus',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(
                                            color: ZPColors.white,
                                          ),
                                    ).tr(),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text(
                              orderHistoryItem.materialDescription,
                              style: Theme.of(context).textTheme.labelSmall,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    orderHistoryItem.manufactureName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: ZPColors.darkGray,
                                          fontSize: 10,
                                        ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  'Qty: ${orderHistoryItem.qty}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: ZPColors.black,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                if (orderHistoryItem.invoiceNumber.isNotEmpty)
                  _InvoiceNumber(
                    orderHistoryItem: orderHistoryItem,
                  ),
              ],
            ),
          ),
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
