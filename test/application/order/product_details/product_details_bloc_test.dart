import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_org_customer_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/product_detail_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/product_meta_data.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/product_details_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/favourite_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/product_details_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ProductDetailRepositoryMock extends Mock
    implements ProductDetailRepository {}

class FavouriteRepositoryMock extends Mock implements FavouriteRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ProductDetailRepository productDetailMockRepository;
  late FavouriteRepository favouriteMockRepository;
  late MaterialInfo mockMaterialInfo;
  late StockInfo mockStockInfo;
  late ProductMetaData mockProductMetaData;
  late List<MaterialInfo> mockSimilarProducts;
  const locale = Locale('en');
  final salesOrg = SalesOrg('2001');
  final mockCustomerCodeInfo = CustomerCodeInfo.empty();
  final mockShipToInfo = ShipToInfo.empty();
  final mockSalesOrganisation = SalesOrganisation(
    salesOrg: salesOrg,
    customerInfos: <SalesOrgCustomerInfo>[],
  );

  final materialInfoType = MaterialInfoType('material');
  final productImage = ProductImages.empty().copyWith(
    image: [
      'https://ezrxdev.blob.core.windows.net/assets/21041773/21041773.png'
    ],
  );

  setUpAll(() async {
    productDetailMockRepository = ProductDetailRepositoryMock();
    favouriteMockRepository = FavouriteRepositoryMock();
    mockMaterialInfo = await ProductDetailLocalDataSource().getProductDetails();
    mockStockInfo = await StockInfoLocalDataSource().getStockInfo();
    mockProductMetaData =
        await ProductDetailLocalDataSource().getItemProductMetaData();
    mockSimilarProducts =
        await ProductDetailLocalDataSource().getSimilarProduct();
  });

  group(
    'Product Details Bloc Test',
    () {
      blocTest<ProductDetailBloc, ProductDetailState>(
        'Product Detail Initialized',
        build: () => ProductDetailBloc(
          productDetailRepository: productDetailMockRepository,
          favouriteRepository: favouriteMockRepository,
        ),
        act: (ProductDetailBloc bloc) => bloc.add(
          const ProductDetailEvent.initialized(),
        ),
        expect: () => [
          ProductDetailState.initial(),
        ],
      );

      blocTest<ProductDetailBloc, ProductDetailState>(
        'Fetch Product Detail Success',
        build: () => ProductDetailBloc(
          productDetailRepository: productDetailMockRepository,
          favouriteRepository: favouriteMockRepository,
        ),
        setUp: () {
          when(
            () => productDetailMockRepository.getProductDetail(
              salesOrganisation: mockSalesOrganisation,
              customerCodeInfo: mockCustomerCodeInfo,
              shipToInfo: mockShipToInfo,
              locale: locale,
              materialNumber: mockMaterialInfo.materialNumber,
              type: materialInfoType,
            ),
          ).thenAnswer(
            (invocation) async => Right(mockMaterialInfo),
          );
          when(
            () => productDetailMockRepository.getStockInfo(
              salesOrganisation: mockSalesOrganisation,
              customerCodeInfo: mockCustomerCodeInfo,
              materialNumber: mockMaterialInfo.materialNumber,
            ),
          ).thenAnswer((invocation) async => Right(mockStockInfo));
          when(
            () => productDetailMockRepository.getItemProductMetaData(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                stockInfo: mockStockInfo,
                materialInfo: mockMaterialInfo,
              ),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              ProductDetailAggregate.empty().copyWith(
                stockInfo: mockStockInfo,
                materialInfo: mockMaterialInfo.copyWith(
                  productImages: mockProductMetaData.productImages.first,
                ),
                productItem: mockProductMetaData.items.first,
              ),
            ),
          );
          when(
            () => productDetailMockRepository.getSimilarProduct(
              salesOrganisation: mockSalesOrganisation,
              customerCodeInfo: mockCustomerCodeInfo,
              shipToInfo: mockShipToInfo,
              materialNumber: mockMaterialInfo.materialNumber,
              principalCode: mockMaterialInfo.principalData.principalCode,
              locale: locale,
            ),
          ).thenAnswer((invocation) async => Right(mockSimilarProducts));
        },
        act: (ProductDetailBloc bloc) {
          bloc.add(
            ProductDetailEvent.fetch(
              salesOrganisation: mockSalesOrganisation,
              customerCodeInfo: mockCustomerCodeInfo,
              shipToInfo: mockShipToInfo,
              locale: locale,
              materialNumber: mockMaterialInfo.materialNumber,
              type: materialInfoType,
            ),
          );
        },
        expect: () => [
          ProductDetailState.initial().copyWith(
            isFetching: true,
            productDetailAggregate: ProductDetailAggregate.empty(),
            failureOrSuccessOption: none(),
          ),
          ProductDetailState.initial().copyWith(
            isFetching: false,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: mockMaterialInfo,
            ),
          ),
          ProductDetailState.initial().copyWith(
            isFetching: true,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: mockMaterialInfo,
            ),
            failureOrSuccessOption: none(),
          ),
          ProductDetailState.initial().copyWith(
            isFetching: false,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: mockMaterialInfo,
              stockInfo: mockStockInfo,
            ),
          ),
          ProductDetailState.initial().copyWith(
            isFetching: true,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: mockMaterialInfo,
              stockInfo: mockStockInfo,
            ),
            failureOrSuccessOption: none(),
          ),
          ProductDetailState.initial().copyWith(
            isFetching: false,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              stockInfo: mockStockInfo,
              materialInfo: mockMaterialInfo.copyWith(
                productImages: mockProductMetaData.productImages.first,
              ),
              productItem: mockProductMetaData.items.first,
            ),
          ),
          ProductDetailState.initial().copyWith(
            isFetching: true,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              stockInfo: mockStockInfo,
              materialInfo: mockMaterialInfo.copyWith(
                productImages: mockProductMetaData.productImages.first,
              ),
              productItem: mockProductMetaData.items.first,
            ),
            failureOrSuccessOption: none(),
          ),
          ProductDetailState.initial().copyWith(
            isFetching: false,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              stockInfo: mockStockInfo,
              materialInfo: mockMaterialInfo.copyWith(
                productImages: mockProductMetaData.productImages.first,
              ),
              productItem: mockProductMetaData.items.first,
              similarProduct: mockSimilarProducts,
            ),
            failureOrSuccessOption: optionOf(Right(mockSimilarProducts)),
          ),
        ],
      );

      blocTest<ProductDetailBloc, ProductDetailState>(
        'Fetch Product Detail failure',
        build: () => ProductDetailBloc(
          productDetailRepository: productDetailMockRepository,
          favouriteRepository: favouriteMockRepository,
        ),
        setUp: () {
          when(
            () => productDetailMockRepository.getProductDetail(
              salesOrganisation: mockSalesOrganisation,
              customerCodeInfo: mockCustomerCodeInfo,
              shipToInfo: mockShipToInfo,
              locale: locale,
              materialNumber: mockMaterialInfo.materialNumber,
              type: materialInfoType,
            ),
          ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('Fake-Error')),
          );
        },
        act: (ProductDetailBloc bloc) {
          bloc.add(
            ProductDetailEvent.fetch(
              salesOrganisation: mockSalesOrganisation,
              customerCodeInfo: mockCustomerCodeInfo,
              shipToInfo: mockShipToInfo,
              locale: locale,
              materialNumber: mockMaterialInfo.materialNumber,
              type: materialInfoType,
            ),
          );
        },
        expect: () => [
          ProductDetailState.initial().copyWith(
            isFetching: true,
            productDetailAggregate: ProductDetailAggregate.empty(),
            failureOrSuccessOption: none(),
          ),
          ProductDetailState.initial().copyWith(
            isFetching: false,
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('Fake-Error'))),
          ),
        ],
      );

      blocTest<ProductDetailBloc, ProductDetailState>(
        'Failed To Fetch Stock Info',
        build: () => ProductDetailBloc(
          productDetailRepository: productDetailMockRepository,
          favouriteRepository: favouriteMockRepository,
        ),
        setUp: () {
          when(
            () => productDetailMockRepository.getStockInfo(
              salesOrganisation: mockSalesOrganisation,
              customerCodeInfo: mockCustomerCodeInfo,
              materialNumber: mockMaterialInfo.materialNumber,
            ),
          ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('Fake-Error')),
          );
          when(
            () => productDetailMockRepository.getItemProductMetaData(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                stockInfo: StockInfo.empty(),
                materialInfo: mockMaterialInfo,
              ),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              ProductDetailAggregate.empty().copyWith(
                stockInfo: StockInfo.empty(),
                materialInfo: mockMaterialInfo.copyWith(
                  productImages: mockProductMetaData.productImages.first,
                ),
                productItem: mockProductMetaData.items.first,
              ),
            ),
          );
          when(
            () => productDetailMockRepository.getSimilarProduct(
              salesOrganisation: mockSalesOrganisation,
              customerCodeInfo: mockCustomerCodeInfo,
              shipToInfo: mockShipToInfo,
              materialNumber: mockMaterialInfo.materialNumber,
              principalCode: mockMaterialInfo.principalData.principalCode,
              locale: locale,
            ),
          ).thenAnswer((invocation) async => Right(mockSimilarProducts));
        },
        act: (ProductDetailBloc bloc) {
          bloc.add(
            ProductDetailEvent.fetchStock(
              salesOrganisation: mockSalesOrganisation,
              customerCodeInfo: mockCustomerCodeInfo,
              shipToInfo: mockShipToInfo,
              locale: locale,
              materialNumber: mockMaterialInfo.materialNumber,
            ),
          );
        },
        seed: () => ProductDetailState.initial().copyWith(
          isFetching: false,
          productDetailAggregate: ProductDetailAggregate.empty().copyWith(
            materialInfo: mockMaterialInfo,
          ),
        ),
        expect: () => [
          ProductDetailState.initial().copyWith(
            isFetching: true,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: mockMaterialInfo,
            ),
            failureOrSuccessOption: none(),
          ),
          ProductDetailState.initial().copyWith(
            isFetching: false,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: mockMaterialInfo,
            ),
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('Fake-Error'))),
          ),
          ProductDetailState.initial().copyWith(
            isFetching: true,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: mockMaterialInfo,
              stockInfo: StockInfo.empty(),
            ),
            failureOrSuccessOption: none(),
          ),
          ProductDetailState.initial().copyWith(
            isFetching: false,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              stockInfo: StockInfo.empty(),
              materialInfo: mockMaterialInfo.copyWith(
                productImages: mockProductMetaData.productImages.first,
              ),
              productItem: mockProductMetaData.items.first,
            ),
          ),
          ProductDetailState.initial().copyWith(
            isFetching: true,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              stockInfo: StockInfo.empty(),
              materialInfo: mockMaterialInfo.copyWith(
                productImages: mockProductMetaData.productImages.first,
              ),
              productItem: mockProductMetaData.items.first,
            ),
            failureOrSuccessOption: none(),
          ),
          ProductDetailState.initial().copyWith(
            isFetching: false,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              stockInfo: StockInfo.empty(),
              materialInfo: mockMaterialInfo.copyWith(
                productImages: mockProductMetaData.productImages.first,
              ),
              productItem: mockProductMetaData.items.first,
              similarProduct: mockSimilarProducts,
            ),
            failureOrSuccessOption: optionOf(Right(mockSimilarProducts)),
          ),
        ],
      );

      blocTest<ProductDetailBloc, ProductDetailState>(
        'Failed to Fetch Meta Data',
        build: () => ProductDetailBloc(
          productDetailRepository: productDetailMockRepository,
          favouriteRepository: favouriteMockRepository,
        ),
        setUp: () {
          when(
            () => productDetailMockRepository.getItemProductMetaData(
              productDetailAggregate: ProductDetailAggregate.empty().copyWith(
                stockInfo: mockStockInfo,
                materialInfo: mockMaterialInfo,
              ),
            ),
          ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('Fake-Error')),
          );
          when(
            () => productDetailMockRepository.getSimilarProduct(
              salesOrganisation: mockSalesOrganisation,
              customerCodeInfo: mockCustomerCodeInfo,
              shipToInfo: mockShipToInfo,
              materialNumber: mockMaterialInfo.materialNumber,
              principalCode: mockMaterialInfo.principalData.principalCode,
              locale: locale,
            ),
          ).thenAnswer((invocation) async => Right(mockSimilarProducts));
        },
        act: (ProductDetailBloc bloc) {
          bloc.add(
            ProductDetailEvent.fetchMetaData(
              salesOrganisation: mockSalesOrganisation,
              customerCodeInfo: mockCustomerCodeInfo,
              shipToInfo: mockShipToInfo,
              locale: locale,
            ),
          );
        },
        seed: () => ProductDetailState.initial().copyWith(
          isFetching: false,
          productDetailAggregate: ProductDetailAggregate.empty().copyWith(
            materialInfo: mockMaterialInfo,
            stockInfo: mockStockInfo,
          ),
          failureOrSuccessOption: none(),
        ),
        expect: () => [
          ProductDetailState.initial().copyWith(
            isFetching: true,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: mockMaterialInfo,
              stockInfo: mockStockInfo,
            ),
            failureOrSuccessOption: none(),
          ),
          ProductDetailState.initial().copyWith(
            isFetching: false,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              stockInfo: mockStockInfo,
              materialInfo: mockMaterialInfo,
            ),
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('Fake-Error'))),
          ),
          ProductDetailState.initial().copyWith(
            isFetching: true,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              stockInfo: mockStockInfo,
              materialInfo: mockMaterialInfo,
            ),
            failureOrSuccessOption: none(),
          ),
          ProductDetailState.initial().copyWith(
            isFetching: false,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              stockInfo: mockStockInfo,
              materialInfo: mockMaterialInfo,
              similarProduct: mockSimilarProducts,
            ),
            failureOrSuccessOption: optionOf(Right(mockSimilarProducts)),
          ),
        ],
      );

      blocTest<ProductDetailBloc, ProductDetailState>(
        'Failed To Fetch Similar Products',
        build: () => ProductDetailBloc(
          productDetailRepository: productDetailMockRepository,
          favouriteRepository: favouriteMockRepository,
        ),
        setUp: () {
          when(
            () => productDetailMockRepository.getSimilarProduct(
              salesOrganisation: mockSalesOrganisation,
              customerCodeInfo: mockCustomerCodeInfo,
              shipToInfo: mockShipToInfo,
              materialNumber: mockMaterialInfo.materialNumber,
              principalCode: mockMaterialInfo.principalData.principalCode,
              locale: locale,
            ),
          ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('Fake-Error')),
          );
        },
        act: (ProductDetailBloc bloc) {
          bloc.add(
            ProductDetailEvent.fetchSimilarProduct(
              salesOrganisation: mockSalesOrganisation,
              customerCodeInfo: mockCustomerCodeInfo,
              shipToInfo: mockShipToInfo,
              locale: locale,
            ),
          );
        },
        seed: () => ProductDetailState.initial().copyWith(
          isFetching: false,
          productDetailAggregate: ProductDetailAggregate.empty().copyWith(
            stockInfo: mockStockInfo,
            materialInfo: mockMaterialInfo.copyWith(
              productImages: mockProductMetaData.productImages.first,
            ),
            productItem: mockProductMetaData.items.first,
          ),
        ),
        expect: () => [
          ProductDetailState.initial().copyWith(
            isFetching: true,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              stockInfo: mockStockInfo,
              materialInfo: mockMaterialInfo.copyWith(
                productImages: mockProductMetaData.productImages.first,
              ),
              productItem: mockProductMetaData.items.first,
            ),
            failureOrSuccessOption: none(),
          ),
          ProductDetailState.initial().copyWith(
            isFetching: false,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              stockInfo: mockStockInfo,
              materialInfo: mockMaterialInfo.copyWith(
                productImages: mockProductMetaData.productImages.first,
              ),
              productItem: mockProductMetaData.items.first,
            ),
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('Fake-Error'))),
          ),
        ],
      );

      blocTest<ProductDetailBloc, ProductDetailState>(
        'Product Details Change Image',
        build: () => ProductDetailBloc(
          productDetailRepository: productDetailMockRepository,
          favouriteRepository: favouriteMockRepository,
        ),
        act: (ProductDetailBloc bloc) {
          bloc.add(
            ProductDetailEvent.changeImage(2),
          );
        },
        seed: () => ProductDetailState.initial().copyWith(
          isFetching: false,
          productDetailAggregate: ProductDetailAggregate.empty().copyWith(
            stockInfo: mockStockInfo,
            materialInfo: mockMaterialInfo.copyWith(
              productImages: mockProductMetaData.productImages.first,
            ),
            productItem: mockProductMetaData.items.first,
            similarProduct: mockSimilarProducts,
          ),
        ),
        expect: () => [
          ProductDetailState.initial().copyWith(
            isFetching: false,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              stockInfo: mockStockInfo,
              materialInfo: mockMaterialInfo.copyWith(
                productImages: mockProductMetaData.productImages.first,
              ),
              productItem: mockProductMetaData.items.first,
              similarProduct: mockSimilarProducts,
            ),
            selectedImageIndex: 2,
          ),
        ],
      );

      blocTest<ProductDetailBloc, ProductDetailState>(
        'Add Favourite Success Not For Similar Products',
        build: () => ProductDetailBloc(
          productDetailRepository: productDetailMockRepository,
          favouriteRepository: favouriteMockRepository,
        ),
        setUp: () {
          when(
            () => favouriteMockRepository.addToFavourites(
              materialNumber: mockMaterialInfo.materialNumber,
              list: [
                mockMaterialInfo.copyWith(
                  productImages: mockProductMetaData.productImages.first,
                )
              ],
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                mockMaterialInfo.copyWith(
                  isFavourite: true,
                  productImages: mockProductMetaData.productImages.first,
                )
              ],
            ),
          );
        },
        act: (ProductDetailBloc bloc) {
          bloc.add(
            ProductDetailEvent.addFavourite(
              isForSimilarProduct: false,
              materialNumber: mockMaterialInfo.materialNumber,
            ),
          );
        },
        seed: () => ProductDetailState.initial().copyWith(
          isFetching: false,
          productDetailAggregate: ProductDetailAggregate.empty().copyWith(
            stockInfo: mockStockInfo,
            materialInfo: mockMaterialInfo.copyWith(
              productImages: mockProductMetaData.productImages.first,
            ),
            productItem: mockProductMetaData.items.first,
            similarProduct: mockSimilarProducts,
          ),
        ),
        expect: () => [
          ProductDetailState.initial().copyWith(
            isFetching: false,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              stockInfo: mockStockInfo,
              materialInfo: mockMaterialInfo.copyWith(
                productImages: mockProductMetaData.productImages.first,
                isFavourite: true,
              ),
              productItem: mockProductMetaData.items.first,
              similarProduct: mockSimilarProducts,
            ),
          ),
        ],
      );

      blocTest<ProductDetailBloc, ProductDetailState>(
        'Add Favourite Success For Similar Products',
        build: () => ProductDetailBloc(
          productDetailRepository: productDetailMockRepository,
          favouriteRepository: favouriteMockRepository,
        ),
        setUp: () {
          when(
            () => favouriteMockRepository.addToFavourites(
              materialNumber: mockMaterialInfo.materialNumber,
              list: mockSimilarProducts,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              mockSimilarProducts
                  .map(
                    (e) => e.materialNumber == mockMaterialInfo.materialNumber
                        ? e.copyWith(isFavourite: true)
                        : e,
                  )
                  .toList(),
            ),
          );
        },
        act: (ProductDetailBloc bloc) {
          bloc.add(
            ProductDetailEvent.addFavourite(
              isForSimilarProduct: true,
              materialNumber: mockMaterialInfo.materialNumber,
            ),
          );
        },
        seed: () => ProductDetailState.initial().copyWith(
          isFetching: false,
          productDetailAggregate: ProductDetailAggregate.empty().copyWith(
            stockInfo: mockStockInfo,
            materialInfo: mockMaterialInfo.copyWith(
              productImages: mockProductMetaData.productImages.first,
            ),
            productItem: mockProductMetaData.items.first,
            similarProduct: mockSimilarProducts,
          ),
        ),
        expect: () => [
          ProductDetailState.initial().copyWith(
            isFetching: false,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              stockInfo: mockStockInfo,
              materialInfo: mockMaterialInfo.copyWith(
                productImages: mockProductMetaData.productImages.first,
                isFavourite: false,
              ),
              productItem: mockProductMetaData.items.first,
              similarProduct: mockSimilarProducts
                  .map(
                    (e) => e.materialNumber == mockMaterialInfo.materialNumber
                        ? e.copyWith(isFavourite: true)
                        : e,
                  )
                  .toList(),
            ),
          ),
        ],
      );

      blocTest<ProductDetailBloc, ProductDetailState>(
        'Add Favourite Failure',
        build: () => ProductDetailBloc(
          productDetailRepository: productDetailMockRepository,
          favouriteRepository: favouriteMockRepository,
        ),
        setUp: () {
          when(
            () => favouriteMockRepository.addToFavourites(
              materialNumber: mockMaterialInfo.materialNumber,
              list: [
                mockMaterialInfo.copyWith(
                  productImages: mockProductMetaData.productImages.first,
                )
              ],
            ),
          ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('Fake-Error')),
          );
        },
        act: (ProductDetailBloc bloc) {
          bloc.add(
            ProductDetailEvent.addFavourite(
              isForSimilarProduct: false,
              materialNumber: mockMaterialInfo.materialNumber,
            ),
          );
        },
        seed: () => ProductDetailState.initial().copyWith(
          isFetching: false,
          productDetailAggregate: ProductDetailAggregate.empty().copyWith(
            stockInfo: mockStockInfo,
            materialInfo: mockMaterialInfo.copyWith(
              productImages: mockProductMetaData.productImages.first,
            ),
            productItem: mockProductMetaData.items.first,
            similarProduct: mockSimilarProducts,
          ),
        ),
        expect: () => [
          ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              stockInfo: mockStockInfo,
              materialInfo: mockMaterialInfo.copyWith(
                productImages: mockProductMetaData.productImages.first,
                isFavourite: false,
              ),
              productItem: mockProductMetaData.items.first,
              similarProduct: mockSimilarProducts,
            ),
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('Fake-Error'))),
          ),
        ],
      );

      blocTest<ProductDetailBloc, ProductDetailState>(
        'Delete Favourite Success Not For Similar Products',
        build: () => ProductDetailBloc(
          productDetailRepository: productDetailMockRepository,
          favouriteRepository: favouriteMockRepository,
        ),
        setUp: () {
          when(
            () => favouriteMockRepository.removeFromFavourites(
              materialNumber: mockMaterialInfo.materialNumber,
              list: [
                mockMaterialInfo.copyWith(
                  isFavourite: true,
                  productImages: mockProductMetaData.productImages.first,
                )
              ],
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                mockMaterialInfo.copyWith(
                  isFavourite: false,
                  productImages: mockProductMetaData.productImages.first,
                )
              ],
            ),
          );
        },
        act: (ProductDetailBloc bloc) {
          bloc.add(
            ProductDetailEvent.deleteFavourite(
              isForSimilarProduct: false,
              materialNumber: mockMaterialInfo.materialNumber,
            ),
          );
        },
        seed: () => ProductDetailState.initial().copyWith(
          isFetching: false,
          productDetailAggregate: ProductDetailAggregate.empty().copyWith(
            stockInfo: mockStockInfo,
            materialInfo: mockMaterialInfo.copyWith(
              isFavourite: true,
              productImages: mockProductMetaData.productImages.first,
            ),
            productItem: mockProductMetaData.items.first,
            similarProduct: mockSimilarProducts,
          ),
        ),
        expect: () => [
          ProductDetailState.initial().copyWith(
            isFetching: false,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              stockInfo: mockStockInfo,
              materialInfo: mockMaterialInfo.copyWith(
                productImages: mockProductMetaData.productImages.first,
                isFavourite: false,
              ),
              productItem: mockProductMetaData.items.first,
              similarProduct: mockSimilarProducts,
            ),
          ),
        ],
      );

      blocTest<ProductDetailBloc, ProductDetailState>(
        'Delete Favourite Success For Similar Products',
        build: () => ProductDetailBloc(
          productDetailRepository: productDetailMockRepository,
          favouriteRepository: favouriteMockRepository,
        ),
        setUp: () {
          when(
            () => favouriteMockRepository.removeFromFavourites(
              materialNumber: mockMaterialInfo.materialNumber,
              list: mockSimilarProducts
                  .map(
                    (e) => e.materialNumber == mockMaterialInfo.materialNumber
                        ? e.copyWith(isFavourite: true)
                        : e,
                  )
                  .toList(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              mockSimilarProducts
                  .map(
                    (e) => e.materialNumber == mockMaterialInfo.materialNumber
                        ? e.copyWith(isFavourite: false)
                        : e,
                  )
                  .toList(),
            ),
          );
        },
        act: (ProductDetailBloc bloc) {
          bloc.add(
            ProductDetailEvent.deleteFavourite(
              isForSimilarProduct: true,
              materialNumber: mockMaterialInfo.materialNumber,
            ),
          );
        },
        seed: () => ProductDetailState.initial().copyWith(
          isFetching: false,
          productDetailAggregate: ProductDetailAggregate.empty().copyWith(
            stockInfo: mockStockInfo,
            materialInfo: mockMaterialInfo.copyWith(
              productImages: mockProductMetaData.productImages.first,
            ),
            productItem: mockProductMetaData.items.first,
            similarProduct: mockSimilarProducts
                .map(
                  (e) => e.materialNumber == mockMaterialInfo.materialNumber
                      ? e.copyWith(isFavourite: true)
                      : e,
                )
                .toList(),
          ),
        ),
        expect: () => [
          ProductDetailState.initial().copyWith(
            isFetching: false,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              stockInfo: mockStockInfo,
              materialInfo: mockMaterialInfo.copyWith(
                productImages: mockProductMetaData.productImages.first,
                isFavourite: false,
              ),
              productItem: mockProductMetaData.items.first,
              similarProduct: mockSimilarProducts
                  .map(
                    (e) => e.materialNumber == mockMaterialInfo.materialNumber
                        ? e.copyWith(isFavourite: false)
                        : e,
                  )
                  .toList(),
            ),
          ),
        ],
      );

      blocTest<ProductDetailBloc, ProductDetailState>(
        'Delete Favourite Failure',
        build: () => ProductDetailBloc(
          productDetailRepository: productDetailMockRepository,
          favouriteRepository: favouriteMockRepository,
        ),
        setUp: () {
          when(
            () => favouriteMockRepository.removeFromFavourites(
              materialNumber: mockMaterialInfo.materialNumber,
              list: [
                mockMaterialInfo.copyWith(
                  isFavourite: true,
                  productImages: mockProductMetaData.productImages.first,
                )
              ],
            ),
          ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('Fake-Error')),
          );
        },
        act: (ProductDetailBloc bloc) {
          bloc.add(
            ProductDetailEvent.deleteFavourite(
              isForSimilarProduct: false,
              materialNumber: mockMaterialInfo.materialNumber,
            ),
          );
        },
        seed: () => ProductDetailState.initial().copyWith(
          isFetching: false,
          productDetailAggregate: ProductDetailAggregate.empty().copyWith(
            stockInfo: mockStockInfo,
            materialInfo: mockMaterialInfo.copyWith(
              isFavourite: true,
              productImages: mockProductMetaData.productImages.first,
            ),
            productItem: mockProductMetaData.items.first,
            similarProduct: mockSimilarProducts,
          ),
        ),
        expect: () => [
          ProductDetailState.initial().copyWith(
            isFetching: false,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              stockInfo: mockStockInfo,
              materialInfo: mockMaterialInfo.copyWith(
                productImages: mockProductMetaData.productImages.first,
                isFavourite: true,
              ),
              productItem: mockProductMetaData.items.first,
              similarProduct: mockSimilarProducts,
            ),
            failureOrSuccessOption: optionOf(
              const Left(ApiFailure.other('Fake-Error')),
            ),
          ),
        ],
      );

      test(
        'Check SelectedImage value for Product Details Bloc If Product Image Is Empty',
        () {
          final productDetailState = ProductDetailState.initial().copyWith(
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo: mockMaterialInfo,
            ),
          );
          final selectedImage = productDetailState.selectedImage;
          expect(selectedImage, StringValue(''));
        },
      );

      test(
        'Check SelectedImage value for Product Details Bloc If Product Image Is Not Empty',
        () {
          final productDetailState = ProductDetailState.initial().copyWith(
            selectedImageIndex: 0,
            productDetailAggregate: ProductDetailAggregate.empty().copyWith(
              materialInfo:
                  mockMaterialInfo.copyWith(productImages: productImage),
            ),
          );
          final selectedIndex = productDetailState.selectedImageIndex;
          final images =
              productDetailState.productDetailAggregate.materialInfo.images;
          final matcher = StringValue(images.elementAt(selectedIndex));
          final selectedImage = productDetailState.selectedImage;
          expect(selectedImage, matcher);
        },
      );
    },
  );
}
