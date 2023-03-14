import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';

abstract class ICartRepository {
  Either<ApiFailure, List<CartItem>> fetchCart();

  Future<Either<ApiFailure, Unit>> clearCart();

  Future<Either<ApiFailure, List<CartItem>>> clearCartOnlySelectedItems({
    required List<String> selectedItemIds,
  });

  Future<Either<ApiFailure, List<CartItem>>> addItemToCart({
    required CartItem cartItem,
    required bool override,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
    required bool doNotAllowOutOfStockMaterials,
  });

  Future<Either<ApiFailure, List<CartItem>>> updateMaterialQtyInCartItem({
    required CartItem cartItem,
    required PriceAggregate updatedQtyItem,
    required bool override,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
    required bool doNotAllowOutOfStockMaterials,
  });

  Future<Either<ApiFailure, List<CartItem>>> discountOverride({
    required CartItem cartItem,
  });

  Future<Either<ApiFailure, List<CartItem>>> deleteFromCart({
    required CartItem item,
  });

  Future<Either<ApiFailure, List<CartItem>>> addRemarkToCartItem({
    required CartItem item,
    required String remarkMessage,
  });

  Future<Either<ApiFailure, List<CartItem>>> addBonusToCartItem({
    required CartItem item,
    required MaterialItemBonus newBonus,
    required bool overrideQty,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
    required bool doNotAllowOutOfStockMaterials,
  });

  Future<Either<ApiFailure, List<CartItem>>> deleteBonusFromCartItem({
    required CartItem item,
    required MaterialItemBonus deletedBonus,
  });
  Future<Either<ApiFailure, List<CartItem>>> updateMaterialDealBonus({
    required PriceAggregate material,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
  });

  Future<Either<ApiFailure, List<CartItem>>> addRemarkToBonusItem({
    required CartItem item,
    required MaterialItemBonus bonus,
    required String remarkMessage,
  });

  Future<Either<ApiFailure, List<CartItem>>> overrideCartItemPrice({
    required CartItem item,
    required List<Price> overridePriceList,
  });

  List<CartItem> updateDiscountQty({
    required List<CartItem> items,
  });

  Future<Either<ApiFailure, List<CartItem>>> updateSelectionInCart({
    required CartItem updatedItem,
  });

  Future<Either<ApiFailure, List<CartItem>>> updateAllSelectionInCart({
    required List<CartItem> currentCart,
  });

  Future<Either<ApiFailure, List<CartItem>>> saveToCartWithUpdatedStockInfo({
    required List<CartItem> cartItem,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
  });

  Future<Either<ApiFailure, Map<MaterialNumber, StockInfo>>> getStockInfoList({
    required List<MaterialInfo> items,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
  });

  Future<Either<ApiFailure, StockInfo>> getStockInfo({
    required MaterialInfo material,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
  });

  Future<Either<ApiFailure, List<CartItem>>> replaceCartWithItems({
    required List<CartItem> items,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
    required bool doNotAllowOutOfStockMaterials,
  });
}
