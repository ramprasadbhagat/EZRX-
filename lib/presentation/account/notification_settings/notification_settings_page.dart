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
      body: ListView(
        children: ListTile.divideTiles(
          color: Theme.of(context).iconTheme.color,
          tiles: [
            ListTile(
              title: Text(
                'Language Preferences'.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text(
                'Email will be sent in your language of choice'.tr(),
                style: Theme.of(context).textTheme.titleSmall?.apply(color: ZPColors.lightGray),
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
                              'fromLanguage':
                                  state.languagePreference.toUpperCase(),
                              'toLanguage': locale.languageCode.toUpperCase(),
                            },
                          );
                          context.read<UserBloc>().add(
                                UserEvent.updateNotificationSettings(
                                  languagePreference: locale.languageCode,
                                  emailNotifications: state.emailNotifications,
                                ),
                              );
                          context.router.pop();
                        },
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ZPColors.lightGray,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            state.languagePreference
                                .toLocale()
                                .languageString(),
                          ),
                          const Icon(
                            Icons.arrow_drop_down_outlined,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ListTile(
              title: Text(
                'Order Summary Update'.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text(
                'Receive a notification of your order summary after placing an order on eZRx'
                    .tr(),
                style: Theme.of(context).textTheme.titleSmall?.apply(color: ZPColors.lightGray),
              ),
              trailing: BlocBuilder<UserBloc, UserState>(
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
            ),
          ],
        ).toList(),
      ),
    );
  }
}
