import 'package:ezrxmobile/domain/auth/entities/loginv2.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'loginv2_dto.freezed.dart';
part 'loginv2_dto.g.dart';

@freezed
class LoginV2Dto with _$LoginV2Dto {
  const LoginV2Dto._();

  const factory LoginV2Dto({
    @JsonKey(name: 'eZRxJWT') required String access,
  }) = _LoginV2Dto;

  factory LoginV2Dto.fromDomain(LoginV2 loginV2) {
    return LoginV2Dto(access: loginV2.jwt.getOrCrash());
  }

  LoginV2 toDomain() {
    return LoginV2(jwt: JWT(access));
  }

  factory LoginV2Dto.fromJson(Map<String, dynamic> json) =>
      _$LoginV2DtoFromJson(json);
}
