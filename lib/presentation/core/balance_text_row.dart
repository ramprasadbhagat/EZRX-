import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class BalanceTextRow extends StatelessWidget {
  final String keyText;
  final String valueText;
  final int keyFlex;
  final int valueFlex;
  final bool valueTextLoading;

  const BalanceTextRow({
    Key? key,
    required this.keyText,
    required this.valueText,
    this.keyFlex = 1,
    this.valueFlex = 2,
    this.valueTextLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const keyTextStyle = TextStyle(
      color: ZPColors.darkGray,
      fontSize: 12.0,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );
    const valueTextStyle = TextStyle(
      color: ZPColors.black,
      fontSize: 12.0,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 2.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: keyFlex,
            child: Text(
              keyText,
              style: keyTextStyle,
              // style: Theme.of(context).textTheme.bodyText1?.apply(
              //         color: ZPColors.darkGray,
              //       ),
            ),
          ),
          Expanded(
            flex: valueFlex,
            child: valueTextLoading
                ? SizedBox(
                    width: 40,
                    child: LoadingShimmer.tile(),
                  )
                : Text(
                    ': $valueText',
                    style: valueTextStyle,
                    //    style: Theme.of(context).textTheme.bodyText1?.apply(
                    //   color: ZPColors.black,
                    // ),
                  ),
          ),
        ],
      ),
    );
  }
}
