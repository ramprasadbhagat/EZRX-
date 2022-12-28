import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';

class RequestReturn extends StatelessWidget {
  const RequestReturn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    locator<CountlyService>().recordCountlyView('request_return');

    return Scaffold(
      appBar: AppBar(title: const Text('Request Return').tr()),
      body: Container(),
    );
  }
}
