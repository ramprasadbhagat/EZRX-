import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
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

class OtherItemDetailsSection extends StatelessWidget {
  const OtherItemDetailsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByItemDetailsBloc, ViewByItemDetailsState>(
      buildWhen: (previous, current) =>
          previous.viewByItemDetails.orderHistoryItems !=
          current.viewByItemDetails.orderHistoryItems,
      builder: (context, state) {
        return state.viewByItemDetails.isOthersOrderItemsSectionVisible
            ? Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: custom.ExpansionTile(
                  initiallyExpanded: true,
                  title: Text(
                    'Other items in this order'.tr(),
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  children: [
                    state.isLoading
                        ? LoadingShimmer.tile()
                        : Column(
                            children: state.viewByItemDetails.orderHistoryItems
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
                                                  price: e.totalPrice.totalPrice
                                                      .toStringAsFixed(2),
                                                  salesOrgConfig: context
                                                      .read<SalesOrgBloc>()
                                                      .state
                                                      .configs,
                                                ),
                                                statusWidget: StatusLabel(
                                                  status: StatusType(
                                                    e.status.displayOrderStatus,
                                                  ),
                                                ),
                                                quantity: e.qty.toString(),
                                                materialNumber:
                                                    e.materialNumber,
                                                isQuantityBelowImage: false,
                                                statusTag: e.productTag,
                                                headerText:
                                                    '${'Order'.tr()} #${e.orderNumber.getOrDefaultValue('')}',
                                                subtitle: '',
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
