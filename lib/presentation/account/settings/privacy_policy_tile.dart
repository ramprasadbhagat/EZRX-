import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';

final _config = locator<Config>();

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: const Key('Privacy_Policy'),
      leading: const Icon(Icons.policy_outlined),
      title: const Text('Privacy Policy').tr(),
      onTap: () => context.router.push(
        WebViewPageRoute(
          url: _config.getPrivacyUrl,
          initialFile: _config.getPrivacyInitialFile,
        ),
      ),
    );
  }
}
