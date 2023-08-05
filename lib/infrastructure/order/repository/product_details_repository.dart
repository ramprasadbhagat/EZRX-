import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/aggregate/product_detail_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/product_meta_data.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/repository/i_product_details_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/product_details_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/product_details_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_remote.dart';
import 'package:html_editor_enhanced/utils/shims/dart_ui_real.dart';

class ProductDetailRepository implements IProductDetailRepository {
  final Config config;
  final ProductDetailLocalDataSource productDetailLocalDataSource;
  final ProductDetailRemoteDataSource productDetailRemoteDataSource;
  final MaterialListLocalDataSource materialListLocalDataSource;
  final MaterialListRemoteDataSource materialListRemoteDataSource;
  final StockInfoLocalDataSource stockInfoLocalDataSource;
  final StockInfoRemoteDataSource stockInfoRemoteDataSource;

  ProductDetailRepository({
    required this.config,
    required this.productDetailLocalDataSource,
    required this.productDetailRemoteDataSource,
    required this.materialListLocalDataSource,
    required this.materialListRemoteDataSource,
    required this.stockInfoLocalDataSource,
    required this.stockInfoRemoteDataSource,
  });

  @override
  Future<Either<ApiFailure, MaterialInfo>> getProductDetail({
    required MaterialNumber materialNumber,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Locale locale,
    required MaterialInfoType type,
  }) async =>
      type.typeBundle
          ? await getBundleDetail(
              customerCodeInfo: customerCodeInfo,
              locale: locale,
              materialNumber: materialNumber,
              salesOrganisation: salesOrganisation,
              shipToInfo: shipToInfo,
            )
          : await getMaterialDetail(
              customerCodeInfo: customerCodeInfo,
              locale: locale,
              materialNumber: materialNumber,
              salesOrganisation: salesOrganisation,
              shipToInfo: shipToInfo,
            );

  @override
  Future<Either<ApiFailure, MaterialInfo>> getMaterialDetail({
    required MaterialNumber materialNumber,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Locale locale,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final productDetail =
            await productDetailLocalDataSource.getProductDetails();

        return Right(productDetail);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final productDetail =
          await productDetailRemoteDataSource.getProductDetails(
        customerCode: customerCodeInfo.customerCodeSoldTo,
        shipToCode: shipToInfo.shipToCustomerCode,
        language: locale.languageCode,
        materialNumber: materialNumber.getOrCrash(),
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
      );

      return Right(productDetail);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, MaterialInfo>> getBundleDetail({
    required MaterialNumber materialNumber,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Locale locale,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final materialInfo =
            await materialListLocalDataSource.getProductDetails();

        return Right(materialInfo);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    } else {
      try {
        final materialData =
            await materialListRemoteDataSource.getProductDetails(
          code: materialNumber.getOrCrash(),
          salesOrg: salesOrganisation.salesOrg.getOrCrash(),
          customerCode: customerCodeInfo.customerCodeSoldTo,
          shipToCode: shipToInfo.shipToCustomerCode,
          type: 'bundle',
        );

        return Right(
          materialData.copyWith(
            bundle: materialData.bundle.copyWith(
              materials:
                  materialData.data.map((e) => e.toMaterialInfo).toList(),
            ),
          ),
        );
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
  }

  @override
  Future<Either<ApiFailure, StockInfo>> getStockInfo({
    required MaterialNumber materialNumber,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final stockInfoList = await stockInfoLocalDataSource.getStockInfo();

        return Right(stockInfoList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    } else {
      try {
        final stockInfoList = await stockInfoRemoteDataSource.getStockInfo(
          materialNumber: materialNumber.getOrCrash(),
          salesOrg: salesOrganisation.salesOrg.getOrCrash(),
          selectedCustomerCode: customerCodeInfo.customerCodeSoldTo,
        );

        return Right(stockInfoList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
  }

  @override
  Future<Either<ApiFailure, List<MaterialInfo>>> getSimilarProduct({
    required MaterialNumber materialNumber,
    required PrincipalCode principalCode,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Locale locale,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final products = await productDetailLocalDataSource.getSimilarProduct();

        return Right(products);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final products = await productDetailRemoteDataSource.getSimilarProduct(
        customerCode: customerCodeInfo.customerCodeSoldTo,
        shipToCode: shipToInfo.shipToCustomerCode,
        language: locale.languageCode,
        materialNumber: materialNumber.getOrCrash(),
        principalCode: principalCode.getOrCrash(),
      );
      final stockInfoData = await getStockInfoList(
        customerCodeInfo: customerCodeInfo,
        materials: products,
        salesOrganisation: salesOrganisation,
      );
      final stockInfoList = stockInfoData.getOrElse(() => []);

      final similarProduct = products.map(
        (materialInfo) {
          final materialStockInfo = stockInfoList.firstWhere(
            (MaterialStockInfo materialStockInfo) =>
                materialStockInfo.materialNumber == materialInfo.materialNumber,
            orElse: () => MaterialStockInfo.empty(),
          );

          return materialInfo.copyWithStock(
            stockInfos: materialStockInfo.stockInfos,
          );
        },
      ).toList();

      return Right(similarProduct);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<MaterialStockInfo>>> getStockInfoList({
    required List<MaterialInfo> materials,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final stockInfoList =
            await stockInfoLocalDataSource.getMaterialStockInfoList();

        return Right(stockInfoList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    } else {
      try {
        final stockInfoList =
            await stockInfoRemoteDataSource.getMaterialStockInfoList(
          materialNumbers:
              materials.map((e) => e.materialNumber.getOrCrash()).toList(),
          salesOrg: salesOrganisation.salesOrg.getOrCrash(),
          selectedCustomerCode: customerCodeInfo.customerCodeSoldTo,
        );

        return Right(stockInfoList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
  }

  @override
  Future<Either<ApiFailure, ProductDetailAggregate>> getItemProductMetaData({
    required ProductDetailAggregate productDetailAggregate,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response =
            await productDetailLocalDataSource.getItemProductMetaData();

        final updatedProductDetailAggregate = productDetailAggregate.copyWith(
          materialInfo: productDetailAggregate.materialInfo.copyWith(
            productImages: response.productImages.isNotEmpty
                ? response.productImages.first
                : ProductImages.empty(),
          ),
          productItem: response.items.isNotEmpty
              ? response.items.first
              : ProductItem.empty(),
        );

        return Right(updatedProductDetailAggregate);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final response =
          await productDetailRemoteDataSource.getItemProductMetaData(
        materialIDs: [
          productDetailAggregate.materialInfo.materialNumber.getOrCrash(),
        ],
      );

      final updatedProductDetailAggregate = productDetailAggregate.copyWith(
        materialInfo: productDetailAggregate.materialInfo.copyWith(
          productImages: response.productImages.isNotEmpty
              ? response.productImages.first
              : ProductImages.empty(),
        ),
        productItem: response.items.isNotEmpty
            ? response.items.first
            : ProductItem.empty(),
      );

      return Right(updatedProductDetailAggregate);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }
}
