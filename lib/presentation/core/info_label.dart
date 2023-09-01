import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class InfoLabel extends StatelessWidget {
  final Color mainColor;
  final Color textColor;
  final double radius;
  final String textValue;
  final EdgeInsets margin;
  const InfoLabel({
    Key? key,
    this.radius = 5,
    this.mainColor = ZPColors.lightBlueColor,
    this.textColor = ZPColors.black,
    required this.textValue,
    this.margin = const EdgeInsets.symmetric(vertical: 16),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      child: Text(textValue, style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
