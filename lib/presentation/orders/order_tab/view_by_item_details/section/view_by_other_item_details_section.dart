import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/presentation/core/common_tile_item.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/widgets/order_item_price.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/widgets/quantity_and_price_with_tax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;
import 'package:ezrxmobile/presentation/core/widget_keys.dart';

class OtherItemDetailsSection extends StatelessWidget {
  const OtherItemDetailsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByItemDetailsBloc, ViewByItemDetailsState>(
      buildWhen: (previous, current) =>
          previous.orderHistory.orderHistoryItems !=
          current.orderHistory.orderHistoryItems,
      builder: (context, state) {
        final eligibilityState = context.read<EligibilityBloc>().state;

        return state.otherItems.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(
                  top: 12.0,
                  left: 12.0,
                  right: 12.0,
                ),
                child: custom.ExpansionTile(
                  initiallyExpanded: true,
                  title: Text(
                    context.tr('Other items in this order'),
                    key: WidgetKeys.viewByItemDetailExpandButton,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  children: [
                    state.isLoading
                        ? LoadingShimmer.tile()
                        : Column(
                            children: state
                                .otherItems.getViewByOrderItemDetailsList
                                .map(
                                  (e) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                        e.manufactureName.getOrDefaultValue(''),
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Column(
                                        children: e.orderHistoryItem
                                            .mapIndexed(
                                              (index, e) => CommonTileItem(
                                                key: WidgetKeys.genericKey(
                                                  key: index.toString(),
                                                ),
                                                label: e.combinationCode(
                                                  showGMCPart: eligibilityState
                                                      .salesOrgConfigs
                                                      .enableGMC,
                                                ),
                                                title: e.materialDescription,
                                                priceComponent: e
                                                        .isBonusMaterial
                                                    ? null
                                                    : OrderItemPrice(
                                                        unitPrice:
                                                            e.itemUnitPrice(
                                                          eligibilityState
                                                              .salesOrg.isID,
                                                        ),
                                                        originPrice: e
                                                            .originPrice
                                                            .toString(),
                                                        showPreviousPrice:
                                                            e.isCounterOffer,
                                                        hidePrice: e.hidePrice,
                                                      ),
                                                statusWidget: StatusLabel(
                                                  key: WidgetKeys
                                                      .orderItemStatusKey,
                                                  status: StatusType(
                                                    e.status.displayOrderStatus,
                                                  ),
                                                ),
                                                quantity: '',
                                                isQuantityBelowImage: true,
                                                isQuantityRequired: false,
                                                materialNumber:
                                                    e.materialNumber,
                                                statusTag: eligibilityState
                                                        .salesOrg.isID
                                                    ? null
                                                    : e.productTag,
                                                headerText:
                                                    '${context.tr('Order')} #${e.orderNumber.getOrDefaultValue('')}',
                                                subtitle: '',
                                                showOfferTag: e.isOfferItem,
                                                showBundleTag: e.isBundle,
                                                footerWidget:
                                                    QuantityAndPriceWithTax(
                                                  quantity: e.qty,
                                                  taxPercentage:
                                                      e.taxPercentage,
                                                  netPrice: e.itemTotalNetPrice(
                                                    eligibilityState
                                                        .salesOrg.isID,
                                                  ),
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
                  ],
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
