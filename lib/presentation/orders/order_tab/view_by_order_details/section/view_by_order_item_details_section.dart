import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/common_tile_item.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_group.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';

class OrderItemDetailsSection extends StatelessWidget {
  const OrderItemDetailsSection({
    Key? key,
    required this.viewByOrderHistoryGroupList,
  }) : super(key: key);
  final List<ViewByOrdersGroup> viewByOrderHistoryGroupList;

  @override
  Widget build(BuildContext context) {
    if (viewByOrderHistoryGroupList.isEmpty) return const SizedBox.shrink();

    final eligibilityState = context.read<EligibilityBloc>().state;
    final displayGovernmentMaterialCOde =
        eligibilityState.salesOrganisation.salesOrg.isTW;
    final salesOrgConfig = eligibilityState.salesOrgConfigs;
    final invoiceNumber = context
        .read<ViewByOrderDetailsBloc>()
        .state
        .orderHistoryDetails
        .invoiceNumber;
    final isMYExternalSalesRep = eligibilityState.isMYExternalSalesRepUser;
    final isIDMarket = eligibilityState.salesOrganisation.salesOrg.isID;

    return Padding(
      key: WidgetKeys.viewByOrderDetailItemsSection,
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Column(
        children: viewByOrderHistoryGroupList
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
                        .mapIndexed(
                          (index, e) => CommonTileItem(
                            key: WidgetKeys.genericKey(
                              key: '$index',
                            ),
                            label:
                                '${e.materialNumber.displayMatNo}${displayGovernmentMaterialCOde ? '|${e.governmentMaterialCode}' : ''}',
                            title: e.materialDescription,
                            priceComponent: PriceComponent(
                              price: e.itemUnitPrice(
                                invoiceNumber,
                                isMYExternalSalesRep,
                                isIDMarket,
                              ),
                              salesOrgConfig: salesOrgConfig,
                            ),
                            statusWidget: isIDMarket
                                ? null
                                : StatusLabel(
                                    status: StatusType(
                                      e.sAPStatus.displayOrderStatus,
                                    ),
                                  ),
                            quantity: '',
                            materialNumber: e.materialNumber,
                            isQuantityBelowImage: true,
                            isQuantityRequired: false,
                            showOfferTag: e.showOfferTag,
                            statusTag: e.orderDetailBonusTag,
                            headerText: salesOrgConfig.batchNumDisplay
                                ? '${'Batch'.tr()}: ${e.batch.displayDashIfEmpty}\n(${'EXP'.tr()}: ${e.expiryDate.dateOrDashString})'
                                : '',
                            subtitle: '',
                            footerWidget: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${context.tr('Qty')}: ${e.qty}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: ZPColors.black,
                                          ),
                                    ),
                                    if (isIDMarket)
                                      Text(
                                        '${e.pickedQuantity} ${context.tr('of')} ${e.qty} ${context.tr('stocks fulfilled')}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              color: ZPColors.black,
                                            ),
                                      ),
                                  ],
                                ),
                                PriceComponent(
                                  salesOrgConfig: salesOrgConfig,
                                  price: e.itemTotalPrice(
                                    invoiceNumber,
                                    isMYExternalSalesRep,
                                    isIDMarket,
                                  ),
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
  }
}
