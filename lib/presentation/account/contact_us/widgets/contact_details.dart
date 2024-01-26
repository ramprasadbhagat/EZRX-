part of 'package:ezrxmobile/presentation/account/contact_us/contact_us_page.dart';

class _ContactDetails extends StatelessWidget {
  const _ContactDetails({Key? key}) : super(key: key);

  final contactText = 'Have any questions? we\'d love to hear from you.';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BlocBuilder<ContactUsDetailsBloc, ContactUsDetailsState>(
          buildWhen: (previous, current) =>
              previous.isLoading != current.isLoading,
          builder: (context, state) {
            final email =
                context.read<EligibilityBloc>().state.salesOrg.isValid()
                    ? state.contactUsDetails.postloginSendToEmail
                    : state.contactUsDetails.preloginSendToEmail;

            return state.isLoading
                ? LoadingShimmer.logo(
                    key: WidgetKeys.loaderImage,
                  )
                : Column(
                    children: [
                      Html(
                        key: WidgetKeys.contactDetailsSectionKey,
                        style: {
                          'body': Style(
                            padding: const EdgeInsets.all(0),
                            margin: const EdgeInsets.all(0),
                          ),
                        },
                        data: state.contactUsDetails.content
                            .appendedImgSrcWithBaseUrlWithMedia,
                        shrinkWrap: true,
                      ),
                      _ContactItem(
                        key: WidgetKeys.genericKey(
                          key: email,
                        ),
                        label: email,
                        icon: Icons.mail_outline,
                        onTap: () => _sendEmail(
                          email,
                          context
                              .read<EligibilityBloc>()
                              .state
                              .salesOrg
                              .contactPersonName,
                        ),
                      ),
                    ],
                  );
          },
        ),
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
}

class _ContactItem extends StatelessWidget {
  const _ContactItem({
    Key? key,
    required this.label,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 12,
      ),
      child: GestureDetector(
        onTap: () => onTap(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 24,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                label,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: ZPColors.extraDarkGreen,
                    ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
