import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListPriceComponent extends StatelessWidget {
  const ListPriceComponent({
    Key? key,
    required this.price,
  }) : super(key: key);

  final String price;

  @override
  Widget build(BuildContext context) {
    final salesOrgConfigs =
        context.read<EligibilityBloc>().state.salesOrgConfigs;

    return salesOrgConfigs.enableListPrice
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: PriceComponent(
                  title: '${context.tr('List price')}: ',
                  type: PriceStyle.materialListPrice,
                  price: price,
                  salesOrgConfig: salesOrgConfigs,
                ),
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}
