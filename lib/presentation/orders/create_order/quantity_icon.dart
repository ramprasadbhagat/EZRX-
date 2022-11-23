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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: const Size(20, 20),
        padding: EdgeInsets.zero,
      ),
      child: Icon(
        icon,
        color: ZPColors.white,
        size: 15,
      ),
      onPressed: () => pressed(),
    );
  }
}