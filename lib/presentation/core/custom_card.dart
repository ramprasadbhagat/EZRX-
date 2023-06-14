import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  const CustomCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
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
