import 'package:flutter/material.dart';

class ColorContainer extends StatelessWidget {
  const ColorContainer({
    Key? key,
    this.widgetKey,
    this.margin = const EdgeInsets.all(16),
    required this.color,
    required this.children,
  }) : super(key: key);

  final Key? widgetKey;
  final EdgeInsetsGeometry margin;
  final Color color;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widgetKey,
      width: double.infinity,
      margin: margin,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
