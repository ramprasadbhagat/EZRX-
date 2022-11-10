import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_header.dart';
part 'order_history_details_order_header_dto.freezed.dart';
part 'order_history_details_order_header_dto.g.dart';
@freezed
class OrderHistoryDetailsOrderHeadersDto with _$OrderHistoryDetailsOrderHeadersDto {
  const OrderHistoryDetailsOrderHeadersDto._();
  const factory OrderHistoryDetailsOrderHeadersDto({
    @JsonKey(name: 'TotalTax',defaultValue: 0.0) required double totalTax,
    @JsonKey(name: 'RequestedDeliveryDate') required String requestedDeliveryDate,
    @JsonKey(name: 'POReference') required String pOReference,
    @JsonKey(name: 'Type') required String type,
     @JsonKey(name: 'TelephoneNumber') required String telephoneNumber,
      @JsonKey(name: 'OrderValue',defaultValue: 0.0) required double orderValue,
      @JsonKey(name: 'CreatedDate') required String createdDate,
      @JsonKey(name: 'EZRXNumber') required String eZRXNumber,
      @JsonKey(name: 'OrderBy') required String orderBy,
  }) = _OrderHistoryDetailsOrderHeadersDto;
  factory OrderHistoryDetailsOrderHeadersDto.fromDomain(OrderHistoryDetailsOrderHeader orderHistoryDetailsOrderHeader) {
    return  OrderHistoryDetailsOrderHeadersDto(
      totalTax: orderHistoryDetailsOrderHeader.totalTax,
      requestedDeliveryDate: orderHistoryDetailsOrderHeader.requestedDeliveryDate,
      pOReference: orderHistoryDetailsOrderHeader.pOReference,
      type: orderHistoryDetailsOrderHeader.type,
      telephoneNumber: orderHistoryDetailsOrderHeader.telephoneNumber,
      orderValue: orderHistoryDetailsOrderHeader.orderValue,
      createdDate: orderHistoryDetailsOrderHeader.createdDate,
      eZRXNumber: orderHistoryDetailsOrderHeader.eZRXNumber,
      orderBy: orderHistoryDetailsOrderHeader.orderBy,

        );
  }

  OrderHistoryDetailsOrderHeader toDomain() {
    return OrderHistoryDetailsOrderHeader(
      totalTax: totalTax,
      requestedDeliveryDate: requestedDeliveryDate,
      pOReference: pOReference,
      type: type,
      telephoneNumber: telephoneNumber,
      orderValue: orderValue,
      createdDate: createdDate,
      eZRXNumber: eZRXNumber,
      orderBy: orderBy,
    );
  }
 
  factory OrderHistoryDetailsOrderHeadersDto.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryDetailsOrderHeadersDtoFromJson(json);
}
