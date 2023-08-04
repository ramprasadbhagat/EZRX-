import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';

import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/language_picker.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:ezrxmobile/application/account/payment_notification/payment_notification_bloc.dart';

import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';

import 'package:ezrxmobile/locator.dart';

import 'package:ezrxmobile/domain/utils/error_utils.dart';

import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';


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
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: ListView(
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
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.apply(color: ZPColors.lightGray),
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
                            context.read<UserBloc>().add(
                                  UserEvent.updateNotificationSettings(
                                    languagePreference: locale.languageValue,
                                    emailNotifications:
                                        state.emailNotifications,
                                  ),
                                );
                            context.router.pop();
                          },
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
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
                              state.languagePreference.languageString,
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
              const _OrderNotificationSection(),
              locator<RemoteConfigService>().getPaymentsConfig()
                  ? const _PaymentNotificationSection()
                  : const SizedBox.shrink(),
            ],
          ).toList(),
        ),
      ),
    );
  }
}

class _OrderNotificationSection extends StatelessWidget {
  const _OrderNotificationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listenWhen: (previous, current) =>
          previous.user.settings.emailNotifications !=
          current.user.settings.emailNotifications,
      listener: (context, state) {
        CustomSnackBar(
          messageText:
              'Email Notification preference updated successfully'.tr(),
        ).show(context);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 8.0),
            child: Text(
              'Order Notifications'.tr(),
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.apply(color: ZPColors.primary),
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
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.apply(color: ZPColors.lightGray),
            ),
            trailing: BlocBuilder<UserBloc, UserState>(
              buildWhen: (previous, current) =>
                  (previous.emailNotifications != current.emailNotifications) ||
                  (previous.languagePreference != current.languagePreference),
              builder: (context, state) {
                return PlatformSwitch(
                  key: const Key('flutterSwitch'),
                  activeColor: ZPColors.secondary,
                  value: state.emailNotifications,
                  onChanged: (bool value) {
                    context.read<UserBloc>().add(
                          UserEvent.updateNotificationSettings(
                            languagePreference: state.languagePreference,
                            emailNotifications: value,
                          ),
                        );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _PaymentNotificationSection extends StatelessWidget {
  const _PaymentNotificationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymentNotificationBloc, PaymentNotificationState>(
      listenWhen: (previous, current) =>
          previous.message != current.message ||
          previous.failureOrSuccessOption != current.failureOrSuccessOption,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {
            if (state.message.isNotEmpty) {
              context.read<UserBloc>().add(
                    UserEvent.updatePaymentNotificationSettings(
                      paymentNotification: state.paymentNotification,
                    ),
                  );
              CustomSnackBar(
                messageText: 'Successfully updated payment notification'.tr(),
              ).show(context);
            }
          },
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {},
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 8, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Notifications'.tr(),
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.apply(color: ZPColors.primary),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Payment related updates'.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                BlocBuilder<UserBloc, UserState>(
                  buildWhen: (previous, current) =>
                      previous.user.settings.paymentNotification !=
                      current.user.settings.paymentNotification,
                  builder: (context, state) {
                    return PlatformSwitch(
                      activeColor: ZPColors.secondary,
                      value: !state.user.settings.paymentNotification
                          .disablePaymentNotification,
                      onChanged: (bool value) {
                        context.read<PaymentNotificationBloc>().add(
                              PaymentNotificationEvent
                                  .updatePaymentNotification(
                                paymentNotification: state
                                    .user.settings.paymentNotification
                                    .copyWith(
                                  disablePaymentNotification: !value,
                                ),
                              ),
                            );
                      },
                    );
                  },
                ),
              ],
            ),
            Text(
              'You will automatically, receive a notification for below services.'
                  .tr(),
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.apply(color: ZPColors.lightGray),
            ),
            Text(
              '\u2022 When you do a payment via eZRx'.tr(),
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.apply(color: ZPColors.lightGray),
            ),
            Text(
              '\u2022 When Payment Advice is generated'.tr(),
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.apply(color: ZPColors.lightGray),
            ),
            Text(
              '\u2022 When Payment Advice is automatically/manually deleted'
                  .tr(),
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.apply(color: ZPColors.lightGray),
            ),
            Text(
              '\u2022 Payment Advice expiry reminders (Default it will be sent before 3/5/7 days & the last day)'
                  .tr(),
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.apply(color: ZPColors.lightGray),
            ),
            const SizedBox(
              height: 20,
            ),
            const _PaymentAdviceExpiryReminderSection(
              type: PaymentAdviceType.day03,
            ),
            const _PaymentAdviceExpiryReminderSection(
              type: PaymentAdviceType.day05,
            ),
            const _PaymentAdviceExpiryReminderSection(
              type: PaymentAdviceType.day07,
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentAdviceExpiryReminderSection extends StatelessWidget {
  final PaymentAdviceType type;
  const _PaymentAdviceExpiryReminderSection({Key? key, required this.type})
      : super(key: key);

  String get _title {
    switch (type) {
      case PaymentAdviceType.day03:
        return 'Payment Advice Expiry Reminder before 03 days';
      case PaymentAdviceType.day05:
        return 'Payment Advice Expiry Reminder before 05 days';
      case PaymentAdviceType.day07:
        return 'Payment Advice Expiry Reminder before 07 days';
      default:
        return '';
    }
  }

  String get _subtitle {
    switch (type) {
      case PaymentAdviceType.day03:
        return 'You will automatically receive a notification before 3 days of the expiry date of all payment advice.';
      case PaymentAdviceType.day05:
        return 'You will automatically receive a notification before 5 days of the expiry date of all payment advice.';
      case PaymentAdviceType.day07:
        return 'You will automatically receive a notification before 7 days of the expiry date of all payment advice.';
      default:
        return '';
    }
  }

  bool _initialValue(BuildContext context) {
    final paymentNotification =
        context.read<UserBloc>().state.user.settings.paymentNotification;
    switch (type) {
      case PaymentAdviceType.day03:
        return paymentNotification.notificationConfigValue('3').disabled;
      case PaymentAdviceType.day05:
        return paymentNotification.notificationConfigValue('5').disabled;
      case PaymentAdviceType.day07:
        return paymentNotification.notificationConfigValue('7').disabled;
      default:
        return false;
    }
  }

  void _onChanged(BuildContext context, bool value) {
    final paymentNotification =
        context.read<UserBloc>().state.user.settings.paymentNotification;
    switch (type) {
      case PaymentAdviceType.day03:
        context.read<PaymentNotificationBloc>().add(
              PaymentNotificationEvent.updateAdviceExpiryReminder(
                paymentNotification: paymentNotification,
                updatedValue: value,
                day: '3',
              ),
            );
        break;
      case PaymentAdviceType.day05:
        context.read<PaymentNotificationBloc>().add(
              PaymentNotificationEvent.updateAdviceExpiryReminder(
                paymentNotification: paymentNotification,
                updatedValue: value,
                day: '5',
              ),
            );
        break;
      case PaymentAdviceType.day07:
        context.read<PaymentNotificationBloc>().add(
              PaymentNotificationEvent.updateAdviceExpiryReminder(
                paymentNotification: paymentNotification,
                updatedValue: value,
                day: '7',
              ),
            );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) =>
          previous.user.settings.paymentNotification !=
          current.user.settings.paymentNotification,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _title.tr(),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      _subtitle.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.apply(color: ZPColors.lightGray),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: PlatformSwitch(
                  activeColor: ZPColors.secondary,
                  value: !_initialValue(context),
                  onChanged: state.user.settings.paymentNotification
                          .disablePaymentNotification
                      ? null
                      : (bool value) => _onChanged(context, !value),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
