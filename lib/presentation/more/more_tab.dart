import 'package:ezrxmobile/application/auth/auth_bloc.dart';
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

class MoreTab extends StatelessWidget {
  const MoreTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'More'.tr(),
          style: Theme.of(context).textTheme.labelLarge,
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: AnnouncementBanner(
        currentPath: const MoreTabRoute().path,
        child: ListView(
          children: [
            const ProfileTile(), // Adds Profile Tile
            const SizedBox(
              height: 15,
            ),
            const ServiceTile(), // Adds Service Tile
            const Divider(
              color: ZPColors.accentColor,
              height: 15,
            ),
            const SizedBox(
              height: 15,
            ),
            const SettingsTile(), // Adds Settings Tile
            const Divider(
              color: ZPColors.accentColor,
              height: 15,
            ),
            const SizedBox(
              height: 15,
            ),
            const HelpAndSupportTile(), // Adds Help and Support Tile
            const Divider(
              color: ZPColors.accentColor,
              height: 15,
            ),
            const SizedBox(
              height: 15,
            ),
            TextButton.icon(
              icon: const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.logout_outlined,
                  color: ZPColors.red,
                ),
              ),
              label: Row(
                mainAxisAlignment:
                    MainAxisAlignment.start, // to align the icon to left
                children: [
                  Text(
                    'Log out',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: ZPColors.red,
                        ),
                  ).tr(),
                ],
              ),
              onPressed: () => context.read<AuthBloc>().add(
                    const AuthEvent.logout(),
                  ),
            ),
            const VersionDisplay(),
          ],
        ),
      ),
    );
  }
}
