import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OfferLabel extends StatelessWidget {
  final MaterialInfo materialInfo;
  final double iconSize;
  const OfferLabel({
    required this.materialInfo,
    this.iconSize = 15,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialPriceBloc, MaterialPriceState>(
      buildWhen: (previous, current) =>
          previous.getPriceForMaterial(materialInfo.materialNumber) !=
          current.getPriceForMaterial(materialInfo.materialNumber),
      builder: (context, state) {
        final eligibilityState = context.read<EligibilityBloc>().state;
        final price = state.getPriceForMaterial(materialInfo.materialNumber);
        final isHidePrice = materialInfo.hidePrice;
        final isMYPnGSalesRep = eligibilityState.isMYExternalSalesRepUser &&
            materialInfo.isPnGPrinciple;
        final displayOffers = !isHidePrice || isMYPnGSalesRep;
        final inStockEligible = materialInfo.inStock ||
            (!materialInfo.inStock &&
                eligibilityState.salesOrgConfigs.addOosMaterials
                    .getOrDefaultValue(false));

        return (price.lastPrice != price.finalPrice) ||
                displayOffers && (price.tiers.isNotEmpty && !isMYPnGSalesRep) ||
                (price.bonuses.isNotEmpty && inStockEligible)
            ? ProductTag.onOfferTag()
            : const SizedBox.shrink();
      },
    );
  }
}
