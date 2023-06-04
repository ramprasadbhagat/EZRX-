
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_beneficiary_response.freezed.dart';

@freezed
class BankBeneficiaryResponse with _$BankBeneficiaryResponse {
  const BankBeneficiaryResponse._();

  const factory BankBeneficiaryResponse({
    required String info,
  }) = _BankBeneficiaryResponse;

  factory BankBeneficiaryResponse.empty() => const BankBeneficiaryResponse(
        info: '',
  );
}
