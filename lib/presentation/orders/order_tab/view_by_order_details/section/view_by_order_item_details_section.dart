import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_group.dart';
import 'package:ezrxmobile/presentation/core/common_tile_item.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderItemDetailsSection extends StatelessWidget {
  const OrderItemDetailsSection({
    Key? key,
    required this.viewByOrderHistoryGroupList,
  }) : super(key: key);
  final List<ViewByOrdersGroup> viewByOrderHistoryGroupList;

  @override
  Widget build(BuildContext context) {
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
                              ),
                              salesOrgConfig: context
                                  .read<EligibilityBloc>()
                                  .state
                                  .salesOrgConfigs,
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
                            statusTag: e.orderDetailBonusTag,
                            headerText: salesOrgConfig.batchNumDisplay
                                ? '${'Batch'.tr()}: ${e.batch.displayDashIfEmpty}\n(${'EXP'.tr()}: ${e.expiryDate.dateOrDashString})'
                                : null,
                            subtitle: '',
                            footerWidget: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                PriceComponent(
                                  salesOrgConfig: salesOrgConfig,
                                  price: e.itemTotalPrice(
                                    invoiceNumber,
                                    isMYExternalSalesRep,
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
