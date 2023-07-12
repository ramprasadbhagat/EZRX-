import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_status_stepper.dart';
import 'package:ezrxmobile/presentation/core/item_address_section.dart';
import 'package:ezrxmobile/presentation/core/status_tracker.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/section/view_by_item_details_header_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/section/view_by_item_details_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/section/view_by_item_details_status_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/section/view_by_other_item_details_section.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewByItemDetailsPage extends StatelessWidget {
  final OrderHistoryItem orderHistoryItem;

  const ViewByItemDetailsPage({
    Key? key,
    required this.orderHistoryItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ViewByItemDetailsBloc, ViewByItemDetailsState>(
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
      child: Scaffold(
        appBar: AppBar(
          title: Text('Item Details'.tr()),
          centerTitle: false,
        ),
        body: AnnouncementBanner(
          currentPath: context.router.currentPath,
          child: ListView(
            children: <Widget>[
              ItemHeaderSection(
                orderHistoryItem: orderHistoryItem,
              ),
              StatusTrackerSection(
                createDate: orderHistoryItem.createdDate,
                title: 'Order status'.tr(),
                status: orderHistoryItem.status,
                onTap: () {
                  _showDEtailsPagePage(context: context);
                },
              ),
              const ItemAddressSection(),
              const Divider(
                indent: 0,
                height: 20,
                endIndent: 0,
                thickness: 2.5,
                color: ZPColors.lightGray2,
              ),
              ItemDetailsSection(
                orderHistoryItem: orderHistoryItem,
              ),
              const OtherItemDetailsSection(),
            ],
          ),
        ),
      ),
    );
  }
}

void _showDEtailsPagePage({
  required BuildContext context,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    enableDrag: false,
    isDismissible: false,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (_) {
      return const OrderStatusSection(
        customStep: [
          CustomStep(
            status: 'Out for deliver',
            subtitle: '10.00am MYR',
            title: '16 Mar',
            icon: Icons.electric_rickshaw,
          ),
          CustomStep(
            status: 'Picking in progress',
            subtitle: '11.00am MYR',
            title: '12 Mar',
            icon: Icons.inventory_2,
            state: CustomStepState.disabled,
          ),
          CustomStep(
            status: 'Pending release',
            subtitle: '12.00am MYR',
            title: '11 Mar',
            icon: Icons.query_builder,
            state: CustomStepState.disabled,
          ),
          CustomStep(
            status: 'Order created',
            subtitle: '15.00am MYR',
            title: '10 Mar',
            icon: Icons.inventory,
            state: CustomStepState.disabled,
          ),
        ],
      );
    },
  ).then(
    (value) {
      if (value == null) return;
    },
  );
}
