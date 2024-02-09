part of 'package:ezrxmobile/presentation/notification/notification_tab.dart';

class _AnnouncementList extends StatelessWidget {
  final NotificationData notificationData;

  const _AnnouncementList({Key? key, required this.notificationData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: WidgetKeys.notificationItem,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      onTap: () {
        if (notificationData.hyperLink.isInternalLink) {
          context.read<DeepLinkingBloc>().add(
                DeepLinkingEvent.addPendingLink(
                  notificationData.hyperLink.uri,
                ),
              );
        } else if (notificationData.hyperLink.isExternalLink) {
          context.router.push(
            WebViewPageRoute(
              url: notificationData.hyperLink.getOrDefaultValue(''),
            ),
          );
        }
      },
      trailing: Text(
        notificationData.createdAt.differenceTime,
        key: WidgetKeys.notificationItemDifferenceTime,
      ),
      leading: Container(
        key: WidgetKeys.notificationItemIcon,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: notificationData.title.iconBgColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          notificationData.title.iconData,
          size: 16,
          color: notificationData.title.iconColor,
        ),
      ),
      tileColor: ZPColors.transparent,
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr(notificationData.title.getOrDefaultValue('')),
            key: WidgetKeys.notificationItemTitle,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          Html(
            data: notificationData.description,
            style: {
              'body': Style(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
              ),
            },
          ),
          const SizedBox.shrink(),
          Text(
            notificationData.createdAt.notificationDateTime,
            key: WidgetKeys.notificationItemCreatedAt,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: ZPColors.lightGray),
          ),
        ],
      ),
    );
  }
}
