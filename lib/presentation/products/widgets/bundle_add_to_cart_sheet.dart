import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/info_label.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_quantity_input.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BundlesAddToCartSheet extends StatelessWidget {
  const BundlesAddToCartSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: WidgetKeys.bundleAddToCartSheet,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add bundle to cart'.tr(),
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const InfoLabel(
            textValue:
                'Please note that the minimum total purchase quantity for this bundle offer is 10.',
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return const _BundleMaterialListTile();
              },
            ),
          ),
          const _BundleSheetFooter(),
        ],
      ),
    );
  }
}

class _BundleMaterialListTile extends StatelessWidget {
  const _BundleMaterialListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      key: WidgetKeys.bundleMaterialListItem,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCard(
          margin: const EdgeInsets.only(bottom: 15),
          padding: const EdgeInsets.all(5),
          showShadow: false,
          showBorder: true,
          child: CachedNetworkImage(
            //provide image url here
            imageUrl: '',
            height: MediaQuery.of(context).size.height * .09,
            width: MediaQuery.of(context).size.width * .20,
            fit: BoxFit.fitHeight,
            placeholder: (context, url) {
              return LoadingShimmer.withChild(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8.0),
                      topLeft: Radius.circular(8.0),
                    ),
                    color: ZPColors.white,
                  ),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.20,
                ),
              );
            },
            errorWidget: (context, url, error) {
              return SvgPicture.asset(
                'assets/svg/product_small.svg',
                fit: BoxFit.fitHeight,
              );
            },
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '11007178',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 5),
              Text(
                'Exforge Tab 160/5mg 28s (2x14)',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(height: 8),
              CartItemQuantityInput(
                isEnabled: true,
                quantityAddKey: WidgetKeys.bundleInputAddKey,
                quantityDeleteKey: WidgetKeys.bundleInputDeleteKey,
                quantityTextKey: WidgetKeys.bundleQuantityTextKey,
                controller: TextEditingController(text: '0'),
                onFieldChange: (value) {},
                minusPressed: (k) {},
                addPressed: (k) {},
                isLoading: false,
                returnZeroOnFieldEmpty: true,
                minimumQty: 1,
                maximumQty: 999999,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BundleSheetFooter extends StatelessWidget {
  const _BundleSheetFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: ZPColors.lightGray,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total quantity: 0',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            'MYR 44.00 per item',
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: ZPColors.skyBlueColor),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    context.router.pop();
                  },
                  child: Text('Cancel'.tr()),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Add to cart'.tr()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
