import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
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
              const _ProfileTile(),
              const _LoginOnBehalfTile(),
              const _SettingsTile(),
            ],
          ).toList(),
        ),
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  const _ProfileTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) => previous.user != current.user,
      builder: (context, state) {
        return BlocConsumer<UserBloc, UserState>(
          listenWhen: (previous, current) => previous.user != current.user,
          listener: (context, state) {
            state.userFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  final failureMessage = failure.failureMessage;
                  showSnackBar(context: context, message: failureMessage.tr());
                  if (failureMessage == 'authentication failed') {
                    context.read<AuthBloc>().add(const AuthEvent.logout());
                  }
                },
                (_) {},
              ),
            );
          },
          buildWhen: (previous, current) => previous.user != current.user,
          builder: (context, state) {
            return ListTile(
              key: const Key('profileTile'),
              leading: const CircleAvatar(),
              title: state.user == User.empty()
                  ? LoadingShimmer.tile(line: 3)
                  : Text(
                      state.user.fullName.toString(),
                      style: Theme.of(context).textTheme.headline6,
                    ),
              onTap: null,
            );
          },
        );
      },
    );
  }
}

class _LoginOnBehalfTile extends StatelessWidget {
  const _LoginOnBehalfTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) => previous.user != current.user,
      builder: (context, state) {
        return Visibility(
          visible: state.user.role.type.canLoginOnBehalf,
          child: ListTile(
            key: const Key('loginOnBehalfTile'),
            leading: const Icon(Icons.person_outline),
            title: const Text('Login on behalf').tr(),
            onTap: () => context.router.pushNamed('login_on_behalf'),
          ),
        );
      },
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        key: const Key('settingsTile'),
        leading: const Icon(Icons.settings_outlined),
        title: const Text('Settings').tr(),
        onTap: () => context.router.pushNamed('settings'),
      );
  }
}
