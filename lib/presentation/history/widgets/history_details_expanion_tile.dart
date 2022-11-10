import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomExpansionTile extends StatelessWidget {
  final String titleText;
  final List<Widget> items;

  const CustomExpansionTile({
    Key? key,
    required this.titleText,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const titleStyle = TextStyle(
      fontSize: 16.0,
      color: ZPColors.darkerGreen,
      fontWeight: FontWeight.w600,
    );

    return ExpansionTile(
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      tilePadding: EdgeInsets.zero,
      initiallyExpanded: true,
      iconColor: ZPColors.darkerGreen,
      title: Text(
        titleText,
        style: titleStyle,
      ),
      children: items,
    );
  }
}
