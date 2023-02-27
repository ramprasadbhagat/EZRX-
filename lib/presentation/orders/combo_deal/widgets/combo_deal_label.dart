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
