import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
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
      constraints: const BoxConstraints(minHeight: 30, maxWidth: 400),
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
              text:
                  '${'Buy'.tr()} ${priceTierItem.quantity.toString()} ${'or more'.tr()} ',
              style: const TextStyle(
                color: ZPColors.black,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: StringUtils.displayPrice(
                context.read<SalesOrgBloc>().state.configs,
                priceTierItem.rate,
              ),
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
