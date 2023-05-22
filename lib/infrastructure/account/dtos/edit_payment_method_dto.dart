import 'package:ezrxmobile/domain/account/entities/edit_payment_method.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_payment_method_dto.freezed.dart';
part 'edit_payment_method_dto.g.dart';

@freezed
class EditPaymentMethodDto with _$EditPaymentMethodDto {
  const EditPaymentMethodDto._();

  const factory EditPaymentMethodDto({
    @JsonKey(name: 'success', defaultValue: false) required bool success,
    @JsonKey(name: 'action', defaultValue: '') required String action,
  }) = _EditPaymentMethodDto;

  factory EditPaymentMethodDto.fromDomain(
    EditPaymentMethod paymentMethod,
  ) {
    return EditPaymentMethodDto(
      success: paymentMethod.success,
      action: paymentMethod.action,
    );
  }

  EditPaymentMethod toDomain() {
    return EditPaymentMethod(
      success: success,
      action: action,
    );
  }

  factory EditPaymentMethodDto.fromJson(Map<String, dynamic> json) =>
      _$EditPaymentMethodDtoFromJson(json);
}
