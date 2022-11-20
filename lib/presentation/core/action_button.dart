import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final void Function() onTap;
  final double width;
  final double height;
  const ActionButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.width = 50,
    this.height = 23,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          gradient: const LinearGradient(
            colors: [
              ZPColors.primary,
              ZPColors.gradient,
            ],
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            color: ZPColors.white,
            fontWeight: FontWeight.bold,
          ),
        ).tr(),
      ),
    );
  }
}
