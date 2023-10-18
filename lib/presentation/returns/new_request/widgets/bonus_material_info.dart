import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/return_item_price.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class BonusMaterialInfo extends StatelessWidget {
  const BonusMaterialInfo({
    Key? key,
    required this.data,
    this.noteLineVisible = false,
  }) : super(key: key);

  final ReturnMaterial data;
  final bool noteLineVisible;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: ZPColors.extraLightGray,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                data.materialNumber.displayMatNo,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                width: 5,
              ),
              StatusLabel(
                status: StatusType('Bonus'),
                valueColor: ZPColors.white,
              ),
            ],
          ),
          Text(
            data.materialDescription,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Text(
            '${context.tr('Batch')} ${data.batch} (${context.tr('Expires')} ${data.expiryDate.dateString})',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.darkGray,
                  fontSize: 12,
                ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ReturnItemPrice(data: data),
              Text(
                '${context.tr('Qty')}: ${data.balanceQuantity.apiParameterValue} ',
              ),
            ],
          ),
          if (noteLineVisible)
            Text(
              context.tr(
                'Bonus unit price is derived by order subtotal divided by the total item quantity (incl. bonus).',
              ),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.changePasswordRecommendationColor,
                    fontSize: 10,
                  ),
            ),
        ],
      ),
    );
  }
}
