import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_filter/view_by_item_filter_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_basic_info.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_filter.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_group.dart';
import 'package:ezrxmobile/presentation/core/common_tile_item.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewByItemsPage extends StatelessWidget {
  const ViewByItemsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByItemsBloc, ViewByItemsState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching,
      builder: (context, state) {
        if (state.isFetching &&
            state.orderHistoryList.orderHistoryItems.isEmpty) {
          return LoadingShimmer.logo(
            key: WidgetKeys.loaderImage,
          );
        }

        return ScrollList<ViewByItemGroup>(
          controller: ScrollController(),
          noRecordFoundWidget: NoRecordFound(
            title: 'No past orders to show',
            subTitle: 'Items ordered on eZRx+ will be shown here',
            svgImage: SvgImage.emptyOrder,
            actionButton: ElevatedButton(
              key: WidgetKeys.startBrowsingViewByItem,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(
                  double.maxFinite,
                  50,
                ),
              ),
              onPressed: () => context.navigateTo(const ProductsTabRoute()),
              child: const Text('Start browsing').tr(),
            ),
          ),
          onRefresh: () {
            context
                .read<ViewByItemFilterBloc>()
                .add(const ViewByItemFilterEvent.initializeOrReset());
            context.read<ViewByItemsBloc>().add(
                  ViewByItemsEvent.fetch(
                    customerCodeInfo:
                        context.read<CustomerCodeBloc>().state.customerCodeInfo,
                    salesOrgConfigs: context.read<SalesOrgBloc>().state.configs,
                    shipToInfo:
                        context.read<CustomerCodeBloc>().state.shipToInfo,
                    user: context.read<UserBloc>().state.user,
                    viewByItemFilter: ViewByItemFilter.empty(),
                    searchKey: SearchKey(''),
                  ),
                );
          },
          isLoading: state.isFetching,
          onLoadingMore: () => context.read<ViewByItemsBloc>().add(
                ViewByItemsEvent.loadMore(
                  customerCodeInfo:
                      context.read<CustomerCodeBloc>().state.customerCodeInfo,
                  salesOrgConfigs: context.read<SalesOrgBloc>().state.configs,
                  shipToInfo: context.read<CustomerCodeBloc>().state.shipToInfo,
                  user: context.read<UserBloc>().state.user,
                ),
              ),
          itemBuilder: (context, index, item) => _ViewByOrderItemGroup(
            orderHistoryItem: item,
            showDivider: index != 0,
          ),
          items:
              state.orderHistoryList.orderHistoryItems.getViewByOrderItemList,
        );
      },
    );
  }
}

class _ViewByOrderItemGroup extends StatelessWidget {
  final ViewByItemGroup orderHistoryItem;
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
                  'Ordered on ${orderHistoryItem.createdDate.dateString}',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: ZPColors.darkerGrey,
                      ),
                ),
              ),
              Column(
                children: orderHistoryItem.orderHistoryItem.map((e) {
                  return _ViewByOrderItem(
                    orderHistoryItem: e,
                    customerCodeInfo:
                        context.read<CustomerCodeBloc>().state.customerCodeInfo,
                    orderHistoryBasicInfo: context
                        .read<ViewByItemsBloc>()
                        .state
                        .orderHistoryList
                        .orderBasicInformation,
                  );
                }).toList(),
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
  final CustomerCodeInfo customerCodeInfo;
  final OrderHistoryBasicInfo orderHistoryBasicInfo;

  const _ViewByOrderItem({
    Key? key,
    required this.orderHistoryItem,
    required this.customerCodeInfo,
    required this.orderHistoryBasicInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ViewByItemDetailsBloc>().add(
              ViewByItemDetailsEvent.fetch(
                orderNumber: orderHistoryItem.orderNumber,
                salesOrganisation:
                    context.read<EligibilityBloc>().state.salesOrganisation,
                user: context.read<UserBloc>().state.user,
                materialNumber: orderHistoryItem.materialNumber,
                soldTo: customerCodeInfo,
                disableDeliveryDateForZyllemStatus: context
                    .read<EligibilityBloc>()
                    .state
                    .salesOrgConfigs
                    .disableDeliveryDate,
              ),
            );

        context.router.push(
          const ViewByItemDetailsPageRoute(),
        );
      },
      child: Column(
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
                orderHistoryItem.status.displayOrderStatus,
              ),
            ),
            quantity: orderHistoryItem.qty.toString(),
            footerWidget: orderHistoryItem.invoiceNumber.isNotEmpty
                ? _InvoiceNumber(
                    orderHistoryItem: orderHistoryItem,
                  )
                : null,
            materialNumber: orderHistoryItem.materialNumber,
            isQuantityBelowImage: false,
            isQuantityRequired: true,
            statusTag: orderHistoryItem.productTag,
          ),
        ],
      ),
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
