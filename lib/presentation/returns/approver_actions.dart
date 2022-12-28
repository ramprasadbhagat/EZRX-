import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';

class ApproverActions extends StatelessWidget {
  const ApproverActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    locator<CountlyService>().recordCountlyView('approver_actions');

    return Scaffold(
      appBar: AppBar(title: const Text('Approver Actions').tr()),
      body: Container(),
    );
  }
}
