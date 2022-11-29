import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
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
import 'package:ezrxmobile/infrastructure/order/dtos/stock_info_dto.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartStorage {
  static const _boxName = 'ezrx_cart_box';

  late Box _cartBox;

  CartStorage();

  Future<void> init() async {
    try {
      await Hive.initFlutter();
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
        ..registerAdapter(PriceAggregateDtoAdapter())
        ..registerAdapter(StockInfoDtoAdapter());
      _cartBox = await Hive.openBox(
        _boxName,
      );
    } catch (e) {
      await Hive.deleteBoxFromDisk(_boxName);
      Hive.resetAdapters();
      await init();
    }
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
            // cartDto.quantity += existingItem.quantity;
            existingItem.quantity += cartDto.quantity;

            await _cartBox.put(entry.key, existingItem);
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

  Future updateItem(PriceAggregateDto cartDto) async {
    try {
      if (_cartBox.isEmpty) {
        await _cartBox.add(cartDto);
      } else {
        for (final entry in _cartBox.toMap().entries) {
          final existingItem = entry.value as PriceAggregateDto;
          if (existingItem.materialDto.materialNumber ==
              cartDto.materialDto.materialNumber) {
            await _cartBox.put(entry.key, cartDto);
            break;
          }
        }
      }
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  Future updateStockInfo(StockInfoDto stockInfo) async {
    try {
      for (final entry in _cartBox.toMap().entries) {
        final existingItem = entry.value as PriceAggregateDto;
        if (existingItem.materialDto.materialNumber ==
            stockInfo.materialNumber) {
          existingItem.stockInfoDto = stockInfo;
          await _cartBox.put(entry.key, existingItem);
          break;
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
          existingItem.priceDto =
              existingItem.priceDto.copyWith(isPriceOverride: true);

          await _cartBox.put(entry.key, existingItem);
          break;
        }
      }
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

//Adding and updating the bonus list
  Future updateBonus({
    required PriceAggregateDto cartDto,
    required MaterialInfo bonusItem,
    required int quantity,
    required bool isUpdateFromCart,
  }) async {
    try {
      for (final entry in _cartBox.toMap().entries) {
        final existingItem = entry.value as PriceAggregateDto;

        if (existingItem.materialDto.materialNumber ==
            cartDto.materialDto.materialNumber) {
          var isUpdate = false;

          for (var i = 0; i < existingItem.bonusItem.length; i++) {
            if (existingItem.bonusItem[i].materialNumber ==
                bonusItem.materialNumber.getOrCrash()) {
              isUpdate = true;
              // cartDto;
              final bonus =
                  existingItem.bonusItem.map((e) => e.toJson()).toList();
              existingItem.bonusItem =
                  bonus.map((e) => MaterialDto.fromJson(e)).toList();

              isUpdateFromCart
                  ? bonus[i]['quantity'] = quantity
                  : bonus[i]['quantity'] += quantity;
              bonus[i]['remarks'] = bonusItem.remarks;

              existingItem.bonusItem =
                  bonus.map((e) => MaterialDto.fromJson(e)).toList();
            }
          }
          if (!isUpdate) {
            final tempBonus = MaterialDto.fromDomain(bonusItem).toJson();
            tempBonus['quantity'] = quantity;
            existingItem.bonusItem.add(MaterialDto.fromJson(tempBonus));
          }
          await _cartBox.put(entry.key, existingItem);
          break;
        }
      }
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

//Adelete from bonus list
  Future deleteBonus({
    required PriceAggregateDto cartDto,
    required MaterialInfo bonusItem,
    required bool isUpdateFromCart,
  }) async {
    try {
      for (final entry in _cartBox.toMap().entries) {
        final existingItem = entry.value as PriceAggregateDto;

        if (existingItem.materialDto.materialNumber ==
            cartDto.materialDto.materialNumber) {
          var isUpdate = false;

          for (var i = 0; i < existingItem.bonusItem.length; i++) {
            if (existingItem.bonusItem[i].materialNumber ==
                bonusItem.materialNumber.getOrCrash()) {
              isUpdate = true;
              // cartDto;
              final bonus =
                  existingItem.bonusItem.map((e) => e.toJson()).toList();
              existingItem.bonusItem =
                  bonus.map((e) => MaterialDto.fromJson(e)).toList();
              bonus.removeAt(i);
              existingItem.bonusItem =
                  bonus.map((e) => MaterialDto.fromJson(e)).toList();
            }
          }

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
