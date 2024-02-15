part of 'package:ezrxmobile/presentation/core/custom_app_bar.dart';

class _CustomerBlockedBanner extends StatelessWidget {

  final bool isCustomerBlocked;
  const _CustomerBlockedBanner({Key? key, required this.isCustomerBlocked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isCustomerBlocked
            ? ColorContainer(
                key: WidgetKeys.customerBlockedBanner,
                color: ZPColors.customerBlockedBannerColor,
                margin: const EdgeInsets.all(0),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 18,
                ),
                circularRadius: 0,
                children: [
                  Text(
                    context.tr('Your account is blocked.'),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    context.tr(
                      'To continue using eZRx+, please contact your system administrator.',
                    ),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              )
        : const SizedBox.shrink();
  }
}
