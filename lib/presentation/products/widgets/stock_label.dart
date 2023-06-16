import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class StockLabel extends StatelessWidget {
  final MaterialInfo materialInfo;

  const StockLabel({required this.materialInfo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return materialInfo.inStock
        ? const SizedBox.shrink()
        : Container(
            key: WidgetKeys.materialListStockLabel,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: const BoxDecoration(
              color: ZPColors.warning,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: Text(
              materialInfo.stockInfos.isEmpty ? 'Preorder' : 'Out of Stock',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: ZPColors.darkerGrey,
                  ),
            ).tr(),
          );
  }
}
