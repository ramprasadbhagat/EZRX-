import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_document_type_aggregate_dto.freezed.dart';
part 'order_document_type_aggregate_dto.g.dart';

@freezed
class OrderDocumentTypeDto with _$OrderDocumentTypeDto {
  const OrderDocumentTypeDto._();
  const factory OrderDocumentTypeDto({
    @JsonKey(name: 'salesOrg',)
        required String salesOrg,
    @JsonKey(name: 'documentType', )
        required String documentType,
    @JsonKey(name: 'description', )
        required String description,
    @JsonKey(name: 'shippingCondition', )
        required String shippingCondition,
    @JsonKey(name: 'orderReason', )
        required String orderReason,    
  }) = _OrderDocumentTypeDto;


  OrderDocumentType toDomain() {
    return OrderDocumentType(
      salesOrg: SalesOrg(salesOrg),
      documentType: documentType,
      description: description,
      shippingCondition: shippingCondition,
      orderReason: orderReason,
    );
  }

  factory OrderDocumentTypeDto.fromJson(Map<String, dynamic> json) =>
      _$OrderDocumentTypeDtoFromJson(json);
}
