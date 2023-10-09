part of 'package:ezrxmobile/presentation/returns/new_request/new_request_success/new_request_successful_page.dart';

class _ReturnRequestSuccessMessage extends StatelessWidget {
  const _ReturnRequestSuccessMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: WidgetKeys.newRequestSuccessMessage,
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          Icon(
            Icons.check_circle,
            color: ZPColors.green,
            size: MediaQuery.of(context).size.width * 0.2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              '${'We’ll send a confirmation to'.tr()} ${context.read<EligibilityBloc>().state.user.email.getOrDefaultValue('')} ${'once your return has been approved.'.tr()}',
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
                  text: 'Track your returned items under '.tr(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: ZPColors.darkGray,
                      ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Returns'.tr(),
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: ZPColors.extraDarkGreen,
                          ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.router.pop();
                        },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
