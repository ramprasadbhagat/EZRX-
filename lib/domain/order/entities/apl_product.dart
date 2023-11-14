import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'apl_product.freezed.dart';

@freezed
class AplProduct with _$AplProduct {
  const AplProduct._();

  const factory AplProduct({
    required MaterialNumber materialNumber,
    required MaterialPrice finalPriceTotal,
    required MaterialPrice finalPrice,
    required MaterialQty productQty,
    required double tax,
  }) = _AplProduct;

  factory AplProduct.empty() => AplProduct(
        materialNumber: MaterialNumber(''),
        finalPrice: MaterialPrice(0),
        finalPriceTotal: MaterialPrice(0),
        productQty: MaterialQty(0),
        tax: 0,
      );

  PriceAggregate toPriceAggregate(
    PriceAggregate cartItemDetails,
  ) =>
      cartItemDetails.copyWith(
        price: cartItemDetails.price
            .copyWith(finalPrice: finalPrice, finalTotalPrice: finalPriceTotal),
        quantity: productQty.intValue,
        materialInfo: cartItemDetails.materialInfo.copyWith(tax: tax),
      );
}
