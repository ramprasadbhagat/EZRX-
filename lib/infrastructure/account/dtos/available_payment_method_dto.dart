import 'package:ezrxmobile/domain/account/entities/available_payment_method.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'available_payment_method_dto.freezed.dart';
part 'available_payment_method_dto.g.dart';

@freezed
class AvailablePaymentMethodDto with _$AvailablePaymentMethodDto {
  const AvailablePaymentMethodDto._();

  const factory AvailablePaymentMethodDto({
    @JsonKey(name: 'salesOrg', defaultValue: '') required String salesOrg,
    @JsonKey(name: 'paymentMethods', defaultValue: '')
        required String paymentMethod,
  }) = _AvailablePaymentMethodDto;

  factory AvailablePaymentMethodDto.fromDomain(
    AvailablePaymentMethod paymentMethod,
  ) {
    return AvailablePaymentMethodDto(
      salesOrg: paymentMethod.salesOrg.getOrCrash(),
      paymentMethod: paymentMethod.paymentMethod.getOrCrash(),
    );
  }

  AvailablePaymentMethod toDomain() {
    return AvailablePaymentMethod(
      salesOrg: SalesOrg(salesOrg),
      paymentMethod: PaymentMethod(paymentMethod),
    );
  }

  factory AvailablePaymentMethodDto.fromJson(Map<String, dynamic> json) =>
      _$AvailablePaymentMethodDtoFromJson(json);
}
