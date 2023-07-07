import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BundleGridItem extends StatelessWidget {
  final MaterialInfo materialInfo;

  const BundleGridItem({
    required this.materialInfo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      key: WidgetKeys.materialListBundleCard,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          Container(
            color: ZPColors.blueTagColor,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  materialInfo.materialNumber.displayMatNo,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ZPColors.darkGray,
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    materialInfo.displayDescription,
                    style: Theme.of(context).textTheme.labelSmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
              ],
            ),
          ),
          Column(
            children: materialInfo.listingVisibleMaterial
                .map((e) => _BundleMaterial(materialData: e))
                .toList(),
          ),
          materialInfo.isMaterialHiddenOnListing
              ? Text(
                  '+ ${materialInfo.listingHiddenMaterialCount} Materials',
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 1,
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class _BundleMaterial extends StatelessWidget {
  final MaterialData materialData;

  const _BundleMaterial({
    required this.materialData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      key: WidgetKeys.materialListBundleMaterial(
        materialData.code.getOrDefaultValue(''),
      ),
      children: [
        CustomCard(
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
          padding: const EdgeInsets.all(5.0),
          showShadow: false,
          showBorder: true,
          child: SvgPicture.asset(
            'assets/svg/product_default.svg',
            height: MediaQuery.of(context).size.height * 0.02,
            width: MediaQuery.of(context).size.height * 0.02,
          ),
        ),
        Expanded(
          child: Text(
            materialData.displayDescription,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
