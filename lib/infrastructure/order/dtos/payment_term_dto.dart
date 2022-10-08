import 'package:ezrxmobile/domain/order/entities/payment_term.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_term_dto.freezed.dart';
part 'payment_term_dto.g.dart';

@freezed
class PaymentTermDto with _$PaymentTermDto {
  const PaymentTermDto._();
  const factory PaymentTermDto({
    @JsonKey(name: 'paymentTermCode') required String paymentTermCode,
    @JsonKey(name: 'paymentTermRanking') required int paymentTermRanking,
    @JsonKey(name: 'paymentTermDescription')
        required String paymentTermDescription,
    @JsonKey(name: 'paymentTermSubranking') required int paymentTermSubranking,
  }) = _PaymentTermDto;

  factory PaymentTermDto.fromDomain(PaymentTerm paymentTerm) {
    return PaymentTermDto(
      paymentTermCode: paymentTerm.paymentTermCode,
      paymentTermDescription: paymentTerm.paymentTermDescription,
      paymentTermRanking: paymentTerm.paymentTermRanking,
      paymentTermSubranking: paymentTerm.paymentTermSubranking,
    );
  }

  PaymentTerm toDomain() {
    return PaymentTerm(
      paymentTermCode: paymentTermCode,
      paymentTermDescription: paymentTermDescription,
      paymentTermRanking: paymentTermRanking,
      paymentTermSubranking: paymentTermSubranking,
    );
  }

  factory PaymentTermDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentTermDtoFromJson(json);
}
