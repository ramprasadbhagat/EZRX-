import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/presentation/account/settings/language_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings').tr()),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: ListTile.divideTiles(
              context: context,
              tiles: [
                const LanguageTile(),
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
        ),
      ),
    );
  }
}
