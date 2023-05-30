import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'deduction_code.freezed.dart';

@freezed
class DeductionCode with _$DeductionCode {
  const DeductionCode._();

  const factory DeductionCode({
    required SalesOrg salesOrg,
    required StringValue salesDistrict,
    required StringValue deductionCode,
    required StringValue deductionDescription,
    required StringValue amountType,
  }) = _DeductionCode;

  factory DeductionCode.empty() => DeductionCode(
        salesOrg: SalesOrg(''),
        salesDistrict: StringValue(''),
        deductionCode: StringValue(''),
        deductionDescription: StringValue(''),
        amountType: StringValue(''),
      );
}
