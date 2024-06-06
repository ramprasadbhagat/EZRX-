part of 'package:ezrxmobile/presentation/home/product_offer_section/product_offer_section.dart';

class _ProductTile extends StatelessWidget {
  final MaterialInfo materialInfo;
  const _ProductTile({required this.materialInfo});

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
                            materialInfo.combinationCode(
                              showGMCPart: context
                                  .read<EligibilityBloc>()
                                  .state
                                  .salesOrgConfigs
                                  .enableGMC,
                              showIRNPart: false,
                            ),
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: ZPColors.extraLightGrey4),
                          ),
                          PreOrderLabel(
                            stockInfo: materialInfo.productStockInfo,
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
                                child: ProductPriceLabel(
                                  materialInfo: materialInfo,
                                ),
                              ),
                              FavouriteIcon(
                                key: WidgetKeys.favIcon(
                                  materialInfo.materialNumber
                                      .getOrDefaultValue(''),
                                ),
                                isFavourite: materialInfo.isFavourite,
                                visualDensity: const VisualDensity(
                                  horizontal: -4,
                                  vertical: -4,
                                ),
                                onTap: () {
                                  if (materialInfo.isFavourite) {
                                    trackMixpanelEvent(
                                      TrackingEvents.addProductToFavorite,
                                      props: {
                                        TrackingProps.productName:
                                            materialInfo.displayDescription,
                                        TrackingProps.productNumber:
                                            materialInfo
                                                .materialNumber.displayMatNo,
                                        TrackingProps.productManufacturer:
                                            materialInfo.getManufactured,
                                        TrackingProps.clickAt:
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
      TrackingEvents.productItemClicked,
      props: {
        TrackingProps.clickAt:
            RouterUtils.buildRouteTrackingName(context.router.currentPath),
        TrackingProps.isBundle: false,
        TrackingProps.productName: materialInfo.displayDescription,
        TrackingProps.productNumber: materialInfo.materialNumber.displayMatNo,
        TrackingProps.productManufacturer: materialInfo.getManufactured,
        TrackingProps.section: 'Products on offer',
        TrackingProps.tag: 'On Offer',
      },
    );
    trackClevertapEvent(
      TrackingEvents.productItemClicked,
      props: {
        TrackingProps.clickAt:
            RouterUtils.buildRouteTrackingName(context.router.currentPath),
        TrackingProps.isBundle: false,
        TrackingProps.productName: materialInfo.displayDescription,
        TrackingProps.productNumber: materialInfo.materialNumber.displayMatNo,
        TrackingProps.productManufacturer: materialInfo.getManufactured,
        TrackingProps.tag: 'On Offer',
      },
    );

    context.router.push(ProductDetailsPageRoute(materialInfo: materialInfo));
  }
}
