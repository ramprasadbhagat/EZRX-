import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MarketPlaceLogo extends StatelessWidget {
  const MarketPlaceLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: SvgPicture.asset(
        SvgImage.marketPlaceLogo,
        fit: BoxFit.fill,
      ),
    );
  }
}
