
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_header.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_payment_term.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_shipping_information.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_messages_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_order_header_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_order_items_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_payment_term_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_po_documents_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_shipping_information_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_history_details_dto.freezed.dart';
part 'order_history_details_dto.g.dart';

@freezed
class OrderHistoryDetailsDto with _$OrderHistoryDetailsDto {
  const OrderHistoryDetailsDto._();
  const factory OrderHistoryDetailsDto({
    @JsonKey(name: 'OrderHeader')
        required OrderHistoryDetailsOrderHeadersDto orderHistoryDetailsOrderHeader,
    @JsonKey(name: 'ShippingInformation')
        required OrderHistoryDetailsShippingInformationDto orderHistoryDetailsShippingInformation,
    @JsonKey(name: 'OrderItems') required List<OrderHistoryDetailsOrderItemDto> orderHistoryDetailsOrderItem,
    @JsonKey(name: 'PaymentTerm')
        required OrderHistoryDetailsPaymentTermDto orderHistoryDetailsPaymentTerm,
    @JsonKey(name: 'SpecialInstructions') required String orderHistoryDetailsSpecialInstructions,
    @JsonKey(name: 'PODocuments')
        required List<OrderHistoryDetailsPODocumentsDto> orderHistoryDetailsPoDocuments,
    @JsonKey(name: 'Messages') required List<OrderHistoryDetailsMessagesDto> orderHistoryDetailsMessages,
  }) = _OrderHistoryDetailsDto;
  factory OrderHistoryDetailsDto.fromDomain(
    OrderHistoryDetails orderHistoryDetails,
  ) {
    return OrderHistoryDetailsDto(
      orderHistoryDetailsOrderHeader: OrderHistoryDetailsOrderHeadersDto.fromDomain(
        orderHistoryDetails.orderHistoryDetailsOrderHeader,
      ),
      orderHistoryDetailsShippingInformation: OrderHistoryDetailsShippingInformationDto.fromDomain(
          orderHistoryDetails.orderHistoryDetailsShippingInformation,),
      orderHistoryDetailsOrderItem: List.from(orderHistoryDetails.orderHistoryDetailsOrderItem)
          .map((e) => OrderHistoryDetailsOrderItemDto.fromDomain(e))
          .toList(),
      
      orderHistoryDetailsPaymentTerm:
          OrderHistoryDetailsPaymentTermDto.fromDomain(orderHistoryDetails.orderHistoryDetailsPaymentTerm),
      orderHistoryDetailsSpecialInstructions: orderHistoryDetails.orderHistoryDetailsSpecialInstructions,
      orderHistoryDetailsPoDocuments:List.from(orderHistoryDetails.orderHistoryDetailsPoDocuments)
          .map((e) => OrderHistoryDetailsPODocumentsDto.fromDomain(e))
          .toList(),
         
      orderHistoryDetailsMessages: List.from(orderHistoryDetails.orderHistoryDetailsMessages)
          .map((e) => OrderHistoryDetailsMessagesDto.fromDomain(e))
          .toList(),
    );
  }
  OrderHistoryDetails toDomain() {
    return OrderHistoryDetails(
      orderHistoryDetailsOrderHeader: OrderHistoryDetailsOrderHeader(
        totalTax: orderHistoryDetailsOrderHeader.totalTax,
        orderValue: orderHistoryDetailsOrderHeader.orderValue,
        pOReference: orderHistoryDetailsOrderHeader.pOReference,
        requestedDeliveryDate: orderHistoryDetailsOrderHeader.requestedDeliveryDate,
        telephoneNumber: orderHistoryDetailsOrderHeader.telephoneNumber,
        type: orderHistoryDetailsOrderHeader.type,
        createdDate: orderHistoryDetailsOrderHeader.createdDate,
        eZRXNumber: orderHistoryDetailsOrderHeader.eZRXNumber,
        orderBy: orderHistoryDetailsOrderHeader.orderBy,
      ),
      orderHistoryDetailsShippingInformation: OrderHistoryDetailsShippingInformation(
        address: orderHistoryDetailsShippingInformation.address,
        country: orderHistoryDetailsShippingInformation.country,
        fax: orderHistoryDetailsShippingInformation.fax,
        invoiceDate: orderHistoryDetailsShippingInformation.invoiceDate,
        invoiceNumber: orderHistoryDetailsShippingInformation.invoiceNumber,
        invoices:orderHistoryDetailsShippingInformation.invoices.map((e) => e.toDomain()).toList(),
        pOReference: orderHistoryDetailsShippingInformation.pOReference,
        phone: orderHistoryDetailsShippingInformation.phone,
        postalCode: orderHistoryDetailsShippingInformation.postalCode,
      ),
      orderHistoryDetailsOrderItem: orderHistoryDetailsOrderItem.map((e) => e.toDomain()).toList(),
     
      orderHistoryDetailsPaymentTerm: OrderHistoryDetailsPaymentTerm(
        paymentTermCode: orderHistoryDetailsPaymentTerm.paymentTermCode,
        paymentTermDescription: orderHistoryDetailsPaymentTerm.paymentTermDescription,
      ),
      orderHistoryDetailsPoDocuments: orderHistoryDetailsPoDocuments.map((e) => e.toDomain()).toList(),
     
      orderHistoryDetailsSpecialInstructions: '',
      orderHistoryDetailsMessages:orderHistoryDetailsMessages.map((e) => e.toDomain()).toList(),
     
    );
  }

  factory OrderHistoryDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryDetailsDtoFromJson(json);
}
