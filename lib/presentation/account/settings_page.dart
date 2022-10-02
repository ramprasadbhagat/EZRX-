import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/package_info/package_info.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/account/settings/change_password_title.dart';
import 'package:ezrxmobile/presentation/account/settings/language_tile.dart';
import 'package:ezrxmobile/presentation/account/settings/privacy_policy_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings').tr()),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: ListTile.divideTiles(
                context: context,
                tiles: [
                  const LanguageTile(),
                  const PrivacyPolicy(),
                  const ChangePasswordTile(),
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
            const _VersionString(),
          ],
        ),
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
          return Text(
            snapshot.data ?? '',
            style: Theme.of(context).textTheme.caption,
          );
        },
      ),
    );
  }
}
