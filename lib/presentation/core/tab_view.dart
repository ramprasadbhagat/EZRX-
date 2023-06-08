import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TabViewPage extends StatelessWidget {
  final List<String> tabHeaderText;
  final List<Widget> tabWidgets;
  final TabController tabController;

  const TabViewPage({
    Key? key,
    required this.tabHeaderText,
    required this.tabWidgets,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: tabController,
          tabs: tabHeaderText
              .map((e) => Tab(key: Key(e.toLowerCase()), text: e.tr()))
              .toList(),
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: tabWidgets,
          ),
        ),
      ],
    );
  }
}
