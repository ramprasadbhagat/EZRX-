import 'package:ezrxmobile/domain/auth/entities/jwt.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'loginv2.freezed.dart';

@freezed
class LoginV2 with _$LoginV2 {
  const LoginV2._();

  const factory LoginV2({required JWT jwt}) = _LoginV2;

  factory LoginV2.empty() => const LoginV2(jwt: JWT(access: '', refresh: ''));
}
