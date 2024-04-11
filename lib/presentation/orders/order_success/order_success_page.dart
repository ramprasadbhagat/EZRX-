import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_filter.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_filter.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_group.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/common_tile_item.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_seller_title.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_title_with_logo.dart';
import 'package:ezrxmobile/presentation/core/payer_information.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/queue_number_info_icon.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/widget/item_tax.dart';
import 'package:ezrxmobile/presentation/orders/order_success/widgets/order_success_attachment_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/widgets/order_item_price.dart';
import 'package:ezrxmobile/presentation/orders/widgets/price_not_available_message.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/orders/widgets/order_bundle_item.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'package:ezrxmobile/presentation/orders/order_success/widgets/order_items.dart';
part 'package:ezrxmobile/presentation/orders/order_success/widgets/bundle_items.dart';
part 'package:ezrxmobile/presentation/orders/order_success/widgets/order_summary.dart';
part 'package:ezrxmobile/presentation/orders/order_success/widgets/order_detail_header.dart';
part 'package:ezrxmobile/presentation/orders/order_success/widgets/order_success_message.dart';

class OrderSuccessPage extends StatelessWidget {
  const OrderSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.orderSuccess,
      appBar: AppBar(
        leadingWidth: 40,
        leading: IconButton(
          padding: const EdgeInsets.only(left: 18),
          key: WidgetKeys.closeButton,
          onPressed: () {
            context.router.popUntilRouteWithPath('main');
          },
          icon: const Icon(Icons.close),
        ),
        title: Text('${'Order submitted'.tr()}!'),
        centerTitle: false,
      ),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: BlocListener<OrderSummaryBloc, OrderSummaryState>(
          listenWhen: (previous, current) =>
              previous.isConfirming != current.isConfirming,
          listener: (context, state) {
            if (!state.isConfirming) {
              context.read<ViewByOrderBloc>().add(
                    ViewByOrderEvent.fetch(
                      filter: ViewByOrdersFilter.empty(),
                      searchKey: SearchKey.searchFilter(''),
                      isDetailsPage: false,
                    ),
                  );
              context.read<ViewByItemsBloc>().add(
                    ViewByItemsEvent.fetch(
                      viewByItemFilter: ViewByItemFilter.empty(),
                      searchKey: SearchKey.searchFilter(''),
                    ),
                  );
              context.read<ViewByItemDetailsBloc>().add(
                    ViewByItemDetailsEvent.searchOrderHistory(
                      searchKey: SearchKey(
                        state.orderHistoryDetails.orderNumber.getValue(),
                      ),
                    ),
                  );
              CustomSnackBar(
                messageText: context.tr('Order submitted'),
              ).show(context);
              context.read<CartBloc>().add(const CartEvent.clearCart());
            }
          },
          child: const _BodyContent(),
        ),
      ),
    );
  }
}

class _BodyContent extends StatelessWidget {
  const _BodyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderSummaryBloc, OrderSummaryState>(
      buildWhen: (previous, current) =>
          previous.isConfirming != current.isConfirming,
      builder: (context, state) {
        final allItems = state.orderHistoryDetailsList.allItems;
        final zpItems = allItems.zpItemOnly;
        final mpItems = allItems.mpItemOnly;

        return state.isConfirming
            ? LoadingShimmer.logo(
                key: WidgetKeys.loaderImage,
              )
            : ListView(
                key: WidgetKeys.scrollList,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                children: [
                  _OrderSuccessMessage(
                    orderStatus: state.orderHistoryDetails.processingStatus,
                  ),
                  if (state.orderHistoryDetailsList.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20.0,
                        ),
                        _OrderDetailHeader(
                          orderHeader: state.orderHistoryDetails,
                          orderHistoryList: state.orderHistoryDetailsList,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 16,
                          ),
                          child: AddressInfoSection.order(),
                        ),
                        const Divider(
                          indent: 0,
                          endIndent: 0,
                          thickness: 0.2,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: PayerInformation(expanded: false),
                        ),
                        const Divider(
                          indent: 0,
                          endIndent: 0,
                          thickness: 0.2,
                        ),
                        _OrderSummary(
                          orderHistoryDetailList: state.orderHistoryDetailsList,
                        ),
                        const Divider(
                          indent: 0,
                          endIndent: 0,
                          thickness: 0.2,
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 20.0,
                          ),
                          child: Text(
                            '${context.tr('Your items')}(${allItems.length})',
                            key: WidgetKeys.orderSuccessItemTotalQty,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: ZPColors.black,
                                ),
                          ),
                        ),
                        _BundleItemSection(
                          bundleItems: zpItems.bundleItemDetailsList,
                        ),
                        _MaterialItemSection(
                          orderItems: zpItems.materialItemDetailsList,
                        ),
                        if (zpItems.isNotEmpty && mpItems.isNotEmpty) ...[
                          const SizedBox(height: 12),
                          const Divider(
                            height: 24,
                            thickness: 0.4,
                          ),
                        ],
                        if (mpItems.isNotEmpty) ...[
                          const SizedBox(height: 12),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: MarketPlaceTitleWithLogo(),
                          ),
                          _BundleItemSection(
                            bundleItems: mpItems.bundleItemDetailsList,
                          ),
                          _MaterialItemSection(
                            orderItems: mpItems.materialItemDetailsList,
                            isMarketPlace: true,
                          ),
                        ],
                      ],
                    ),
                ],
              );
      },
    );
  }
}
