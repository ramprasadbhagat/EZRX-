import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/add_favourite.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/remove_favourite.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/favourite_local.dart';
import 'package:ezrxmobile/domain/account/entities/sales_org_customer_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/favourite_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_list_repository.dart';

class MockMaterialListRepository extends Mock
    implements MaterialListRepository {}

class MockFavouriteRepository extends Mock implements FavouriteRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MaterialListRepository materialListMockRepository;
  late FavouriteRepository favouriteMockRepository;
  late Config config;
  final salesOrg2601 = SalesOrg('2601');
  final mockSalesOrganisationConfigs = SalesOrganisationConfigs.empty();
  final mockCustomerCodeInfo = CustomerCodeInfo.empty();
  final mockShipToInfo = ShipToInfo.empty();
  final mockSelectedMaterialFilter = MaterialFilter.empty();
  final mockSalesOrganisation = SalesOrganisation(
    salesOrg: salesOrg2601,
    customerInfos: <SalesOrgCustomerInfo>[],
  );
  late final MaterialResponse materialResponseMock;
  late final AddFavourite addToFavouritesResponseMock;
  late final RemoveFavourite removeFavouritesResponseMock;
  late List addToFavouritesList;
  late List removeFavouritesList;
  final materialState = MaterialListState.initial();
  setUpAll(() async {
    materialListMockRepository = MockMaterialListRepository();
    favouriteMockRepository = MockFavouriteRepository();
    config = Config()..appFlavor = Flavor.mock;
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
      act: (MaterialListBloc bloc) =>
          bloc.add(const MaterialListEvent.initialized()),
      expect: () => [
        MaterialListState.initial(),
      ],
    );

    blocTest(
      'Fetch material list success',
      build: () => MaterialListBloc(
        materialListRepository: materialListMockRepository,
        favouriteRepository: favouriteMockRepository,
        config: config,
      ),
      setUp: () {
        when(
          () => materialListMockRepository.getMaterialList(
            salesOrganisation: mockSalesOrganisation,
            salesOrgConfig: mockSalesOrganisationConfigs,
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipToInfo,
            pageSize: config.pageSize,
            offset: 0,
            selectedMaterialFilter: mockSelectedMaterialFilter,
            language: Language.english(),
          ),
        ).thenAnswer(
          (invocation) async => Right(materialResponseMock),
        );
      },
      seed: () => materialState,
      act: (MaterialListBloc bloc) {
        bloc.add(
          MaterialListEvent.fetch(
            salesOrganisation: mockSalesOrganisation,
            configs: mockSalesOrganisationConfigs,
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipToInfo,
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
            isScanFromBarcode: false,
            selectedMaterialFilter:
                materialState.selectedMaterialFilter.copyWith(
              isFavourite: mockSelectedMaterialFilter.isFavourite,
              isFOCMaterial: mockSelectedMaterialFilter.isFOCMaterial,
              bundleOffers: mockSelectedMaterialFilter.bundleOffers,
              isProductOffer: mockSelectedMaterialFilter.isProductOffer,
              sortBy: mockSelectedMaterialFilter.sortBy,
              countryListSelected:
                  mockSelectedMaterialFilter.countryListSelected,
              brandList: mockSelectedMaterialFilter.brandList,
              manufactureListSelected:
                  mockSelectedMaterialFilter.manufactureListSelected,
            ),
          ),
          materialState.copyWith(
            materialCount: materialResponseMock.count,
            materialList: materialResponseMock.products,
            apiFailureOrSuccessOption: optionOf(Right(materialResponseMock)),
            isFetching: false,
            canLoadMore:
                materialResponseMock.products.length >= config.pageSize,
            nextPageIndex: 1,
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
      setUp: () {
        when(
          () => materialListMockRepository.getMaterialList(
            salesOrganisation: mockSalesOrganisation,
            salesOrgConfig: mockSalesOrganisationConfigs,
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipToInfo,
            pageSize: config.pageSize,
            offset: 0,
            selectedMaterialFilter: mockSelectedMaterialFilter,
            language: Language.english(),
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
            salesOrganisation: mockSalesOrganisation,
            configs: mockSalesOrganisationConfigs,
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipToInfo,
            selectedMaterialFilter: mockSelectedMaterialFilter,
          ),
        );
      },
      seed: () => materialState,
      expect: () => [
        materialState.copyWith(
          isFetching: true,
          materialList: <MaterialInfo>[],
          nextPageIndex: 0,
          apiFailureOrSuccessOption: none(),
          isScanFromBarcode: false,
          selectedMaterialFilter: materialState.selectedMaterialFilter.copyWith(
            isFavourite: mockSelectedMaterialFilter.isFavourite,
            isFOCMaterial: mockSelectedMaterialFilter.isFOCMaterial,
            bundleOffers: mockSelectedMaterialFilter.bundleOffers,
            isProductOffer: mockSelectedMaterialFilter.isProductOffer,
            sortBy: mockSelectedMaterialFilter.sortBy,
            countryListSelected: mockSelectedMaterialFilter.countryListSelected,
            brandList: mockSelectedMaterialFilter.brandList,
            manufactureListSelected:
                mockSelectedMaterialFilter.manufactureListSelected,
          ),
        ),
        materialState.copyWith(
          isFetching: false,
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
            salesOrganisation: mockSalesOrganisation,
            salesOrgConfig: mockSalesOrganisationConfigs,
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipToInfo,
            pageSize: config.pageSize,
            offset: materialState.materialList.length,
            selectedMaterialFilter: mockSelectedMaterialFilter,
            language: Language.english(),
          ),
        ).thenAnswer(
          (invocation) async => Right(materialResponseMock),
        );
      },
      seed: () => materialState,
      act: (MaterialListBloc bloc) {
        bloc.add(
          MaterialListEvent.loadMore(
            salesOrganisation: mockSalesOrganisation,
            configs: mockSalesOrganisationConfigs,
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipToInfo,
          ),
        );
      },
      expect: () {
        final productList = List<MaterialInfo>.from(materialState.materialList)
          ..addAll(materialResponseMock.products);
        return [
          materialState.copyWith(
            isFetching: true,
            apiFailureOrSuccessOption: none(),
            isScanFromBarcode: false,
          ),
          materialState.copyWith(
            materialCount: materialResponseMock.count,
            materialList: productList,
            apiFailureOrSuccessOption: none(),
            isFetching: false,
            canLoadMore: productList.length >= config.pageSize,
            nextPageIndex: materialState.nextPageIndex + 1,
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
            salesOrganisation: mockSalesOrganisation,
            salesOrgConfig: mockSalesOrganisationConfigs,
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipToInfo,
            pageSize: config.pageSize,
            offset: materialState.materialList.length,
            selectedMaterialFilter: mockSelectedMaterialFilter,
            language: Language.english(),
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
      },
      seed: () => materialState,
      act: (MaterialListBloc bloc) {
        bloc.add(
          MaterialListEvent.loadMore(
            salesOrganisation: mockSalesOrganisation,
            configs: mockSalesOrganisationConfigs,
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipToInfo,
          ),
        );
      },
      expect: () => [
        materialState.copyWith(
          isFetching: true,
          apiFailureOrSuccessOption: none(),
          isScanFromBarcode: false,
        ),
        materialState.copyWith(
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
          isFetching: false,
        ),
      ],
    );

    blocTest(
      'can not Load more',
      seed: () => materialState.copyWith(
        materialList: List.generate(
          24,
          (index) => materialResponseMock.products.first,
        ),
        materialCount: 24,
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
            salesOrganisation: mockSalesOrganisation,
            salesOrgConfig: mockSalesOrganisationConfigs,
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipToInfo,
            pageSize: config.pageSize,
            offset: 24,
            selectedMaterialFilter: mockSelectedMaterialFilter,
            language: Language.english(),
          ),
        ).thenAnswer(
          (invocation) async => Right(
            MaterialResponse(
              count: 44,
              products: materialResponseMock.products.skip(20).toList(),
            ),
          ),
        );
      },
      act: (MaterialListBloc bloc) {
        bloc.add(
          MaterialListEvent.loadMore(
            salesOrganisation: mockSalesOrganisation,
            configs: mockSalesOrganisationConfigs,
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipToInfo,
          ),
        );
      },
      expect: () {
        return [
          materialState.copyWith(
            isFetching: true,
            materialCount: 24,
            materialList: List.generate(
              24,
              (index) => materialResponseMock.products.first,
            ),
            nextPageIndex: 1,
          ),
          materialState.copyWith(
            materialCount: 44,
            materialList: [
              ...List.generate(
                24,
                (index) => materialResponseMock.products.first,
              ),
              ...materialResponseMock.products.skip(20)
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
          isFetching: false,
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
          isFetching: false,
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
          isFetching: false,
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
          isFetching: false,
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
          materialResponseMock.products.first.copyWith(isFavourite: true)
        ],
      ),
      act: (MaterialListBloc bloc) =>
          bloc.add(const MaterialListEvent.watchFavoriteStatus()),
      setUp: () {
        when(() => favouriteMockRepository.watchFavoriteStatus()).thenAnswer(
          (_) => Stream.fromIterable(
            [
              materialResponseMock.products.first.copyWith(isFavourite: false),
              materialResponseMock.products.first.copyWith(isFavourite: true)
            ],
          ),
        );
      },
      expect: () => [
        MaterialListState.initial().copyWith(
          materialList: [
            materialResponseMock.products.first.copyWith(isFavourite: false)
          ],
        ),
        MaterialListState.initial().copyWith(
          materialList: [
            materialResponseMock.products.first.copyWith(isFavourite: true)
          ],
        )
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
          materialResponseMock.products.first.copyWith(isFavourite: true)
        ],
      ),
      act: (MaterialListBloc bloc) => bloc.add(
        MaterialListEvent.updateFavoriteStatus(
          updatedMaterial:
              materialResponseMock.products.first.copyWith(isFavourite: false),
        ),
      ),
      expect: () => [
        MaterialListState.initial().copyWith(
          materialList: [
            materialResponseMock.products.first.copyWith(isFavourite: false)
          ],
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
          materialResponseMock.products.first.copyWith(isFavourite: true)
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
  });
}
