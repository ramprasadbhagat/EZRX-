import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/curved_rectangle_widget.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/widgets/bundle_material_descriptions_sheet.dart';
import 'package:ezrxmobile/presentation/products/widgets/favorite_icon.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/presentation/products/widgets/bundle_add_to_cart_sheet.dart';

class BundleDetailPage extends StatelessWidget {
  const BundleDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.bundleDetailPage,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          const _BundleImagesSection(),
          const Align(
            alignment: Alignment.topLeft,
            child: _BundleOfferTag(),
          ),
          const _BundleDetails(),
          const SizedBox(height: 10),
          const Divider(
            indent: 0,
            endIndent: 0,
            height: 15,
            color: ZPColors.lightGray2,
          ),
          _BundleOfferDetails(),
        ],
      ),
      bottomNavigationBar: const _AddToCartButton(),
    );
  }
}

// Need To remove this after Images Implementation
class _BundleImagesSection extends StatelessWidget {
  const _BundleImagesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      fallbackHeight: 300,
    );
  }
}

class _BundleDetails extends StatelessWidget {
  const _BundleDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '11007178',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Bundle - Promotion A',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              FavouriteIcon(
                materialInfo: MaterialInfo.empty(),
              ),
            ],
          ),
          Text(
            'MYR 44.00 per item',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}

class _BundleOfferDetails extends StatelessWidget {
  _BundleOfferDetails({Key? key}) : super(key: key);

  //Please remove this after integrating with api //
  final listOffers = <BundleOffer>[
    BundleOffer(
      rate: '12.00',
      minQty: '70',
    ),
    BundleOffer(
      rate: '22.00',
      minQty: '30',
    ),
    BundleOffer(
      rate: '31.00',
      minQty: '15',
    ),
    BundleOffer(
      rate: '44.00',
      minQty: '10',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            minLeadingWidth: 5,
            isThreeLine: true,
            leading: const Icon(
              Icons.discount_outlined,
            ),
            title: Text(
              'Bundle offer'.tr(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            subtitle: Text(
              'Mix and match bundled products and buy more for better deals.'
                  .tr(),
            ),
          ),
          CurvedRectangleWidget(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            semiCircleCount: 8,
            semiCircleRadius: 16,
            width: double.infinity,
            backgroundColor: ZPColors.lightBlueColor,
            borderColor: ZPColors.lightBlueBorderColor,
            child: Column(
              children: listOffers.map((e) {
                return BalanceTextRow(
                  keyFlex: 3,
                  keyText: 'MYR ${e.rate} per item',
                  keyTextStyle: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontWeight: FontWeight.w600),
                  valueFlex: 4,
                  valueText: 'Total purchase quantity:${e.minQty} or more',
                  valueTextStyle: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: ZPColors.darkGray),
                );
              }).toList(),
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(top: 10, bottom: 20),
            title: Text(
              'Material information'.tr(),
              style: Theme.of(context).textTheme.labelMedium,
            ),
            subtitle: const Text(
              'Bundle code, Manufacturer, Country of origin',
            ),
            trailing: IconButton(
              onPressed: () {
                _showMaterialDescriptionSheet(context: context);
              },
              icon: const Icon(Icons.chevron_right),
            ),
          ),
        ],
      ),
    );
  }

  void _showMaterialDescriptionSheet({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      builder: (_) {
        return const BundleMaterialDescription();
      },
    );
  }
}

//Please remove this after integrating api //
class BundleOffer {
  final String rate;
  final String minQty;
  BundleOffer({required this.rate, required this.minQty});
}

class _BundleOfferTag extends StatelessWidget {
  const _BundleOfferTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: const BoxDecoration(
        color: ZPColors.skyBlueColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.discount_outlined,
            color: ZPColors.white,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            'Bundle offer'.tr(),
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: ZPColors.white),
          ),
        ],
      ),
    );
  }
}

class _AddToCartButton extends StatelessWidget {
  const _AddToCartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: () {
          _showBundleAddToCartBottomSheet(
            context: context,
          );
        },
        child: Text('Add to cart'.tr()),
      ),
    );
  }

  void _showBundleAddToCartBottomSheet({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (_) {
        return const BundlesAddToCartSheet();
      },
    );
  }
}
