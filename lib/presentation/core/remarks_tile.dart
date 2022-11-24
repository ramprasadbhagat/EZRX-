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
    final messageTextGroup = Flexible(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: CustomPaint(
                painter: Triangle(ZPColors.green),
              ),
            ),
            Flexible(
              child: Container(
                padding: const EdgeInsets.only(left: 8),
                decoration: const BoxDecoration(
                  color: ZPColors.green,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(18),
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        title: Text(
                          message,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Monstserrat',
                            fontSize: 14,
                          ),
                        ),
                        trailing: showEditDeleteDialog,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 8, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          const SizedBox(height: 30),
          messageTextGroup,
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
