import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/product_images/repository/product_images_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ProductImagesRepositoryMock extends Mock
    implements ProductImagesRepository {}

void main() {
  late ProductImages productImage;
  late final ProductImagesRepository repository;
  late Map<MaterialNumber, ProductImages> fetchedMaterialImageMap;
  late Map<MaterialNumber, ProductImages> notFetchedMaterialImageMap;

  final fetchedMaterials = <MaterialInfo>[
    MaterialInfo.empty().copyWith(materialNumber: MaterialNumber('3')),
    MaterialInfo.empty().copyWith(materialNumber: MaterialNumber('4')),
  ];

  final notFetchedMaterials = <MaterialInfo>[
    MaterialInfo.empty().copyWith(materialNumber: MaterialNumber('1')),
    MaterialInfo.empty().copyWith(materialNumber: MaterialNumber('2')),
  ];



  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    repository = ProductImagesRepositoryMock();
    productImage = ProductImages.empty().copyWith(thumbNail: 'image_url_1');
    fetchedMaterialImageMap = {
      for (var materialInfo in fetchedMaterials)
        materialInfo.materialNumber:
            productImage.copyWith(materialNumber: materialInfo.materialNumber),
    };
    notFetchedMaterialImageMap = {
      for (var materialInfo in notFetchedMaterials)
        materialInfo.materialNumber:
            productImage.copyWith(materialNumber: materialInfo.materialNumber),
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
        productImageMap: fetchedMaterialImageMap,
      ),
      act: (ProductImageBloc bloc) => bloc.add(
        ProductImageEvent.fetch(list: fetchedMaterials),
      ),
      expect: () {
        return [
          ProductImageState.initial().copyWith(
            isFetching: true,
            productImageMap: fetchedMaterialImageMap,
          ),
          ProductImageState.initial().copyWith(
            isFetching: false,
            productImageMap: fetchedMaterialImageMap,
          ),
        ];
      },
    );

    blocTest<ProductImageBloc, ProductImageState>(
      'Fetch material image success',
      build: () => ProductImageBloc(productImagesRepository: repository),
      setUp: () {
        when(
          () => repository.getImagesForMaterials(
            list: notFetchedMaterials.map((e) => e.materialNumber).toList(),
          ),
        ).thenAnswer(
          (_) async => Right(notFetchedMaterialImageMap),
        );
      },
      act: (ProductImageBloc bloc) => bloc.add(
        ProductImageEvent.fetch(list: notFetchedMaterials),
      ),
      expect: () => [
        ProductImageState.initial().copyWith(
          isFetching: true,
        ),
        ProductImageState.initial().copyWith(
          isFetching: false,
          productImageMap: notFetchedMaterialImageMap,
        ),
      ],
    );

    blocTest<ProductImageBloc, ProductImageState>(
      'Fetch material image failure',
      seed: () => ProductImageState.initial().copyWith(
        productImageMap: fetchedMaterialImageMap,
      ),
      build: () => ProductImageBloc(productImagesRepository: repository),
      setUp: () {
        when(
          () => repository.getImagesForMaterials(
            list: notFetchedMaterials.map((e) => e.materialNumber).toList(),
          ),
        ).thenAnswer(
          (_) async => const Left(ApiFailure.other('fake-error')),
        );
      },
      act: (ProductImageBloc bloc) => bloc.add(
        ProductImageEvent.fetch(list: notFetchedMaterials),
      ),
      expect: () => [
        ProductImageState.initial().copyWith(
          isFetching: true,
          productImageMap: fetchedMaterialImageMap,
        ),
        ProductImageState.initial().copyWith(
          isFetching: false,
          productImageMap: fetchedMaterialImageMap,
        ),
      ],
    );
  });
}
