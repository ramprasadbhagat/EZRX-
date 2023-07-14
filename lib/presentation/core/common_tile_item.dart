import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class CommonTileItem extends StatelessWidget {
  const CommonTileItem({
    Key? key,
    required this.label,
    required this.materialNumber,
    required this.title,
    required this.subtitle,
    required this.headerText,
    required this.statusWidget,
    required this.quantity,
    required this.isQuantityBelowImage,
    this.tag = '',
    this.footerWidget,
    required this.priceComponent,
    this.isQuantityRequired = true,
  }) : super(key: key);

  final String label;
  final MaterialNumber materialNumber;
  final String title;
  final String subtitle;
  final String headerText;
  final Widget priceComponent;
  final Widget statusWidget;
  final String quantity;
  final bool isQuantityBelowImage;
  final String tag;
  final Widget? footerWidget;
  final bool isQuantityRequired;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
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
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            tag.isNotEmpty
                                ? Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Chip(
                                      label: Text(
                                        tag,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(
                                              color: ZPColors.white,
                                            ),
                                      ).tr(),
                                      visualDensity: const VisualDensity(
                                        horizontal: -4,
                                        vertical: -4,
                                      ),
                                      backgroundColor: ZPColors.darkerGreen,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      labelPadding: const EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            title,
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
                          isPriceComponent: true,
                          priceComponent: priceComponent,
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
    required this.isPriceComponent,
  }) : super(key: key);

  final String tileBody3;
  final bool isQuantityBelowImage;
  final String quantity;
  final Widget priceComponent;
  final bool isPriceComponent;

  @override
  Widget build(BuildContext context) {
    return isQuantityBelowImage
        ? isPriceComponent
            ? priceComponent
            : Text(
                tileBody3,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: ZPColors.darkerGrey,
                    ),
              )
        : Row(
            children: [
              Expanded(
                child: isPriceComponent
                    ? priceComponent
                    : Text(
                        tileBody3,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: ZPColors.darkGray,
                              fontSize: 10,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
              ),
              Text(
                'Qty: $quantity',
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
    required this.header,
    required this.statusWidget,
  }) : super(key: key);

  final String header;
  final Widget statusWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                header,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: ZPColors.darkerGrey,
                    ),
              ),
            ],
          ),
        ),
        statusWidget,
      ],
    );
  }
}

class _ImageBox extends StatelessWidget {
  const _ImageBox({
    required this.isQuantityBelowImage,
    required this.quantity,
    required this.materialNumber,
  });
  final bool isQuantityBelowImage;
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
                child: ProductImage(
                  width: MediaQuery.of(context).size.height * 0.06,
                  height: MediaQuery.of(context).size.height * 0.06,
                  fit: BoxFit.fitHeight,
                  materialNumber: materialNumber,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Qty: $quantity',
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
            margin: const EdgeInsets.fromLTRB(0, 10, 8, 0),
            child: ProductImage(
              width: MediaQuery.of(context).size.height * 0.06,
              height: MediaQuery.of(context).size.height * 0.06,
              materialNumber: materialNumber,
              fit: BoxFit.fitHeight,
            ),
          );
  }
}