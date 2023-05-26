import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'deduction_code.freezed.dart';

@freezed
class DeductionCode with _$DeductionCode {
  const DeductionCode._();

  const factory DeductionCode({
    required SalesOrg salesOrg,
    required String salesDistrict,
    required String deductionCode,
    required String deductionDescription,
    required String amountType,
  }) = _DeductionCode;

  factory DeductionCode.empty() => DeductionCode(
        salesOrg: SalesOrg(''),
        salesDistrict: '',
        deductionCode: '',
        deductionDescription: '',
        amountType: '',
      );

  String get salesDistrictLabel => salesDistrict.isEmpty ? 'NA' : salesDistrict;
}
