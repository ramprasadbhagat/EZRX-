import 'dart:convert';

import 'package:ezrxmobile/domain/auth/local_storage/i_cred_storage.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/local_storage/i_secure_storage.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/cred_dto.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CredStorage implements ICredStorage {
  static const _boxName = 'ezrx_cred_box';
  static const _credKey = 'ezrx_auth_cred';
  static const _secureKey = 'ezrx_cred_secure';

  late Box _encryptedBox;
  ISecureStorage secureStorage;

  CredStorage({required this.secureStorage});

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CredDtoAdapter());
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
  Future<CredDto> get() async {
    try {
      return await _encryptedBox.get(
        _credKey,
        defaultValue: CredDto(username: '', password: ''),
      );
    } catch (e) {
      throw LocalException(message: e.toString());
    }
  }

  @override
  Future set(CredDto jwtDto) async {
    try {
      await _encryptedBox.put(_credKey, jwtDto);
    } catch (e) {
      throw LocalException(message: e.toString());
    }
  }

  @override
  Future delete() async {
    try {
      await _encryptedBox.delete(_credKey);
    } catch (e) {
      throw LocalException(message: e.toString());
    }
  }
}
