import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/widgets/favorite_icon.dart';
import 'package:ezrxmobile/presentation/products/widgets/stock_label.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';

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
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: ColoredBox(
              color: ZPColors.extraLightGrey3,
              child: Stack(
                children: [
                  Center(
                    child: CachedNetworkImage(
                      imageUrl: materialInfo.productImage,
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
                          'assets/svg/product_default.svg',
                          fit: BoxFit.fill,
                        );
                      },
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
                  _PriceLabel(materialInfo: materialInfo),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PriceLabel extends StatelessWidget {
  final MaterialInfo materialInfo;

  const _PriceLabel({Key? key, required this.materialInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialPriceBloc, MaterialPriceState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching,
      builder: (context, state) {
        final itemPrice = state.materialPrice[materialInfo.code];
        if (itemPrice != null) {
          final priceAggregate = PriceAggregate(
            banner: BannerItem.empty(),
            price: itemPrice,
            materialInfo: materialInfo,
            salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
            quantity: 1,
            // TODO: will revisit and enhance this
            discountedMaterialCount: itemPrice.zmgDiscount
                ? context.watch<CartBloc>().state.zmgMaterialCount(
                      itemMaterialGroup: materialInfo.materialGroup2,
                    )
                : context.read<CartBloc>().state.zmgMaterialCount(
                      itemMaterialGroup: materialInfo.materialGroup2,
                    ),
            bundle: Bundle.empty(),
            addedBonusList: [],
            stockInfo: StockInfo.empty().copyWith(
              materialNumber: materialInfo.code,
            ),
            tenderContract: TenderContract.empty(),
            comboDeal: ComboDeal.empty(),
          );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // priceAggregate.taxDetails.isNotEmpty
              //     ? Text(
              //   priceAggregate.taxDetails,
              //   key: Key(
              //     'taxClassification${materialInfo.materialNumber.getOrDefaultValue('')}',
              //   ),
              //   style: Theme.of(context).textTheme.titleSmall?.apply(
              //     color: ZPColors.lightGray,
              //   ),
              // )
              //     : const SizedBox.shrink(),
              // context.read<SalesOrgBloc>().state.configs.enableVat
              //     ? Text(
              //   '${'Price before ${context.read<SalesOrgBloc>().state.salesOrg.taxCode}: '.tr()}${priceAggregate.display(PriceType.finalPrice).tr()}',
              //   key: Key(
              //     'priceBefore${materialInfo.materialNumber.getOrDefaultValue('')}',
              //   ),
              //   style: Theme.of(context).textTheme.titleSmall?.apply(
              //     color: ZPColors.lightGray,
              //   ),
              // )
              //     : const SizedBox.shrink(),
              // context.read<SalesOrgBloc>().state.configs.enableListPrice
              //     ? Text(
              //   '${'List Price:'.tr()}${priceAggregate.display(PriceType.listPrice).tr()}',
              //   key: Key(
              //     'listPrice${materialInfo.materialNumber.getOrDefaultValue('')}',
              //   ),
              //   style: Theme.of(context).textTheme.titleSmall?.apply(
              //     color: ZPColors.lightGray,
              //   ),
              // )
              //     : const SizedBox.shrink(),
              Text(
                priceAggregate.display(PriceType.unitPrice).tr(),
                style: Theme.of(context).textTheme.labelMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          );
        }
        if (state.isFetching) {
          return SizedBox(
            key: WidgetKeys.priceLoading,
            width: 40,
            child: LoadingShimmer.tile(),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // context.read<SalesOrgBloc>().state.configs.enableListPrice
            //     ? Text(
            //   '${'List Price:'.tr()}NA',
            //   style: Theme.of(context).textTheme.titleSmall?.apply(
            //     color: ZPColors.lightGray,
            //   ),
            // )
            //     : const SizedBox.shrink(),
            Text(
              'Price Not Available'.tr(),
              style: Theme.of(context).textTheme.labelMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        );
      },
    );
  }
}
