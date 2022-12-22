import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class AddRemarksButton extends StatelessWidget {
  const AddRemarksButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: InkWell(
          key: Key('$key-InkWell'),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.add,
                  color: ZPColors.kPrimaryColor,
                ),
                Flexible(
                  child: Text(
                    'Add Remarks',
                    style: Theme.of(context).textTheme.bodyText1?.apply(
                          color: ZPColors.kPrimaryColor,
                        ),
                  ).tr(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
