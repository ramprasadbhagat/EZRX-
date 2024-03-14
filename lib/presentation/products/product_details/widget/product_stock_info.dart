import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/products/widgets/stock_info.dart';
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

        if (state.isDetailAndStockFetching) {
          return SizedBox(
            width: 100,
            child: LoadingShimmer.tile(),
          );
        }

        return StockInfoWidget(
          stockInfo: stockInfo,
          materialInfo: state.productDetailAggregate.materialInfo,
        );
      },
    );
  }
}
