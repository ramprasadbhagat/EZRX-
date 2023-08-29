import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/product_meta_data.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';

abstract class ICartRepository {
  //TODO: evaluate which methods can be removed
  Future<Either<ApiFailure, Map<MaterialNumber, ProductMetaData>>> getProducts({
    required List<MaterialNumber> materialNumbers,
  });

  //TODO: evaluate which methods will be removed with addition to this
  Future<Either<ApiFailure, Unit>> clearCart();

  Future<Either<ApiFailure, List<PriceAggregate>>> updateMaterialDealBonus({
    required List<PriceAggregate> materials,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
  });

  List<CartItem> updateDiscountQty({
    required List<CartItem> items,
  });

  Future<Either<ApiFailure, List<CartItem>>> saveToCartWithUpdatedStockInfo({
    required List<CartItem> cartItem,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
  });

  Future<Either<ApiFailure, Map<MaterialNumber, List<StockInfo>>>>
      getStockInfoList({
    required List<MaterialInfo> items,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
  });

  Future<Either<ApiFailure, List<StockInfo>>> getStockInfo({
    required MaterialInfo material,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
  });

  //TODO: evaluate which methods will be removed with addition to this
  Future<Either<ApiFailure, List<PriceAggregate>>> upsertCart({
    required MaterialInfo materialInfo,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs salesOrganisationConfig,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required String language,
    required int quantity,
    required String itemId,
    required RequestCounterOfferDetails counterOfferDetails,
  });

  Future<Either<ApiFailure, List<PriceAggregate>>> upsertCartItems({
    required PriceAggregate product,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required String language,
  });

  Future<Either<ApiFailure, List<PriceAggregate>>> getAddedToCartProductList();
}
