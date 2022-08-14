import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account').tr(),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ListView(
          children: ListTile.divideTiles(
            context: context,
            tiles: [
              BlocBuilder<UserBloc, UserState>(
                buildWhen: (previous, current) => previous.user != current.user,
                builder: (context, state) {
                  return ListTile(
                    key: const Key('profileTile'),
                    leading: const CircleAvatar(),
                    title: Text(
                      state.user.fullName.toString(),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    onTap: () {},
                  );
                },
              ),
              BlocBuilder<UserBloc, UserState>(
                buildWhen: (previous, current) => previous.user != current.user,
                builder: (context, state) {
                  return Visibility(
                    visible: state.user.role.name.canLoginOnBehalf,
                    child: ListTile(
                      key: const Key('loginOnBehalfTile'),
                      leading: const Icon(Icons.person_outline),
                      title: const Text('Login on behalf').tr(),
                      onTap: () => context.router.pushNamed('login_on_behalf'),
                    ),
                  );
                },
              ),
              ListTile(
                key: const Key('settingsTile'),
                leading: const Icon(Icons.settings_outlined),
                title: const Text('Settings').tr(),
                onTap: () => context.router.pushNamed('settings'),
              ),
            ],
          ).toList(),
        ),
      ),
    );
  }
}
