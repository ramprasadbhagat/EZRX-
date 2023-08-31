import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_history_details_order_item.freezed.dart';

@freezed
class OrderItem with _$OrderItem {
  const OrderItem._();
  factory OrderItem({
    required MaterialNumber materialCode,
    required String materialDescription,
    required String defaultMaterialDescription,
  }) = _OrderItem;
  factory OrderItem.empty() => OrderItem(
        materialCode: MaterialNumber(''),
        materialDescription: '',
        defaultMaterialDescription: '',
      );
}
