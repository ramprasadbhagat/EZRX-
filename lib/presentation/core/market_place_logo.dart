import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MarketPlaceLogo extends StatelessWidget {
  final double? width;
  final double? height;
  const MarketPlaceLogo({Key? key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 24,
      height: height ?? 24,
      child: SvgPicture.asset(
        SvgImage.marketPlaceLogo,
        fit: BoxFit.fill,
      ),
    );
  }

  factory MarketPlaceLogo.small() {
    return const MarketPlaceLogo(
      width: 18,
      height: 18,
    );
  }
}
