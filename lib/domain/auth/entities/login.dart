import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login.freezed.dart';

@freezed
class Login with _$Login {
  const Login._();

  const factory Login({required JWT jwt}) = _Login;
  // TODO: cover refresh token

  factory Login.empty() => Login(jwt: JWT(''));
}
