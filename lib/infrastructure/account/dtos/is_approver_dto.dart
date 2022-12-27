import 'package:freezed_annotation/freezed_annotation.dart';

part 'is_approver_dto.freezed.dart';

part 'is_approver_dto.g.dart';

@freezed
class IsApproverDto with _$IsApproverDto {
  IsApproverDto._();

  factory IsApproverDto({
    required bool isApprover,
  }) = _IsApproverDto;

  factory IsApproverDto.fromJson(Map<String, dynamic> json) =>
      _$IsApproverDtoFromJson(json);
}
