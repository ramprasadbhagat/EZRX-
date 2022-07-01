import 'package:ezrxmobile/domain/auth/entities/jwt.dart';
import 'package:hive/hive.dart';

part 'jwt_dto.g.dart';

@HiveType(typeId: 0)
class JWTDto {
  JWTDto({required this.access, required this.refresh});

  @HiveField(0)
  final String access;
  @HiveField(1)
  final String refresh;

  factory JWTDto.fromDomain(JWT jwt) {
    return JWTDto(
      access: jwt.access,
      refresh: jwt.refresh,
    );
  }

  JWT toDomain() {
    return JWT(
      access: access,
      refresh: '',
    );
  }
}
