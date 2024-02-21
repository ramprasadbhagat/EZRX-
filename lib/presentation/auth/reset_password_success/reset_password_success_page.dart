import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/logo.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResetPasswordSuccess extends StatelessWidget {
  const ResetPasswordSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: ListView(
          children: <Widget>[
            const Logo(
              title: 'Reset password',
            ),
            SvgPicture.asset(
              SvgImage.resetPasswordSuccessLogo,
              key: WidgetKeys.noRecordsFoundSearchIcon,
              height: 120,
            ),
            const SizedBox(height: 10),
            Text(
              context.tr('New password saved!'),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 5),
            Text(
              context.tr('You have successfully changed \n your password.'),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: ElevatedButton(
                key: WidgetKeys.changePasswordButton,
                onPressed: () =>
                    context.router.popUntilRouteWithName(LoginPageRoute.name),
                child: Text(context.tr('Login')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
