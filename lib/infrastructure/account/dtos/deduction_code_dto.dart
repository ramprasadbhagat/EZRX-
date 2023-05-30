import 'package:ezrxmobile/domain/account/entities/deduction_code.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'deduction_code_dto.freezed.dart';
part 'deduction_code_dto.g.dart';

@freezed
class DeductionCodeDto with _$DeductionCodeDto {
  const DeductionCodeDto._();

  const factory DeductionCodeDto({
    @JsonKey(name: 'salesOrg', defaultValue: '') required String salesOrg,
    @JsonKey(name: 'salesDistrict', defaultValue: '')
        required String salesDistrict,
    @JsonKey(name: 'deductionCode', defaultValue: '')
        required String deductionCode,
    @JsonKey(name: 'deductionDescription', defaultValue: '')
        required String deductionDescription,
    @JsonKey(name: 'amountType', defaultValue: '') required String amountType,
  }) = _DeductionCodeDto;

  factory DeductionCodeDto.fromDomain(
    DeductionCode deductionCode,
  ) {
    return DeductionCodeDto(
      salesOrg: deductionCode.salesOrg.getOrCrash(),
      salesDistrict: deductionCode.salesDistrict.getOrCrash(),
      deductionCode: deductionCode.deductionCode.getOrCrash(),
      deductionDescription: deductionCode.deductionDescription.getOrCrash(),
      amountType: deductionCode.amountType.getOrCrash(),
    );
  }

  DeductionCode toDomain() {
    return DeductionCode(
      salesOrg: SalesOrg(salesOrg),
      salesDistrict: StringValue(salesDistrict),
      deductionCode: StringValue(deductionCode),
      deductionDescription: StringValue(deductionDescription),
      amountType: StringValue(amountType),
    );
  }

  factory DeductionCodeDto.fromJson(Map<String, dynamic> json) =>
      _$DeductionCodeDtoFromJson(json);
}
