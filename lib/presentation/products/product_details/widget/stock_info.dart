import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductStockInfo extends StatelessWidget {
  final MaterialNumber materialNumber;
  const ProductStockInfo({
    Key? key,
    required this.materialNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      buildWhen: (previous, current) =>
          current.productDetailAggregate.stockInfo !=
              previous.productDetailAggregate.stockInfo ||
          current.isDetailAndStockFetching != previous.isDetailAndStockFetching,
      builder: (context, state) {
        final stockInfo = state.productDetailAggregate.stockInfo;
        final eligibilityState = context.read<EligibilityBloc>().state;

        if (state.isDetailAndStockFetching) {
          return SizedBox(
            width: 100,
            child: LoadingShimmer.tile(),
          );
        }

        return stockInfo.batchExpiryDateAvailable
            ? Padding(
                key: WidgetKeys.materialDetailsStock,
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: RichText(
                  text: TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: ZPColors.darkGray),
                    children: [
                      if (eligibilityState.salesOrg.showBatchNumber)
                        TextSpan(
                          text:
                              '${context.tr('Batch')}: ${state.displayBatchNumber} ',
                        ),
                      if (eligibilityState.salesOrgConfigs.expiryDateDisplay)
                        TextSpan(
                          text:
                              '(${context.tr('EXP')}: ${state.displayExpiryDate})',
                        ),
                    ],
                  ),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
