import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/core/product_images/repository/i_product_images_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/product_images/datasource/product_images_local.dart';
import 'package:ezrxmobile/infrastructure/core/product_images/datasource/product_images_remote.dart';

class ProductImagesRepository implements IProductImagesRepository {
  final Config config;
  final ProductImagesLocalDataSource productImagesLocalDataSource;
  final ProductImagesRemoteDataSource productImagesRemoteDataSource;

  ProductImagesRepository({
    required this.config,
    required this.productImagesLocalDataSource,
    required this.productImagesRemoteDataSource,
  });

  @override
  Future<Either<ApiFailure, Map<MaterialNumber, ProductImages>>>
      getImagesForMaterials({
    required List<MaterialNumber> list,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final productImages =
            await productImagesLocalDataSource.getProductImages();

        return Right(
          {
            for (var item in productImages) item.materialNumber: item,
          },
        );
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final productImages =
          await productImagesRemoteDataSource.getProductImages(
        materialNumbers: list.map((e) => e.getOrCrash()).toList(),
      );

      return Right(
        {
          for (var item in productImages) item.materialNumber: item,
        },
      );
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
