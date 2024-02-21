import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_cred.freezed.dart';

@freezed
class ResetPasswordCred with _$ResetPasswordCred {
  const ResetPasswordCred._();

  const factory ResetPasswordCred({
    required Username username,
    required StringValue token,
  }) = _ResetPasswordCred;

  factory ResetPasswordCred.empty() => ResetPasswordCred(
        username: Username(''),
        token: StringValue(''),
      );

  bool get isValid => username.isValid() && token.isValid();

  bool get isNotEmpty => this != ResetPasswordCred.empty();

  User get toUser => User.empty().copyWith(username: username);
}
