import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_header.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_group.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_history_filter.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewByOrdersPage extends StatelessWidget {
  const ViewByOrdersPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ViewByOrderBloc, ViewByOrderState>(
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
        if (state.isFetching && state.viewByOrderList.orderHeaders.isEmpty) {
          return LoadingShimmer.logo(
            key: WidgetKeys.loaderImage,
          );
        }

        return ScrollList<ViewByOrderHistoryGroup>(
          controller: ScrollController(),
          noRecordFoundWidget: const NoRecordFound(title: 'No orders found'),
          onRefresh: () {
            context.read<ViewByOrderBloc>().add(
                  ViewByOrderEvent.fetch(
                    customerCodeInfo:
                        context.read<CustomerCodeBloc>().state.customerCodeInfo,
                    salesOrgConfigs: context.read<SalesOrgBloc>().state.configs,
                    shipToInfo:
                        context.read<CustomerCodeBloc>().state.shipToInfo,
                    user: context.read<UserBloc>().state.user,
                    sortDirection: 'desc',
                    filter: ViewByOrderHistoryFilter.empty(),
                  ),
                );
          },
          isLoading: state.isFetching,
          onLoadingMore: () => context.read<ViewByOrderBloc>().add(
                ViewByOrderEvent.loadMore(
                  customerCodeInfo:
                      context.read<CustomerCodeBloc>().state.customerCodeInfo,
                  salesOrgConfigs: context.read<SalesOrgBloc>().state.configs,
                  shipToInfo: context.read<CustomerCodeBloc>().state.shipToInfo,
                  user: context.read<UserBloc>().state.user,
                  sortDirection: 'desc',
                ),
              ),
          itemBuilder: (context, index, item) => _ViewByOrderGroup(
            viewByOrderHistoryItem: item,
            showDivider: index != 0,
          ),
          items: state.viewByOrderList.orderHeaders.getViewByOrderGroupList,
        );
      },
    );
  }
}

class _ViewByOrderGroup extends StatelessWidget {
  final ViewByOrderHistoryGroup viewByOrderHistoryItem;
  final bool showDivider;
  const _ViewByOrderGroup({
    Key? key,
    required this.viewByOrderHistoryItem,
    required this.showDivider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                    'Ordered on ${viewByOrderHistoryItem.createdDate.toValidDateString}',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: ZPColors.darkerGrey,
                        ),
                  ),
                ),
                Column(
                  children: viewByOrderHistoryItem.orderHeaders
                      .map(
                        (e) => _ViewByOrder(
                          viewByOrderHistoryItem: e,
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ViewByOrder extends StatelessWidget {
  final OrderHistoryDetailsOrderHeader viewByOrderHistoryItem;
  const _ViewByOrder({Key? key, required this.viewByOrderHistoryItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final salesOrgConfigs =
        context.read<EligibilityBloc>().state.salesOrgConfigs;

    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomCard(
          child: ListTile(
            onTap: () {},
            contentPadding: const EdgeInsets.all(10),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order #${viewByOrderHistoryItem.orderNumber.getOrDefaultValue('')}',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${viewByOrderHistoryItem.materialCount} materials',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      PriceComponent(
                        salesOrgConfig: salesOrgConfigs,
                        price: viewByOrderHistoryItem.orderValue.toString(),
                        currencyCodeTextStyle:
                            Theme.of(context).textTheme.titleSmall,
                        title: 'Order total : ',
                      ),
                    ],
                  ),
                ),
                const _BuyAgainButton(),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class _BuyAgainButton extends StatelessWidget {
  const _BuyAgainButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.maxFinite, 45),
      ),
      onPressed: () {},
      child: Text(
        'Buy again'.tr(),
      ),
    );
  }
}
