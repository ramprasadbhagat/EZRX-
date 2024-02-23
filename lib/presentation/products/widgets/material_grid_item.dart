import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/favorite_icon.dart';
import 'package:ezrxmobile/presentation/core/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/product_price_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/widgets/combo_offer_label.dart';
import 'package:ezrxmobile/presentation/products/widgets/covid_label.dart';
import 'package:ezrxmobile/presentation/products/widgets/offer_label.dart';
import 'package:ezrxmobile/presentation/products/widgets/stock_label.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        margin: const EdgeInsets.all(8),
        child: Stack(
          children: [
            Column(
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
                            height: double.infinity,
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
                            ComboOfferLabel(
                              materialInfo: materialInfo,
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: CovidLabel(
                            materialInfo: materialInfo,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: FavouriteIcon(
                            isFavourite: materialInfo.isFavourite,
                            onTap: () {
                              if (!materialInfo.isFavourite) {
                                trackMixpanelEvent(
                                  MixpanelEvents.addProductToFavorite,
                                  props: {
                                    MixpanelProps.productName:
                                        materialInfo.displayDescription,
                                    MixpanelProps.productCode: materialInfo
                                        .materialNumber.displayMatNo,
                                    MixpanelProps.productManufacturer:
                                        materialInfo.getManufactured,
                                    MixpanelProps.clickAt:
                                        RouterUtils.buildRouteTrackingName(
                                      context.router.currentPath,
                                    ),
                                  },
                                );
                              }

                              onFavouriteTap.call();
                            },
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
                          materialInfo.combinationCode(
                            showGMCPart: context
                                .read<EligibilityBloc>()
                                .state
                                .salesOrgConfigs
                                .enableGMC,
                          ),
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: ZPColors.darkGray,
                                  ),
                          key: WidgetKeys.materialNumberText,
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              materialInfo.displayDescription,
                              key: WidgetKeys.nameCart,
                              style: Theme.of(context).textTheme.labelSmall,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Text(
                          (materialInfo.manufacturerPrefix.isNotEmpty
                                  ? '${context.tr(materialInfo.manufacturerPrefix)}: '
                                  : '') +
                              materialInfo.getManufactured,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: ZPColors.darkGray,
                                    fontSize: 10,
                                  ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          key: WidgetKeys.manufacturerMaterials,
                        ),
                        const SizedBox(height: 5),
                        ProductPriceLabel(materialInfo: materialInfo),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (materialInfo.isMarketPlace)
              const Positioned(
                top: 10,
                right: 10,
                child: MarketPlaceLogo(),
              ),
          ],
        ),
      ),
    );
  }
}
