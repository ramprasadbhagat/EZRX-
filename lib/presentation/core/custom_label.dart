import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {
  final Color mainColor;
  final Color textColor;
  final double radius;
  final double height;
  final String textValue;
  const CustomLabel({
    Key? key,
    this.radius = 10,
    this.height = 16,
    this.mainColor = ZPColors.secondary,
    this.textColor = ZPColors.kPrimaryColor,
    required this.textValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      child: FittedBox(
        child: Text(
          textValue,
          style: Theme.of(context).textTheme.titleSmall?.apply(
                color: textColor,
              ),
        ),
      ),
    );
  }
}
