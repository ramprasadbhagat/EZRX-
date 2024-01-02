import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_details_group.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/common_tile_item.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreditItemsSection extends StatelessWidget {
  final List<CustomerDocumentDetailGroup> creditItems;
  const CreditItemsSection({
    Key? key,
    required this.creditItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: creditItems.length,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              child: Text(
                '${context.tr('Return items')} (${context.read<CreditAndInvoiceDetailsBloc>().state.itemsInfo.length})',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: ZPColors.black,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                creditItems[index].principalName.getOrDefaultValue(''),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: ZPColors.black,
                    ),
              ),
            ),
            Column(
              children: creditItems[index].items.map(
                (creditItem) {
                  return CommonTileItem(
                    headerText:
                        '${context.tr('Batch')} ${creditItem.batchNumber.getOrDefaultValue('')} (EXP:${creditItem.expiryDate.dateString})',
                    materialNumber: creditItem.materialNumber,
                    label: removeLeadingZero(
                      creditItem.materialNumber.getOrDefaultValue(''),
                    ),
                    subtitle: StringUtils.displayPrice(
                      context.read<EligibilityBloc>().state.salesOrgConfigs,
                      creditItem.unitPrice,
                    ),
                    title: creditItem.billingDocumentItemText,
                    quantity: creditItem.billingQuantity.stringValue,
                    isQuantityBelowImage: true,
                    isQuantityRequired: false,
                    statusWidget: const SizedBox.shrink(),
                    footerWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${context.tr('Qty')}: ${creditItem.billingQuantity.getOrDefaultValue(0)}',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: ZPColors.black,
                                  ),
                        ),
                        PriceComponent(
                          salesOrgConfig: context
                              .read<EligibilityBloc>()
                              .state
                              .salesOrgConfigs,
                          price: creditItem.netAmount.toStringAsFixed(2),
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          ],
        );
      },
    );
  }
}
