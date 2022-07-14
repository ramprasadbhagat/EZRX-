import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/user/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      '${state.user.fullName.firstName}, ${state.user.fullName.lastName}',
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
                    //@@@@@ need convert to valueObject
                    visible: state.user.role.id == '7',
                    child: ListTile(
                      key: const Key('loginOnBehalfTile'),
                      leading: const Icon(Icons.person_outline),
                      title: const Text('Login on behalf'),
                      onTap: () => context.router.pushNamed('login_on_behalf'),
                    ),
                  );
                },
              ),
              ListTile(
                key: const Key('settingsTile'),
                leading: const Icon(Icons.settings_outlined),
                title: const Text('Settings'),
                onTap: () {},
              ),
              ListTile(
                key: const Key('logoutTile'),
                leading: const Icon(Icons.logout_outlined),
                title: const Text('Logout'),
                onTap: () => context.read<AuthBloc>().add(
                      const AuthEvent.logout(),
                    ),
              ),
            ],
          ).toList(),
        ),
      ),
    );
  }
}
