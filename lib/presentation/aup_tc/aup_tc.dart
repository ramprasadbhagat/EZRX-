import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/aup_tc/aup_tc_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/static_html_viewer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';

class AupTCDialog extends StatelessWidget {
  const AupTCDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AupTcBloc, AupTcState>(
      buildWhen: (previous, current) =>
          previous.tncFile != current.tncFile ||
          previous.privacyFile != current.privacyFile,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            key: const ValueKey('auptcappBar'),
            title: SvgPicture.asset(
              'assets/svg/ezrx+logo.svg',
              height: 30,
              fit: BoxFit.scaleDown,
            ),
            automaticallyImplyLeading: false,
          ),
          body: AnnouncementBanner(
            currentPath: context.router.currentPath,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.tr('Welcome to eZRx+'),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    context.tr(
                      'As a new user of eZRx+, we will require you to acknowledge the Terms of Use and Regional Privacy Policy before proceeding.',
                    ),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: _ConsentBox(
                      url: state.tncFile,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: _ConsentBox(
                      url: state.privacyFile,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const _TermsOfUseConsentCheckBox(),
                  const SizedBox(
                    height: 5,
                  ),
                  const _PrivacyPolicyConsentCheckBox(),
                ],
              ),
            ),
          ),
          bottomNavigationBar: const AcceptButton(),
        );
      },
    );
  }
}

class _TermsOfUseConsentCheckBox extends StatelessWidget {
  const _TermsOfUseConsentCheckBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AupTcBloc, AupTcState>(
      buildWhen: (previous, current) =>
          previous.tncConsent != current.tncConsent,
      builder: (context, state) {
        return CheckboxListTile(
          contentPadding: const EdgeInsets.all(0),
          value: state.tncConsent,
          title: Text(
            context.tr('I have read and hereby agree to the Terms of Use'),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: ZPColors.darkerGrey,
                ),
          ),
          onChanged: (value) {
            context.read<AupTcBloc>().add(
                  AupTcEvent.termsOfUseConsent(
                    newValue: value!,
                  ),
                );
          },
          visualDensity: VisualDensity.compact,
          controlAffinity: ListTileControlAffinity.leading,
        );
      },
    );
  }
}

class _PrivacyPolicyConsentCheckBox extends StatelessWidget {
  const _PrivacyPolicyConsentCheckBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AupTcBloc, AupTcState>(
      buildWhen: (previous, current) =>
          previous.privacyConsent != current.privacyConsent,
      builder: (context, state) {
        return CheckboxListTile(
          contentPadding: const EdgeInsets.all(0),
          value: state.privacyConsent,
          title: Text(
            context.tr(
              'I have read and hereby consent to Zuellig Pharma and its affiliates processing my personal data in accordance with the Regional Privacy Policy.',
            ),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: ZPColors.darkerGrey,
                ),
          ),
          onChanged: (value) {
            context.read<AupTcBloc>().add(
                  AupTcEvent.privacyPolicyConsent(
                    newValue: value!,
                  ),
                );
          },
          visualDensity: VisualDensity.compact,
          controlAffinity: ListTileControlAffinity.leading,
        );
      },
    );
  }
}

class _ConsentBox extends StatelessWidget {
  const _ConsentBox({
    Key? key,
    required this.url,
  }) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      height: MediaQuery.of(context).size.height * .20,
      decoration: BoxDecoration(
        color: ZPColors.white,
        border: Border.all(
          color: ZPColors.lightGray,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: StaticHtmlViewer(
        key: WidgetKeys.aupTcWebView,
        htmlPath: url,
        styleCss: styleCss,
      ),
    );
  }

  String get styleCss {
    return '''
      var style = document.createElement('style');
      style.innerHTML = 'body { padding: 3.5rem !important; padding-top: 0rem !important; align-items: center; justify-content: center;}';
      document.head.appendChild(style);
    ''';
  }
}

class AcceptButton extends StatelessWidget {
  const AcceptButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AupTcBloc, AupTcState>(
      buildWhen: (previous, current) =>
          current.privacyConsent && current.tncConsent ||
          !current.privacyConsent ||
          !current.tncConsent,
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  key: const ValueKey('auptcAcceptButton'),
                  onPressed: () {
                    if (!state.tncConsent && !state.privacyConsent) {
                      CustomSnackBar(
                        messageText:
                            'You need to read and accept full Terms of use and Privacy Policy before continue.'
                                .tr(),
                      ).show(context);
                    } else {
                      context.read<UserBloc>().add(
                            const UserEvent.acceptTnc(),
                          );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(350, 40),
                    backgroundColor: state.tncConsent && state.privacyConsent
                        ? ZPColors.primary
                        : ZPColors.unselectedLabelColor,
                  ),
                  child: Text(
                    context.tr('Accept and continue'),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(
                          const AuthEvent.logout(),
                        );
                  },
                  child: Text(
                    context.tr('Cancel'),
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: ZPColors.orange,
                        ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
