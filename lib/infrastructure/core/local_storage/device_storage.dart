import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DeviceStorage {
  static const _boxName = 'device_storage_box';
  static const _id = 'device_storage';

  late Box _box;

  DeviceStorage();

  Future<void> init() async {
    try {
      await Hive.initFlutter();
      _box = await Hive.openBox(
        _boxName,
      );
    } catch (e) {
      await Hive.deleteBoxFromDisk(_boxName);
      await init();
    }
  }

  Future<void> setAppFirstLaunch({required bool isAppFirstLaunch}) async {
    try {
      await _box.put(_id, isAppFirstLaunch);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  bool isAppFirstLaunch() {
    try {
      return _box.get(
        _id,
        defaultValue: true,
      );
    } catch (e) {
      throw (CacheException(message: e.toString()));
    }
  }
}
