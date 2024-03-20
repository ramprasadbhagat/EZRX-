import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/icon_label.dart';
import 'package:ezrxmobile/presentation/core/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/section_tile.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/custom_card.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';

class RecentOrdersSection extends StatelessWidget {
  const RecentOrdersSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return BlocProvider<ViewByItemsBloc>(
      create: (context) => locator<ViewByItemsBloc>()
        ..add(
          ViewByItemsEvent.initialized(
            salesOrgConfigs: eligibilityState.salesOrgConfigs,
            customerCodeInfo: eligibilityState.customerCodeInfo,
            shipToInfo: eligibilityState.shipToInfo,
            user: eligibilityState.user,
            salesOrganisation: eligibilityState.salesOrganisation,
          ),
        ),
      child: BlocListener<EligibilityBloc, EligibilityState>(
        listenWhen: (previous, current) => current.isRefreshed(previous),
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
                    height: 140,
                    child: state.isFetching
                        ? LoadingShimmer.logo(
                            key: WidgetKeys.recentOrderSectionLoaderImage,
                          )
                        : ListView(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.zero,
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
        child: Stack(
          children: [
            CustomCard(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                key: WidgetKeys.listRecentlyOrdered,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomCard(
                      showBorder: true,
                      showShadow: false,
                      child: ProductImage(
                        materialNumber: product.materialNumber,
                        fit: BoxFit.fitHeight,
                        width: 90,
                        height: 90,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              if (product.isMarketPlace)
                                Padding(
                                  padding: const EdgeInsets.only(right: 5.0),
                                  child: MarketPlaceLogo.small(),
                                ),
                              Text(
                                product.materialNumber.displayMatNo,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: ZPColors.extraLightGrey4,
                                    ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                            child: Text(
                              product.materialDescription,
                              style: Theme.of(context).textTheme.labelSmall,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              key:
                                  WidgetKeys.materialDescriptionRecentlyOrdered,
                            ),
                          ),
                          Text(
                            '${product.isMarketPlace ? '${context.tr('Sold by')}: ' : ''}${product.principalData.principalName.name}',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: ZPColors.extraLightGrey4,
                                      fontSize: 10,
                                    ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          PriceComponent(
                            price: product.itemUnitPrice(
                              eligibilityState.salesOrg.isID,
                            ),
                            salesOrgConfig: eligibilityState.salesOrgConfigs,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (product.isOfferItem)
              const IconLabel(
                key: WidgetKeys.iconLabelOffer,
                icon: Icons.local_offer_outlined,
                backgroundColor: ZPColors.darkYellow,
                iconSize: 23,
                labelText: '',
                margin: EdgeInsets.only(left: 10, top: 10),
              ),
          ],
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
