import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

final scaffoldKey = GlobalKey<ScaffoldState>();

class RequestReturnDetails extends StatelessWidget {
  const RequestReturnDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Request Return Details').tr(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [],
      ),
    );
  }
}
