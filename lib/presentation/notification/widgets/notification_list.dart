part of 'package:ezrxmobile/presentation/notification/notification_tab.dart';

class _NotificationList extends StatelessWidget {
  final NotificationData notificationData;
  const _NotificationList({Key? key, required this.notificationData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.read<NotificationBloc>().add(
              NotificationEvent.readNotifications(
                notificationId: notificationData.id,
              ),
            );
        _navigateToDetailPage(context);
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),

      ///TODO: will revisit later
      trailing: Text(
        notificationData.createdAt.differenceTime,
      ),
      leading: Container(
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
      tileColor: notificationData.isRead
          ? ZPColors.transparent
          : ZPColors.lightBgYellow,
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            notificationData.title.getOrDefaultValue(''),
            style: Theme.of(context).textTheme.labelSmall,
          ),
          Text(
            notificationData.description,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          context.read<UserBloc>().state.isSalesRep
              ? const _CustomerDetails()
              : const SizedBox.shrink(),

          ///TODO: will revisit later
          Text(
            notificationData.createdAt.notificationDateTime,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: ZPColors.lightGray),
          ),
        ],
      ),
    );
  }

  void _navigateToDetailPage(
    BuildContext context,
  ) {
    final notificationType = notificationData.type;

    //No Navigation for incorrect data
    if (notificationType.isValid() &&
        notificationType.getDetailPageRoute.isEmpty) return;
    final eligibilityState = context.read<EligibilityBloc>().state;
    //Event call for Return Detail Page
    if (notificationType.navigateToReturnDetailPage &&
        eligibilityState.isReturnsEnable) {
      context.read<ReturnSummaryDetailsBloc>().add(
            ReturnSummaryDetailsEvent.fetch(
              returnId: notificationData.returnRequestId,
            ),
          );
      //Navigate to return Detail Page
      context.router.pushNamed(notificationType.getDetailPageRoute);
    }
    //Event call for Order Detail Page
    else if (notificationType.navigateToOrderDetailPage &&
        eligibilityState.user.userCanAccessOrderHistory) {
      context.read<ViewByOrderDetailsBloc>().add(
            ViewByOrderDetailsEvent.fetch(
              user: eligibilityState.user,
              orderNumber: notificationData.orderNumber,
              customerCodeInfo: eligibilityState.customerCodeInfo,
              salesOrganisation: eligibilityState.salesOrganisation,
            ),
          );
      //Navigate to respective Detail Page
      context.router.pushNamed(notificationType.getDetailPageRoute);
    }
  }
}

class _CustomerDetails extends StatelessWidget {
  const _CustomerDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCodeBloc, CustomerCodeState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        final customerCodeInfo = state.customerCodeInfo;
        if (customerCodeInfo == CustomerCodeInfo.empty()) {
          return const SizedBox.shrink();
        }

        return Text(
          '${customerCodeInfo.customerName}(${customerCodeInfo.customerCodeSoldTo})',
          style: Theme.of(context).textTheme.titleSmall,
        );
      },
    );
  }
}
