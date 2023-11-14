import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/invoice_order_item.dart';
part 'invoice_order_item_dto.freezed.dart';
part 'invoice_order_item_dto.g.dart';

@freezed
class InvoiceOrderItemDto with _$InvoiceOrderItemDto {
  const InvoiceOrderItemDto._();
  factory InvoiceOrderItemDto({
    @JsonKey(
      name: 'invoice',
      defaultValue: '',
    )
        required String invoiceId,
    @JsonKey(
      name: 'orderId',
      defaultValue: '',
    )
        required String orderId,
  }) = _InvoiceOrderItemDto;

  InvoiceOrderItem get toDomain => InvoiceOrderItem(
        invoiceId: StringValue(invoiceId),
        orderId: StringValue(orderId),
      );

  factory InvoiceOrderItemDto.fromJson(Map<String, dynamic> json) =>
      _$InvoiceOrderItemDtoFromJson(json);
}
