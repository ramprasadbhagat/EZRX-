import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/orders/core/order_sold_to_info.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;

class HistorySoldToSection extends StatelessWidget {
  const HistorySoldToSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return custom.ExpansionTile(
      initiallyExpanded: true,
      keepHeaderBorder: true,
      key: const ValueKey('soldToAddress'),
      title: Text(
        'Sold to Address'.tr(),
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.w600),
      ),
      children: const [
        SoldToAddressInfo(),
      ],
    );
  }
}
