import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TabViewPage extends StatelessWidget {
  final int length;
  final List<String> tabHeaderText;
  final List<Widget> tabWidgets;

  const TabViewPage({
    Key? key,
    required this.length,
    required this.tabHeaderText,
    required this.tabWidgets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: length,
      child: Column(
        children: [
          TabBar(tabs: tabHeaderText.map((e) => Tab(text: e.tr())).toList()),
          Expanded(child: TabBarView(children: tabWidgets)),
        ],
      ),
    );
  }
}
