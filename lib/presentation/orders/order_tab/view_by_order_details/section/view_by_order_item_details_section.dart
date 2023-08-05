import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/presentation/core/common_tile_item.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

class OrderItemDetailsSection extends StatelessWidget {
  const OrderItemDetailsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayGovernmentMaterialCOde =
        context.read<SalesOrgBloc>().state.salesOrganisation.salesOrg.isTW;

    return BlocBuilder<ViewByOrderDetailsBloc, ViewByOrderDetailsState>(
      buildWhen: (previous, current) =>
          previous.orderHistoryDetails != current.orderHistoryDetails,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: state.isLoading
              ? LoadingShimmer.logo(
                  key: WidgetKeys.loaderImage,
                )
              : Column(
                  children: state
                      .orderHistoryDetails
                      .orderHistoryDetailsOrderItem
                      .getViewByOrderItemDetailsList
                      .map(
                        (e) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              e.principalName.name,
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: e.viewByOrderItem
                                  .map(
                                    (e) => CommonTileItem(
                                      label:
                                          '${e.materialNumber.displayMatNo}${displayGovernmentMaterialCOde ? '|${e.governmentMaterialCode}' : ''}',
                                      title: e.materialDescription,
                                      priceComponent: PriceComponent(
                                        price: e.totalPrice
                                            .totalPrice //TODO: It is list price offer price should also have annotation of "Discount applied" if it was an offer material , once design team confirm and getting data will enhance
                                            .toStringAsFixed(2),
                                        salesOrgConfig: context
                                            .read<SalesOrgBloc>()
                                            .state
                                            .configs,
                                        currencyCodeTextStyle: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                              color: ZPColors.darkGray,
                                            ),
                                      ),
                                      statusWidget: StatusLabel(
                                        status: StatusType(
                                          e.sAPStatus.getOrDefaultValue(''),
                                        ),
                                      ),
                                      quantity: '',
                                      materialNumber: e.materialNumber,
                                      isQuantityBelowImage: true,
                                      isQuantityRequired: false,
                                      headerText:
                                          'Batch ${e.batch}\n(EXP: ${e.expiryDate.dateString})',
                                      subtitle: '',
                                      footerWidget: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Qty: ${e.qty}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color: ZPColors.black,
                                                ),
                                          ),
                                          PriceComponent(
                                            salesOrgConfig: context
                                                .read<SalesOrgBloc>()
                                                .state
                                                .configs,
                                            price: e.totalPrice
                                                .totalPrice //TODO: It should be item subtotal, once design team confirm and getting data will enhance
                                                .toStringAsFixed(2),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
        );
      },
    );
  }
}
