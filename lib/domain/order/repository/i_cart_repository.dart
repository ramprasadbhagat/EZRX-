import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';

abstract class ICartRepository {
  Future<Either<ApiFailure, Unit>> initCartStorage();
  Future<Either<ApiFailure, List<PriceAggregate>>> fetchCartItems();
  Future<Either<ApiFailure, List<PriceAggregate>>> addToCart({
    required PriceAggregate cartItem,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
    required bool doNotallowOutOfStockMaterial,
  });
  Future<Either<ApiFailure, List<PriceAggregate>>> updateCartItem({
    required PriceAggregate cartItem,
  });
  Future<Either<ApiFailure, List<PriceAggregate>>> updateCart({
    required List<Price> cartItem,
    required String materialNumber,
  });

  Future<Either<ApiFailure, List<PriceAggregate>>> deleteFromCart({
    required PriceAggregate cartItem,
  });
  Future<Either<ApiFailure, Unit>> clear();

  Future<Either<ApiFailure, List<PriceAggregate>>> addToCartList({
    required List<PriceAggregate> items,
  });

  Future<Either<ApiFailure, List<PriceAggregate>>> updateStockInfo({
    required User user,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
  });

  List<MaterialNumber> updateSelectedItem({
    required PriceAggregate cartItem,
    required List<MaterialNumber> selectedMaterialList,
  });
  List<MaterialNumber> removeFromSelectedMaterialList({
    required PriceAggregate cartItem,
    required List<MaterialNumber> selectedMaterialList,
  });
  List<MaterialNumber> updateSelectAll({
    required List<PriceAggregate> cartItemList,
  });

  List<MaterialNumber> getUpdatedMaterialList({
    required List<PriceAggregate> cartItemList,
    required List<MaterialNumber> selectedItemsMaterialNumber,
    required List<PriceAggregate> items,
  });

  Future<Either<ApiFailure, List<PriceAggregate>>> updateBonusItem({
    required PriceAggregate cartItem,
    required int quantity,
    required MaterialInfo bonusItem,
    required bool isUpdatedFromCart,
  });

  Future<Either<ApiFailure, List<PriceAggregate>>> deleteBonusItem({
    required PriceAggregate cartItem,
    required MaterialInfo bonusItem,
    required bool isUpdateFromCart,
  });
}
