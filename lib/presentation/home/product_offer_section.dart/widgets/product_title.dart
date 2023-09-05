part of 'package:ezrxmobile/presentation/home/product_offer_section.dart/product_offer_section.dart';

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
              margin: const EdgeInsets.all(10.0),
              child: ListTile(
                contentPadding: const EdgeInsets.all(8),
                title: Row(
                  children: [
                    CustomCard(
                      showBorder: true,
                      showShadow: false,
                      padding: const EdgeInsets.all(
                        10,
                      ),
                      child: ProductImage(
                        width: MediaQuery.of(context).size.height * 0.06,
                        height: 50,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _PriceLabel(product: materialInfo),
                              FavouriteIcon(
                                isFavourite: materialInfo.isFavourite,
                                visualDensity: const VisualDensity(
                                  horizontal: -4,
                                  vertical: -4,
                                ),
                                onTap: () {
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
    final eligibilityBlocState = context.read<EligibilityBloc>().state;
    context.read<ProductDetailBloc>().add(
          ProductDetailEvent.fetch(
            materialNumber: materialInfo.materialNumber,
            locale: context.locale,
            type: materialInfo.type,
          ),
        );
    context.router.pushNamed('orders/material_details');
    context.read<MaterialPriceBloc>().add(
          MaterialPriceEvent.fetch(
            salesOrganisation: eligibilityBlocState.salesOrganisation,
            salesConfigs: eligibilityBlocState.salesOrgConfigs,
            customerCodeInfo: eligibilityBlocState.customerCodeInfo,
            shipToInfo: eligibilityBlocState.shipToInfo,
            comboDealEligible: eligibilityBlocState.comboDealEligible,
            materials: [materialInfo],
          ),
        );
  }
}
