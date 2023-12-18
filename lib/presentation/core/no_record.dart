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
    this.title = "That didn't match anything",
    this.subTitle =
        'Try adjusting your search or filter selection to find what you’re looking for',
    this.svgImage,
    this.isSearchKeyEmpty = true,
    this.actionButton = const SizedBox.shrink(),
    this.subTitleWidget,
  }) : super(key: key);
  final String title;
  final bool isSearchKeyEmpty;
  final String subTitle;
  final String? svgImage;
  final Widget actionButton;
  final Widget? subTitleWidget;

  factory NoRecordFound.ordersHistory(BuildContext context, String searchKey) =>
      NoRecordFound(
        title: 'No orders found',
        subTitle: searchKey.isNotEmpty
            ? 'Try adjusting your search or filter selection to find what you’re looking for'
            : 'Items ordered on eZRx+ will be shown here',
        svgImage: SvgImage.emptyBox,
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

  factory NoRecordFound.productTab(
    BuildContext context, {
    required bool isFavourite,
  }) =>
      isFavourite
          ? NoRecordFound(
              svgImage: SvgImage.emptyFavourite,
              title: 'No favourites yet',
              subTitleWidget: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: ZPColors.neutralsDarkBlack,
                      ),
                  children: [
                    TextSpan(
                      text: context.tr(
                        'Tap on',
                      ),
                    ),
                    const WidgetSpan(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4,
                        ),
                        child: Icon(
                          Icons.favorite_border_outlined,
                          color: ZPColors.darkYellow,
                        ),
                      ),
                    ),
                    TextSpan(
                      text: context.tr(
                        'to add an item to your favourites',
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const NoRecordFound();

  factory NoRecordFound.returnItems({
    required bool isSearchKeyEmpty,
  }) =>
      isSearchKeyEmpty
          ? const NoRecordFound(
              title: 'No return request to show',
              subTitle: 'Returns requested on eZRx+ will be shown here',
              svgImage: SvgImage.emptyBox,
            )
          : const NoRecordFound();
  factory NoRecordFound.newReturnItems({
    required bool isSearchKeyEmpty,
  }) =>
      isSearchKeyEmpty
          ? const NoRecordFound(
              title: 'No record found',
              subTitle:
                  'Items that may be selected for returns will be shown here.',
              svgImage: SvgImage.emptyBox,
            )
          : const NoRecordFound();

  factory NoRecordFound.newPaymentInvoices({
    required bool isSearchAndFilterEmpty,
  }) =>
      isSearchAndFilterEmpty
          ? const NoRecordFound(
              title: 'No available invoices',
              subTitle: 'Available invoices will be shown here',
              svgImage: SvgImage.emptyBox,
            )
          : const NoRecordFound();

  factory NoRecordFound.newPaymentCredits({
    required bool isSearchAndFilterEmpty,
  }) =>
      isSearchAndFilterEmpty
          ? const NoRecordFound(
              title: 'No available credits',
              subTitle: 'Available credit notes will be shown here',
              svgImage: SvgImage.emptyBox,
            )
          : const NoRecordFound();

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
          Text(
            context.tr(title),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: ZPColors.neutralsDarkBlack,
                ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 30),
            child: subTitleWidget ??
                Text(
                  '${context.tr(subTitle)}.',
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
