part of 'package:ezrxmobile/presentation/account/profile/profile_page.dart';

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Account & business details:'.tr(),
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const _UserDetails(),
        const SizedBox(height: 15),
        Text(
          'License information:'.tr(),
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
