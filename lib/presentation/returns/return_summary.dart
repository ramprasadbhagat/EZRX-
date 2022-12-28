import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';

class ReturnSummary extends StatelessWidget {
  const ReturnSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    locator<CountlyService>().recordCountlyView('return_summary');

    return Scaffold(
      appBar: AppBar(title: const Text('Return Summary').tr()),
      body: Container(),
    );
  }
}
