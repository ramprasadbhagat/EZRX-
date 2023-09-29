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
      //Navigate to Order Detail Page
      context.router.push(const ViewByOrderDetailsPageRoute());
    }
    //Event call for Payment Detail Page
    else if (notificationData.isPaymentEligible &&
        !eligibilityState.isPaymentEnabled) {
      context.read<PaymentSummaryDetailsBloc>().add(
            PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo(
              salesOrganization: eligibilityState.salesOrganisation,
              customerCodeInfo: eligibilityState.customerCodeInfo,
              paymentSummaryDetails: PaymentSummaryDetails.empty().copyWith(
                paymentID: notificationData.saleDocument,
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
