import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password.freezed.dart';

@freezed
class ForgotPassword with _$ForgotPassword {
  factory ForgotPassword({
    required bool requestResetPassword,
  }) = _ForgotPassword;
}
