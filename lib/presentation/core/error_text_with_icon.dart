import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class ErrorTextWithIcon extends StatelessWidget {
  final String valueText;
  const ErrorTextWithIcon({Key? key, required this.valueText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(
            Icons.error,
            color: ZPColors.error,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            valueText,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ZPColors.error,
                ),
          ),
        ],
      ),
    );
  }
}
