import 'package:ezrxmobile/domain/auth/database/i_token_storage.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/jwt_dto.dart';

class TokenStorage implements ITokenStorage {
  static const _boxName = 'auth_token_box';
  static const _tokenKey = 'ezrx_auth_token';
  Box get _box => Hive.box(_boxName);

  TokenStorage() {
    _init();
  }

  Future<void> _init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(JWTDtoAdapter());
    await Hive.openBox(_boxName);
  }

  @override
  Future<JWTDto> get() async {
    try {
      return await _box.get(
        _tokenKey,
        defaultValue: JWTDto(access: '', refresh: ''),
      );
    } catch (_) {
      throw CacheException();
    }
  }

  @override
  Future set(JWTDto jwtDto) async {
    try {
      await _box.put(_tokenKey, jwtDto);
    } catch (_) {
      throw CacheException();
    }
  }

  @override
  Future delete() async {
    try {
      await _box.delete(_tokenKey);
    } catch (_) {
      throw CacheException();
    }
  }
}
