import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class ComboDealLabel extends StatelessWidget {
  const ComboDealLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        color: ZPColors.secondary,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: FittedBox(
        child: Text(
          'Combo',
          style: Theme.of(context).textTheme.titleSmall?.apply(
                color: ZPColors.kPrimaryColor,
              ),
        ),
      ),
    );
  }
}

class MandatoryLabel extends StatelessWidget {
  const MandatoryLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        color: ZPColors.lightGreen,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: FittedBox(
        child: Text(
          'Mandatory',
          style: Theme.of(context).textTheme.titleSmall?.apply(
                color: ZPColors.primary,
              ),
        ),
      ),
    );
  }
}

class DiscountLabel extends StatelessWidget {
  final String label;
  const DiscountLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        color: ZPColors.lightGreen,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: FittedBox(
        child: Text(
          label,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ZPColors.primary,
              ),
        ),
      ),
    );
  }
}

class PriceLabel extends StatelessWidget {
  final String label;
  final double price;
  final double discountPrice;
  final bool discountEnable;
  final SalesOrganisationConfigs salesConfigs;
  const PriceLabel({
    Key? key,
    required this.label,
    required this.price,
    required this.discountPrice,
    required this.salesConfigs,
    this.discountEnable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$label: ${StringUtils.displayPrice(
              salesConfigs,
              discountEnable ? discountPrice : price,
            )} ',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.black,
                ),
          ),
          TextSpan(
            text: discountEnable ? price.toStringAsFixed(2) : '',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.lightGray,
                  decoration: TextDecoration.lineThrough,
                ),
          ),
        ],
      ),
    );
  }
}
