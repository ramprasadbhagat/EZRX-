import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';

class ReturnsOverview extends StatelessWidget {
  const ReturnsOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    locator<CountlyService>().recordCountlyView('returns_overview');

    return Scaffold(
      appBar: AppBar(title: const Text('Returns Overview').tr()),
      body: Container(),
    );
  }
}
