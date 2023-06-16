import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/sales_organisation_configs_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/sales_organisation_configs_principal_dto.dart';
import 'package:ezrxmobile/infrastructure/banner/dtos/banner_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/bundle_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/bundle_info_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/cart_item_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/combo_deal_amount_tier_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/combo_deal_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/combo_deal_group_deal_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/combo_deal_material_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/combo_deal_qty_tier_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/combo_deal_sku_tier_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/combo_deal_tier_rule_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_item_bonus_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_aggregate_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_bonus_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_bundle_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_combo_deal_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_rule_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_tier_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/stock_info_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/tender_contract_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/overriden_rule_tier_dto.dart';
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
        ..registerAdapter(PriceComboDealDtoAdapter())
        ..registerAdapter(PriceComboDealCategoryDtoAdapter())
        ..registerAdapter(PriceDtoAdapter())
        ..registerAdapter(ComboDealDtoAdapter())
        ..registerAdapter(ComboDealSKUTierDtoAdapter())
        ..registerAdapter(ComboDealAmountTierDtoAdapter())
        ..registerAdapter(ComboDealQtyTierDtoAdapter())
        ..registerAdapter(ComboDealGroupDealDtoAdapter())
        ..registerAdapter(ComboDealTierRuleDtoAdapter())
        ..registerAdapter(ComboDealMaterialSetDtoAdapter())
        ..registerAdapter(ComboDealMaterialDtoAdapter())
        ..registerAdapter(SalesOrganisationConfigsDtoAdapter())
        ..registerAdapter(PriceAggregateDtoAdapter())
        ..registerAdapter(TenderContractDtoAdapter())
        ..registerAdapter(StockInfoDtoAdapter())
        ..registerAdapter(MaterialItemBonusDtoAdapter())
        ..registerAdapter(CartItemDtoAdapter())
        ..registerAdapter(SalesOrganisationConfigsPrincipalDtoAdapter())
        ..registerAdapter(CartItemTypeAdapter())
        ..registerAdapter(BannerDtoAdapter())
        ..registerAdapter(OverridenRuleTierDtoAdapter())
        ..registerAdapter(TieredRulesDtoAdapter())
        ..registerAdapter(RuleTierDtoAdapter());
      _cartBox = await Hive.openBox(
        _boxName,
      );
    } catch (e) {
      await Hive.deleteBoxFromDisk(_boxName);
      //Hive.resetAdapters();
      await init();
    }
  }

  List<CartItemDto> getAll() {
    try {
      return _cartBox.values.whereType<CartItemDto>().map((e) => e).toList();
    } catch (e) {
      throw (CacheException(message: e.toString()));
    }
  }

  CartItemDto? get({required String id}) {
    try {
      return _cartBox.get(id) as CartItemDto?;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  Future<void> put({required String id, required CartItemDto item}) async {
    try {
      await _cartBox.put(id, item);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  Future<void> putAll({required Map<String, CartItemDto> items}) async {
    try {
      await _cartBox.putAll(items);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  Future<void> delete({required String id}) async {
    try {
      await _cartBox.delete(id);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  Future<void> clear() async {
    try {
      await _cartBox.flush();
      await _cartBox.clear();
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  Future<void> deleteSelectedItems({
    required List<String> selectedItemIds,
  }) async {
    try {
      await _cartBox.deleteAll(selectedItemIds);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
