part of 'package:ezrxmobile/presentation/orders/order_success/order_success_page.dart';

class _OrderSuccessMessage extends StatelessWidget {
  final OrderHistoryDetails orderHistoryDetails;
  const _OrderSuccessMessage({Key? key, required this.orderHistoryDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      key: WidgetKeys.orderSuccessMessage,
      children: [
        SvgPicture.asset(
          orderHistoryDetails.processingStatus.orderConfirmationIcon,
          fit: BoxFit.fitHeight,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            '${context.tr(orderHistoryDetails.processingStatus.orderConfirmationPrefixMessage)} ${context.read<EligibilityBloc>().state.user.email.getOrDefaultValue('')} ${context.tr(orderHistoryDetails.processingStatus.orderConfirmationSuffixMessage)}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ZPColors.darkerGrey,
                ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ListTile(
            tileColor: ZPColors.lightBlueColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                10.0,
              ),
            ),
            horizontalTitleGap: 0,
            leading: const Icon(
              Icons.info,
              color: ZPColors.skyBlueColor,
              size: 24,
            ),
            title: Text(
              context.tr("What's next?"),
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: ZPColors.black,
                  ),
            ),
            subtitle: RichText(
              text: TextSpan(
                text: 'Track your ordered items under'.tr(),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: ZPColors.darkGray,
                    ),
                children: <TextSpan>[
                  const TextSpan(text: ' '),
                  TextSpan(
                    text: 'Orders'.tr(),
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: ZPColors.black,
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap =
                          () => context.router.navigateNamed('main/orders_tab'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
