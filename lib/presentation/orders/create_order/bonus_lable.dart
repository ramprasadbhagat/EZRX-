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
      width: 150,
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
              text: 'Buy ${bonus.qualifyingQuantity} get ',
              style: const TextStyle(
                color: ZPColors.white,
                fontFamily: 'Poppins',
              ),
            ),
            TextSpan(
              text: '${bonus.bonusQuantity} free',
              style: const TextStyle(
                color: ZPColors.white,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
