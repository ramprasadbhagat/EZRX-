import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_item.freezed.dart';

@freezed
class ReturnItem with _$ReturnItem {
  const ReturnItem._();

  const factory ReturnItem({
    required String requestId,
    required DateTimeStringValue requestDate,
    required int itemQty,
    required double totalPrice,
    required StatusType status,
    required MaterialNumber materialNumber,
    required String materialName,
    required String defaultMaterialDescription,
    required String orderNumber,
    required String invoiceID,
    required String customerName,
    required String batch,
    required DateTimeStringValue expiry,
  }) = _ReturnItem;

  factory ReturnItem.empty() => ReturnItem(
        requestId: '',
        requestDate: DateTimeStringValue(''),
        itemQty: 0,
        totalPrice: 0.0,
        status: StatusType(''),
        materialNumber: MaterialNumber(''),
        materialName: '',
        defaultMaterialDescription: '',
        orderNumber: '',
        invoiceID: '',
        customerName: '',
        batch: '',
        expiry: DateTimeStringValue(''),
      );
}
