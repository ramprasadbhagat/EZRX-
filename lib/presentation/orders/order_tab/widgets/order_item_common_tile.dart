import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/covid_tag.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class OrderItemCommonTile extends StatelessWidget {
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final String label;
  final Widget priceComponentSubtitle;
  final Widget footerWidget;
  final bool showOfferTag;
  final Widget statusWidget;
  final String quantity;
  final MaterialNumber materialNumber;
  final bool isCovidItem;
  final bool showBundleTag;
  final String materialDescription;
  final Widget tenderContractSection;
  final Widget batchExpiryDate;
  final String sellerName;
  final StatusType statusTag;
  const OrderItemCommonTile({
    super.key,
    this.onTap,
    this.padding,
    required this.label,
    required this.priceComponentSubtitle,
    required this.footerWidget,
    this.showOfferTag = false,
    required this.statusWidget,
    required this.quantity,
    required this.materialNumber,
    this.isCovidItem = false,
    this.showBundleTag = false,
    this.sellerName = '',
    required this.materialDescription,
    required this.tenderContractSection,
    required this.batchExpiryDate,
    required this.statusTag,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        onTap: onTap,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: statusWidget,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ImageBox(
                    quantity: quantity,
                    materialNumber: materialNumber,
                    isCovidItem: isCovidItem,
                    showOfferTag: showOfferTag,
                    showBundleTag: showBundleTag,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 8, 10, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  label,
                                  key: WidgetKeys.commonTileItemLabel,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                              if (statusTag.isStatusTagValid) ...[
                                const SizedBox(width: 5),
                                StatusLabel(
                                  key: WidgetKeys.commonTileItemStatusLabel,
                                  status: statusTag,
                                  valueColor: statusTag.displayStatusTextColor,
                                ),
                              ],
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              materialDescription,
                              key: WidgetKeys.commonTileItemTitle,
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ),
                          batchExpiryDate,
                          if (sellerName.isNotEmpty)
                            Text(
                              sellerName,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: ZPColors.neutralsGrey1,
                                    fontSize: 10,
                                  ),
                            ),
                          priceComponentSubtitle,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            const Divider(
              endIndent: 0,
              indent: 0,
              height: 8,
              color: ZPColors.lightGray2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: footerWidget,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: tenderContractSection,
            ),
          ],
        ),
      ),
    );
  }
}

class _ImageBox extends StatelessWidget {
  const _ImageBox({
    required this.quantity,
    required this.materialNumber,
    required this.isCovidItem,
    required this.showOfferTag,
    required this.showBundleTag,
  });
  final bool isCovidItem;
  final bool showOfferTag;
  final bool showBundleTag;
  final String quantity;
  final MaterialNumber materialNumber;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      showBorder: true,
      showShadow: false,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.fromLTRB(0, 7, 8, 0),
      child: Stack(
        children: [
          ProductImage(
            materialNumber: materialNumber,
            fit: BoxFit.fitHeight,
            width: 80,
            height: 80,
          ),
          if (showOfferTag) ProductTag.onOfferIcon(),
          if (showBundleTag) ProductTag.bundleOfferIcon(),
          if (isCovidItem)
            Positioned(
              top: MediaQuery.of(context).size.height * 0.055,
              child: const CovidTag(),
            ),
        ],
      ),
    );
  }
}
