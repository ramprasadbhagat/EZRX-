import 'package:ezrxmobile/domain/account/entities/payment_advice_header_logo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_advice_header_logo_dto.freezed.dart';
part 'payment_advice_header_logo_dto.g.dart';

@freezed
class PaymentAdviceHeaderLogoDto with _$PaymentAdviceHeaderLogoDto {
  const PaymentAdviceHeaderLogoDto._();
  factory PaymentAdviceHeaderLogoDto({
    @JsonKey(
      name: 'url',
      defaultValue: '',
    )
        required String url,
    @JsonKey(
      name: 'filename',
      defaultValue: '',
    )
        required String fileName,
  }) = _PaymentAdviceHeaderLogoDto;

  factory PaymentAdviceHeaderLogoDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentAdviceHeaderLogoDtoFromJson(json);

  PaymentAdviceHeaderLogo toDomain() => PaymentAdviceHeaderLogo(
        fileName: fileName,
        url: url,
      );
}
