import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'return_price.freezed.dart';

@freezed
class ReturnPrice with _$ReturnPrice {
  const ReturnPrice._();

  const factory ReturnPrice({
    required MaterialPrice unitPrice,
    required MaterialPrice totalPrice,
    required MaterialNumber materialNumber,
    required String itemNumber,
  }) = _ReturnItem;

  factory ReturnPrice.empty() => ReturnPrice(
        unitPrice: MaterialPrice(0.0),
        totalPrice: MaterialPrice(0.0),
        itemNumber: '',
        materialNumber: MaterialNumber(''),
      );
}
