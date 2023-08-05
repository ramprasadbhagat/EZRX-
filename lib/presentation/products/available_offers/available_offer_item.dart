//ignore_for_file: unused-code
//ignore_for_file: unused-class
//ignore_for_file: unused-files
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/presentation/core/curved_rectangle_widget.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class AvailableOfferItem extends StatelessWidget {
  const AvailableOfferItem({
    Key? key,
    required this.bonusMaterial,
    this.height,
    required this.width,
    required this.padding,
  }) : super(key: key);

  final double? height;
  final double width;
  final BonusMaterial bonusMaterial;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return CurvedRectangleWidget(
      height: height,
      width: width,
      semiCircleCount: 8,
      semiCircleRadius: 16,
      padding: padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${bonusMaterial.bonusQuantity} ${bonusMaterial.materialDescription}',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: ZPColors.textButtonColor,
                ),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            bonusMaterial.materialNumber.displayMatNo,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ZPColors.extraLightGrey4,
                ),
          ),
          Text(
            '${'Purchase quantity'.tr()}: ${bonusMaterial.qualifyingQuantity}',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ZPColors.black,
                ),
          ),
        ],
      ),
    );
  }
}
