import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/custom_label.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BonusDiscountLabel extends StatelessWidget {
  final MaterialInfo materialInfo;
  final String tenderContractNumber;

  const BonusDiscountLabel({Key? key, required this.materialInfo, required this.tenderContractNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialPriceBloc, MaterialPriceState>(
      builder: (context, materialPriceState) {
        final itemPrice =
            materialPriceState.getPriceForMaterial(materialInfo.materialNumber);


        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (materialInfo.hasValidTenderContract)
               Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                child: Text(
                  tenderContractNumber,
                  style: Theme.of(context).textTheme.bodyText1?.apply(
                        color: ZPColors.tender,
                      ),
                ),
              ),
            if (!materialInfo.hidePrice && itemPrice.bonuses.isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                child: SvgPicture.asset(
                  'assets/svg/bonus.svg',
                  key: const ValueKey('bonusLogo'),
                ),
              ),
            if (!materialInfo.hidePrice && itemPrice.tiers.isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                child: SvgPicture.asset(
                  'assets/svg/tieredPricing.svg',
                  key: const ValueKey('tieredPricingLogo'),
                ),
              ),
            if (itemPrice.zmgDiscount)
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: CustomLabel(
                  key: ValueKey('zmgDiscountLable'),
                  textValue: 'ZMG',
                ),
              ),
          ],
        );
      },
    );
  }
}
