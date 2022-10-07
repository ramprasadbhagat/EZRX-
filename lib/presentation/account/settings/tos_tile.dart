import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';

class Tos extends StatelessWidget {
  const Tos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: const Key('tostile'),
      leading: const Icon(Icons.policy_outlined),
      title: Text('Tos'.tr()),
      onTap: () => context.router.push(AupTCDialogRoute(fromSetting: true)),
    );
  }
}
