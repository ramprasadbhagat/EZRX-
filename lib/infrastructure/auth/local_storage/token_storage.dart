import 'dart:convert';

import 'package:ezrxmobile/domain/auth/local_storage/i_token_storage.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/local_storage/i_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/jwt_dto.dart';

class TokenStorage implements ITokenStorage {
  static const _boxName = 'ezrx_token_box';
  static const _tokenKey = 'ezrx_auth_token';
  static const _secureKey = 'ezrx_auth_secure';
  late Box _encryptedBox;
  ISecureStorage secureStorage;

  TokenStorage({required this.secureStorage});

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(JWTDtoAdapter());
    // https://docs.hivedb.dev/#/advanced/encrypted_box
    final encryprionKey = await secureStorage.read(key: _secureKey);
    if (encryprionKey.isEmpty) {
      final key = Hive.generateSecureKey();
      await secureStorage.write(key: _secureKey, value: base64UrlEncode(key));
    }
    final key = await secureStorage.read(key: _secureKey);
    final encryptionKey = base64Url.decode(key);
    _encryptedBox = await Hive.openBox(
      _boxName,
      encryptionCipher: HiveAesCipher(encryptionKey),
    );
  }

  @override
  Future<JWTDto> get() async {
    try {
      return await _encryptedBox.get(
        _tokenKey,
        defaultValue: JWTDto(access: ''),
      );
    } catch (e) {
      throw LocalException(message: e.toString());
    }
  }

  @override
  Future set(JWTDto jwtDto) async {
    try {
      await _encryptedBox.put(_tokenKey, jwtDto);
    } catch (e) {
      throw LocalException(message: e.toString());
    }
  }

  @override
  Future clear() async {
    try {
      await _encryptedBox.clear();
    } catch (e) {
      throw LocalException(message: e.toString());
    }
  }
}
