import 'package:ezrxmobile/domain/auth/local_storage/i_cred_storage.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/cred_dto.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CredStorage implements ICredStorage {
  static const _boxName = 'auth_cred_box';
  static const _credKey = 'ezrx_auth_cred';
  Box get _box => Hive.box(_boxName);

  CredStorage() {
    _init();
  }

  Future<void> _init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CredDtoAdapter());
    await Hive.openBox(_boxName);
  }

  @override
  Future<CredDto> get() async {
    try {
      return await _box.get(
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
      await _box.put(_credKey, jwtDto);
    } catch (e) {
      throw LocalException(message: e.toString());
    }
  }

  @override
  Future delete() async {
    try {
      await _box.delete(_credKey);
    } catch (e) {
      throw LocalException(message: e.toString());
    }
  }
}
