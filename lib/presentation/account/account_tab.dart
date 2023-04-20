import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/domain/announcement/entities/announcement.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_button.dart';
import 'package:ezrxmobile/presentation/core/profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account').tr(),
        automaticallyImplyLeading: false,
        actions: const [
          CartButton(),
        ],
      ),
      body: AnnouncementBanner(
        appModule: AppModule.core,
        child: ListView(
          children: ListTile.divideTiles(
            context: context,
            tiles: [
              const ProfileTile(),
              const _LoginOnBehalfTile(),
              const _SupportTile(),
              const _SettingsTile(),
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
        return state.userCanLoginOnBehalf
            ? ListTile(
                key: const Key('loginOnBehalfTile'),
                leading: const Icon(Icons.person_outline),
                title: Text(
                  'Login on behalf',
                  locale: context.locale,
                ).tr(),
                onTap: () => context.router.pushNamed('login_on_behalf'),
              )
            : const SizedBox.shrink();
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

class _SupportTile extends StatelessWidget {
  const _SupportTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesOrgBloc, SalesOrgState>(
      buildWhen: (previous, current) =>
          previous.salesOrganisation.salesOrg !=
          current.salesOrganisation.salesOrg,
      builder: (context, state) {
        if (!state.salesOrganisation.salesOrg.isSg) {
          return const SizedBox.shrink();
        }

        return ListTile(
          key: const Key('supportTile'),
          leading: const Icon(Icons.chat),
          title: Text(
            'Support',
            locale: context.locale,
          ).tr(),
          onTap: () {
            launchUrlString(
              'https://zuelligpharmacare.freshdesk.com/support/home',
            );
          },
        );
      },
    );
  }
}
