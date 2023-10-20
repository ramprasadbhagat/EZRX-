import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class BonusLabel extends StatelessWidget {
  const BonusLabel({
    Key? key,
    required this.bonus,
  }) : super(key: key);

  final BonusMaterial bonus;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const ValueKey('bonusLable'),
      constraints: const BoxConstraints(minHeight: 30, maxWidth: 400),
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 5),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/bonustier.png',
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: '${'Buy'.tr()} ${bonus.qualifyingQuantity} ${'get'.tr()} ',
              style: const TextStyle(
                color: ZPColors.black,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: '${bonus.bonusQuantity} ${'free'.tr()}',
              style: const TextStyle(
                color: ZPColors.black,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandedBonusLabel extends StatefulWidget {
  const ExpandedBonusLabel({
    Key? key,
    required this.bonus,
  }) : super(key: key);

  final BonusMaterial bonus;

  @override
  State<ExpandedBonusLabel> createState() => _ExpandedBonusLabelState();
}

class _ExpandedBonusLabelState extends State<ExpandedBonusLabel> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          key: const ValueKey('bonusLable'),
          alignment: Alignment.center,
          constraints: const BoxConstraints(minHeight: 30, maxWidth: 400),
          margin: const EdgeInsets.only(bottom: 5),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/bonustier.png',
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            '${'Buy'.tr()} ${widget.bonus.qualifyingQuantity} ${'get'.tr()} ',
                        style: const TextStyle(
                          color: ZPColors.black,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '${widget.bonus.bonusQuantity} ${'free'.tr()}',
                        style: const TextStyle(
                          color: ZPColors.black,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                key: const Key('Expandable'),
                onTap: () => setState(() => isExpanded = !isExpanded),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Icon(
                    isExpanded ? Icons.remove : Icons.add,
                    color: ZPColors.black,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (isExpanded)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.bonus.materialDescription,
                style: Theme.of(context).textTheme.titleSmall,
              ).tr(),
              Text(
                widget.bonus.materialNumber.displayMatNo.tr(),
                style: Theme.of(context).textTheme.titleSmall,
              ).tr(),
              Text(
                'Bonus Qty: ${widget.bonus.bonusQuantity}',
                style: Theme.of(context).textTheme.titleSmall,
              ).tr(),
            ],
          ),
      ],
    );
  }
}
