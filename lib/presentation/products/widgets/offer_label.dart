import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
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
        ? ProductTag.onOfferTag()
        : const SizedBox.shrink();
  }
}
