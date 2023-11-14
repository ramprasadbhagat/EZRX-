import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/order/entities/apl_product.dart';

part 'apl_simulator_order.freezed.dart';

@freezed
class AplSimulatorOrder with _$AplSimulatorOrder {
  const AplSimulatorOrder._();

  const factory AplSimulatorOrder({
    required double totalPriceWithoutTax,
    required double smallOrderFee,
    required double grandTotal,
    required double totalTax,
    required double totalDiscountValue,
    required List<AplProduct> aplProducts,
  }) = _AplSimulatorOrder;

  factory AplSimulatorOrder.empty() => const AplSimulatorOrder(
        totalPriceWithoutTax: 0,
        smallOrderFee: 0,
        grandTotal: 0,
        totalTax: 0,
        totalDiscountValue: 0,
        aplProducts: <AplProduct>[],
      );

  List<PriceAggregate> toCartItemList(List<PriceAggregate> cartItemDetails) {
    final list = <PriceAggregate>[];

    for (final product in aplProducts) {
      final index = aplProducts.indexOf(product);
      final cartItemDetail = cartItemDetails[index];
      if (product.materialNumber ==
          cartItemDetail.materialInfo.materialNumber) {
        list.add(product.toPriceAggregate(cartItemDetail));
      }
    }

    return list;
  }

  bool get isEmpty => this == AplSimulatorOrder.empty();
}
