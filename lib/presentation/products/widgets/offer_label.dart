import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OfferLabel extends StatelessWidget {
  final MaterialInfo materialInfo;

  const OfferLabel({required this.materialInfo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context
                .read<MaterialPriceBloc>()
                .state
                .getPriceForMaterial(materialInfo.materialNumber)
                .tiers
                .isNotEmpty ||
            context
                    .read<MaterialPriceBloc>()
                    .state
                    .getPriceForMaterial(materialInfo.materialNumber)
                    .bonuses
                    .isNotEmpty &&
                !materialInfo.inStock &&
                context
                    .read<SalesOrgBloc>()
                    .state
                    .configs
                    .addOosMaterials
                    .getOrDefaultValue(false)
        ? Container(
            key: WidgetKeys.materialListStockLabel,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            margin: const EdgeInsets.only(
              top: 10,
            ),
            decoration: const BoxDecoration(
              color: ZPColors.warning,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.local_offer_outlined,
                  size: 15,
                  color: ZPColors.white,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'On offer'.tr(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: ZPColors.white,
                      ),
                ),
              ],
            ),
          )
        : const SizedBox.shrink();
  }
}
