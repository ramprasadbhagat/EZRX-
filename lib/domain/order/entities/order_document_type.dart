import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_document_type.freezed.dart';

@freezed
class OrderDocumentType with _$OrderDocumentType {
  const OrderDocumentType._();

  const factory OrderDocumentType({
    required SalesOrg salesOrg,
    required DocumentType documentType,
    required String description,
    required String shippingCondition,
    required String orderReason,
  }) = _OrderDocumentType;

  factory OrderDocumentType.empty() => OrderDocumentType(
        salesOrg: SalesOrg(''),
        documentType: DocumentType(''),
        description: '',
        shippingCondition: '',
        orderReason: '',
      );

  factory OrderDocumentType.defaultSelected({required SalesOrg salesOrg}) =>
      OrderDocumentType.empty().copyWith(
        description: 'ZP Regular Order',
        documentType: DocumentType('ZP Regular Order (ZPOR)'),
        salesOrg: salesOrg,
      );

  String get displayReasonText => '$orderReason: $description';
}
