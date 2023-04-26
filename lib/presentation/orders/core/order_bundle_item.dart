import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/material_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;

class OrderBundleItem extends StatelessWidget {
  final MaterialItem material;
  final String materialNumber;
  final String qty;
  const OrderBundleItem({
    Key? key,
    required this.material,
    required this.materialNumber,
    required this.qty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: custom.ExpansionTile(
        initiallyExpanded: true,
        threeLineTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: ZPColors.darkGray,
                    width: 2.0,
                  ),
                ),
              ),
              child: BlocBuilder<MaterialPriceDetailBloc,
                  MaterialPriceDetailState>(
                buildWhen: (previous, current) =>
                    previous.isFetching != current.isFetching,
                builder: (context, state) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Bundle Code: '.tr(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: ZPColors.darkerGreen,
                            ),
                          ),
                          state.isFetching || state.isValidating
                              ? SizedBox(
                                  key: const Key('material-description-key'),
                                  width: 100,
                                  child: LoadingShimmer.tile(),
                                )
                              : Flexible(
                                  child: Text(
                                    material.bundleCode,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: ZPColors.darkerGreen,
                                    ),
                                  ),
                                ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Bundle Name: '.tr(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: ZPColors.darkerGreen,
                            ),
                          ),
                          state.isFetching || state.isValidating
                              ? SizedBox(
                                  key: const Key('material-description-key'),
                                  width: 100,
                                  child: LoadingShimmer.tile(),
                                )
                              : Flexible(
                                  child: Text(
                                    stringTitleCase(material.bundleName),
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: ZPColors.darkerGreen,
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
        children: material.materials.map((material) {
          return Card(
            color: ZPColors.extraLightGray,
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 5),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Material Description:'.tr(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: ZPColors.darkerGreen,
                        ),
                      ),
                      BlocBuilder<MaterialPriceDetailBloc,
                          MaterialPriceDetailState>(
                        buildWhen: (previous, current) =>
                            previous.isFetching != current.isFetching ||
                            previous.isValidating != current.isValidating,
                        builder: (context, state) {
                          return state.isFetching || state.isValidating
                              ? SizedBox(
                                  key: const Key(
                                    'material-description-key',
                                  ),
                                  width: 100,
                                  child: LoadingShimmer.tile(),
                                )
                              : Flexible(
                                  child: Text(
                                    material.materialDescription,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: ZPColors.darkerGreen,
                                    ),
                                  ),
                                );
                        },
                      ),
                    ],
                  ),
                  _MaterialItemInfo(
                    title: 'Material Number:'.tr(),
                    info: Row(
                      children: [
                        Text(
                          material.materialNumber.displayMatNo,
                          style: const TextStyle(
                            color: ZPColors.darkerGreen,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        BlocBuilder<MaterialPriceDetailBloc,
                            MaterialPriceDetailState>(
                          buildWhen: (previous, current) =>
                              previous.isValidating != current.isValidating,
                          builder: (context, state) {
                            final isValidMaterial = state.isValidMaterial(
                              query: material.queryInfo,
                            );
                            if (!state.isValidating && !isValidMaterial) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: ZPColors.secondary,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'Invalid'.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: ZPColors.primary,
                                      ),
                                ),
                              );
                            }

                            return const SizedBox();
                          },
                        ),
                      ],
                    ),
                  ),
                  _MaterialItemInfo(
                    title: 'Material Qty:'.tr(),
                    info: Text(
                      material.quantity.toString(),
                      style: const TextStyle(
                        color: ZPColors.darkerGreen,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  _MaterialItemInfo(
                    title:
                        'Price before ${context.read<SalesOrgBloc>().state.salesOrg.taxCode}: '
                            .tr(),
                    info: _MaterialPriceInfo(
                      materialQueryInfo: material.queryInfo,
                      priceType: PriceType.finalPrice,
                    ),
                  ),
                  _MaterialItemInfo(
                    title: 'Unit Price:'.tr(),
                    info: _MaterialPriceInfo(
                      materialQueryInfo: material.queryInfo,
                      priceType: PriceType.unitPrice,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _MaterialItemInfo extends StatelessWidget {
  final String title;
  final Widget info;
  const _MaterialItemInfo({
    Key? key,
    required this.title,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                      color: ZPColors.darkerGreen,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[info],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _MaterialPriceInfo extends StatelessWidget {
  final MaterialQueryInfo materialQueryInfo;
  final PriceType priceType;
  const _MaterialPriceInfo({
    Key? key,
    required this.materialQueryInfo,
    required this.priceType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialPriceDetailBloc, MaterialPriceDetailState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching ||
          previous.isValidating != current.isValidating,
      builder: (context, state) {
        final itemInfo = state.materialDetails[materialQueryInfo];
        if (state.isFetching || state.isValidating) {
          return SizedBox(
            key: const Key('price-loading'),
            width: 40,
            child: LoadingShimmer.tile(),
          );
        }
        if (itemInfo != null) {
          final priceAggregate = PriceAggregate(
            banner: BannerItem.empty(),
            price: itemInfo.price,
            materialInfo: itemInfo.info,
            salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
            quantity: 1,
            discountedMaterialCount:
                context.read<CartBloc>().state.zmgMaterialCount(
                      itemMaterialGroup: itemInfo.info.materialGroup2,
                    ),
            bundle: Bundle.empty(),
            addedBonusList: [],
            stockInfo: StockInfo.empty(),
            tenderContract: TenderContract.empty(),
            comboDeal: ComboDeal.empty(),
          );

          return Text(
            priceAggregate.display(priceType),
            style: const TextStyle(
              color: ZPColors.darkerGreen,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          );
        }

        return const Text(
          'NA',
          style: TextStyle(
            color: ZPColors.darkerGreen,
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
          ),
        );
      },
    );
  }
}
