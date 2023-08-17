import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/favorite_icon.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/product_price_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/widgets/offer_label.dart';
import 'package:ezrxmobile/presentation/products/widgets/stock_label.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class MaterialGridItem extends StatelessWidget {
  final MaterialInfo materialInfo;
  final VoidCallback onTap;
  final VoidCallback onFavouriteTap;

  const MaterialGridItem({
    required this.materialInfo,
    required this.onTap,
    required this.onFavouriteTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomCard(
        clipBehavior: Clip.antiAlias,
        key: WidgetKeys.materialListMaterialCard,
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 3),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: ColoredBox(
                color: ZPColors.white,
                child: Stack(
                  children: [
                    Center(
                      child: ProductImage(
                        materialNumber: materialInfo.materialNumber,
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OfferLabel(
                          materialInfo: materialInfo,
                        ),
                        StockLabel(
                          materialInfo: materialInfo,
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: FavouriteIcon(
                        isFavourite: materialInfo.isFavourite,
                        onTap: onFavouriteTap,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      materialInfo.materialNumber.displayMatNo,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ZPColors.darkGray,
                          ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          materialInfo.displayDescription,
                          style: Theme.of(context).textTheme.labelSmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Text(
                      materialInfo.getManufactured,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ZPColors.darkGray,
                            fontSize: 10,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    ProductPriceLabel(materialInfo: materialInfo),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
