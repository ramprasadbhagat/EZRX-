import 'package:ezrxmobile/domain/auth/entities/login.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/user_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_dto.freezed.dart';
part 'login_dto.g.dart';

@freezed
class LoginDto with _$LoginDto {
  const LoginDto._();

  const factory LoginDto({
    @JsonKey(name: 'eZRxJWT', readValue: _convertAccessToken)
        required String access,
    @JsonKey(name: 'eZRxRefreshJWT', readValue: _convertRefreshToken)
        required String refresh,
    @Default(UserDto.emptyUserDto) @JsonKey(name: 'user') UserDto user,
  }) = _LoginDto;

  Login toDomain() {
    return Login(
      access: JWT(access),
      refresh: JWT(refresh),
      user: user.toDomain(),
    );
  }

  factory LoginDto.fromJson(Map<String, dynamic> json) =>
      _$LoginDtoFromJson(json);
}

//_convertAccessToken performs conversion with two different keys:
//If it is login api call, then it will extract access token value from 'eZRxJWT'
//If it is getAccessToken call, it will extract access token value from 'eZRxAccessToken'
String _convertAccessToken(Map json, String key) =>
    json[key] ?? json['eZRxAccessToken'];

//_convertRefreshToken performs conversion with two different keys:
//If it is login api call, then it will extract access token value from 'eZRxRefreshJWT'
//If it is getAccessToken call, it will extract access token value from 'eZRxRefreshToken'
String _convertRefreshToken(Map json, String key) =>
    json[key] ?? json['eZRxRefreshToken'] ?? '';
