import 'package:ezrxmobile/domain/account/entities/bank_beneficiary_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_beneficiary_response_dto.freezed.dart';
part 'bank_beneficiary_response_dto.g.dart';

@freezed
class BankBeneficiaryResponseDto with _$BankBeneficiaryResponseDto {
  const BankBeneficiaryResponseDto._();

  const factory BankBeneficiaryResponseDto({
    @JsonKey(name: 'info', defaultValue: '') required String info,
  }) = _BankBeneficiaryResponseDto;

  factory BankBeneficiaryResponseDto.fromDomain(
    BankBeneficiaryResponse bankBeneficiaryResponse,
  ) {
    return BankBeneficiaryResponseDto(info: bankBeneficiaryResponse.info);
  }

  BankBeneficiaryResponse toDomain() {
    return BankBeneficiaryResponse(
      info: info,
    );
  }

  factory BankBeneficiaryResponseDto.fromJson(Map<String, dynamic> json) =>
      _$BankBeneficiaryResponseDtoFromJson(json);
}
