import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/tender_contract_details_tile.dart';
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
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
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
                        'Material Description: '.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.apply(
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
                              ? Text(
                                  'NA',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.apply(
                                        color: ZPColors.darkerGreen,
                                      ),
                                )
                              : Flexible(
                                  child: Text(
                                    materialDescription,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.apply(
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
              title: 'Material Number'.tr(),
              info: Row(
                children: [
                  Text(
                    ': $materialNumber',
                    style: Theme.of(context).textTheme.titleSmall?.apply(
                          color: ZPColors.darkerGreen,
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
                            style:
                                Theme.of(context).textTheme.titleSmall?.apply(
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
            BalanceTextRow(
              keyText: 'Material Qty'.tr(),
              valueText: qty,
              keyFlex: 1,
              valueFlex: 1,
            ),
            _MaterialItemInfo(
              title:
                  'Price before ${context.read<SalesOrgBloc>().state.salesOrg.taxCode}'
                      .tr(),
              info: _MaterialPriceInfo(
                materialQueryInfo: materialQueryInfo,
                priceType: PriceType.finalPrice,
              ),
            ),
            _MaterialItemInfo(
              title: 'Unit Price: '.tr(),
              info: _MaterialPriceInfo(
                materialQueryInfo: materialQueryInfo,
                priceType: PriceType.unitPrice,
              ),
            ),
            if (materialQueryInfo.tenderContract != TenderContract.empty())
              TenderContractDetailsTile(
                tenderContract: materialQueryInfo.tenderContract,
              ),
            const SizedBox(height: 10),
            BlocBuilder<MaterialPriceDetailBloc, MaterialPriceDetailState>(
              buildWhen: (previous, current) =>
                  previous.isFetching != current.isFetching,
              builder: (context, state) {
                final itemInfo = state.materialDetails[materialQueryInfo];
                final hasValidTenderContract =
                    itemInfo?.info.hasValidTenderContract ?? true;

                return !hasValidTenderContract &&
                        materialQueryInfo.tenderContract !=
                            TenderContract.empty() &&
                        !state.isFetching
                    ? Text(
                        'This Tender Contract is no more available and will not be added to the cart',
                        style: Theme.of(context).textTheme.subtitle2?.apply(
                              color: ZPColors.red,
                            ),
                      )
                    : const SizedBox.shrink();
              },
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
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 2.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleSmall?.apply(
                    color: ZPColors.darkGray,
                  ),
            ),
          ),
          Expanded(
            child: info,
          ),
        ],
      ),
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
            bundle: Bundle.empty(),
            addedBonusList: [],
            stockInfo: StockInfo.empty(),
            tenderContract: TenderContract.empty(),
          );

          return Text(
            ': ${priceAggregate.display(priceType)}',
            style: Theme.of(context).textTheme.titleSmall?.apply(
                  color: ZPColors.darkerGreen,
                ),
          );
        }

        return Text(
          'NA',
          style: Theme.of(context).textTheme.titleSmall?.apply(
                color: ZPColors.darkerGreen,
              ),
        );
      },
    );
  }
}
