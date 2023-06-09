import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class BackToLogin extends StatelessWidget {
  const BackToLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: WidgetKeys.loginSubmitButton,
      onPressed: () =>
          context.router.popUntilRouteWithName(LoginPageRoute.name),
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor: const MaterialStatePropertyAll(
              ZPColors.accentColor,
            ),
          ),
      child: Text(
        'Back To Login',
        style: Theme.of(context).textTheme.labelSmall,
      ).tr(),
    );
  }
}
