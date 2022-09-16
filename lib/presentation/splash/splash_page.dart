import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upgrader/upgrader.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        state.map(
          initial: (_) => _showLoadingDialog(context),
          loading: (_) => _showLoadingDialog(context),
          authenticated: (_) {
            context.router.replaceAll([
              const SplashPageRoute(),
              const HomeNavigationTabbarRoute(),
            ]);
          },
          unauthenticated: (_) {
            context.router.replaceAll([
              const SplashPageRoute(),
              const LoginPageRoute(),
            ]);
          },
        );
      },
      child: UpgradeAlert(
        upgrader: Upgrader(
          messages: _UpgraderLocalizationMessage(),
          dialogStyle: Platform.isIOS
              ? UpgradeDialogStyle.cupertino
              : UpgradeDialogStyle.material,
          debugLogging:
              locator<Config>().appFlavor == Flavor.prod ? false : true,
          minAppVersion: '1.0.0',
        ),
        child: const Scaffold(),
      ),
    );
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
              SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  key: Key('splashLoadingIndicator'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _UpgraderLocalizationMessage extends UpgraderMessages {
  @override
  String message(UpgraderMessage messageKey) {
    switch (messageKey) {
      case UpgraderMessage.body:
        return 'A new version of {{appName}} is available!'.tr();
      case UpgraderMessage.buttonTitleIgnore:
        return 'Ignore'.tr();
      case UpgraderMessage.buttonTitleLater:
        return 'Later'.tr();
      case UpgraderMessage.buttonTitleUpdate:
        return 'Update Now'.tr();
      case UpgraderMessage.prompt:
        return 'Want to update?'.tr();
      case UpgraderMessage.releaseNotes:
        return 'Release Notes'.tr();
      case UpgraderMessage.title:
        return 'Update App?'.tr();
      default:
        return super.message(messageKey) ?? '';
    }
  }
}
