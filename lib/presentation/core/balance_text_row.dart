import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/history/status_label.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class BalanceTextRow extends StatelessWidget {
  final String keyText;
  final String valueText;
  final int keyFlex;
  final int valueFlex;
  final bool valueTextLoading;
  final bool isStatus;

  const BalanceTextRow({
    Key? key,
    required this.keyText,
    required this.valueText,
    this.keyFlex = 1,
    this.valueFlex = 2,
    this.valueTextLoading = false,
    this.isStatus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              style: Theme.of(context).textTheme.titleSmall?.apply(
                    color: ZPColors.darkGray,
                  ),
            ),
          ),
          Expanded(
            flex: valueFlex,
            child: valueTextLoading
                ? SizedBox(
                    width: 40,
                    child: LoadingShimmer.tile(),
                  )
                : isStatus
                    ? Row(
                        children: [
                          Text(
                            ': ',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Flexible(
                            child: StatusLabel(
                              status: StatusType(valueText),
                            ),
                          ),
                        ],
                      )
                    : Text(
                        ': $valueText',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
          ),
        ],
      ),
    );
  }
}
