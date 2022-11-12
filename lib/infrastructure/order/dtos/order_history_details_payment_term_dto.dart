
import 'package:ezrxmobile/domain/order/entities/order_history_details_payment_term.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_history_details_payment_term_dto.freezed.dart';
part 'order_history_details_payment_term_dto.g.dart';
@freezed
class OrderHistoryDetailsPaymentTermDto with _$OrderHistoryDetailsPaymentTermDto {
  const OrderHistoryDetailsPaymentTermDto._();
  const factory OrderHistoryDetailsPaymentTermDto({
    @JsonKey(name: 'PaymentTermCode',defaultValue: '') required String paymentTermCode,
    @JsonKey(name: 'PaymentTermDescription',defaultValue: '') required String paymentTermDescription,
  }) = _OrderHistoryDetailsPaymentTermDto;
  factory OrderHistoryDetailsPaymentTermDto.fromDomain( OrderHistoryDetailsPaymentTerm orderHistoryDetailsPaymentTerm) {
    return  OrderHistoryDetailsPaymentTermDto(
      paymentTermCode: orderHistoryDetailsPaymentTerm.paymentTermCode,
      paymentTermDescription: orderHistoryDetailsPaymentTerm.paymentTermDescription,
       );
  }

  OrderHistoryDetailsPaymentTerm toDomain() {
    return OrderHistoryDetailsPaymentTerm(
      paymentTermCode: paymentTermCode,
      paymentTermDescription: paymentTermDescription,
    );
  }
 
  factory OrderHistoryDetailsPaymentTermDto.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryDetailsPaymentTermDtoFromJson(json);
}
