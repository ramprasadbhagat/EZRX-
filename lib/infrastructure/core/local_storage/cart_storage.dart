import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/cart_item_dto.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';

class CartStorage {
  static const _boxName = 'ezrx_cart_box';

  late Box _cartBox;

  CartStorage();

  Future<void> init() async {
    Hive.registerAdapter(MaterialDtoAdapter());
    Hive.registerAdapter(CartItemDtoAdapter());
    _cartBox = await Hive.openBox(
      _boxName,
    );
  }

  Future<List<CartItemDto>> get() async {
    try {
      return _cartBox.values.map((e) => e as CartItemDto).toList();
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  Future add(CartItemDto cartDto) async {
    try {
      if (_cartBox.isEmpty) {
        await _cartBox.add(cartDto);
      } else {
        var isUpdate = false;
        for (final entry in _cartBox.toMap().entries) {
          final existingItem = entry.value as CartItemDto;
          if (existingItem.materialDto.materialNumber ==
              cartDto.materialDto.materialNumber) {
            isUpdate = true;
            cartDto.quantity += existingItem.quantity;
            await _cartBox.put(entry.key, cartDto);
            break;
          }
        }
        if (!isUpdate) {
          await _cartBox.add(cartDto);
        }
      }
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  Future delete(String materialNumber) async {
    try {
      if (_cartBox.isNotEmpty) {
        for (final entry in _cartBox.toMap().entries) {
          final existingItem = entry.value as CartItemDto;
          if (existingItem.materialDto.materialNumber == materialNumber) {
            await _cartBox.delete(entry.key);
            break;
          }
        }
      }
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  Future close() async {
    try {
      await _cartBox.flush();
      await _cartBox.clear();
      await _cartBox.close();
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
