import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';

class UserRestriction extends StatelessWidget {
  const UserRestriction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    locator<CountlyService>().recordCountlyView('user_restriction');

    return Scaffold(
      appBar: AppBar(title: const Text('User Restriction').tr()),
      body: Container(),
    );
  }
}
