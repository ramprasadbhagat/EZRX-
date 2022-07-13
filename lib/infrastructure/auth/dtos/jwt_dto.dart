import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:hive/hive.dart';

part 'jwt_dto.g.dart';

@HiveType(typeId: 0)
class JWTDto {
  JWTDto({required this.access});

  @HiveField(0)
  final String access;

  factory JWTDto.fromDomain(JWT jwtToken) {
    return JWTDto(access: jwtToken.getOrCrash());
  }

  JWT toDomain() {
    return JWT(access);
  }
}
