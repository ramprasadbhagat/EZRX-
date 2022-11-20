import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PriceTierLabel extends StatelessWidget {
  const PriceTierLabel({
    Key? key,
    required this.priceTierItem,
  }) : super(key: key);

  final PriceTierItem priceTierItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const ValueKey('priceTierLable'),
      width: 180,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 5),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/tierpriceback.png',
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: 'Buy ${priceTierItem.quantity.toString()} or more ',
              style: const TextStyle(
                fontSize: 11,
                color: ZPColors.white,
                fontFamily: 'Poppins',
              ),
            ),
            TextSpan(
              text: context.read<SalesOrgBloc>().state.currency.code,
              style: const TextStyle(
                fontSize: 11,
                color: ZPColors.white,
                fontFamily: 'Roboto',
              ),
            ),
            const TextSpan(
              text: ' ',
              style: TextStyle(
                fontSize: 11,
                color: ZPColors.white,
                fontFamily: 'Poppins',
              ),
            ),
            TextSpan(
              text: priceTierItem.rate.toStringAsFixed(2),
              style: const TextStyle(
                fontSize: 11,
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
