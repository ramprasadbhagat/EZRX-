import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_header.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_history_details_order_header_dto.freezed.dart';
part 'order_history_details_order_header_dto.g.dart';

@freezed
class OrderHistoryDetailsOrderHeadersDto
    with _$OrderHistoryDetailsOrderHeadersDto {
  const OrderHistoryDetailsOrderHeadersDto._();
  const factory OrderHistoryDetailsOrderHeadersDto({
    @JsonKey(name: 'TotalTax', defaultValue: 0.0) required double totalTax,
    @JsonKey(name: 'RequestedDeliveryDate', defaultValue: '')
        required String requestedDeliveryDate,
    @JsonKey(name: 'Type', defaultValue: '') required String type,
    @JsonKey(name: 'TelephoneNumber', defaultValue: '')
        required String telephoneNumber,
    @JsonKey(name: 'OrderValue', defaultValue: 0.0) required double orderValue,
    @JsonKey(name: 'CreatedDate', defaultValue: '') required String createdDate,
    @JsonKey(name: 'EZRXNumber', defaultValue: '') required String eZRXNumber,
    @JsonKey(name: 'OrderBy', defaultValue: '') required String orderBy,
    @JsonKey(name: 'ReferenceNotes', defaultValue: '')
        required String referenceNotes,
    @JsonKey(name: 'OrderReason', defaultValue: '') required String orderReason,
    @JsonKey(name: 'CompanyName', defaultValue: '') required String companyName,
    @JsonKey(name: 'HasPOAttachment', defaultValue: false)
        required bool hasPOAttachment,
    @JsonKey(name: 'ItmDescription', defaultValue: '')
        required String itmDescription,
    @JsonKey(name: 'ItmCount', defaultValue: 0) required int itemCount,
    @JsonKey(name: 'CreatedTime', defaultValue: '') required String createdTime,
    @JsonKey(name: 'OrderNumber', defaultValue: '') required String orderNumber,
    @JsonKey(name: 'POReference', defaultValue: '') required String pOReference,
    @JsonKey(name: 'ShipTo', defaultValue: '') required String shipTo,
    @JsonKey(name: 'SoldTo', defaultValue: '') required String soldTo,
  }) = _OrderHistoryDetailsOrderHeadersDto;
  factory OrderHistoryDetailsOrderHeadersDto.fromDomain(
    OrderHistoryDetailsOrderHeader orderHistoryDetailsOrderHeader,
  ) {
    return OrderHistoryDetailsOrderHeadersDto(
      totalTax: orderHistoryDetailsOrderHeader.totalTax,
      requestedDeliveryDate:
          orderHistoryDetailsOrderHeader.requestedDeliveryDate.dateString,
      type: orderHistoryDetailsOrderHeader.type,
      telephoneNumber:
          orderHistoryDetailsOrderHeader.telephoneNumber.displayTelephoneNumber,
      orderValue: orderHistoryDetailsOrderHeader.orderValue,
      createdDate: orderHistoryDetailsOrderHeader.createdDate.getValue(),
      eZRXNumber: orderHistoryDetailsOrderHeader.eZRXNumber,
      orderBy: orderHistoryDetailsOrderHeader.orderBy,
      referenceNotes: orderHistoryDetailsOrderHeader.referenceNotes,
      orderReason: orderHistoryDetailsOrderHeader.orderReason,
      companyName:
          orderHistoryDetailsOrderHeader.companyName.getOrDefaultValue(''),
      createdTime: orderHistoryDetailsOrderHeader.createdTime,
      hasPOAttachment: orderHistoryDetailsOrderHeader.hasPOAttachment,
      itmDescription: orderHistoryDetailsOrderHeader.itmDescription,
      itemCount: orderHistoryDetailsOrderHeader.itemCount,
      orderNumber:
          orderHistoryDetailsOrderHeader.orderNumber.getOrDefaultValue(''),
      pOReference:
          orderHistoryDetailsOrderHeader.pOReference.displayPOReference,
      shipTo: orderHistoryDetailsOrderHeader.shipTo,
      soldTo: orderHistoryDetailsOrderHeader.soldTo,
    );
  }

  OrderHistoryDetailsOrderHeader toDomain() {
    return OrderHistoryDetailsOrderHeader(
      totalTax: totalTax,
      requestedDeliveryDate: DateTimeStringValue(requestedDeliveryDate),
      type: type,
      telephoneNumber: PhoneNumber(telephoneNumber),
      orderValue: orderValue,
      createdDate: DateTimeStringValue(createdDate),
      eZRXNumber: eZRXNumber,
      orderBy: orderBy,
      referenceNotes: referenceNotes,
      orderReason: orderReason,
      companyName: CompanyName(''),
      createdTime: createdTime,
      hasPOAttachment: hasPOAttachment,
      itmDescription: itmDescription,
      itemCount: itemCount,
      orderNumber: OrderNumber(orderNumber),
      pOReference: POReference(pOReference),
      shipTo: shipTo,
      soldTo: soldTo,
    );
  }

  factory OrderHistoryDetailsOrderHeadersDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$OrderHistoryDetailsOrderHeadersDtoFromJson(json);
}
