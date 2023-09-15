import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OfferLabel extends StatelessWidget {
  final MaterialInfo materialInfo;
  final TextStyle? textStyle;
  final double iconSize;
  const OfferLabel({
    required this.materialInfo,
    this.textStyle,
    this.iconSize = 15,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = textStyle ??
        Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: ZPColors.white,
            );

    final materialPriceState = context.read<MaterialPriceBloc>().state;
    final isHidePrice = materialInfo.hidePrice;
    final isMYPnGSalesRep =
        context.read<EligibilityBloc>().state.isMYExternalSalesRepUser &&
            materialInfo.isPnGPrinciple;

    final displayOffers = !isHidePrice || isMYPnGSalesRep;

    return displayOffers &&
                (materialPriceState
                        .getPriceForMaterial(materialInfo.materialNumber)
                        .tiers
                        .isNotEmpty &&
                    !isMYPnGSalesRep) ||
            (materialPriceState
                    .getPriceForMaterial(materialInfo.materialNumber)
                    .bonuses
                    .isNotEmpty &&
                (materialInfo.inStock ||
                    (!materialInfo.inStock &&
                        context
                            .read<SalesOrgBloc>()
                            .state
                            .configs
                            .addOosMaterials
                            .getOrDefaultValue(false))))
        ? Container(
            key: WidgetKeys.materialListStockLabel,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            margin: const EdgeInsets.only(
              top: 10,
            ),
            decoration: const BoxDecoration(
              color: ZPColors.orange,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.local_offer_outlined,
                  size: iconSize,
                  color: ZPColors.white,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'On offer'.tr(),
                  style: style,
                ),
              ],
            ),
          )
        : const SizedBox.shrink();
  }
}
