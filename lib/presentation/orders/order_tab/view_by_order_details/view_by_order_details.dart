import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/section/view_by_order_header_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/section/view_by_order_item_details_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/section/view_by_order_summary_section.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewByOrderDetailsPage extends StatelessWidget {
  const ViewByOrderDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr('Order Details')),
        centerTitle: false,
      ),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: BlocBuilder<ViewByOrderDetailsBloc, ViewByOrderDetailsState>(
          buildWhen: (previous, current) =>
              previous.isLoading != current.isLoading,
          builder: (context, state) {
            return state.isLoading
                ? LoadingShimmer.logo(
                    key: WidgetKeys.loaderImage,
                  )
                : ListView(
                    key: WidgetKeys.viewByOrderDetailsPageListView,
                    children: <Widget>[
                      const OrderHeaderSection(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 16.0,
                        ),
                        child: AddressInfoSection.order(),
                      ),
                      const Divider(
                        indent: 0,
                        height: 20,
                        endIndent: 0,
                        thickness: 2.5,
                        color: ZPColors.lightGray2,
                      ),
                      const OrderSummarySection(),
                      const Divider(
                        indent: 0,
                        height: 20,
                        endIndent: 0,
                        thickness: 2.5,
                        color: ZPColors.lightGray2,
                      ),
                      if (!state.isOrderHistoryDetailsEmpty)
                        OrderItemDetailsSection(
                          viewByOrderHistoryGroupList: state
                              .orderHistoryDetails
                              .orderHistoryDetailsOrderItem
                              .getViewByOrderItemDetailsList,
                        ),
                    ],
                  );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<CartBloc, CartState>(
          listenWhen: (previous, current) =>
              previous.isUpserting != current.isUpserting &&
              !current.isUpserting,
          listener: (context, state) => state.apiFailureOrSuccessOption.fold(
            () => context.router.pushNamed('orders/cart'),
            (_) => {},
          ),
          buildWhen: (previous, current) =>
              previous.isUpserting != current.isUpserting,
          builder: (context, stateCart) {
            return BlocConsumer<ViewByOrderDetailsBloc,
                ViewByOrderDetailsState>(
              listenWhen: (previous, current) =>
                  previous.isFetchingList != current.isFetchingList &&
                  !current.isFetchingList,
              listener: (context, state) {},
              buildWhen: (previous, current) =>
                  previous.isLoading != current.isLoading ||
                  previous.isFetchingList != current.isFetchingList,
              builder: (context, state) {
                return state.isOrderHistoryDetailsEmpty
                    ? const SizedBox.shrink()
                    : ElevatedButton(
                        key: WidgetKeys.viewByOrderDetailBuyAgain,
                        onPressed: () => context.read<CartBloc>().add(
                              CartEvent.addHistoryItemsToCart(
                                priceAggregate: state.productDetailAggregateList
                                    .map(
                                      (e) => PriceAggregate.empty().copyWith(
                                        materialInfo: e.materialInfo,
                                        price: context
                                                    .read<MaterialPriceBloc>()
                                                    .state
                                                    .materialPrice[
                                                e.materialInfo
                                                    .materialNumber] ??
                                            Price.empty(),
                                        salesOrgConfig: context
                                            .read<SalesOrgBloc>()
                                            .state
                                            .configs,
                                      ),
                                    )
                                    .toList(),
                                quantity: state.productDetailAggregateList
                                    .map(
                                      (e) =>
                                          context
                                              .read<CartBloc>()
                                              .state
                                              .getQuantityOfProduct(
                                                productNumber: e.materialInfo
                                                    .materialNumber,
                                              ) +
                                          context
                                              .read<ViewByOrderDetailsBloc>()
                                              .state
                                              .orderHistoryDetails
                                              .getOrderHistoryDetailsOrderItem(
                                                materialNumber: e.materialInfo
                                                    .materialNumber,
                                              )
                                              .qty,
                                    )
                                    .toList(),
                                user: context.read<UserBloc>().state.user,
                                counterOfferDetails:
                                    RequestCounterOfferDetails.empty(),
                              ),
                            ),
                        style: Theme.of(context)
                            .elevatedButtonTheme
                            .style!
                            .copyWith(
                              backgroundColor: const MaterialStatePropertyAll(
                                ZPColors.white,
                              ),
                              shape: const MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  side: BorderSide(color: ZPColors.primary),
                                ),
                              ),
                            ),
                        child: Wrap(
                          children: [
                            LoadingShimmer.withChild(
                              enabled: state.isLoading ||
                                  state.isFetchingList ||
                                  stateCart.isUpserting,
                              child: Text(
                                context.tr('Buy again'),
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                      color: ZPColors.primary,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      );
              },
            );
          },
        ),
      ),
    );
  }
}
