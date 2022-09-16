import 'package:ezrxmobile/domain/auth/entities/login.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_dto.freezed.dart';
part 'login_dto.g.dart';

@freezed
class LoginDto with _$LoginDto {
  const LoginDto._();

  const factory LoginDto({
    @JsonKey(name: 'eZRxJWT') required String access,
  }) = _LoginDto;

  factory LoginDto.fromDomain(Login login) {
    return LoginDto(access: login.jwt.getOrCrash());
  }

  Login toDomain() {
    return Login(jwt: JWT(access));
  }

  factory LoginDto.fromJson(Map<String, dynamic> json) =>
      _$LoginDtoFromJson(json);
}
