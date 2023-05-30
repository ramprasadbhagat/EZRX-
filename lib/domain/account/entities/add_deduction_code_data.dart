import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_deduction_code_data.freezed.dart';

@freezed
class AddDeductionCodeData with _$AddDeductionCodeData {
  const AddDeductionCodeData._();
  const factory AddDeductionCodeData({
    required SalesOrg salesOrg,
    required StringValue salesDistrict,
    required StringValue deductionCode,
    required StringValue amountType,
    required StringValue deductionDescription,
  }) = _AddDeductionCodeData;

  factory AddDeductionCodeData.empty() => AddDeductionCodeData(
        salesOrg: SalesOrg(''),
        salesDistrict: StringValue(''),
        deductionCode: StringValue(''),
        amountType: StringValue(''),
        deductionDescription: StringValue(''),
      );

  bool get isValid =>
      salesOrg.isValid() &&
      deductionCode.isValid() &&
      amountType.isValid() &&
      deductionDescription.isValid();
}
