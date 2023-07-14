import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoRecordFound extends StatelessWidget {
  const NoRecordFound({
    Key? key,
    this.title = '',
    this.subTitle =
        'Try adjusting your search or filter selection to find what you’re looking for.',
    this.svgImage = SvgImage.searchLogo,
    this.actionButton = const SizedBox.shrink(),
  }) : super(key: key);
  final String title;
  final String subTitle;
  final String svgImage;
  final Widget actionButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: SvgPicture.asset(
              svgImage,
              key: WidgetKeys.noRecordsFoundSearchIcon,
              height: 150,
            ),
          ),
          if (title.isNotEmpty)
            Text(
              title.tr(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: ZPColors.neutralsDarkBlack,
                  ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 30),
            child: Text(
              subTitle.tr(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: ZPColors.neutralsDarkBlack,
                  ),
            ),
          ),
          actionButton,
        ],
      ),
    );
  }
}
