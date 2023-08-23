import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';

class NewRequestSuccessfulPage extends StatelessWidget {
  const NewRequestSuccessfulPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: cover UI in another ticket
    return Scaffold(
      key: WidgetKeys.newRequestSuccessfulPage,
      appBar: AppBar(
        centerTitle: false,
        title: Text('Return request submitted'.tr()),
      ),
      body: Center(
        child: Text('Return request submitted'.tr()),
      ),
    );
  }
}
