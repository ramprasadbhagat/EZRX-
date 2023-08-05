import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                (e) {
                  return CommonTileItem(
                    headerText:
                        'Batch ${e.batchNumber.getOrDefaultValue('')} (EXP:${e.expiryDate.dateString})',
                    materialNumber: e.materialNumber,
                    label: removeLeadingZero(
                      e.materialNumber.getOrDefaultValue(''),
                    ),
                    subtitle: StringUtils.displayPrice(
                      context.read<SalesOrgBloc>().state.configs,
                      double.parse(
                        (e.grossAmount / e.billingQuantity.getOrDefaultValue(1))
                            .toStringAsFixed(2),
                      ),
                    ),
                    title: e.billingDocumentItemText,
                    quantity: '${e.billingQuantity.getOrDefaultValue(0)}',
                    isQuantityBelowImage: true,
                    isQuantityRequired: false,
                    statusWidget: const SizedBox.shrink(),
                    footerWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Qty: ${e.billingQuantity.getOrDefaultValue(0)}',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: ZPColors.black,
                                  ),
                        ),
                        PriceComponent(
                          salesOrgConfig:
                              context.read<SalesOrgBloc>().state.configs,
                          price: e.grossAmount.toStringAsFixed(2),
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
