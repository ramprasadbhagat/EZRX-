import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/return_item_price.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class MaterialInfoWidget extends StatelessWidget {
  const MaterialInfoWidget({
    Key? key,
    required this.data,
    this.showBatchExp = true,
  }) : super(key: key);

  final ReturnMaterial data;
  final bool showBatchExp;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        bottom: 8.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.materialNumber.displayMatNo,
            style: Theme.of(context).textTheme.titleSmall,
            key: WidgetKeys.itemMaterialNumberKey,
          ),
          Text(
            data.materialDescription,
            style: Theme.of(context).textTheme.labelMedium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            key: WidgetKeys.itemTitleKey,
          ),
          if (showBatchExp)
            Wrap(
              children: [
                Text(
                  '${'Batch'.tr()} ${data.batch} ',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: ZPColors.darkGray,
                        fontSize: 12,
                      ),
                  key: WidgetKeys.itemBatchKey,
                ),
                Text(
                  '(${'Expires'.tr()} ${data.expiryDate.dateString})',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: ZPColors.darkGray,
                        fontSize: 12,
                      ),
                  key: WidgetKeys.itemExpiresKey,
                ),
              ],
            ),
          ReturnItemPrice(data: data),
        ],
      ),
    );
  }
}
