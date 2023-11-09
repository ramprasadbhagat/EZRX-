part of 'package:ezrxmobile/presentation/home/product_offer_section/product_offer_section.dart';

class _ProductTile extends StatelessWidget {
  final MaterialInfo materialInfo;
  const _ProductTile({Key? key, required this.materialInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _navigateToDetails(context, materialInfo),
      child: SizedBox(
        width: Responsive.isMobile(context)
            ? MediaQuery.of(context).size.width * 0.9
            : MediaQuery.of(context).size.width * 0.45,
        child: Stack(
          children: [
            CustomCard(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                key: WidgetKeys.productOnOffer,
                contentPadding: const EdgeInsets.all(8),
                title: Row(
                  children: [
                    CustomCard(
                      showBorder: true,
                      showShadow: false,
                      child: ProductImage(
                        key: WidgetKeys.materialNumberInfo,
                        materialNumber: materialInfo.materialNumber,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            materialInfo.materialNumber.displayMatNo,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: ZPColors.extraLightGrey4),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              materialInfo.name,
                              style: Theme.of(context).textTheme.labelSmall,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            materialInfo.getManufactured,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: ZPColors.extraLightGrey4,
                                      fontSize: 10,
                                    ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: _PriceLabel(product: materialInfo),
                              ),
                              FavouriteIcon(
                                isFavourite: materialInfo.isFavourite,
                                visualDensity: const VisualDensity(
                                  horizontal: -4,
                                  vertical: -4,
                                ),
                                onTap: () {
                                  if (materialInfo.isFavourite) {
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
                                  materialInfo.isFavourite
                                      ? context.read<MaterialListBloc>().add(
                                            MaterialListEvent.deleteFavourite(
                                              item: materialInfo,
                                            ),
                                          )
                                      : context.read<MaterialListBloc>().add(
                                            MaterialListEvent.addFavourite(
                                              item: materialInfo,
                                            ),
                                          );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const IconLabel(
              key: WidgetKeys.iconLabelOffer,
              icon: Icons.local_offer_outlined,
              backgroundColor: ZPColors.darkYellow,
              iconSize: 23,
              labelText: '',
              margin: EdgeInsets.only(left: 10, top: 10),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToDetails(BuildContext context, MaterialInfo materialInfo) {
    trackMixpanelEvent(
      MixpanelEvents.productItemClicked,
      props: {
        MixpanelProps.clickAt:
            RouterUtils.buildRouteTrackingName(context.router.currentPath),
        MixpanelProps.isBundle: false,
        MixpanelProps.productName: materialInfo.displayDescription,
        MixpanelProps.productCode: materialInfo.materialNumber.displayMatNo,
        MixpanelProps.productManufacturer: materialInfo.getManufactured,
        MixpanelProps.section: 'Products on offer',
      },
    );
    final eligibilityBlocState = context.read<EligibilityBloc>().state;
    context.read<ProductDetailBloc>().add(
          ProductDetailEvent.fetch(
            materialNumber: materialInfo.materialNumber,
            locale: context.locale,
            type: materialInfo.type,
          ),
        );
    if (eligibilityBlocState.isZDP5eligible) {
      context.read<MaterialPriceBloc>().add(
            MaterialPriceEvent.fetchPriceForZDP5Materials(
              materialInfo: materialInfo,
            ),
          );
    }
    context.router.pushNamed('orders/material_details');
    context.read<MaterialPriceBloc>().add(
          MaterialPriceEvent.fetch(
            comboDealEligible: eligibilityBlocState.comboDealEligible,
            materials: [materialInfo],
          ),
        );
  }
}
