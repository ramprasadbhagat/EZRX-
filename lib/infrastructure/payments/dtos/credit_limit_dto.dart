import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_limit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_limit_dto.freezed.dart';
part 'credit_limit_dto.g.dart';

@freezed
class CreditLimitDto with _$CreditLimitDto {
  const CreditLimitDto._();
  const factory CreditLimitDto({
    @JsonKey(name: 'partner', defaultValue: '')
        required String customerCode,
    @JsonKey(
      name: 'currency',
      defaultValue: '',
    )
        required String currency,
    @JsonKey(name: 'creditLimit', defaultValue: '')
        required String creditLimit,
    @JsonKey(name: 'creditExposure', defaultValue: '')
        required String creditExposure,
    @JsonKey(name: 'creditBalance', defaultValue: '')
        required String creditBalance,
  }) = _CreditLimitDto;

  factory CreditLimitDto.fromDomain(
    CreditLimit creditLimit,
  ) {
    return CreditLimitDto(
      customerCode: creditLimit.customerCode.getOrCrash(),
      currency: creditLimit.currency.getOrCrash(),
      creditLimit: creditLimit.creditLimit,
      creditExposure: creditLimit.creditExposure,
      creditBalance: creditLimit.creditBalance,
    );
  }

  CreditLimit toDomain() {
    return CreditLimit(
      customerCode: CustomerCode(customerCode),
      currency: Currency(currency),
      creditLimit: creditLimit,
      creditExposure: creditExposure,
      creditBalance: creditBalance,
    );
  }

  factory CreditLimitDto.fromJson(Map<String, dynamic> json) =>
      _$CreditLimitDtoFromJson(json);
}
