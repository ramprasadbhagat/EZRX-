import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';

class EzrxAplLogo extends StatelessWidget {
  const EzrxAplLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20.0),
      alignment: Alignment.center,
      child: SvgPicture.asset(
        SvgImage.ezrxapl,
      ),
    );
  }
}
