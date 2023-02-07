import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/package_info/package_info.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/account/settings/language_tile.dart';
import 'package:ezrxmobile/presentation/account/settings/notification_tile.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:ezrxmobile/application/aup_tc/aup_tc_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    locator<CountlyService>().recordCountlyView('Settings Screen');

    return Scaffold(
      appBar: AppBar(title: const Text('Settings').tr()),
      body: Stack(
        children: [
          ListView(
            children: ListTile.divideTiles(
              context: context,
              tiles: [
                const NotificationTile(),
                ListTile(
                  key: const Key('changePasswordTile'),
                  leading: const Icon(
                    Icons.vpn_key_outlined,
                  ),
                  title: const Text('Change Password').tr(),
                  onTap: () {
                    context
                        .read<ResetPasswordBloc>()
                        .add(const ResetPasswordEvent.onRestart());
                    context.router.pushNamed('change_password_page');
                  },
                ),
                const LanguageTile(),
                ListTile(
                  key: const Key('contactUsTile'),
                  leading: const Icon(Icons.contact_support_outlined),
                  title: const Text('Contact Us').tr(),
                  onTap: () => context.router.pushNamed('contact_us_page'),
                ),
                ListTile(
                  key: const Key('tostile'),
                  leading: const Icon(Icons.policy_outlined),
                  title: Text('ToS'.tr()),
                  onTap: () async {
                    if (kIsWeb) {
                      final privacyUrl = context.read<AupTcBloc>().state.url;
                      if (await canLaunchUrl(
                        Uri.tryParse(privacyUrl) ?? Uri(path: ''),
                      )) {
                        await launchUrl(Uri.parse(privacyUrl));
                      }
                    } else {
                      await context.router
                          .push(AupTCDialogRoute(fromSetting: true));
                    }
                  },
                ),
                ListTile(
                  key: const Key('Privacy_Policy'),
                  leading: const Icon(Icons.policy_outlined),
                  title: const Text('Privacy Policy').tr(),
                  onTap: () async {
                    final config = locator<Config>();
                    final privacyUrl = config.getPrivacyUrl;
                    if (kIsWeb) {
                      if (await canLaunchUrl(
                        Uri.tryParse(privacyUrl) ?? Uri(path: ''),
                      )) {
                        await launchUrl(Uri.parse(privacyUrl));
                      }
                    } else {
                      await context.router.push(
                        WebViewPageRoute(
                          url: privacyUrl,
                          initialFile: config.getPrivacyInitialFile,
                        ),
                      );
                    }
                  },
                ),
                ListTile(
                  key: const Key('logoutTile'),
                  leading: const Icon(Icons.logout_outlined),
                  title: const Text('Logout').tr(),
                  onTap: () => context.read<AuthBloc>().add(
                        const AuthEvent.logout(),
                      ),
                ),
              ],
            ).toList(),
          ),
          const SafeArea(bottom: true, child: _VersionString()),
        ],
      ),
    );
  }
}

class _VersionString extends StatelessWidget {
  const _VersionString({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: FutureBuilder<String>(
        future: locator<PackageInfoService>().getString(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Text(
              snapshot.data ?? '',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          );
        },
      ),
    );
  }
}
