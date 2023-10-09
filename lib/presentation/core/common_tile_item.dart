import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/covid_tag.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class CommonTileItem extends StatelessWidget {
  const CommonTileItem({
    Key? key,
    required this.label,
    required this.materialNumber,
    required this.title,
    required this.subtitle,
    required this.quantity,
    required this.isQuantityBelowImage,
    this.headerText,
    this.statusWidget,
    this.statusTag,
    this.footerWidget,
    this.priceComponent,
    this.isQuantityRequired = true,
    this.onTap,
    this.isCovidItem = false,
  }) : super(key: key);

  final String label;
  final MaterialNumber materialNumber;
  final String title;
  final String subtitle;
  final String? headerText;
  final Widget? priceComponent;
  final Widget? statusWidget;
  final String quantity;
  final bool isQuantityBelowImage;
  final StatusType? statusTag;
  final Widget? footerWidget;
  final bool isQuantityRequired;
  final bool isCovidItem;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: ListTile(
        onTap: onTap,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _HeaderItem(
              header: headerText,
              statusWidget: statusWidget,
            ),
            Row(
              children: [
                _ImageBox(
                  isQuantityBelowImage:
                      isQuantityRequired ? isQuantityBelowImage : false,
                  quantity: quantity,
                  materialNumber: materialNumber,
                  isCovidItem: isCovidItem,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              label,
                              key: WidgetKeys.commonTileItemLabel,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            if (statusTag != null &&
                                statusTag!
                                    .getOrDefaultValue('')
                                    .isNotEmpty) ...[
                              const SizedBox(
                                width: 5,
                              ),
                              StatusLabel(
                                key: WidgetKeys.commonTileItemStatusLabel,
                                status: statusTag!,
                                valueColor: statusTag!.displayStatusTextColor,
                              ),
                            ],
                            if (headerText == null && statusWidget != null) ...[
                              const Spacer(),
                              statusWidget!,
                            ],
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            title,
                            key: WidgetKeys.commonTileItemTitle,
                            style: Theme.of(context).textTheme.labelMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        _Subtitle(
                          tileBody3: subtitle,
                          isQuantityBelowImage:
                              isQuantityRequired ? isQuantityBelowImage : true,
                          quantity: quantity,
                          priceComponent:
                              priceComponent ?? const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (footerWidget != null) const SizedBox(height: 5),
            if (footerWidget != null) footerWidget!,
          ],
        ),
      ),
    );
  }
}

class _Subtitle extends StatelessWidget {
  const _Subtitle({
    Key? key,
    required this.tileBody3,
    required this.isQuantityBelowImage,
    required this.quantity,
    required this.priceComponent,
  }) : super(key: key);

  final String tileBody3;
  final bool isQuantityBelowImage;
  final String quantity;
  final Widget priceComponent;

  @override
  Widget build(BuildContext context) {
    return isQuantityBelowImage
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              priceComponent,
              Text(
                tileBody3,
                key: WidgetKeys.commonTileItemSubTitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: ZPColors.darkerGrey,
                    ),
              ),
            ],
          )
        : Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    priceComponent,
                    Text(
                      tileBody3,
                      key: WidgetKeys.commonTileItemSubTitle,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ZPColors.darkGray,
                            fontSize: 10,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Text(
                '${context.tr('Qty')}: $quantity',
                key: WidgetKeys.commonTileItemQty,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.black,
                    ),
              ),
            ],
          );
  }
}

class _HeaderItem extends StatelessWidget {
  const _HeaderItem({
    Key? key,
    this.header,
    this.statusWidget,
  }) : super(key: key);

  final String? header;
  final Widget? statusWidget;

  @override
  Widget build(BuildContext context) {
    final headerText = header ?? '';
    if (headerText.isEmpty && statusWidget == null) {
      return const SizedBox.shrink();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                headerText,
                key: WidgetKeys.commonTileItemHeader,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: ZPColors.darkerGrey,
                    ),
              ),
            ],
          ),
        ),
        statusWidget ?? const SizedBox.shrink(),
      ],
    );
  }
}

class _ImageBox extends StatelessWidget {
  const _ImageBox({
    required this.isQuantityBelowImage,
    required this.quantity,
    required this.materialNumber,
    required this.isCovidItem,
  });
  final bool isQuantityBelowImage;
  final bool isCovidItem;
  final String quantity;
  final MaterialNumber materialNumber;

  @override
  Widget build(BuildContext context) {
    return isQuantityBelowImage
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCard(
                showBorder: true,
                showShadow: false,
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.fromLTRB(0, 10, 8, 0),
                child: Stack(
                  children: [
                    ProductImage(
                      fit: BoxFit.fitHeight,
                      materialNumber: materialNumber,
                    ),
                    if (isCovidItem)
                      const Positioned(
                        bottom: 20,
                        child: CovidTag(),
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Qty: $quantity',
                key: WidgetKeys.commonTileItemQty,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ],
          )
        : CustomCard(
            showBorder: true,
            showShadow: false,
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
            child: Stack(
              children: [
                ProductImage(
                  materialNumber: materialNumber,
                  fit: BoxFit.fitHeight,
                ),
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
