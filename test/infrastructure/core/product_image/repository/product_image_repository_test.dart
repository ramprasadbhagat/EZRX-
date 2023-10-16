import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/infrastructure/core/product_images/datasource/product_images_local.dart';
import 'package:ezrxmobile/infrastructure/core/product_images/datasource/product_images_remote.dart';
import 'package:ezrxmobile/infrastructure/core/product_images/repository/product_images_repository.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class ProductImagesLocalDataSourceMock extends Mock
    implements ProductImagesLocalDataSource {}

class ProductImagesRemoteDataSourceMock extends Mock
    implements ProductImagesRemoteDataSource {}

void main() {
  late ProductImagesRepository productImagesRepository;
  late Config mockConfig;
  late ProductImagesLocalDataSource productImagesLocalDataSource;
  late ProductImagesRemoteDataSource productImagesRemoteDataSource;

  setUpAll(
    () {
      mockConfig = Config()..appFlavor = Flavor.mock;
      productImagesLocalDataSource = ProductImagesLocalDataSourceMock();
      productImagesRemoteDataSource = ProductImagesRemoteDataSourceMock();
      productImagesRepository = ProductImagesRepository(
        config: mockConfig,
        productImagesLocalDataSource: productImagesLocalDataSource,
        productImagesRemoteDataSource: productImagesRemoteDataSource,
      );
    },
  );

  group('ProductImagesRepository tests', () {
    test('get Product Images successfully local', () async {
      when(() => productImagesLocalDataSource.getProductImages())
          .thenAnswer((invocation) async => <ProductImages>[]);

      final result = await productImagesRepository.getImagesForMaterials(
        list: [],
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get Product Images fail local', () async {
      when(() => productImagesLocalDataSource.getProductImages())
          .thenThrow(MockException());

      final result = await productImagesRepository.getImagesForMaterials(
        list: [],
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test(
      'get Product Images successfully remote ',
      () async {
        mockConfig.appFlavor = Flavor.uat;
        when(
          () => productImagesRemoteDataSource.getProductImages(
            materialNumbers: [],
          ),
        ).thenAnswer((_) async => <ProductImages>[]);
        final result = await productImagesRepository.getImagesForMaterials(
          list: [],
        );
        expect(
          result.isRight(),
          true,
        );
      },
    );

    test(
      'get Product Images fail remote ',
      () async {
        mockConfig.appFlavor = Flavor.uat;
        when(
          () => productImagesRemoteDataSource.getProductImages(
            materialNumbers: [],
          ),
        ).thenThrow(MockException());
        final result = await productImagesRepository.getImagesForMaterials(
          list: [],
        );
        expect(
          result.isLeft(),
          true,
        );
      },
    );
  });
}
