import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_document_type.freezed.dart';



@freezed
class OrderDocumentType with _$OrderDocumentType {
  const OrderDocumentType._();

  const factory OrderDocumentType({
    required SalesOrg salesOrg,
    required String documentType,
    required String description,
    required String shippingCondition,
    required String orderReason,
  }) = _OrderDocumentType;


  factory OrderDocumentType.empty() => OrderDocumentType(
        salesOrg: SalesOrg(''),
        documentType: '',
        description: '',
        shippingCondition: '',
        orderReason: '',
      );

  String get displayReasonText =>
   '$orderReason: $description'; 

  bool get isZPFB =>
    documentType.contains('ZPFB');
  
  bool get isZPFC =>
    documentType.contains('ZPFC');
  
  bool get isZPOR =>
    documentType.contains('ZPOR');     

}