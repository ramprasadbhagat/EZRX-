import 'package:ezrxmobile/application/order/re_order_permission/re_order_permission_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/status_tracker.dart';
import 'package:ezrxmobile/presentation/home/widgets/customer_blocked_banner.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/widgets/order_status_section.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/widgets/order_bundle_item.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_order/view_by_order_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/section/view_by_order_header_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/section/view_by_order_summary_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/section/view_by_order_item_details_section.dart';

part 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/section/view_by_order_bundle_item_details_section.dart';
part 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/section/view_by_order_status_tracker.dart';

class ViewByOrderDetailsPage extends StatelessWidget {
  const ViewByOrderDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return BlocBuilder<ViewByOrderDetailsBloc, ViewByOrderDetailsState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.tr('Order Details')),
            centerTitle: false,
          ),
          body: AnnouncementBanner(
            currentPath: context.router.currentPath,
            child: state.isLoading
                ? LoadingShimmer.logo(
                    key: WidgetKeys.loaderImage,
                  )
                : ListView(
                    key: WidgetKeys.viewByOrderDetailsPageListView,
                    children: <Widget>[
                      const CustomerBlockedBanner(),
                      const OrderHeaderSection(),
                      if (eligibilityState.salesOrg.isID)
                        _ViewByOrderStatusTracker(
                          orderHistoryDetails: state.orderHistoryDetails,
                        ),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10,
                        ),
                        child: Text(
                          '${context.tr('Order items')} (${state.orderHistoryDetails.orderHistoryDetailsOrderItem.length})',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(color: ZPColors.neutralsBlack),
                        ),
                      ),
                      if (state.orderHistoryDetails.orderHistoryDetailsOrderItem
                          .bundleItemDetailsList.isNotEmpty)
                        const _BundleItemDetailsSection(),
                      if (state.orderHistoryDetails.orderHistoryDetailsOrderItem
                          .materialItemDetailsList.isNotEmpty)
                        OrderItemDetailsSection(
                          viewByOrderHistoryGroupList: state
                              .orderHistoryDetails
                              .orderHistoryDetailsOrderItem
                              .materialItemDetailsList,
                        ),
                    ],
                  ),
          ),
          bottomNavigationBar: eligibilityState.user.disableCreateOrder ||
                  state.isLoading
              ? null
              : BlocProvider(
                  create: (context) => locator<ReOrderPermissionBloc>()
                    ..add(
                      ReOrderPermissionEvent.initialized(
                        customerCodeInfo: eligibilityState.customerCodeInfo,
                        shipToInfo: eligibilityState.shipToInfo,
                        salesOrganisation: eligibilityState.salesOrganisation,
                        salesOrganisationConfigs:
                            eligibilityState.salesOrgConfigs,
                      ),
                    ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: BuyAgainButton(
                      viewByOrderHistoryItem: state.orderHistoryDetails,
                      key: WidgetKeys.viewByOrderBuyAgainButtonKey,
                    ),
                  ),
                ),
        );
      },
    );
  }
}
