import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderMaterialItem extends StatelessWidget {
  final MaterialQueryInfo materialQueryInfo;

  final String materialNumber;
  final String qty;
  const OrderMaterialItem({
    Key? key,
    required this.materialQueryInfo,
    required this.materialNumber,
    required this.qty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      margin: const EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
                  final itemInfo = state.materialDetails[materialQueryInfo];
                  final materialDescription =
                      itemInfo?.info.materialDescription ?? '';

                  return Row(
                    children: [
                       Text(
                        'Material Description:'.tr(),
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
                          : itemInfo == null
                              ? const Text(
                                  'NA',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: ZPColors.darkerGreen,
                                  ),
                                )
                              : Flexible(
                                  child: Text(
                                    materialDescription,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: ZPColors.darkerGreen,
                                    ),
                                  ),
                                ),
                    ],
                  );
                },
              ),
            ),
            _MaterialItemInfo(
              title: 'Material Number:'.tr(),
              info: Row(
                children: [
                  Text(
                    materialNumber,
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
                        query: materialQueryInfo,
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
                            style: const TextStyle(
                              color: ZPColors.primary,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
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
                qty,
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
                materialQueryInfo: materialQueryInfo,
                priceType: PriceType.unitPriceBeforeGst,
              ),
            ),
            _MaterialItemInfo(
              title: 'Unit Price: '.tr(),
              info: _MaterialPriceInfo(
                materialQueryInfo: materialQueryInfo,
                priceType: PriceType.unitPrice,
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
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
        const SizedBox(height: 10),
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
            price: itemInfo.price,
            materialInfo: itemInfo.info,
            salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
            quantity: 1,
            discountedMaterialCount:
                context.read<CartBloc>().state.zmgMaterialCount,
            isOverride: false,
            bundle: Bundle.empty(),
            addedBonusList: [],
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
