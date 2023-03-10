import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'order_document_type_aggregate_dto.freezed.dart';
part 'order_document_type_aggregate_dto.g.dart';

@freezed
class OrderDocumentTypeDto with _$OrderDocumentTypeDto {
  const OrderDocumentTypeDto._();
  @HiveType(typeId: 31, adapterName: 'OrderDocumentTypeDtoAdapter')
  const factory OrderDocumentTypeDto({
    @JsonKey(
      name: 'salesOrg',
    )
    @HiveField(0, defaultValue: '')
        required String salesOrg,
    @JsonKey(
      name: 'documentType',
    )
    @HiveField(1, defaultValue: '')
        required String documentType,
    @JsonKey(
      name: 'description',
    )
    @HiveField(2, defaultValue: '')
        required String description,
    @JsonKey(
      name: 'shippingCondition',
    )
    @HiveField(3, defaultValue: '')
        required String shippingCondition,
    @JsonKey(
      name: 'orderReason',
    )
    @HiveField(4, defaultValue: '')
        required String orderReason,
  }) = _OrderDocumentTypeDto;

  OrderDocumentType toDomain() {
    return OrderDocumentType(
      salesOrg: SalesOrg(salesOrg),
      documentType: DocumentType(documentType),
      description: description,
      shippingCondition: shippingCondition,
      orderReason: orderReason,
    );
  }

  factory OrderDocumentTypeDto.fromDomain(OrderDocumentType orderType) =>
      OrderDocumentTypeDto(
        salesOrg: orderType.salesOrg.getOrDefaultValue(''),
        description: orderType.description,
        documentType: orderType.documentType.getOrDefaultValue(''),
        orderReason: orderType.orderReason,
        shippingCondition: orderType.shippingCondition,
      );

  factory OrderDocumentTypeDto.fromJson(Map<String, dynamic> json) =>
      _$OrderDocumentTypeDtoFromJson(json);
}
