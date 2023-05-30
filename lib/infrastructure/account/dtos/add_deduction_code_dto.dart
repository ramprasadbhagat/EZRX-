import 'package:ezrxmobile/domain/account/entities/add_deduction_code.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_deduction_code_dto.freezed.dart';
part 'add_deduction_code_dto.g.dart';

@freezed
class AddDeductionCodeDto with _$AddDeductionCodeDto {
  const AddDeductionCodeDto._();

  const factory AddDeductionCodeDto({
    @JsonKey(name: 'success', defaultValue: false) required bool success,
    @JsonKey(name: 'info', defaultValue: '') required String info,
  }) = _AddDeductionCodeDto;

  factory AddDeductionCodeDto.fromDomain(
    AddDeductionCode addDeductionCode,
  ) {
    return AddDeductionCodeDto(
      success: addDeductionCode.success,
      info: addDeductionCode.info,
    );
  }

  AddDeductionCode toDomain() {
    return AddDeductionCode(
      success: success,
      info: info,
    );
  }

  factory AddDeductionCodeDto.fromJson(Map<String, dynamic> json) =>
      _$AddDeductionCodeDtoFromJson(json);
}
