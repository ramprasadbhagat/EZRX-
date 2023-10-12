import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComboOfferLabel extends StatelessWidget {
  final MaterialInfo materialInfo;
  final double iconSize;
  const ComboOfferLabel({
    required this.materialInfo,
    this.iconSize = 15,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialPriceBloc, MaterialPriceState>(
      buildWhen: (previous, current) =>
          previous.materialPrice != current.materialPrice,
      builder: (context, state) {
        final displayComboOfferOffers = state
                .materialPrice[materialInfo.materialNumber]
                ?.isComboDealEligible ??
            false;

        return displayComboOfferOffers
            ? ProductTag.comboOffer()
            : const SizedBox.shrink();
      },
    );
  }
}
