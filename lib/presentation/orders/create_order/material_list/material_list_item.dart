import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/orders/combo_deal/widgets/combo_deal_label.dart';
import 'package:ezrxmobile/presentation/orders/create_order/bonus_discount_label.dart';
import 'package:ezrxmobile/presentation/core/custom_small_button.dart';
import 'package:ezrxmobile/presentation/orders/create_order/favorite_button.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/cart_bottom_sheet.dart';
import 'package:flutter_svg/svg.dart';

class MaterialListItem extends StatelessWidget {
  final MaterialInfo materialInfo;
  final SalesOrganisationConfigs salesOrgConfigs;

  const MaterialListItem({
    Key? key,
    required this.materialInfo,
    required this.salesOrgConfigs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        key: Key(
          'materialOption${materialInfo.materialNumber.getOrDefaultValue('')}',
        ),
        onTap: () => _showMaterialDetail(context),
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SvgPicture.asset(
                'assets/svg/default_product_image.svg',
                key: const ValueKey('addToCartProductImage'),
                height: 70,
                fit: BoxFit.fitHeight,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    materialInfo.materialDescription,
                    style: Theme.of(context).textTheme.titleSmall?.apply(
                          color: ZPColors.kPrimaryColor,
                        ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        materialInfo.materialNumber.displayMatNo,
                        style: Theme.of(context).textTheme.titleSmall?.apply(
                              color: ZPColors.lightGray,
                            ),
                      ),
                      BlocBuilder<MaterialPriceBloc, MaterialPriceState>(
                        buildWhen: (previous, current) =>
                            previous.isFetching != current.isFetching,
                        builder: (context, state) {
                          final price = state
                              .getPriceForMaterial(materialInfo.materialNumber);
            
                          return BonusDiscountLabel(
                            materialInfo: materialInfo,
                            price: price,
                            tenderContractNumber: 'Tender Contract',
                          );
                        },
                      ),
                    ],
                  ),
                  (salesOrgConfigs.enableDefaultMD &&
                          materialInfo.defaultMaterialDescription.isNotEmpty)
                      ? Text(
                          materialInfo.defaultMaterialDescription,
                          key: Key(
                            'defaultMaterialDescription${materialInfo.materialNumber.getOrDefaultValue('')}',
                          ),
                          style: Theme.of(context).textTheme.titleSmall?.apply(
                                color: ZPColors.lightGray,
                              ),
                        )
                      : const SizedBox.shrink(),
                  (salesOrgConfigs.enableIRN &&
                          materialInfo.itemRegistrationNumber.isNotEmpty)
                      ? Text(
                          materialInfo.itemRegistrationNumber,
                          key: Key(
                            'registrationNumber${materialInfo.materialNumber.getOrDefaultValue('')}',
                          ),
                          style: Theme.of(context).textTheme.titleSmall?.apply(
                                color: ZPColors.lightGray,
                              ),
                        )
                      : const SizedBox.shrink(),
                  if (salesOrgConfigs.enableGMN &&
                      materialInfo.genericMaterialName.isNotEmpty)
                    Text(
                      materialInfo.genericMaterialName,
                      key: Key(
                        'genericMaterial${materialInfo.materialNumber.getOrDefaultValue('')}',
                      ),
                      style: Theme.of(context).textTheme.titleSmall?.apply(
                            color: ZPColors.lightGray,
                          ),
                    ),
                  Text(
                    materialInfo.principalData.principalName
                        .getOrDefaultValue(''),
                    style: Theme.of(context).textTheme.titleSmall?.apply(
                          color: ZPColors.lightGray,
                        ),
                  ),
                  _GovermentMaterialCode(
                    materialInfo: materialInfo,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: _PriceLabel(materialInfo: materialInfo)),
                      Row(
                        children: [
                          FavoriteButton(
                            key: Key(
                              'favoriteButtonKey${materialInfo.materialNumber.displayMatNo}',
                            ),
                            materialInfo: materialInfo,
                          ),
                          CustomSmallButton(
                            onPressed: () => _showMaterialDetail(context),
                            text: 'Add'.tr(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  BlocBuilder<EligibilityBloc, EligibilityState>(
                    buildWhen: (previous, current) =>
                        previous.comboDealEligible != current.comboDealEligible,
                    builder: (context, eligibilityState) {
                      return BlocBuilder<MaterialPriceBloc, MaterialPriceState>(
                        buildWhen: (previous, current) =>
                            previous.isFetching != current.isFetching,
                        builder: (context, state) {
                          final price = state
                              .getPriceForMaterial(materialInfo.materialNumber);
            
                          return price.comboDeal.isAvailable &&
                                  eligibilityState.comboDealEligible
                              ? GestureDetector(
                                  onTap: () {
                                    _showComboDeal(
                                      context: context,
                                      price: price,
                                    );
                                  },
                                  child: const ComboDealLabel(),
                                )
                              : const SizedBox();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMaterialDetail(BuildContext context) {
    final materialPrice = context
        .read<MaterialPriceBloc>()
        .state
        .materialPrice[materialInfo.materialNumber];

    if (materialPrice == null) {
      if (!salesOrgConfigs.materialWithoutPrice) {
        showSnackBar(
          context: context,
          message: 'Product Not Available'.tr(),
        );
      } else {
        showSnackBar(
          context: context,
          message: 'Price currently unavailable for this product.'.tr(),
        );
      }

      return;
    }

    final comboDealInCart = context.read<CartBloc>().state.getComboDealCartItem(
          comboDealQuery: materialPrice.comboDeal,
        );

    if (comboDealInCart.materials.isNotEmpty) {
      _showComboDeal(
        context: context,
        price: materialPrice,
      );

      return;
    }

    final mixpanelService = locator<MixpanelService>();

    CartBottomSheet.showAddToCartBottomSheet(
      context: context,
      priceAggregate: PriceAggregate(
        banner: mixpanelService.banner != BannerItem.empty()
            ? mixpanelService.banner
            : BannerItem.empty(),
        price: materialPrice,
        materialInfo: materialInfo,
        salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
        quantity: 1,
        bundle: Bundle.empty(),
        addedBonusList: [],
        stockInfo: StockInfo.empty().copyWith(
          materialNumber: materialInfo.materialNumber,
        ),
        tenderContract: TenderContract.empty(),
        comboDeal: ComboDeal.empty(),
      ),
    );
  }

  void _showComboDeal({
    required BuildContext context,
    required Price price,
  }) {
    final comboDealInCart = context.read<CartBloc>().state.getComboDealCartItem(
          comboDealQuery: price.comboDeal,
        );

    if (comboDealInCart.materials.isEmpty) {
      final comboDealType = price.comboDeal.category.type;
      if (comboDealType.isMaterialNumber) {
        final salesConfig = context.read<SalesOrgBloc>().state.configs;
        final materials = price.comboDeal.category.values
            .map(
              (item) => PriceAggregate.empty().copyWith(
                salesOrgConfig: salesConfig,
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber(item),
                ),
                price: Price.empty().copyWith(
                  materialNumber: MaterialNumber(item),
                  comboDeal: price.comboDeal,
                ),
              ),
            )
            .toList();

        context.router.push(
          ComboDealMaterialDetailPageRoute(
            comboItems: materials,
          ),
        );
      } else if (comboDealType.isPrinciple) {
        context.router.push(
          ComboDealPrincipleDetailPageRoute(
            comboDeal: price.comboDeal,
          ),
        );
      }
    } else {
      final priceComboDeal = comboDealInCart.materials.firstPriceComboDeal;
      final comboDealType = priceComboDeal.category.type;

      if (comboDealType.isMaterialNumber) {
        context.router.push(
          ComboDealMaterialDetailPageRoute(
            comboItems: comboDealInCart.materials,
            isEdit: true,
          ),
        );
      } else if (comboDealType.isPrinciple) {
        context.router.push(
          ComboDealPrincipleDetailPageRoute(
            comboDeal: priceComboDeal,
            initialComboItems: comboDealInCart.materials,
          ),
        );
      }
    }
  }
}

class _GovermentMaterialCode extends StatelessWidget {
  final MaterialInfo materialInfo;

  const _GovermentMaterialCode({Key? key, required this.materialInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesOrgBloc, SalesOrgState>(
      builder: (context, state) {
        return state.configs.enableGMC
            ? Text(
                '${'Government Material Code:'.tr()} ${materialInfo.governmentMaterialCode}',
                key: Key(
                  'governmentMaterialCode${materialInfo.governmentMaterialCode}',
                ),
                style: Theme.of(context).textTheme.titleSmall?.apply(
                      color: ZPColors.lightGray,
                    ),
                overflow: TextOverflow.ellipsis,
              )
            : const SizedBox.shrink();
      },
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
        final itemPrice = state.materialPrice[materialInfo.materialNumber];
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
              materialNumber: materialInfo.materialNumber,
            ),
            tenderContract: TenderContract.empty(),
            comboDeal: ComboDeal.empty(),
          );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              priceAggregate.taxDetails.isNotEmpty
                  ? Text(
                      priceAggregate.taxDetails,
                      key: Key(
                        'taxClassification${materialInfo.materialNumber.getOrDefaultValue('')}',
                      ),
                      style: Theme.of(context).textTheme.titleSmall?.apply(
                            color: ZPColors.lightGray,
                          ),
                    )
                  : const SizedBox.shrink(),
              context.read<SalesOrgBloc>().state.configs.enableVat
                  ? Text(
                      '${'Price before ${context.read<SalesOrgBloc>().state.salesOrg.taxCode}: '.tr()}${priceAggregate.display(PriceType.finalPrice)}',
                      key: Key(
                        'priceBefore${materialInfo.materialNumber.getOrDefaultValue('')}',
                      ),
                      style: Theme.of(context).textTheme.titleSmall?.apply(
                            color: ZPColors.lightGray,
                          ),
                    )
                  : const SizedBox.shrink(),
              context.read<SalesOrgBloc>().state.configs.enableListPrice
                  ? Text(
                      '${'List Price:'.tr()}${priceAggregate.display(PriceType.listPrice)}',
                      key: Key(
                        'listPrice${materialInfo.materialNumber.getOrDefaultValue('')}',
                      ),
                      style: Theme.of(context).textTheme.titleSmall?.apply(
                            color: ZPColors.lightGray,
                          ),
                    )
                  : const SizedBox.shrink(),
              Text(
                '${'Unit Price:'.tr()} ${priceAggregate.display(PriceType.unitPrice)}',
                style: Theme.of(context).textTheme.titleSmall?.apply(
                      color: ZPColors.black,
                    ),
              ),
            ],
          );
        }
        if (state.isFetching) {
          return SizedBox(
            key: const Key('price-loading'),
            width: 40,
            child: LoadingShimmer.tile(),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            context.read<SalesOrgBloc>().state.configs.enableListPrice
                ? Text(
                    '${'List Price:'.tr()}NA',
                    style: Theme.of(context).textTheme.titleSmall?.apply(
                          color: ZPColors.lightGray,
                        ),
                  )
                : const SizedBox.shrink(),
            Text(
              '${'Unit Price:'.tr()}NA',
              style: Theme.of(context).textTheme.titleSmall?.apply(
                    color: ZPColors.black,
                  ),
            ),
          ],
        );
      },
    );
  }
}
