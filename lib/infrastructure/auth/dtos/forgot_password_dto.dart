import 'package:ezrxmobile/domain/auth/entities/forgot_password.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_dto.freezed.dart';
part 'forgot_password_dto.g.dart';

@freezed
class ForgotPasswordDto with _$ForgotPasswordDto {
  const ForgotPasswordDto._();
  factory ForgotPasswordDto({
    @JsonKey(name: 'requestResetPassword') required bool requestResetPassword,
  }) = _ForgotPasswordDto;

  factory ForgotPasswordDto.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordDtoFromJson(json);

  ForgotPassword toDomain() => ForgotPassword(
        requestResetPassword: requestResetPassword,
      );
}
