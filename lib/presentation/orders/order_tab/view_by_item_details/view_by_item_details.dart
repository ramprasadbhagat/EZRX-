import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/delivery_info_data.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/presentation/core/license_expired_banner.dart';
import 'package:ezrxmobile/infrastructure/core/common/clevertap_helper.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_seller_with_logo.dart';
import 'package:ezrxmobile/presentation/orders/widgets/edi_user_banner.dart';
import 'package:ezrxmobile/presentation/payments/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/application/order/re_order_permission/re_order_permission_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/all_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_basic_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_step.dart';
import 'package:ezrxmobile/domain/order/entities/order_status_tracker.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/common_tile_item.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;
import 'package:ezrxmobile/presentation/core/queue_number_info_icon.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/payer_information.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/status_tracker.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/widgets/order_item_price.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/widgets/order_status_section.dart';
import 'package:ezrxmobile/presentation/core/quantity_and_price_with_tax.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

part 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/section/view_by_item_status_tracker.dart';
part 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/section/buy_again_button.dart';
part 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/section/item_details_section.dart';
part 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/section/view_by_item_attachment_section.dart';
part 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/section/view_by_item_details_header_section.dart';
part 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/section/view_by_other_item_details_section.dart';
part 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/section/view_by_item_order_item_tile.dart';
part 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/section/invoice_number_section.dart';
part 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/section/order_number_section.dart';

class ViewByItemDetailsPage extends StatelessWidget {
  const ViewByItemDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return BlocProvider<ReOrderPermissionBloc>(
      create: (context) => locator<ReOrderPermissionBloc>()
        ..add(
          ReOrderPermissionEvent.initialized(
            customerCodeInfo: eligibilityState.customerCodeInfo,
            shipToInfo: eligibilityState.shipToInfo,
            salesOrganisation: eligibilityState.salesOrganisation,
            salesOrganisationConfigs: eligibilityState.salesOrgConfigs,
          ),
        ),
      child: Scaffold(
        appBar: CustomAppBar.commonAppBar(
          title: Text(context.tr('Item Details')),
          customerBlockedOrSuspended: eligibilityState.customerBlockOrSuspended,
        ),
        bottomNavigationBar:
            context.read<ViewByItemDetailsBloc>().state.displayBuyAgainButton
                ? const _BuyAgainButton()
                : null,
        body: BlocConsumer<ViewByItemDetailsBloc, ViewByItemDetailsState>(
          listenWhen: (previous, current) =>
              previous.failureOrSuccessOption !=
                  current.failureOrSuccessOption ||
              previous.isDetailsLoading != current.isDetailsLoading,
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
              previous.isLoading != current.isLoading ||
              previous.isDetailsLoading != current.isDetailsLoading ||
              previous.orderHistoryItem != current.orderHistoryItem ||
              previous.orderHistoryStatuses != current.orderHistoryStatuses,
          builder: (context, state) {
            return state.isLoading
                ? LoadingShimmer.logo(
                    key: WidgetKeys.loaderImage,
                  )
                : AnnouncementBanner(
                    currentPath: context.router.currentPath,
                    child: ListView(
                      key: WidgetKeys.scrollList,
                      children: <Widget>[
                        const LicenseExpiredBanner(),
                        const EdiUserBanner(),
                        ViewByItemDetailsHeaderSection(
                          orderHistoryItem: state.orderHistoryItem,
                          orderHistoryBasicInfo:
                              state.orderHistory.orderBasicInformation,
                        ),
                        _ViewByItemStatusTracker(
                          orderHistoryItem: state.orderHistoryItem,
                          subSteps: state.orderHistoryStatuses,
                        ),
                        const Divider(
                          indent: 0,
                          height: 32,
                          endIndent: 0,
                          color: ZPColors.lightGrey,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 16.0,
                          ),
                          child: AddressInfoSection.order(),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: PayerInformation(
                            expanded: false,
                          ),
                        ),
                        const Divider(
                          indent: 0,
                          height: 20,
                          endIndent: 0,
                          color: ZPColors.lightGrey,
                        ),
                        ItemDetailsSection(
                          orderHistoryItem: state.orderHistoryItem,
                        ),
                        OtherItemDetailsSection(
                          otherItems: state.otherItems,
                          isMarketPlace: state.orderHistoryItem.isMarketPlace,
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
