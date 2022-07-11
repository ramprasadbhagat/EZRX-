import 'package:ezrxmobile/infrastructure/auth/dtos/jwt_dto.dart';

abstract class ITokenStorage {
  Future<void> init();
  Future<JWTDto> get();
  Future set(JWTDto jwtDto);
  Future clear();
}
