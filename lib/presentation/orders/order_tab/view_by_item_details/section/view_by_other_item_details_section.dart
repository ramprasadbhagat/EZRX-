import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/presentation/core/common_tile_item.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
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
        return state.orderHistory.isOthersOrderItemsSectionVisible
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
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  children: [
                    state.isLoading
                        ? LoadingShimmer.tile()
                        : Column(
                            children: state.orderHistory.orderHistoryItems
                                .getViewByOrderItemDetailsList
                                .map(
                                  (e) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                        e.manufactureName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Column(
                                        children: e.orderHistoryItem
                                            .map(
                                              (e) => CommonTileItem(
                                                isQuantityRequired: true,
                                                label: e.materialNumber
                                                    .displayMatNo,
                                                title: e.materialDescription,
                                                priceComponent: PriceComponent(
                                                  price: e.itemTotalPrice(
                                                    context
                                                        .read<EligibilityBloc>()
                                                        .state
                                                        .salesOrg
                                                        .isID,
                                                  ),
                                                  salesOrgConfig: context
                                                      .read<EligibilityBloc>()
                                                      .state
                                                      .salesOrgConfigs,
                                                ),
                                                statusWidget: StatusLabel(
                                                  key: WidgetKeys
                                                      .orderItemStatusKey,
                                                  status: StatusType(
                                                    e.status
                                                        .getOrDefaultValue(''),
                                                  ),
                                                ),
                                                quantity: e.qty.toString(),
                                                materialNumber:
                                                    e.materialNumber,
                                                isQuantityBelowImage: false,
                                                statusTag: e.productTag,
                                                headerText:
                                                    '${context.tr('Order')} #${e.orderNumber.getOrDefaultValue('')}',
                                                subtitle: '',
                                                showOfferTag: e.isOfferItem,
                                                showBundleTag: e.isBundle,
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
