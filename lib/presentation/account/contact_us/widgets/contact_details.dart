part of 'package:ezrxmobile/presentation/account/contact_us/contact_us_page.dart';

class _ContactDetails extends StatelessWidget {
  const _ContactDetails({
    Key? key,
    required this.salesOrg,
  }) : super(key: key);

  final SalesOrg salesOrg;

  final contactText = 'Have any questions? we\'d love to hear from you.';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          contactText,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: ZPColors.extraLightGrey4,
                fontWeight: FontWeight.w400,
              ),
        ),
        _ContactItem(
          label: salesOrg.contactEmail,
          icon: Icons.mail_outline,
          onTap: () =>
              _sendEmail(salesOrg.contactEmail, salesOrg.contactPersonName),
        ),
        ...salesOrg.contact.phoneNumbers
            .map(
              (e) => _ContactItem(
                label: e.displayTelephoneNumber,
                icon: Icons.call_outlined,
                onTap: () => _makeCall('tel://${e.displayTelephoneNumber}'),
              ),
            )
            .toList(),
      ],
    );
  }

  Future<void> _sendEmail(String email, String personName) async {
    final emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': 'Example Subject & Symbols are allowed!',
        'body': 'Dear $personName',
      },
    );
    await launchUrl(emailLaunchUri);
  }

  Future<void> _makeCall(String reqUrl) async {
    await launchUrl(Uri.parse(reqUrl), mode: LaunchMode.externalApplication);
  }
}
