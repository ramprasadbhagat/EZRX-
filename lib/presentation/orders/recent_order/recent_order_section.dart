import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/govt_list_price_component.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/section_tile.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/custom_card.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';

import 'package:ezrxmobile/presentation/core/price_component.dart';

class RecentOrdersSection extends StatelessWidget {
  const RecentOrdersSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ViewByItemsBloc>(
      create: (context) => locator<ViewByItemsBloc>(),
      child: BlocListener<EligibilityBloc, EligibilityState>(
        listenWhen: (previous, current) =>
            previous.isLoading != current.isLoading && !current.isLoading,
        listener: (context, state) {
          context.read<ViewByItemsBloc>().add(
                ViewByItemsEvent.initialized(
                  salesOrgConfigs: state.salesOrgConfigs,
                  customerCodeInfo: state.customerCodeInfo,
                  shipToInfo: state.shipToInfo,
                  user: state.user,
                  salesOrganisation: state.salesOrganisation,
                ),
              );
        },
        child: const _BodyContent(),
      ),
    );
  }
}

class _BodyContent extends StatelessWidget {
  const _BodyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByItemsBloc, ViewByItemsState>(
      buildWhen: (previous, current) =>
          previous.orderHistory.orderHistoryItems !=
              current.orderHistory.orderHistoryItems ||
          previous.isFetching != current.isFetching,
      builder: (context, state) {
        return state.isFetching ||
                state.orderHistory.orderHistoryItems.isNotEmpty
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: SectionTitle(
                      key: WidgetKeys.recentlyOrder,
                      title: 'Recently ordered',
                      onTapIconButton: () => state.isFetching
                          ? null
                          : context.navigateTo(const OrdersTabRoute()),
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    child: state.isFetching
                        ? LoadingShimmer.logo(
                            key: WidgetKeys.recentOrderSectionLoaderImage,
                          )
                        : ListView(
                            scrollDirection: Axis.horizontal,
                            children: state.orderHistory.orderHistoryItems
                                .map((e) => _ProductTile(product: e))
                                .toList(),
                          ),
                  ),
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }
}

class _ProductTile extends StatelessWidget {
  final OrderHistoryItem product;
  const _ProductTile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return InkWell(
      onTap: () => _navigateToOrderDetails(context, product),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: CustomCard(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            key: WidgetKeys.listRecentlyOrdered,
            contentPadding: const EdgeInsets.all(8),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomCard(
                  showBorder: true,
                  showShadow: false,
                  child: ProductImage(
                    materialNumber: product.materialNumber,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${product.materialNumber.displayMatNo} | ${product.ezrxNumber.displayNAIfEmpty}',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: ZPColors.extraLightGrey4),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          product.materialDescription,
                          style: Theme.of(context).textTheme.labelSmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          key: WidgetKeys.materialDescriptionRecentlyOrdered,
                        ),
                      ),
                      Text(
                        product.principalData.principalName
                            .getOrDefaultValue(''),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: ZPColors.extraLightGrey4,
                              fontSize: 10,
                            ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      PriceComponent(
                        price: product.itemUnitPrice(
                          eligibilityState.salesOrg.isID,
                        ),
                        salesOrgConfig: eligibilityState.salesOrgConfigs,
                      ),
                      Flexible(
                        child: GovtListPriceComponent(
                          price: product.itemUnitPrice(
                            eligibilityState.salesOrg.isID,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToOrderDetails(
    BuildContext context,
    OrderHistoryItem orderHistoryItem,
  ) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    context.read<ViewByItemDetailsBloc>().add(
          ViewByItemDetailsEvent.setItemOrderDetails(
            orderHistory: context.read<ViewByItemsBloc>().state.orderHistory,
            orderHistoryItem: orderHistoryItem,
            disableDeliveryDateForZyllemStatus:
                eligibilityState.salesOrgConfigs.disableDeliveryDate,
          ),
        );

    context.router.push(
      const ViewByItemDetailsPageRoute(),
    );
  }
}
