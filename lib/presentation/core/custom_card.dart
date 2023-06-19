import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final bool showShadow;
  final bool showBorder;
  const CustomCard({
    Key? key,
    required this.child,
    this.margin = const EdgeInsets.only(bottom: 20.0),
    this.padding = const EdgeInsets.symmetric(vertical: 0.0),
    this.showShadow = true,
    this.showBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: showBorder
            ? Border.all(color: ZPColors.boxShadowGray, width: 1.5)
            : null,
        boxShadow: showShadow
            ? [
                const BoxShadow(
                  blurRadius: 5,
                  spreadRadius: 2,
                  color: ZPColors.boxShadowGray,
                ),
              ]
            : null,
        color: ZPColors.white,
      ),
      child: child,
    );
  }
}
