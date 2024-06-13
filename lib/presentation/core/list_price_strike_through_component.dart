import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListPriceStrikeThroughComponent extends StatelessWidget {
  final PriceAggregate priceAggregate;
  final String title;

  const ListPriceStrikeThroughComponent({
    super.key,
    required this.priceAggregate,
    this.title = '',
  });

  @override
  Widget build(BuildContext context) {
    return priceAggregate.showMaterialListPrice
        ? Row(
            children: [
              PriceComponent(
                key: WidgetKeys.listPriceStrikeThroughComponent,
                title: title,
                salesOrgConfig:
                    context.read<EligibilityBloc>().state.salesOrgConfigs,
                price: priceAggregate.display(PriceType.listPrice),
                type: PriceStyle.materialListPriceStrikeThrough,
              ),
              const SizedBox(width: 4),
            ],
          )
        : const SizedBox.shrink();
  }
}
