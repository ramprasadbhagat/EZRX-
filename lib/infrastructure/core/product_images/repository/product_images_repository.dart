import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/product_images/repository/i_product_images_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/product_images/datasource/product_images_local.dart';
import 'package:ezrxmobile/infrastructure/core/product_images/datasource/product_images_remote.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';

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
  Future<Either<ApiFailure, List>> getProductImages({
    required List list,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response = await productImagesLocalDataSource.getProductImages();

        return Right(response);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final materialNumbers =
          list.map((e) => e.materialNumber.getOrCrash()).toList();
      final response = await productImagesRemoteDataSource.getProductImages(
        materialNumbers: materialNumbers,
      );

      final updatedList = List.from(list).map((e) {
        final productImageDetails = response.firstWhere(
          (element) => element.materialNumber == e.materialNumber,
          orElse: () => ProductImages.empty(),
        );

        return e.copyWith(productImages: productImageDetails);
      }).toList();

      return Right(updatedList);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, Map<MaterialNumber, String>>>
      getImagesForMaterials({
    required List<MaterialNumber> list,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final productImages =
            await productImagesLocalDataSource.getProductImages();

        return Right(
          {
            for (var item in productImages) item.materialNumber: item.thumbNail,
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
          for (var item in productImages) item.materialNumber: item.thumbNail,
        },
      );
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
