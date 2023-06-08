import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MoreTab extends StatelessWidget {
  const MoreTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: const Key('morePage'),
        title: const Text('More').tr(),
        automaticallyImplyLeading: false,
      ),
      body: Container(),
    );
  }
}
