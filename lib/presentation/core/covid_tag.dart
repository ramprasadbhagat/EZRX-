import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CovidTag extends StatelessWidget {
  const CovidTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 3,
      ),
      decoration: const BoxDecoration(
        color: ZPColors.invoiceStatusBlue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
        ),
      ),
      child: SvgPicture.asset(
        SvgImage.coronavirus,
      ),
    );
  }
}
