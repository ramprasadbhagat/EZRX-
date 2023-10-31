import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/notification_settings/notification_settings_bloc.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/bullet_widget.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'package:ezrxmobile/presentation/account/notification_settings/widgets/notification_setting_item.dart';
part 'package:ezrxmobile/presentation/account/notification_settings/widgets/notification_setting_footer.dart';

class NotificationSettingsPage extends StatelessWidget {
  const NotificationSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr('Notifications')),
        centerTitle: false,
      ),
      body: BlocConsumer<NotificationSettingsBloc, NotificationSettingsState>(
        listenWhen: (previous, current) =>
            previous.submitFailureOrSuccessOption !=
                current.submitFailureOrSuccessOption ||
            previous.failureOrSuccessOption != current.failureOrSuccessOption,
        listener: (context, state) {
          state.failureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                ErrorUtils.handleApiFailure(context, failure);
              },
              (_) {},
            ),
          );
          state.submitFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                ErrorUtils.handleApiFailure(context, failure);
              },
              (_) {
                CustomSnackBar(
                  key: WidgetKeys.notificationSettingsSuccessSnackBar,
                  messageText:
                      context.tr('Notification settings saved successfully'),
                ).show(context);
              },
            ),
          );
        },
        buildWhen: (previous, current) =>
            previous.currentNotificationSettings !=
                current.currentNotificationSettings ||
            previous.isLoading != current.isLoading,
        builder: (context, state) {
          return ListView(
            key: WidgetKeys.notificationSettingsPage,
            padding: const EdgeInsets.all(16.0),
            children: [
              Text(
                context.tr('Notification settings'),
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Text(
                context.tr('Your email notification settings'),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.neutralsGrey1,
                    ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                context.tr('Orders'),
                style: Theme.of(context).textTheme.labelLarge,
              ),
              _NotificationSettingItem(
                title: 'Order confirmation',
                tileKey: WidgetKeys.orderConfirmationTile,
                value: state.currentNotificationSettings.orderConfirmation
                    .getOrCrash(),
                onChange: (value) =>
                    context.read<NotificationSettingsBloc>().add(
                          NotificationSettingsEvent.updateOrderConfirmation(
                            value: value ?? false,
                          ),
                        ),
                description:
                    'Receive a confirmation email after placing an order on eZRx+',
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Divider(
                  indent: 0,
                  thickness: 1,
                  endIndent: 0,
                  height: 1,
                  color: ZPColors.extraLightGrey2,
                ),
              ),
              Text(
                context.tr('Payments'),
                style: Theme.of(context).textTheme.labelLarge,
              ),
              _NotificationSettingItem(
                title: 'Receive a notification for the following:',
                tileKey: WidgetKeys.paymentConfirmationTile,
                value: state.currentNotificationSettings.paymentConfirmation
                    .getOrCrash(),
                onChange: (value) =>
                    context.read<NotificationSettingsBloc>().add(
                          NotificationSettingsEvent.updatePaymentConfirmation(
                            value: value ?? false,
                          ),
                        ),
                description:
                    'Receive a confirmation email after placing an order on eZRx+',
                subDescriptionList: const [
                  'After a payment has been submitted on eZRx+',
                  'Payment advice has been generated',
                  'Payment advice has been deleted either automatically or manually',
                ],
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: const _NotificationSettingFooter(),
    );
  }
}
