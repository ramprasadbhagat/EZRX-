import 'package:ezrxmobile/domain/auth/entities/reset_password_entities.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_dto.freezed.dart';
part 'reset_password_dto.g.dart';

@freezed
class ResetPasswordDto with _$ResetPasswordDto {
  const ResetPasswordDto._();

  const factory ResetPasswordDto({
    @JsonKey(name: 'success') required bool success,
    @JsonKey(name: 'status') required String status,

  }) = _ResetPasswordDto;

  factory ResetPasswordDto.fromDomain(ResetPasswordEntities resetPasswordEntities) {
    return ResetPasswordDto(
        success: resetPasswordEntities.success,
        status: resetPasswordEntities.status,
      );
  }


  ResetPasswordEntities toDomain() {
    return ResetPasswordEntities(
      status: status,
      success: success,
    );
  }

  factory ResetPasswordDto.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordDtoFromJson(json);
}
