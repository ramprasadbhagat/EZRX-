import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';

class PolicyConfiguration extends StatelessWidget {
  const PolicyConfiguration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    locator<CountlyService>().recordCountlyView('policy_configuration');

    return Scaffold(
      appBar: AppBar(title: const Text('Policy Configuration').tr()),
      body: Container(),
    );
  }
}
