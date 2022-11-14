import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ConfirmClearCartDialog {
  static void show({
    required BuildContext context,
    required String title,
    required String description,
    required VoidCallback onConfirmed,
    required bool skipDialog,
  }) {
    if (skipDialog) {
      context.router.popUntilRouteWithName(HomeNavigationTabbarRoute.name);
      onConfirmed();
    } else {
      showPlatformDialog(
        context: context,
        barrierDismissible: true,
        useRootNavigator: true,
        builder: (BuildContext context) {
          return PlatformAlertDialog(
            title: Text(title),
            content: Text(description),
            actions: [
              PlatformDialogAction(
                key: const Key('Cancel'),
                child: const Text('Cancel').tr(),
                onPressed: () {
                  context.router.pop();
                },
              ),
              PlatformDialogAction(
                key: const Key('Change'),
                child: const Text('Change').tr(),
                onPressed: () {
                  context.read<CartBloc>().add(const CartEvent.clearCart());
                  context.router
                      .popUntilRouteWithName(HomeNavigationTabbarRoute.name);
                  onConfirmed();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
