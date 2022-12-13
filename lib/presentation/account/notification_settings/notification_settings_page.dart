import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/language_picker.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class NotificationSettingsPage extends StatelessWidget {
  const NotificationSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Set Up Email Notifications'.tr(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: ListTile.divideTiles(
            color: Theme.of(context).iconTheme.color,
            tiles: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Language Preferences'.tr(),
                    style: const TextStyle(fontSize: 13),
                  ),
                  subtitle: Text(
                    'Email will be sent in your language of choice'.tr(),
                    style: TextStyle(
                      color: Theme.of(context).iconTheme.color,
                      fontSize: 11,
                    ),
                  ),
                  trailing: BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      return GestureDetector(
                        key: const Key('gestureDetectorForLanguagePicker'),
                        onTap: () => showPlatformDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (_) => LanguagePicker(
                            key: const Key(
                              'notificationSettingsLanguagePicker',
                            ),
                            onPressed: (Locale locale) {
                              locator<CountlyService>().addCountlyEvent(
                                  'notification_language_changed',
                                  segmentation: {
                                    'fromLanguage': state
                                        .languagePreference
                                        .toUpperCase(),
                                    'toLanguage':
                                        locale.languageCode.toUpperCase(),
                                  },);
                              context.read<UserBloc>().add(
                                    UserEvent.updateNotificationSettings(
                                      languagePreference: locale.languageCode,
                                      emailNotifications:
                                          state.emailNotifications,
                                    ),
                                  );
                              context.router.pop();
                            },
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).iconTheme.color ??
                                  ZPColors.lightGray,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  state.languagePreference
                                      .toLocale()
                                      .languageString(),
                                  style: const TextStyle(fontSize: 13),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Icon(
                                  Icons.arrow_drop_down_outlined,
                                  color: Theme.of(context).iconTheme.color,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Order Summary Update'.tr(),
                    style: const TextStyle(fontSize: 13),
                  ),
                  subtitle: Text(
                    'Receive a notification of your order summary after placing an order on eZRx'
                        .tr(),
                    style: TextStyle(
                      color: Theme.of(context).iconTheme.color,
                      fontSize: 11,
                    ),
                  ),
                  trailing: Column(
                    children: [
                      // Row(
                      //   mainAxisSize: MainAxisSize.min,
                      //   children: [
                      //     Text(
                      //       'Email'.tr(),
                      //       style: const TextStyle(fontSize: 12),
                      //     ),
                      //     const SizedBox(
                      //       width: 4,
                      //     ),
                      //     GestureDetector(
                      //       child: Icon(
                      //         Icons.info_outline_rounded,
                      //         size: 18.0,
                      //         color: Theme.of(context).iconTheme.color,
                      //       ),
                      //       onTap: () {
                      //         // if (overlayEntry.mounted) {
                      //         //   overlayEntry.remove();
                      //         // } else {
                      //         //   Overlay.of(context).insert(overlayEntry);
                      //         // }
                      //       },
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(
                      //   height: 5,
                      // ),
                      Row(mainAxisSize: MainAxisSize.min, children: [
                        BlocBuilder<UserBloc, UserState>(
                          buildWhen: (previous, current) =>
                              (previous.emailNotifications !=
                                  current.emailNotifications) ||
                              (previous.languagePreference !=
                                  current.languagePreference),
                          builder: (context, state) {
                            return PlatformSwitch(
                              key: const Key('flutterSwitch'),
                              activeColor: ZPColors.secondary,
                              value: state.emailNotifications,
                              onChanged: (bool value) {
                                context.read<UserBloc>().add(
                                      UserEvent.updateNotificationSettings(
                                        languagePreference:
                                            state.languagePreference,
                                        emailNotifications: value,
                                      ),
                                    );
                              },
                            );
                          },
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            ],
          ).toList(),
        ),
      ),
    );
  }
}
