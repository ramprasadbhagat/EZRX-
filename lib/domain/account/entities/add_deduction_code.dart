import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_deduction_code.freezed.dart';

@freezed
class AddDeductionCode with _$AddDeductionCode {
  const AddDeductionCode._();

  const factory AddDeductionCode({
    required bool success,
    required String info,
  }) = _AddDeductionCode;

  factory AddDeductionCode.empty() => const AddDeductionCode(
        success: false,
        info: '',
      );
}
