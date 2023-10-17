//ignore_for_file: unused-code
//ignore_for_file: unused-class
//ignore_for_file: unused-files
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/presentation/core/curved_rectangle_widget.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

class AvailableOfferItem extends StatelessWidget {
  const AvailableOfferItem({
    Key? key,
    required this.bonusMaterial,
    required this.priceTier,
    this.height,
    required this.width,
    required this.padding,
  }) : super(key: key);

  final double? height;
  final double width;
  final BonusMaterial bonusMaterial;
  final PriceTierItem priceTier;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return CurvedRectangleWidget(
      height: height,
      width: width,
      semiCircleCount: 8,
      semiCircleRadius: 16,
      padding: padding,
      child: priceTier != PriceTierItem.empty()
          ? _TierItem(priceTier: priceTier)
          : _BonusItem(bonusMaterial: bonusMaterial),
    );
  }
}

class _BonusItem extends StatelessWidget {
  const _BonusItem({
    Key? key,
    required this.bonusMaterial,
  }) : super(key: key);

  final BonusMaterial bonusMaterial;

  @override
  Widget build(BuildContext context) {
    return Column(
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
          key: WidgetKeys.lblNameProductOffers,
        ),
        Text(
          bonusMaterial.materialNumber.displayMatNo,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: ZPColors.extraLightGrey4,
              ),
          key: WidgetKeys.lblCodeProductOffers,
        ),
        Text(
          '${context.tr('Purchase quantity')}: ${bonusMaterial.qualifyingQuantity}',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: ZPColors.black,
              ),
          key: WidgetKeys.lblQuantityProductOffers,
        ),
      ],
    );
  }
}

class _TierItem extends StatelessWidget {
  const _TierItem({
    Key? key,
    required this.priceTier,
  }) : super(key: key);

  final PriceTierItem priceTier;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PriceComponent(
          salesOrgConfig: context.read<EligibilityBloc>().state.salesOrgConfigs,
          price: priceTier.rate.toStringAsFixed(2),
        ),
        Text(
          '${context.tr('Purchase quantity')}: ${priceTier.quantity}',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: ZPColors.black,
              ),
        ),
      ],
    );
  }
}
