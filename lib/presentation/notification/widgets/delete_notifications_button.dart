part of 'package:ezrxmobile/presentation/notification/notification_tab.dart';

class _DeleteNotificationButton extends StatelessWidget {
  const _DeleteNotificationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
      buildWhen: (previous, current) =>
          previous.notificationList.notificationData !=
          current.notificationList.notificationData,
      builder: (context, state) {
        if (state.notificationList.notificationData.isEmpty) {
          return const SizedBox.shrink();
        }

        return IconButton(
          key: WidgetKeys.notificationDeleteButton,
          onPressed: () {
            context.read<NotificationBloc>().add(
                  const NotificationEvent.deleteAllNotifications(),
                );
          },
          icon: const Icon(
            Icons.delete_outline,
            color: ZPColors.red,
          ),
        );
      },
    );
  }
}
