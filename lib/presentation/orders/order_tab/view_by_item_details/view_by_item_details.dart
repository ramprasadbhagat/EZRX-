import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/re_order_permission/re_order_permission_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_step.dart';
import 'package:ezrxmobile/domain/order/entities/order_status_tracker.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/section/view_by_item_details_header_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/section/item_details_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/section/view_by_other_item_details_section.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/presentation/core/status_tracker.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/widgets/order_status_section.dart';

part 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/section/view_by_item_status_tracker.dart';
part 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/section/buy_again_button.dart';

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
          customerBlocked:
              context.read<EligibilityBloc>().state.shipToInfo.customerBlock,
        ),
        bottomNavigationBar:
            context.read<EligibilityBloc>().state.user.role.type.isSalesRepRole
                ? null
                : const _BuyAgainButton(),
        body: BlocConsumer<ViewByItemDetailsBloc, ViewByItemDetailsState>(
          listener: (context, state) {
            state.failureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  ErrorUtils.handleApiFailure(context, failure);
                },
                (success) {},
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
                      key: WidgetKeys.viewByItemsOrderDetailPage,
                      children: <Widget>[
                        ViewByItemDetailsHeaderSection(
                          orderHistoryItem: state.orderHistoryItem,
                          orderHistoryBasicInfo:
                              state.orderHistory.orderBasicInformation,
                        ),
                        _ViewByItemStatusTracker(
                          orderHistoryItem: state.orderHistoryItem,
                          subSteps: state.orderHistoryStatuses,
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
                        ItemDetailsSection(
                          orderHistoryItem: state.orderHistoryItem,
                        ),
                        const OtherItemDetailsSection(),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
