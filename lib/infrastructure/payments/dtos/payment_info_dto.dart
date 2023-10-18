import 'package:ezrxmobile/domain/payments/entities/payment_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_info_dto.freezed.dart';
part 'payment_info_dto.g.dart';

@freezed
class PaymentInfoDto with _$PaymentInfoDto {
  const PaymentInfoDto._();

  const factory PaymentInfoDto({
    @JsonKey(name: 'paymentID', defaultValue: '') required String paymentID,
    @JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
        required String paymentBatchAdditionalInfo,
  }) = _PaymentInfoDto;

  PaymentInfo toDomain() => PaymentInfo(
        paymentID: paymentID,
        paymentBatchAdditionalInfo: paymentBatchAdditionalInfo,
      );

  factory PaymentInfoDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentInfoDtoFromJson(json);
}
