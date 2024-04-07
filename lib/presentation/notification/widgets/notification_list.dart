part of 'package:ezrxmobile/presentation/notification/notification_tab.dart';

class _NotificationList extends StatelessWidget {
  final NotificationData notificationData;
  const _NotificationList({Key? key, required this.notificationData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: WidgetKeys.notificationItem,
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
        key: WidgetKeys.notificationItemDifferenceTime,
      ),
      leading: Container(
        key: WidgetKeys.notificationItemIcon,
        padding: const EdgeInsets.all(8.0),
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
          Row(
            children: [
              if (notificationData.isMarketPlace)
                const Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: MarketPlaceIcon(),
                ),
              Text(
                context.tr(notificationData.title.getOrDefaultValue('')),
                key: WidgetKeys.notificationItemTitle,
                style: Theme.of(context).textTheme.labelSmall,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Text(
            notificationData.description,
            key: WidgetKeys.notificationItemDescription,
            style: Theme.of(context).textTheme.titleSmall,
          ),

          ///TODO: will revisit later
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

  void _navigateToDetailPage(
    BuildContext context,
  ) {
    //No Navigation for incorrect data
    if (!notificationData.type.isValid()) return;
    final eligibilityState = context.read<EligibilityBloc>().state;
    //Event call for Return Detail Page
    if (notificationData.isReturnEligible && eligibilityState.isReturnsEnable) {
      context.read<ReturnSummaryDetailsBloc>().add(
            ReturnSummaryDetailsEvent.fetch(
              returnId: notificationData.returnRequestId,
            ),
          );
      //Navigate to return Detail Page
      context.router.push(const ReturnRequestSummaryByItemDetailsRoute());
    }
    //Event call for Order Detail Page
    else if (notificationData.isOrderEligible &&
        eligibilityState.user.userCanAccessOrderHistory) {
      context.read<ViewByOrderDetailsBloc>().add(
            ViewByOrderDetailsEvent.fetch(
              orderNumber: notificationData.orderNumber,
            ),
          );

      context.read<ViewByItemDetailsBloc>().add(
            ViewByItemDetailsEvent.searchOrderHistory(
              searchKey: SearchKey(notificationData.orderNumber.getValue()),
            ),
          );
      //Navigate to Order Detail Page
      context.router.push(const ViewByOrderDetailsPageRoute());
    }
    //Event call for Payment Detail Page
    else if ((notificationData.isPaymentEligible &&
        eligibilityState.isPaymentEnabled)) {
      context.read<PaymentSummaryDetailsBloc>().add(
            PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo(
              details: PaymentSummaryDetails.empty().copyWith(
                zzAdvice: notificationData.paymentNumber,
                paymentBatchAdditionalInfo:
                    notificationData.paymentBatchAdditionalInfo,
              ),
            ),
          );
      //Navigate to Payment Detail Page
      context.router.push(const PaymentSummaryDetailsPageRoute());
    } else {
      CustomSnackBar(
        icon: const Icon(
          Icons.info,
          color: ZPColors.error,
        ),
        backgroundColor: ZPColors.errorSnackBarColor,
        messageText: context.tr("You don't have access"),
      ).show(context);
    }
  }
}
