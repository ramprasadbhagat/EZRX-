import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Contact Us').tr(),
      ),
      body: BlocBuilder<SalesOrgBloc, SalesOrgState>(
        buildWhen: (previous, current) =>
            previous.salesOrganisation.salesOrg !=
            current.salesOrganisation.salesOrg,
        builder: (context, state) {
          final salesOrg = state.salesOrganisation.salesOrg;

          return ListView(
            children: ListTile.divideTiles(
              context: context,
              tiles: [
                ListTile(
                  key: const Key('nameTile'),
                  title: Text(salesOrg.contactPersonName).tr(),
                ),
                if (salesOrg.contact.instruction.isNotEmpty)
                  ListTile(
                    key: const Key('instructionTile'),
                    title: Text(salesOrg.contact.instruction).tr(),
                  ),
                ...salesOrg.contact.phoneNumbers.map(
                  (e) => ListTile(
                    onTap: () async => await _makeCall('tel://$e'),
                    title: Text(
                      e,
                      style: const TextStyle(color: ZPColors.primary),
                    ),
                    leading: const Icon(Icons.call, color: ZPColors.primary),
                  ),
                ),
                ListTile(
                  key: const Key('emailTile'),
                  onTap: () => _sendEmail(
                    salesOrg.contactEmail,
                    salesOrg.contactPersonName,
                  ),
                  leading: const Icon(Icons.email, color: ZPColors.primary),
                  title: Text(
                    salesOrg.contactEmail,
                    style: const TextStyle(color: ZPColors.primary),
                  ).tr(),
                ),
              ],
            ).toList(),
          );
        },
      ),
    );
  }

  Future<void> _makeCall(String reqUrl) async {
    await launchUrl(Uri.parse(reqUrl), mode: LaunchMode.externalApplication);
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
}
