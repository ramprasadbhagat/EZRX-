import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/sales_organisation_configs_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/bundle_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/bundle_info_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_aggregate_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_bonus_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_bundle_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_rule_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_tier_dto.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartStorage {
  static const _boxName = 'ezrx_cart_box';

  late Box _cartBox;

  CartStorage();

  Future<void> init() async {
    Hive
      ..registerAdapter(BundleInfoDtoAdapter())
      ..registerAdapter(BundleDtoAdapter())
      ..registerAdapter(MaterialDtoAdapter())
      ..registerAdapter(PriceRuleDtoAdapter())
      ..registerAdapter(PriceTierItemDtoAdapter())
      ..registerAdapter(PriceTierDtoAdapter())
      ..registerAdapter(BonusMaterialDtoAdapter())
      ..registerAdapter(PriceBonusItemDtoAdapter())
      ..registerAdapter(PriceBonusDtoAdapter())
      ..registerAdapter(PriceBundleItemDtoAdapter())
      ..registerAdapter(PriceBundleDtoAdapter())
      ..registerAdapter(PriceDtoAdapter())
      ..registerAdapter(SalesOrganisationConfigsDtoAdapter())
      ..registerAdapter(PriceAggregateDtoAdapter());
    _cartBox = await Hive.openBox(
      _boxName,
    );
  }

  Future<List<PriceAggregateDto>> get() async {
    try {
      return _cartBox.values.map((e) => e as PriceAggregateDto).toList();
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  Future add(PriceAggregateDto cartDto) async {
    try {
      if (_cartBox.isEmpty) {
        await _cartBox.add(cartDto);
      } else {
        var isUpdate = false;
        for (final entry in _cartBox.toMap().entries) {
          final existingItem = entry.value as PriceAggregateDto;
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
//Replacing the item for price override

  Future update({
    required PriceDto cartDto,
    required String materialNumber,
    required bool isMock,
  }) async {
    try {
      for (final entry in _cartBox.toMap().entries) {
        final existingItem = entry.value as PriceAggregateDto;

        if (existingItem.materialDto.materialNumber == materialNumber) {
          existingItem.priceDto = cartDto;
          existingItem.isOverride = true;

          await _cartBox.put(entry.key, existingItem);
          break;
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
          final existingItem = entry.value as PriceAggregateDto;
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

  Future clear() async {
    try {
      await _cartBox.flush();
      await _cartBox.clear();
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  Future addAll(List<PriceAggregateDto> cartItemsDto) async {
    try {
      await _cartBox.addAll(cartItemsDto);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
