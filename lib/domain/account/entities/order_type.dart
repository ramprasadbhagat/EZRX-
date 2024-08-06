import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_type.freezed.dart';

@freezed
class OrderType with _$OrderType {
  const OrderType._();

  const factory OrderType({
    required String categoryId,
    required DocumentType orderType,
    required int orderReason,
    required StringValue description,
    required bool enabled,
  }) = _OrderType;

  factory OrderType.empty() => OrderType(
        categoryId: '',
        orderType: DocumentType(''),
        description: StringValue(''),
        orderReason: 0,
        enabled: false,
      );
}
