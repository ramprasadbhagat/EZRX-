part of 'package:ezrxmobile/presentation/account/contact_us/contact_us_page.dart';

class _SupportHours extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Support hours:'.tr(),
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: ZPColors.primary,
              ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Monday to Friday: 8am - 8pm'.tr(),
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: ZPColors.extraLightGrey4,
                fontWeight: FontWeight.w400,
              ),
        ),
        Text(
          'Saturday: 8am - 5pm'.tr(),
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: ZPColors.extraLightGrey4,
                fontWeight: FontWeight.w400,
              ),
        ),
      ],
    );
  }
}
