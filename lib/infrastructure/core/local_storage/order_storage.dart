import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_document_type_aggregate_dto.dart';
import 'package:hive_flutter/hive_flutter.dart';

class OrderStorage {
  static const _boxName = 'ezrx_order_box';
  static const _orderTypeKey = 'ezrx_order_type';

  late Box _orderBox;

  OrderStorage();

  Future<void> init() async {
    try {
      await Hive.initFlutter();
      Hive.registerAdapter(OrderDocumentTypeDtoAdapter());
      _orderBox = await Hive.openBox(
        _boxName,
      );
    } catch (e) {
      await Hive.deleteBoxFromDisk(_boxName);
      //Hive.resetAdapters();
      await init();
    }
  }

  Future<void> putOrderType({required OrderDocumentTypeDto orderType}) async {
    try {
      await _orderBox.put(_orderTypeKey, orderType);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  OrderDocumentTypeDto? getOrderType() {
    try {
      return _orderBox.get(_orderTypeKey) as OrderDocumentTypeDto?;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  Future<void> deleteOrderType() async {
    try {
      await _orderBox.delete(_orderTypeKey);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  Future<void> clear() async {
    try {
      await _orderBox.flush();
      await _orderBox.clear();
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
