import 'package:ezrxmobile/domain/order/entities/payment_customer_information.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_customer_information_dto.freezed.dart';
part 'payment_customer_information_dto.g.dart';

@freezed
class PaymentCustomerInformationDto with _$PaymentCustomerInformationDto {
  const PaymentCustomerInformationDto._();
  const factory PaymentCustomerInformationDto({
    @JsonKey(name: 'paymentTerm') required String paymentTerm,
  }) = _PaymentCustomerInformationDto;

  factory PaymentCustomerInformationDto.fromDomain(
    PaymentCustomerInformation paymentCustomerInformation,
  ) {
    return PaymentCustomerInformationDto(
      paymentTerm: paymentCustomerInformation.paymentTerm,
    );
  }

  PaymentCustomerInformation toDomain() {
    return PaymentCustomerInformation(paymentTerm: paymentTerm);
  }

  factory PaymentCustomerInformationDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentCustomerInformationDtoFromJson(json);
}
