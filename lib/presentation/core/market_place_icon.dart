import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MarketPlaceIcon extends StatelessWidget {
  final double width;
  final double height;
  const MarketPlaceIcon({Key? key, this.width = 20, this.height = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: SvgPicture.asset(
        SvgImage.marketplaceIcon,
        fit: BoxFit.fill,
      ),
    );
  }
}
