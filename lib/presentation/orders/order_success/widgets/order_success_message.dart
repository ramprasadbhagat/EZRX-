part of 'package:ezrxmobile/presentation/orders/order_success/order_success_page.dart';

class _OrderSuccessMessage extends StatelessWidget {
  const _OrderSuccessMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.check_circle,
          color: ZPColors.green,
          size: MediaQuery.of(context).size.width * 0.2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            '${'We’ll send a confirmation to'.tr()} ${context.read<UserBloc>().state.user.email.getOrDefaultValue('')} ${'once your order has been confirmed'.tr()}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ZPColors.darkerGrey,
                ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
              "What's next?".tr(),
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: ZPColors.black,
                  ),
            ),
            subtitle: RichText(
              text: TextSpan(
                text: 'Track your ordered items under '.tr(),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: ZPColors.darkGray,
                    ),
                children: <TextSpan>[
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
