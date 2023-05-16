import 'package:ezrxmobile/domain/account/entities/delete_payment_method.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_payment_method_dto.freezed.dart';
part 'delete_payment_method_dto.g.dart';

@freezed
class DeletePaymentMethodDto with _$DeletePaymentMethodDto {
  const DeletePaymentMethodDto._();

  const factory DeletePaymentMethodDto({
    @JsonKey(name: 'success', defaultValue: false) required bool success,
  }) = _DeletePaymentMethodDto;

  factory DeletePaymentMethodDto.fromDomain(
    DeletePaymentMethodDto paymentMethod,
  ) {
    return DeletePaymentMethodDto(
      success: paymentMethod.success,
    );
  }

  DeletePaymentMethod toDomain() {
    return DeletePaymentMethod(
      success: success,
    );
  }

  factory DeletePaymentMethodDto.fromJson(Map<String, dynamic> json) =>
      _$DeletePaymentMethodDtoFromJson(json);
}
