import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets margin;
  final EdgeInsets padding;
  const CustomCard({
    Key? key,
    required this.child,
    this.margin = const EdgeInsets.only(bottom: 20.0),
    this.padding = const EdgeInsets.symmetric(vertical: 10.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            spreadRadius: 2,
            color: ZPColors.boxShadowGray,
          ),
        ],
        color: ZPColors.white,
      ),
      child: child,
    );
  }
}
