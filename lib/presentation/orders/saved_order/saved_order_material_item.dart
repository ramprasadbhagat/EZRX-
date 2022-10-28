import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedOrderMaterialItem extends StatelessWidget {
  const SavedOrderMaterialItem({
    Key? key,
    required this.material,
  }) : super(key: key);

  final MaterialItem material;

  MaterialQueryInfo get itemPriceQuery => MaterialQueryInfo.fromSavedOrder(
        orderMaterial: material,
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
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
            child: Text(
              'Material Description: ${material.materialDescription}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: ZPColors.darkerGreen,
              ),
            ),
          ),
          _MaterialItemInfo(
            title: 'Material Number: '.tr(),
            info: Text(
              material.materialNumber.displayMatNo,
              style: const TextStyle(
                color: ZPColors.darkerGreen,
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          _MaterialItemInfo(
            title: 'Material Qty: '.tr(),
            info: Text(
              material.qty.toString(),
              style: const TextStyle(
                color: ZPColors.darkerGreen,
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          _MaterialItemInfo(
            title: 'Unit Price: '.tr(),
            info:
                BlocBuilder<MaterialPriceDetailBloc, MaterialPriceDetailState>(
              buildWhen: (previous, current) =>
                  previous.materialDetails[itemPriceQuery] !=
                  current.materialDetails[itemPriceQuery],
              builder: (context, state) {
                final itemInfo = state.materialDetails[itemPriceQuery]?.price;

                if (itemInfo != null) {
                  final currentCurrency =
                      context.read<SalesOrgBloc>().state.configs.currency;
                  final isHidePrice = material.hidePrice;

                  return Text(
                    itemInfo.finalPrice.displayWithCurrency(
                      currency: currentCurrency,
                      hidePrice: isHidePrice,
                    ),
                    style: const TextStyle(
                      color: ZPColors.darkerGreen,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  );
                }
                if (state.isFetching) {
                  return SizedBox(
                    key: const Key('price-loading'),
                    width: 40,
                    child: LoadingShimmer.tile(),
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
            ),
          ),
          const SizedBox(height: 5),
        ],
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
