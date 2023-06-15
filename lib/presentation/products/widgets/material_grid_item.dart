import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/widgets/favorite_icon.dart';
import 'package:ezrxmobile/presentation/products/widgets/stock_label.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MaterialGridItem extends StatelessWidget {
  final MaterialInfo materialInfo;
  const MaterialGridItem({
    required this.materialInfo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      key: WidgetKeys.materialListMaterialCard,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Center(
                  child: SvgPicture.asset(
                    'assets/svg/product_default.svg',
                    fit: BoxFit.fill,
                  ),
                ),
                StockLabel(
                  materialInfo: materialInfo,
                ),
                const Align(
                  alignment: Alignment.bottomRight,
                  child: FavouriteIcon(),
                ),
              ],
            ),
          ),
          const Divider(
            indent: 0,
            endIndent: 0,
            height: 15,
            color: ZPColors.accentColor,
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    materialInfo.code.displayMatNo,
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
                    materialInfo.manufactured,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ZPColors.darkGray,
                          fontSize: 10,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'MYR 00.00',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
