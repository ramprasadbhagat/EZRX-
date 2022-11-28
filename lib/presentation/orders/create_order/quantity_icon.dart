import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class QuantityIcon extends StatelessWidget {
  final Function pressed;
  final IconData icon;
  const QuantityIcon({
    Key? key,
    required this.pressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 23,
      width: 23,
      margin: const EdgeInsets.all(6),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: ZPColors.primary,
        ),
        child: Icon(
          icon,
          color: ZPColors.white,
          size: 15,
        ),
        onPressed: () => pressed(),
      ),
    );
  }
}
