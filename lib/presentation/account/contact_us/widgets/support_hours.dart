part of '../contact_us_page.dart';

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
          height: 10,
        ),
        Text(
          'Monday to Friday: 8am - 8pm',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: ZPColors.extraLightGrey4,
                fontWeight: FontWeight.w400,
              ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Saturday: 8am - 5pm',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: ZPColors.extraLightGrey4,
                fontWeight: FontWeight.w400,
              ),
        ),
      ],
    );
  }
}
