import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoRecordFound extends StatelessWidget {
  const NoRecordFound({
    Key? key,
    this.title = '',
    this.subTitle =
        'Try adjusting your search or filter selection to find what you’re looking for.',
    this.svgImage,
    this.actionButton = const SizedBox.shrink(),
    this.subTitleWidget,
  }) : super(key: key);
  final String title;
  final String subTitle;
  final String? svgImage;
  final Widget actionButton;
  final Widget? subTitleWidget;

  factory NoRecordFound.ordersHistory(BuildContext context) => NoRecordFound(
        title: 'No past orders to show',
        subTitle: 'Items ordered on eZRx+ will be shown here',
        svgImage: SvgImage.emptyOrder,
        actionButton: ElevatedButton(
          key: WidgetKeys.startBrowsingViewByItem,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(
              double.maxFinite,
              50,
            ),
          ),
          onPressed: () => context.navigateTo(const ProductsTabRoute()),
          child: Text(context.tr('Start browsing')),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: SvgPicture.asset(
              svgImage ?? SvgImage.searchLogo,
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
            child: subTitleWidget ??
                Text(
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
