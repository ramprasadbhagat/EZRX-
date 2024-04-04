import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OfferLabel extends StatelessWidget {
  final MaterialInfo materialInfo;
  final bool iconOnly;
  const OfferLabel({
    required this.materialInfo,
    this.iconOnly = false,
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

        return state.displayOfferTag(materialInfo, eligibilityState.user)
            ? iconOnly
                ? ProductTag.onOfferIcon()
                : ProductTag.onOfferTag()
            : const SizedBox.shrink();
      },
    );
  }
}
