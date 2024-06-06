import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/proxy_login/proxy_login_form_bloc.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/more/section/login_on_behalf_sheet.dart';
import 'package:ezrxmobile/presentation/more/section/profile_tile_section.dart';
import 'package:ezrxmobile/presentation/more/section/version_display.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/more/section/help_and_support_section.dart';
import 'package:ezrxmobile/presentation/more/section/service_tile_section.dart';
import 'package:ezrxmobile/presentation/more/section/settings_title_section.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'section/login_on_behalf/login_on_behalf.dart';

class MoreTab extends StatelessWidget {
  const MoreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.tr('More'),
          style: Theme.of(context).textTheme.labelLarge,
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: AnnouncementBanner(
        key: WidgetKeys.moreScreen,
        currentPath: const MoreTabRoute().path,
        child: ListView(
          key: WidgetKeys.moreTapListContent,
          children: [
            const ProfileTile(),
            const SizedBox(height: 10),
            const ServiceTile(),
            const Divider(
              color: ZPColors.accentColor,
              endIndent: 16,
              indent: 16,
              height: 40,
            ),
            const SettingsTile(),
            const SizedBox(
              height: 15,
            ),
            const HelpAndSupportTile(),
            const Divider(
              color: ZPColors.accentColor,
              height: 15,
            ),
            const VersionDisplay(),
            const SizedBox(
              height: 15,
            ),
            const LoginOnBehalf(),
            TextButton.icon(
              style: TextButton.styleFrom(alignment: Alignment.centerLeft),
              icon: const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Icon(Icons.logout_outlined, color: ZPColors.red),
              ),
              label: Text(
                context.tr('Log out'),
                key: WidgetKeys.logOutTile,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ZPColors.red,
                    ),
              ),
              onPressed: () => context.read<AuthBloc>().add(
                    const AuthEvent.logout(),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
