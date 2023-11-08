import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/banner/entities/ez_reach_banner.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/bonus_sample_item.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_material_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPriceLabel extends StatelessWidget {
  final MaterialInfo materialInfo;

  const ProductPriceLabel({Key? key, required this.materialInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialPriceBloc, MaterialPriceState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching ||
          previous.materialPrice != current.materialPrice,
      builder: (context, state) {
        final itemPrice = state.materialPrice[materialInfo.materialNumber];
        final salesOrgConfig =
            context.read<EligibilityBloc>().state.salesOrgConfigs;
        if (itemPrice != null) {
          final priceAggregate = PriceAggregate(
            banner: EZReachBanner.empty(),
            price: itemPrice,
            materialInfo: materialInfo,
            salesOrgConfig: salesOrgConfig,
            quantity: materialInfo.quantity.intValue == 0
                ? 1
                : materialInfo.quantity.intValue,
            // TODO: will revisit and enhance this
            discountedMaterialCount: itemPrice.zmgDiscount
                ? context.watch<CartBloc>().state.zmgMaterialsQty(
                      materialInfo.materialGroup2,
                    )
                : context.read<CartBloc>().state.zmgMaterialsQty(
                      materialInfo.materialGroup2,
                    ),
            bundle: Bundle.empty(),
            addedBonusList: [],
            stockInfo: StockInfo.empty().copyWith(
              materialNumber: materialInfo.materialNumber,
            ),
            tenderContract: TenderContract.empty(),
            comboDeal: ComboDeal.empty(),
            bonusSampleItems: <BonusSampleItem>[],
            comboMaterials: <ComboMaterialItem>[],
          );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (priceAggregate.zdp5PriceDisplay)
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: PriceComponent(
                    price: priceAggregate.displayZdp5Price,
                    salesOrgConfig: salesOrgConfig,
                  ),
                ),
              PriceComponent(
                type: priceAggregate.zdp5PriceDisplay
                    ? PriceStyle.counterOfferPrice
                    : PriceStyle.commonPrice,
                price: priceAggregate.display(PriceType.unitPrice),
                salesOrgConfig: salesOrgConfig,
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
            Text(
              context.tr('Price Not Available'),
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
