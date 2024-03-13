import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:ezrxmobile/presentation/products/widgets/material_grid_item.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final MaterialInfo material;
  final Key widgetKey;
  final String section;
  final bool isSimilarProduct;
  final Function() onFavouriteTap;
  const ProductCard({
    Key? key,
    this.isSimilarProduct = false,
    required this.widgetKey,
    required this.material,
    required this.section,
    required this.onFavouriteTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Responsive.isLargerThan(context, Breakpoint.desktop)
          ? MediaQuery.of(context).size.width * 0.25
          : MediaQuery.of(context).size.width * 0.45,
      child: MaterialGridItem(
        key: widgetKey,
        materialInfo: material,
        onTap: () => _productOnTap(context, material),
        onFavouriteTap: onFavouriteTap,
      ),
    );
  }

  void _productOnTap(BuildContext context, MaterialInfo materialInfo) {
    trackMixpanelEvent(
      MixpanelEvents.productItemClicked,
      props: {
        MixpanelProps.clickAt:
            RouterUtils.buildRouteTrackingName(context.router.currentPath),
        MixpanelProps.isBundle: false,
        MixpanelProps.productName: materialInfo.displayDescription,
        MixpanelProps.productCode: materialInfo.materialNumber.displayMatNo,
        MixpanelProps.productManufacturer: materialInfo.getManufactured,
        MixpanelProps.section: section,
      },
    );
    context.router.push(ProductDetailsPageRoute(materialInfo: materialInfo));
  }
}
