import 'package:easy_localization/easy_localization.dart';
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
          previous.productDetailAggregate.stockInfo,
      builder: (context, state) {
        final stockInfo = state.productDetailAggregate.stockInfo;
        if (state.isFetching) {
          return SizedBox(
            width: 100,
            child: LoadingShimmer.tile(),
          );
        }
        
        return stockInfo.batchExpiryDateAvailable
            ? Padding(
                key: WidgetKeys.materialDetailsStock,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: RichText(
                  text: TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: ZPColors.darkGray),
                    children: [
                      stockInfo.batch.isValid()
                          ? TextSpan(
                              text:
                                  '${'Batch'.tr()} ${stockInfo.batch.getOrDefaultValue('')} ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: ZPColors.darkGray),
                            )
                          : const WidgetSpan(child: SizedBox.shrink()),
                      stockInfo.expiryDate.isValid()
                          ? TextSpan(
                              text:
                                  '(${'EXP'.tr()}: ${stockInfo.expiryDate.dateString})',
                            )
                          : const WidgetSpan(child: SizedBox.shrink()),
                    ],
                  ),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
