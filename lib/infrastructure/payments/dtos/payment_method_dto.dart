import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_method_dto.freezed.dart';
part 'payment_method_dto.g.dart';

@freezed
class PaymentMethodDto with _$PaymentMethodDto {
  const PaymentMethodDto._();

  const factory PaymentMethodDto({
    @JsonKey(name: 'paymentMethods', defaultValue: '')
        required String paymentMethods,
  }) = _PaymentMethodDto;

  PaymentMethodValue toDomain() {
    return PaymentMethodValue(paymentMethods);
  }

  factory PaymentMethodDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodDtoFromJson(json);
}
