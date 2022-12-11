import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/sales_organisation_configs_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/bundle_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/bundle_info_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_item_bonus_dto.dart';
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

  int get cartBoxSize => _cartBox.length;

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
        ..registerAdapter(StockInfoDtoAdapter())
        ..registerAdapter(MaterialItemBonusDtoAdapter());
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
    required MaterialItemBonus bonusItem,
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
                    bonusItem.materialInfo.materialNumber.getOrCrash() &&
                existingItem.bonusItem.elementAt(i).additionalBonusFlag ==
                    bonusItem.additionalBonusFlag) {
              isUpdate = true;
              final bonus =
                  existingItem.bonusItem.map((e) => e.toJson()).toList();
              isUpdateFromCart
                  ? bonus[i]['freeQuantity'] = quantity
                  : bonus[i]['freeQuantity'] += quantity;
              bonus[i]['comment'] = bonusItem.materialInfo.remarks;
              existingItem.bonusItem = bonus
                  .map<MaterialItemBonusDto>(
                    (e) => MaterialItemBonusDto.fromJson(e),
                  )
                  .toList();
            }
          }
          if (!isUpdate) {
            final tempBonus =
                MaterialItemBonusDto.fromDomain(bonusItem).toJson();
            tempBonus['freeQuantity'] = quantity;
            existingItem.bonusItem
                .add(MaterialItemBonusDto.fromJson(tempBonus));
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
    required MaterialItemBonus bonusItem,
    required bool isUpdateFromCart,
  }) async {
    try {
      for (final entry in _cartBox.toMap().entries) {
        final existingItem = entry.value as PriceAggregateDto;

        if (existingItem.materialDto.materialNumber ==
            cartDto.materialDto.materialNumber) {
          for (var i = 0; i < existingItem.bonusItem.length; i++) {
            if (existingItem.bonusItem[i].materialNumber ==
                    bonusItem.materialInfo.materialNumber.getOrCrash() &&
                existingItem.bonusItem.elementAt(i).additionalBonusFlag ==
                    bonusItem.additionalBonusFlag) {
              final bonus =
                  existingItem.bonusItem.map((e) => e.toJson()).toList();
              existingItem.bonusItem =
                  bonus.map((e) => MaterialItemBonusDto.fromJson(e)).toList();
              bonus.removeAt(i);
              existingItem.bonusItem =
                  bonus.map((e) => MaterialItemBonusDto.fromJson(e)).toList();
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
