import 'package:flutter/material.dart';

class MaterialFrameWrapper extends StatelessWidget {
  final Widget child;

  const MaterialFrameWrapper({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MediaQuery(
        data: const MediaQueryData(size: Size(480, 900)),
        child: child,
      ),
    );
  }
}
