import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'deduction_code.freezed.dart';

@freezed
class DeductionCode with _$DeductionCode {
  const DeductionCode._();

  const factory DeductionCode({
    required int key,
    required SalesOrg salesOrg,
    required StringValue salesDistrict,
    required StringValue deductionCode,
    required StringValue deductionDescription,
    required StringValue amountType,
    required bool isDeleteInProgress,
  }) = _DeductionCode;

  factory DeductionCode.empty() => DeductionCode(
        key: 0,
        salesOrg: SalesOrg(''),
        salesDistrict: StringValue(''),
        deductionCode: StringValue(''),
        deductionDescription: StringValue(''),
        amountType: StringValue(''),
        isDeleteInProgress: false,
      );

  bool get isValid =>
      salesOrg.isValid() &&
      deductionCode.isValid() &&
      amountType.isValid() &&
      deductionDescription.isValid();
}
