import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';

class StatementSummaryPage extends StatelessWidget {
  const StatementSummaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        key: WidgetKeys.statementSummaryTab,
        child: const SizedBox.shrink(),
      ),
    );
  }
}
