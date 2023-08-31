import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/re_order_permission/re_order_permission_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_header.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/item_address_section.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/section/view_by_order_header_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/section/view_by_order_item_details_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/section/view_by_order_summary_section.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewByOrderDetailsPage extends StatefulWidget {
  final OrderHistoryDetailsOrderHeader viewByOrderHistoryItem;

  const ViewByOrderDetailsPage({
    Key? key,
    required this.viewByOrderHistoryItem,
  }) : super(key: key);

  @override
  State<ViewByOrderDetailsPage> createState() => _ViewByOrderDetailsPageState();
}

class _ViewByOrderDetailsPageState extends State<ViewByOrderDetailsPage> {
  @override
  void initState() {
    context.read<ViewByOrderDetailsBloc>().add(
          ViewByOrderDetailsEvent.fetch(
            user: context.read<UserBloc>().state.user,
            orderHeader: widget.viewByOrderHistoryItem,
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'.tr()),
        centerTitle: false,
      ),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: BlocBuilder<ViewByOrderDetailsBloc, ViewByOrderDetailsState>(
          buildWhen: (previous, current) =>
              previous.orderHistoryDetails != current.orderHistoryDetails,
          builder: (context, state) {
            return state.isLoading
                ? LoadingShimmer.logo(
                    key: WidgetKeys.loaderImage,
                  )
                : ListView(
                    key: WidgetKeys.viewByOrderDetailsPageListView,
                    children: <Widget>[
                      OrderHeaderSection(
                        viewByOrdersItem: widget.viewByOrderHistoryItem,
                      ),
                      const ItemAddressSection(),
                      const Divider(
                        indent: 0,
                        height: 20,
                        endIndent: 0,
                        thickness: 2.5,
                        color: ZPColors.lightGray2,
                      ),
                      OrderSummarySection(
                        viewByOrdersItem: widget.viewByOrderHistoryItem,
                      ),
                      const Divider(
                        indent: 0,
                        height: 20,
                        endIndent: 0,
                        thickness: 2.5,
                        color: ZPColors.lightGray2,
                      ),
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
          listener: (context, state) {
            context.router.pushNamed('orders/cart');
          },
          buildWhen: (previous, current) =>
              previous.isUpserting != current.isUpserting,
          builder: (context, stateCart) {
            return BlocListener<ReOrderPermissionBloc, ReOrderPermissionState>(
              listenWhen: (previous, current) =>
                  previous.isFetching != current.isFetching &&
                  !current.isFetching,
              listener: (context, state) {
                state.failureOrSuccessOption.fold(
                  () => context.read<ViewByOrderDetailsBloc>().add(
                        ViewByOrderDetailsEvent.fetchDetailItemList(
                          validOrderHistoryDetailsOrderItems:
                              state.validOrderHistoryDetailsOrderItems,
                          salesOrganisation: context
                              .read<EligibilityBloc>()
                              .state
                              .salesOrganisation,
                          customerCodeInfo: context
                              .read<EligibilityBloc>()
                              .state
                              .customerCodeInfo,
                          shipToInfo:
                              context.read<EligibilityBloc>().state.shipToInfo,
                          locale: context.locale,
                        ),
                      ),
                  (option) => option.fold(
                    (failure) => ErrorUtils.handleApiFailure(context, failure),
                    (_) {},
                  ),
                );
              },
              child:
                  BlocConsumer<ViewByOrderDetailsBloc, ViewByOrderDetailsState>(
                listenWhen: (previous, current) =>
                    previous.isFetchingList != current.isFetchingList &&
                    !current.isFetchingList,
                listener: (context, state) {
                  context.read<CartBloc>().add(
                        CartEvent.addHistoryItemsToCart(
                          priceAggregate: state.productDetailAggregateList
                              .map(
                                (e) => PriceAggregate.empty().copyWith(
                                  materialInfo: e.materialInfo,
                                  price: context
                                              .read<MaterialPriceBloc>()
                                              .state
                                              .materialPrice[
                                          e.materialInfo.materialNumber] ??
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
                                          productNumber:
                                              e.materialInfo.materialNumber,
                                        ) +
                                    context
                                        .read<ViewByOrderDetailsBloc>()
                                        .state
                                        .orderHistoryDetails
                                        .getOrderHistoryDetailsOrderItem(
                                          materialNumber:
                                              e.materialInfo.materialNumber,
                                        )
                                        .qty,
                              )
                              .toList(),
                          user: context.read<UserBloc>().state.user,
                          counterOfferDetails:
                              RequestCounterOfferDetails.empty(),
                        ),
                      );
                },
                buildWhen: (previous, current) =>
                    previous.isLoading != current.isLoading ||
                    previous.isFetchingList != current.isFetchingList,
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: state.isLoading ||
                            state.isFetchingList ||
                            stateCart.isUpserting
                        ? null
                        : () {
                            context.read<ReOrderPermissionBloc>().add(
                                  ReOrderPermissionEvent.fetch(
                                    orderHistoryDetailsOrderItems: state
                                        .orderHistoryDetails
                                        .orderHistoryDetailsOrderItem
                                        .toList(),
                                    salesOrganisation: context
                                        .read<SalesOrgBloc>()
                                        .state
                                        .salesOrganisation,
                                    shipToInfo: context
                                        .read<CustomerCodeBloc>()
                                        .state
                                        .shipToInfo,
                                    customerCodeInfo: context
                                        .read<CustomerCodeBloc>()
                                        .state
                                        .customerCodeInfo,
                                  ),
                                );
                          },
                    style:
                        Theme.of(context).elevatedButtonTheme.style!.copyWith(
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
                            'Buy again'.tr(),
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
              ),
            );
          },
        ),
      ),
    );
  }
}
