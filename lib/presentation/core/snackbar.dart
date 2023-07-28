import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

void showSnackBar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        key: const Key('snackBarMessage'),
      ),
      duration: const Duration(seconds: 3),
      dismissDirection: DismissDirection.horizontal,
    ),
  );
}

void showTopSnackBar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          const Icon(
            Icons.check_circle,
            color: ZPColors.checkSnackBar,
          ),
          const SizedBox(
            width: 4.0,
          ),
          Text(
            message,
            key: const Key('snackBarMessage'),
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: ZPColors.neutralsBlack),
          ),
        ],
      ),
      duration: const Duration(seconds: 3),
      dismissDirection: DismissDirection.horizontal,
      behavior: SnackBarBehavior.floating,
      showCloseIcon: true,
      backgroundColor: ZPColors.backgroundTopSnackBar,
      closeIconColor: ZPColors.backgroundCloseButtonSnackBar,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 200,
        right: 20,
        left: 20,
        top: 0,
      ),
    ),
  );
}
