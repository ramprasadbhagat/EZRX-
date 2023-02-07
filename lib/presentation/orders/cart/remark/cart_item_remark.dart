import 'dart:math' as math;

import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class RemarksMessage extends StatelessWidget {
  final String message;
  final Widget showEditDeleteDialog;

  const RemarksMessage({
    Key? key,
    required this.message,
    required this.showEditDeleteDialog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, top: 5, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: CustomPaint(
              painter: Triangle(ZPColors.darkGray),
            ),
          ),
          Flexible(
            child: ListTile(
              contentPadding: const EdgeInsets.only(left: 15),
              tileColor: ZPColors.darkGray,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(18),
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
              ),
              dense: true,
              title: Text(
                message,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.apply(color: ZPColors.white),
              ),
              trailing: showEditDeleteDialog,
            ),
          ),
        ],
      ),
    );
  }
}

class Triangle extends CustomPainter {
  final Color bgColor;

  Triangle(this.bgColor);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = bgColor;

    final path = Path();
    path.lineTo(-5, 0);
    path.lineTo(0, 10);
    path.lineTo(5, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
