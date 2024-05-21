import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/add_favourite.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/remove_favourite.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/favourite_local.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/favourite_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_list_repository.dart';

import '../../../common_mock_data/user_mock.dart';
import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';

class MockMaterialListRepository extends Mock
    implements MaterialListRepository {}

class MockFavouriteRepository extends Mock implements FavouriteRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MaterialListRepository materialListMockRepository;
  late FavouriteRepository favouriteMockRepository;
  late Config config;
  final mockSelectedMaterialFilter = MaterialFilter.empty();
  late final MaterialResponse materialResponseMock;
  late final AddFavourite addToFavouritesResponseMock;
  late final RemoveFavourite removeFavouritesResponseMock;
  late List<MaterialStockInfo> stockInfoList;
  late List addToFavouritesList;
  late List removeFavouritesList;
  final materialState = MaterialListState.initial().copyWith(
    salesOrganisation: fakeSGSalesOrganisation,
    configs: fakeSGSalesOrgConfigs,
    customerCodeInfo: fakeCustomerCodeInfo,
    shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
    user: fakeClientUser,
  );
  final updatedSelectedMaterialFilter =
      materialState.selectedMaterialFilter.copyWith(
    isFavourite: mockSelectedMaterialFilter.isFavourite,
    isCovidSelected: mockSelectedMaterialFilter.isCovidSelected,
    bundleOffers: mockSelectedMaterialFilter.bundleOffers,
    isProductOffer: mockSelectedMaterialFilter.isProductOffer,
    sortBy: mockSelectedMaterialFilter.sortBy,
    countryListSelected: mockSelectedMaterialFilter.countryListSelected,
    brandList: mockSelectedMaterialFilter.brandList,
    manufactureListSelected: mockSelectedMaterialFilter.manufactureListSelected,
    isMarketPlace: mockSelectedMaterialFilter.isMarketPlace,
  );
  setUpAll(() async {
    materialListMockRepository = MockMaterialListRepository();
    favouriteMockRepository = MockFavouriteRepository();
    config = Config()..appFlavor = Flavor.mock;
    stockInfoList = await StockInfoLocalDataSource().getMaterialStockInfoList();
    materialResponseMock = await MaterialListLocalDataSource().getProductList();
    addToFavouritesResponseMock =
        await FavouriteLocalDataSource().addFavouriteMaterial();
    removeFavouritesResponseMock =
        await FavouriteLocalDataSource().removeFavouriteMaterial();
  });

  setUp(() {
    when(() => favouriteMockRepository.watchFavoriteStatus())
        .thenAnswer((_) => Stream.fromIterable([]));
  });

  group('Material List Bloc', () {
    blocTest<MaterialListBloc, MaterialListState>(
      'Material List Initialize',
      build: () => MaterialListBloc(
        materialListRepository: materialListMockRepository,
        favouriteRepository: favouriteMockRepository,
        config: config,
      ),
      setUp: () {
        when(
          () => materialListMockRepository.getMaterialList(
            salesOrganisation: fakeSGSalesOrganisation,
            salesOrgConfig: fakeSGSalesOrgConfigs,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            pageSize: config.productTabPageSize,
            offset: 0,
            selectedMaterialFilter: mockSelectedMaterialFilter,
            user: fakeClientUser,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (MaterialListBloc bloc) => bloc.add(
        MaterialListEvent.initialized(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSGSalesOrganisation,
          configs: fakeSGSalesOrgConfigs,
          shipToInfo: fakeShipToInfo,
          user: fakeClientUser,
          selectedMaterialFilter: mockSelectedMaterialFilter,
        ),
      ),
      expect: () => [
        materialState,
        materialState.copyWith(
          isFetching: true,
          selectedMaterialFilter: materialState.selectedMaterialFilter.copyWith(
            isFavourite: mockSelectedMaterialFilter.isFavourite,
            isCovidSelected: mockSelectedMaterialFilter.isCovidSelected,
            bundleOffers: mockSelectedMaterialFilter.bundleOffers,
            isProductOffer: mockSelectedMaterialFilter.isProductOffer,
            sortBy: mockSelectedMaterialFilter.sortBy,
            countryListSelected: mockSelectedMaterialFilter.countryListSelected,
            brandList: mockSelectedMaterialFilter.brandList,
            manufactureListSelected:
                mockSelectedMaterialFilter.manufactureListSelected,
            isMarketPlace: mockSelectedMaterialFilter.isMarketPlace,
          ),
        ),
        materialState.copyWith(
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
        ),
      ],
    );

    blocTest(
      'Fetch material list success',
      build: () => MaterialListBloc(
        materialListRepository: materialListMockRepository,
        favouriteRepository: favouriteMockRepository,
        config: config,
      ),
      seed: () => materialState,
      setUp: () {
        when(
          () => materialListMockRepository.getMaterialList(
            salesOrganisation: fakeSGSalesOrganisation,
            salesOrgConfig: fakeSGSalesOrgConfigs,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeClientUser,
            pageSize: config.productTabPageSize,
            offset: 0,
            selectedMaterialFilter: mockSelectedMaterialFilter,
          ),
        ).thenAnswer(
          (invocation) async => Right(materialResponseMock),
        );
        when(
          () => materialListMockRepository.getStockInfoList(
            materials: materialResponseMock.products,
            salesOrganisation: fakeSGSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ).thenAnswer((_) async => const Left(ApiFailure.other('fake-error')));
      },
      act: (MaterialListBloc bloc) {
        bloc.add(
          MaterialListEvent.fetch(
            selectedMaterialFilter: mockSelectedMaterialFilter,
          ),
        );
      },
      expect: () {
        return [
          materialState.copyWith(
            isFetching: true,
            materialList: <MaterialInfo>[],
            nextPageIndex: 0,
            apiFailureOrSuccessOption: none(),
            selectedMaterialFilter: updatedSelectedMaterialFilter,
          ),
          materialState.copyWith(
            materialCount: materialResponseMock.count,
            materialList: materialResponseMock.products,
            apiFailureOrSuccessOption: optionOf(Right(materialResponseMock)),
            canLoadMore: materialResponseMock.products.length >=
                config.productTabPageSize,
            nextPageIndex: 1,
            selectedMaterialFilter: updatedSelectedMaterialFilter,
          ),
          materialState.copyWith(
            materialCount: materialResponseMock.count,
            materialList: materialResponseMock.products,
            apiFailureOrSuccessOption: none(),
            canLoadMore: materialResponseMock.products.length >=
                config.productTabPageSize,
            nextPageIndex: 1,
            selectedMaterialFilter: updatedSelectedMaterialFilter,
          ),
          materialState.copyWith(
            materialCount: materialResponseMock.count,
            materialList: materialResponseMock.products,
            apiFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fake-error'))),
            canLoadMore: materialResponseMock.products.length >=
                config.productTabPageSize,
            nextPageIndex: 1,
            selectedMaterialFilter: updatedSelectedMaterialFilter,
          ),
        ];
      },
    );

    blocTest(
      'Fetch material list fail',
      build: () => MaterialListBloc(
        materialListRepository: materialListMockRepository,
        favouriteRepository: favouriteMockRepository,
        config: config,
      ),
      seed: () => materialState,
      setUp: () {
        when(
          () => materialListMockRepository.getMaterialList(
            salesOrganisation: fakeSGSalesOrganisation,
            salesOrgConfig: fakeSGSalesOrgConfigs,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            pageSize: config.productTabPageSize,
            offset: 0,
            selectedMaterialFilter: mockSelectedMaterialFilter,
            user: fakeClientUser,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (MaterialListBloc bloc) {
        bloc.add(
          MaterialListEvent.fetch(
            selectedMaterialFilter: mockSelectedMaterialFilter,
          ),
        );
      },
      expect: () => [
        materialState.copyWith(
          isFetching: true,
          selectedMaterialFilter: materialState.selectedMaterialFilter.copyWith(
            isFavourite: mockSelectedMaterialFilter.isFavourite,
            isCovidSelected: mockSelectedMaterialFilter.isCovidSelected,
            bundleOffers: mockSelectedMaterialFilter.bundleOffers,
            isProductOffer: mockSelectedMaterialFilter.isProductOffer,
            sortBy: mockSelectedMaterialFilter.sortBy,
            countryListSelected: mockSelectedMaterialFilter.countryListSelected,
            brandList: mockSelectedMaterialFilter.brandList,
            manufactureListSelected:
                mockSelectedMaterialFilter.manufactureListSelected,
            isMarketPlace: mockSelectedMaterialFilter.isMarketPlace,
          ),
        ),
        materialState.copyWith(
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
        ),
      ],
    );

    blocTest(
      'Update search key',
      build: () => MaterialListBloc(
        materialListRepository: materialListMockRepository,
        favouriteRepository: favouriteMockRepository,
        config: config,
      ),
      seed: () => materialState,
      act: (MaterialListBloc bloc) {
        bloc.add(
          const MaterialListEvent.updateSearchKey(
            searchKey: 'mock-search-text',
          ),
        );
      },
      expect: () => [
        materialState.copyWith(
          searchKey: SearchKey.search('mock-search-text'),
        ),
      ],
    );

    blocTest(
      'Load more success',
      build: () => MaterialListBloc(
        materialListRepository: materialListMockRepository,
        favouriteRepository: favouriteMockRepository,
        config: config,
      ),
      setUp: () {
        when(
          () => materialListMockRepository.getMaterialList(
            salesOrganisation: fakeSGSalesOrganisation,
            salesOrgConfig: fakeSGSalesOrgConfigs,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            pageSize: config.productTabPageSize,
            offset: materialState.materialList.length,
            selectedMaterialFilter: mockSelectedMaterialFilter,
            user: fakeClientUser,
          ),
        ).thenAnswer(
          (invocation) async => Right(materialResponseMock),
        );
        when(
          () => materialListMockRepository.getStockInfoList(
            materials: materialResponseMock.products,
            salesOrganisation: fakeSGSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ).thenAnswer((_) async => const Left(ApiFailure.other('fake-error')));
      },
      seed: () => materialState,
      act: (MaterialListBloc bloc) {
        bloc.add(
          const MaterialListEvent.loadMore(),
        );
      },
      expect: () {
        final productList = List<MaterialInfo>.from(materialState.materialList)
          ..addAll(materialResponseMock.products);
        return [
          materialState.copyWith(
            isFetching: true,
          ),
          materialState.copyWith(
            materialCount: materialResponseMock.count,
            materialList: productList,
            canLoadMore: productList.length >= config.productTabPageSize,
            nextPageIndex: materialState.nextPageIndex + 1,
          ),
          materialState.copyWith(
            materialCount: materialResponseMock.count,
            materialList: productList,
            canLoadMore: productList.length >= config.productTabPageSize,
            nextPageIndex: materialState.nextPageIndex + 1,
            apiFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fake-error'))),
          ),
        ];
      },
    );

    blocTest(
      'Load more fail',
      build: () => MaterialListBloc(
        materialListRepository: materialListMockRepository,
        favouriteRepository: favouriteMockRepository,
        config: config,
      ),
      setUp: () {
        when(
          () => materialListMockRepository.getMaterialList(
            salesOrganisation: fakeSGSalesOrganisation,
            salesOrgConfig: fakeSGSalesOrgConfigs,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            pageSize: config.productTabPageSize,
            offset: materialState.materialList.length,
            selectedMaterialFilter: mockSelectedMaterialFilter,
            user: fakeClientUser,
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
      },
      seed: () => materialState,
      act: (MaterialListBloc bloc) {
        bloc.add(
          const MaterialListEvent.loadMore(),
        );
      },
      expect: () => [
        materialState.copyWith(
          isFetching: true,
        ),
        materialState.copyWith(
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
        ),
      ],
    );

    blocTest(
      'can not Load more',
      seed: () => materialState.copyWith(
        materialList: List.generate(
          config.productTabPageSize,
          (index) => materialResponseMock.products.first,
        ),
        materialCount: config.productTabPageSize,
        nextPageIndex: 1,
      ),
      build: () => MaterialListBloc(
        materialListRepository: materialListMockRepository,
        favouriteRepository: favouriteMockRepository,
        config: config,
      ),
      setUp: () {
        when(
          () => materialListMockRepository.getMaterialList(
            salesOrganisation: fakeSGSalesOrganisation,
            salesOrgConfig: fakeSGSalesOrgConfigs,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            pageSize: config.productTabPageSize,
            offset: config.productTabPageSize,
            selectedMaterialFilter: mockSelectedMaterialFilter,
            user: fakeClientUser,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            MaterialResponse(
              count: 44,
              products: materialResponseMock.products.skip(20).toList(),
            ),
          ),
        );

        when(
          () => materialListMockRepository.getStockInfoList(
            materials: materialResponseMock.products.skip(20).toList(),
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeSGSalesOrganisation,
          ),
        ).thenAnswer((_) async => const Left(ApiFailure.poorConnection()));
      },
      act: (MaterialListBloc bloc) {
        bloc.add(const MaterialListEvent.loadMore());
      },
      expect: () {
        return [
          materialState.copyWith(
            isFetching: true,
            materialCount: config.productTabPageSize,
            materialList: List.generate(
              config.productTabPageSize,
              (index) => materialResponseMock.products.first,
            ),
            nextPageIndex: 1,
          ),
          materialState.copyWith(
            materialCount: 44,
            materialList: [
              ...List.generate(
                config.productTabPageSize,
                (index) => materialResponseMock.products.first,
              ),
              ...materialResponseMock.products.skip(20).toList(),
            ],
            canLoadMore: false,
            nextPageIndex: 2,
          ),
        ];
      },
    );

    blocTest(
      'add favorite success',
      build: () => MaterialListBloc(
        materialListRepository: materialListMockRepository,
        favouriteRepository: favouriteMockRepository,
        config: config,
      ),
      setUp: () {
        when(
          () => favouriteMockRepository.addToFavourites(
            materialNumber: materialResponseMock.products.first.materialNumber,
            list: materialState.materialList,
          ),
        ).thenAnswer(
          (invocation) async {
            if (!addToFavouritesResponseMock
                .addFavouriteMaterial.isSuccessful) {
              addToFavouritesList = materialResponseMock.products;
            } else {
              addToFavouritesList = List.from(materialResponseMock.products)
                  .map(
                    (element) => element.materialNumber ==
                            materialResponseMock.products.first.materialNumber
                        ? element.copyWith(isFavourite: true)
                        : element,
                  )
                  .toList();
            }
            return Right(addToFavouritesList);
          },
        );
      },
      seed: () => materialState,
      act: (MaterialListBloc bloc) {
        bloc.add(
          MaterialListEvent.addFavourite(
            item: materialResponseMock.products.first,
          ),
        );
      },
      expect: () => [
        materialState.copyWith(
          materialList:
              addToFavouritesList.map((e) => e as MaterialInfo).toList(),
        ),
      ],
    );

    blocTest(
      'add favorite fail',
      build: () => MaterialListBloc(
        materialListRepository: materialListMockRepository,
        favouriteRepository: favouriteMockRepository,
        config: config,
      ),
      setUp: () {
        when(
          () => favouriteMockRepository.addToFavourites(
            materialNumber: materialResponseMock.products.first.materialNumber,
            list: materialState.materialList,
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
      },
      seed: () => materialState,
      act: (MaterialListBloc bloc) {
        bloc.add(
          MaterialListEvent.addFavourite(
            item: materialResponseMock.products.first,
          ),
        );
      },
      expect: () => [
        materialState.copyWith(
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
        ),
      ],
    );

    blocTest(
      'delete favorite success',
      build: () => MaterialListBloc(
        materialListRepository: materialListMockRepository,
        favouriteRepository: favouriteMockRepository,
        config: config,
      ),
      setUp: () {
        when(
          () => favouriteMockRepository.removeFromFavourites(
            materialNumber: materialResponseMock.products.first.materialNumber,
            list: materialState.materialList,
          ),
        ).thenAnswer(
          (invocation) async {
            if (!removeFavouritesResponseMock
                .removeFavouriteMaterial.isSuccessful) {
              removeFavouritesList = materialResponseMock.products;
            } else {
              removeFavouritesList = List.from(materialResponseMock.products)
                  .map(
                    (element) => element.materialNumber ==
                            materialResponseMock.products.first.materialNumber
                        ? element.copyWith(isFavourite: false)
                        : element,
                  )
                  .toList();
            }
            return Right(removeFavouritesList);
          },
        );
      },
      seed: () => materialState,
      act: (MaterialListBloc bloc) {
        bloc.add(
          MaterialListEvent.deleteFavourite(
            item: materialResponseMock.products.first,
          ),
        );
      },
      expect: () => [
        materialState.copyWith(
          materialList:
              removeFavouritesList.map((e) => e as MaterialInfo).toList(),
        ),
      ],
    );

    blocTest(
      'delete favorite fail',
      build: () => MaterialListBloc(
        materialListRepository: materialListMockRepository,
        favouriteRepository: favouriteMockRepository,
        config: config,
      ),
      setUp: () {
        when(
          () => favouriteMockRepository.removeFromFavourites(
            materialNumber: materialResponseMock.products.first.materialNumber,
            list: materialState.materialList,
          ),
        ).thenAnswer(
          (invocation) async {
            return const Left(ApiFailure.other('fake-error'));
          },
        );
      },
      seed: () => materialState,
      act: (MaterialListBloc bloc) {
        bloc.add(
          MaterialListEvent.deleteFavourite(
            item: materialResponseMock.products.first,
          ),
        );
      },
      expect: () => [
        materialState.copyWith(
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
        ),
      ],
    );

    blocTest(
      'Add UpdateFavoriteEvent when listen from stream',
      build: () => MaterialListBloc(
        materialListRepository: materialListMockRepository,
        favouriteRepository: favouriteMockRepository,
        config: config,
      ),
      seed: () => MaterialListState.initial().copyWith(
        materialList: [
          materialResponseMock.products.first.copyWith(isFavourite: true),
        ],
      ),
      act: (MaterialListBloc bloc) =>
          bloc.add(const MaterialListEvent.watchFavoriteStatus()),
      setUp: () {
        when(() => favouriteMockRepository.watchFavoriteStatus()).thenAnswer(
          (_) => Stream.fromIterable(
            [
              materialResponseMock.products.first,
              materialResponseMock.products.first.copyWith(isFavourite: true),
            ],
          ),
        );
      },
      expect: () => [
        MaterialListState.initial().copyWith(
          materialList: [materialResponseMock.products.first],
        ),
        MaterialListState.initial().copyWith(
          materialList: [
            materialResponseMock.products.first.copyWith(isFavourite: true),
          ],
        ),
      ],
    );

    blocTest(
      'Update favorite status of material when updated material is in the list',
      build: () => MaterialListBloc(
        materialListRepository: materialListMockRepository,
        favouriteRepository: favouriteMockRepository,
        config: config,
      ),
      seed: () => MaterialListState.initial().copyWith(
        materialList: [
          materialResponseMock.products.first.copyWith(isFavourite: true),
        ],
      ),
      act: (MaterialListBloc bloc) => bloc.add(
        MaterialListEvent.updateFavoriteStatus(
          updatedMaterial: materialResponseMock.products.first,
        ),
      ),
      expect: () => [
        MaterialListState.initial().copyWith(
          materialList: [materialResponseMock.products.first],
        ),
      ],
    );

    blocTest(
      'Nothing happens when updated favorite material is not in the list',
      build: () => MaterialListBloc(
        materialListRepository: materialListMockRepository,
        favouriteRepository: favouriteMockRepository,
        config: config,
      ),
      seed: () => MaterialListState.initial().copyWith(
        materialList: [
          materialResponseMock.products.first.copyWith(isFavourite: true),
        ],
      ),
      act: (MaterialListBloc bloc) => bloc.add(
        MaterialListEvent.updateFavoriteStatus(
          updatedMaterial: materialResponseMock.products[1],
        ),
      ),
      expect: () => [],
    );

    test('Test Is Filter Selected', () {
      final materialBloc = MaterialListBloc(
        materialListRepository: materialListMockRepository,
        favouriteRepository: favouriteMockRepository,
        config: config,
      );
      materialBloc.emit(
        MaterialListState.initial().copyWith(
          selectedMaterialFilter: mockSelectedMaterialFilter.copyWith(
            isFavourite: true,
          ),
        ),
      );
      expect(materialBloc.state.isFilterSelected, true);
    });

    blocTest(
      'Get stock success',
      build: () => MaterialListBloc(
        materialListRepository: materialListMockRepository,
        favouriteRepository: favouriteMockRepository,
        config: config,
      ),
      seed: () => materialState.copyWith(
        materialList: materialResponseMock.products,
        apiFailureOrSuccessOption:
            optionOf(const Left(ApiFailure.poorConnection())),
      ),
      setUp: () {
        when(
          () => materialListMockRepository.getStockInfoList(
            materials: materialResponseMock.products,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeSGSalesOrganisation,
          ),
        ).thenAnswer((_) async => Right(stockInfoList));
      },
      act: (MaterialListBloc bloc) => bloc.add(
        MaterialListEvent.fetchStock(
          materials: materialResponseMock.products,
        ),
      ),
      expect: () => [
        materialState.copyWith(
          materialList: materialResponseMock.products,
          apiFailureOrSuccessOption: none(),
        ),
        materialState.copyWith(
          materialList: materialResponseMock.products.map((material) {
            final stockInfo = stockInfoList.firstWhere(
              (e) => e.materialNumber == material.materialNumber,
              orElse: () => MaterialStockInfo.empty(),
            );

            return material.stockInfos.isEmpty
                ? material.copyWithStock(stockInfos: stockInfo.stockInfos)
                : material;
          }).toList(),
          apiFailureOrSuccessOption: optionOf(Right(stockInfoList)),
        ),
      ],
    );

    blocTest(
      'Get stock info on empty material list',
      build: () => MaterialListBloc(
        materialListRepository: materialListMockRepository,
        favouriteRepository: favouriteMockRepository,
        config: config,
      ),
      act: (MaterialListBloc bloc) => bloc.add(
        MaterialListEvent.fetchStock(
          materials: [],
        ),
      ),
      expect: () => [],
    );
  });
}
