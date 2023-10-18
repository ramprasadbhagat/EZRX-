part of 'package:ezrxmobile/presentation/account/profile/profile_page.dart';

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr('Account & business details:'),
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const _UserDetails(
          key: WidgetKeys.profileUserDetails,
        ),
        const SizedBox(height: 15),
        Text(
          context.tr('License information:'),
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
