import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListPriceStrikeThroughComponent extends StatelessWidget {
  final PriceAggregate priceAggregate;

  const ListPriceStrikeThroughComponent({
    Key? key,
    required this.priceAggregate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return priceAggregate.showMaterialListPrice &&
            priceAggregate.showStrikeThrough
        ? PriceComponent(
            salesOrgConfig:
                context.read<EligibilityBloc>().state.salesOrgConfigs,
            price: priceAggregate.display(PriceType.listPrice),
            type: PriceStyle.materialListPriceStrikeThrough,
          )
        : const SizedBox.shrink();
  }
}
