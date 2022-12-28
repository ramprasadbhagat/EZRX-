import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/approver/approver_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/cart_button.dart';
import 'package:ezrxmobile/presentation/core/profile_tile.dart';
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
        actions: const [CartButton()],
      ),
      body: Center(
        child: ListView(
          children: ListTile.divideTiles(
            context: context,
            tiles: [
              const ProfileTile(),
              const _LoginOnBehalfTile(),
              const _SettingsTile(),
              const _ReturnsTile(),
            ],
          ).toList(),
        ),
      ),
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
          visible: state.userCanLoginOnBehalf,
          child: ListTile(
            key: const Key('loginOnBehalfTile'),
            leading: const Icon(Icons.person_outline),
            title: Text(
              'Login on behalf',
              locale: context.locale,
            ).tr(),
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
      title: Text(
        'Settings',
        locale: context.locale,
      ).tr(),
      onTap: () => context.router.pushNamed('settings'),
    );
  }
}

class _ReturnsTile extends StatelessWidget {
  const _ReturnsTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return BlocConsumer<ApproverBloc, ApproverState>(
          listenWhen: (previous, current) =>
              previous.apiFailureOrSuccessOption !=
                  current.apiFailureOrSuccessOption ||
              previous.isApprover != current.isApprover,
          listener: (context, state) {
            state.apiFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  ErrorUtils.handleApiFailure(context, failure);
                },
                (_) {},
              ),
            );
          },
          buildWhen: (previous, current) =>
              previous.isApprover != current.isApprover,
          builder: (context, state) {
            return Visibility(
              visible: state.isApprover,
              child: ListTile(
                key: const Key('returnsTile'),
                leading: const Icon(Icons.undo),
                title: Text(
                  'Returns',
                  locale: context.locale,
                ).tr(),
                onTap: () => context.router.pushNamed('returns'),
              ),
            );
          },
        );
      },
    );
  }
}
