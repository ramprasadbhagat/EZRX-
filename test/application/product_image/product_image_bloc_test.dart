import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/product_images/datasource/product_images_local.dart';
import 'package:ezrxmobile/infrastructure/core/product_images/repository/product_images_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ProductImagesRepositoryMock extends Mock
    implements ProductImagesRepository {}

void main() {
  late final ProductImagesRepository repository;

  late final Map<MaterialNumber, String> mockMaterialImageUrl;

  final fakeMaterialInfoList = [
    MaterialInfo.empty().copyWith(materialNumber: MaterialNumber('1')),
    MaterialInfo.empty().copyWith(materialNumber: MaterialNumber('2')),
  ];

  final fakeMaterialNumberList1 = [
    MaterialNumber('000000000021041790'),
    MaterialNumber('2'),
  ];

  final fakeMaterialInfoList1 = [
    MaterialInfo.empty().copyWith(materialNumber: MaterialNumber('000000000021041790')),
    MaterialInfo.empty().copyWith(materialNumber: MaterialNumber('2')),
  ];

  final fakeMaterialImageUrl = {
    MaterialNumber('1'): 'image_url_1',
    MaterialNumber('2'): 'image_url_2',
  };

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    repository = ProductImagesRepositoryMock();
    final productImages =
        await ProductImagesLocalDataSource().getProductImages();
    mockMaterialImageUrl = {
      for (var item in productImages) item.materialNumber: item.thumbNail,
    };
  });

  group('Image Product Bloc', () {
    blocTest(
      'Initialize',
      build: () => ProductImageBloc(productImagesRepository: repository),
      act: (ProductImageBloc bloc) => bloc.add(
        const ProductImageEvent.initialized(),
      ),
      expect: () => [ProductImageState.initial()],
    );

    blocTest<ProductImageBloc, ProductImageState>(
        'Fetch Product Image when all materials already present on state',
        build: () => ProductImageBloc(productImagesRepository: repository),
        seed: () => ProductImageState.initial().copyWith(
              materialUrlMap: fakeMaterialImageUrl,
            ),
        act: (ProductImageBloc bloc) => bloc.add(
              ProductImageEvent.fetch(list: fakeMaterialInfoList),
            ),
        expect: () {
          return [
            ProductImageState.initial().copyWith(
              isFetching: true,
              materialUrlMap: fakeMaterialImageUrl,
            ),
            ProductImageState.initial().copyWith(
              isFetching: false,
              materialUrlMap: fakeMaterialImageUrl,
            ),
          ];
        });

    blocTest<ProductImageBloc, ProductImageState>(
      'Fetch material image success',
      build: () => ProductImageBloc(productImagesRepository: repository),
      setUp: () {
        when(
          () => repository.getImagesForMaterials(
            list: fakeMaterialNumberList1,
          ),
        ).thenAnswer(
          (_) async => Right(mockMaterialImageUrl),
        );
      },
      act: (ProductImageBloc bloc) => bloc.add(
        ProductImageEvent.fetch(
          list: fakeMaterialInfoList1
        ),
      ),
      expect: () => [
        ProductImageState.initial().copyWith(
          isFetching: true,
        ),
        ProductImageState.initial().copyWith(
          isFetching: false,
          materialUrlMap: mockMaterialImageUrl,
        ),
      ],
    );

    blocTest<ProductImageBloc, ProductImageState>(
      'Fetch material image failure',
      build: () => ProductImageBloc(productImagesRepository: repository),
      setUp: () {
        when(
          () => repository.getImagesForMaterials(
            list: fakeMaterialNumberList1,
          ),
        ).thenAnswer(
          (_) async => const Left(ApiFailure.other('fake-error')),
        );
      },
      act: (ProductImageBloc bloc) => bloc.add(
        ProductImageEvent.fetch(
          list: fakeMaterialInfoList1
        ),
      ),
      expect: () => [
        ProductImageState.initial().copyWith(
          isFetching: true,
        ),
        ProductImageState.initial().copyWith(
          isFetching: false,
        ),
      ],
    );
  });
}
