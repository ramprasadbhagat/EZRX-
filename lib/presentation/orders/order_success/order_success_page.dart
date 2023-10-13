import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/common_tile_item.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_group.dart';
import 'package:ezrxmobile/presentation/orders/widgets/order_bundle_item.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/presentation/orders/order_success/widgets/order_success_attachment_section.dart';

part 'package:ezrxmobile/presentation/orders/order_success/widgets/order_items.dart';
part 'package:ezrxmobile/presentation/orders/order_success/widgets/bundle_items.dart';
part 'package:ezrxmobile/presentation/orders/order_success/widgets/order_summary.dart';
part 'package:ezrxmobile/presentation/orders/order_success/widgets/payer_information.dart';
part 'package:ezrxmobile/presentation/orders/order_success/widgets/order_detail_header.dart';
part 'package:ezrxmobile/presentation/orders/order_success/widgets/order_success_message.dart';

class OrderSuccessPage extends StatelessWidget {
  const OrderSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.orderSuccess,
      appBar: AppBar(
        leading: IconButton(
          key: WidgetKeys.closeButton,
          onPressed: () {
            context.router.popUntilRouteWithPath('main');
          },
          icon: const Icon(Icons.close),
        ),
        title: Text('Order submitted!'.tr()),
      ),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: BlocListener<OrderSummaryBloc, OrderSummaryState>(
          listenWhen: (previous, current) =>
              previous.isConfirming != current.isConfirming,
          listener: (context, state) {
            if (!state.isConfirming) {
              CustomSnackBar(
                messageText: 'Order submitted'.tr(),
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
        return state.isConfirming
            ? LoadingShimmer.logo(
                key: WidgetKeys.loaderImage,
              )
            : ListView(
                key: WidgetKeys.scrollList,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                children: [
                  const _OrderSuccessMessage(),
                  if (!state.isOrderHistoryDetailsEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20.0,
                        ),
                        _OrderDetailHeader(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 16,
                          ),
                          child: AddressInfoSection.order(),
                        ),
                        const Divider(
                          indent: 0,
                          endIndent: 0,
                          thickness: 0.2,
                        ),
                        const _PayerInformation(),
                        const Divider(
                          indent: 0,
                          endIndent: 0,
                          thickness: 0.2,
                        ),
                        _OrderSummary(
                          orderHistoryDetails: state.orderHistoryDetails,
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
                            '${context.tr('Your items')}(${context.read<OrderSummaryBloc>().state.orderHistoryDetails.orderHistoryDetailsOrderItem.length})',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: ZPColors.black,
                                ),
                          ),
                        ),
                        _BundleItemSection(
                          bundleItems: state
                              .orderHistoryDetails
                              .orderHistoryDetailsOrderItem
                              .bundleItemDetailsList,
                        ),
                        _OrderItems(
                          orderItems: state
                              .orderHistoryDetails
                              .orderHistoryDetailsOrderItem
                              .materialItemDetailsList,
                        ),
                      ],
                    ),
                ],
              );
      },
    );
  }
}
