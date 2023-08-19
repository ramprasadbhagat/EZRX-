import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_header.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/item_address_section.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/section/view_by_order_item_details_section.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/section/view_by_order_header_section.dart';

import 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/section/view_by_order_summary_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewByOrderDetailsPage extends StatelessWidget {
  final OrderHistoryDetailsOrderHeader viewByOrdersItem;

  const ViewByOrderDetailsPage({
    Key? key,
    required this.viewByOrdersItem,
  }) : super(key: key);

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
                        viewByOrdersItem: viewByOrdersItem,
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
                        viewByOrdersItem: viewByOrdersItem,
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
    );
  }
}
