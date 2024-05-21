import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/config.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/order/entities/product_suggestion_history.dart';
import 'package:ezrxmobile/domain/order/repository/i_product_search_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/product_search_local.dart';
import 'package:ezrxmobile/application/order/product_search/product_search_bloc.dart';

import '../../../common_mock_data/user_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

class MockProductSearchRepository extends Mock
    implements IProductSearchRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  late IProductSearchRepository productSearchRepository;
  late ProductSearchBloc productSearchBloc;

  final customerCodeInfo = CustomerCodeInfo.empty();
  final shipToInfo = ShipToInfo.empty();
  final searchKey = SearchKey('fake-text');

  late MaterialResponse materialResponse;
  late MaterialResponse fakeResponse1;
  late MaterialResponse fakeResponse2;
  late Config config;
  final searchKeys = ProductSuggestionHistory(
    searchKeyList: [
      SearchKey('searchKey1'),
      SearchKey('searchKey2'),
      SearchKey('searchKey3'),
    ],
  );

  setUp(() async {
    config = Config()..appFlavor = Flavor.mock;
    productSearchRepository = MockProductSearchRepository();
    productSearchBloc = ProductSearchBloc(
      productSearchRepository: productSearchRepository,
      config: config,
    );
    materialResponse =
        await ProductSearchLocalDataSource().getSearchedProductList();
    fakeResponse1 = MaterialResponse(
      count: 50,
      products: List.generate(
        config.productTabPageSize,
        (index) => materialResponse.products[0],
      ),
    );
    fakeResponse2 = MaterialResponse(
      count: 50,
      products: List.generate(
        config.productTabPageSize,
        (index) => materialResponse.products[1],
      ),
    );
  });

  group('ProductSearchBloc', () {
    blocTest<ProductSearchBloc, ProductSearchState>(
      ' -> Initial state is correct',
      build: () {
        when(() => productSearchRepository.getSearchKeys())
            .thenAnswer((_) async => Right(searchKeys));
        return productSearchBloc;
      },
      act: (bloc) => bloc.add(
        ProductSearchEvent.initialized(
          configs: fakeMYSalesOrgConfigs,
          customerCodeInfo: customerCodeInfo,
          salesOrganization: fakeMYSalesOrganisation,
          shipToInfo: shipToInfo,
          user: fakeClientUser,
        ),
      ),
      expect: () => [
        ProductSearchState.initial().copyWith(
          configs: fakeMYSalesOrgConfigs,
          customerCodeInfo: customerCodeInfo,
          salesOrganization: fakeMYSalesOrganisation,
          shipToInfo: shipToInfo,
          user: fakeClientUser,
        ),
        ProductSearchState.initial().copyWith(
          configs: fakeMYSalesOrgConfigs,
          customerCodeInfo: customerCodeInfo,
          salesOrganization: fakeMYSalesOrganisation,
          shipToInfo: shipToInfo,
          productSuggestionHistory: searchKeys,
          user: fakeClientUser,
        ),
      ],
    );

    group(' -> SearchProduct', () {
      blocTest<ProductSearchBloc, ProductSearchState>(
        ' -> Search with different searchKey',
        seed: () => ProductSearchState.initial().copyWith(
          searchKey: searchKey,
          configs: fakeMYSalesOrgConfigs,
          customerCodeInfo: customerCodeInfo,
          salesOrganization: fakeMYSalesOrganisation,
          shipToInfo: shipToInfo,
          user: fakeClientUser,
        ),
        build: () {
          when(
            () => productSearchRepository.searchProductList(
              salesOrganization: fakeMYSalesOrganisation,
              salesOrgConfig: fakeMYSalesOrgConfigs,
              customerCodeInfo: customerCodeInfo,
              shipToInfo: shipToInfo,
              searchKey: SearchKey('diff-search-key'),
              pageSize: config.pageSize,
              offset: 0,
              materialFilter: MaterialFilter.empty(),
              user: fakeClientUser,
            ),
          ).thenAnswer((_) async => Right(materialResponse));
          return productSearchBloc;
        },
        act: (bloc) => bloc
          ..add(
            ProductSearchEvent.searchProduct(
              searchKey: SearchKey.search('diff-search-key'),
              materialFilter: MaterialFilter.empty(),
            ),
          ),
        expect: () => [
          ProductSearchState.initial().copyWith(
            configs: fakeMYSalesOrgConfigs,
            customerCodeInfo: customerCodeInfo,
            salesOrganization: fakeMYSalesOrganisation,
            shipToInfo: shipToInfo,
            searchKey: SearchKey.search('diff-search-key'),
            suggestedProductList: <MaterialInfo>[],
            isSearching: true,
            canLoadMore: true,
            apiFailureOrSuccessOption: none(),
            user: fakeClientUser,
          ),
          ProductSearchState.initial().copyWith(
            configs: fakeMYSalesOrgConfigs,
            customerCodeInfo: customerCodeInfo,
            salesOrganization: fakeMYSalesOrganisation,
            shipToInfo: shipToInfo,
            apiFailureOrSuccessOption: optionOf(Right(materialResponse)),
            suggestedProductList: materialResponse.products,
            isSearching: false,
            canLoadMore: true,
            searchKey: SearchKey('diff-search-key'),
            user: fakeClientUser,
          ),
        ],
      );
      blocTest<ProductSearchBloc, ProductSearchState>(
        ' -> Emits correct states and responses',
        seed: () => ProductSearchState.initial().copyWith(
          salesOrganization: fakeMYSalesOrganisation,
          configs: fakeMYSalesOrgConfigs,
          customerCodeInfo: customerCodeInfo,
          shipToInfo: shipToInfo,
          searchKey: SearchKey(''),
          user: fakeClientUser,
        ),
        build: () {
          when(
            () => productSearchRepository.searchProductList(
              salesOrganization: fakeMYSalesOrganisation,
              salesOrgConfig: fakeMYSalesOrgConfigs,
              customerCodeInfo: customerCodeInfo,
              shipToInfo: shipToInfo,
              searchKey: searchKey,
              pageSize: config.pageSize,
              offset: 0,
              materialFilter: MaterialFilter.empty(),
              user: fakeClientUser,
            ),
          ).thenAnswer((_) async => Right(materialResponse));
          return productSearchBloc;
        },
        act: (bloc) => bloc.add(
          ProductSearchEvent.searchProduct(
            searchKey: SearchKey.search(searchKey.getValue()),
            materialFilter: MaterialFilter.empty(),
          ),
        ),
        expect: () => [
          ProductSearchState.initial().copyWith(
            configs: fakeMYSalesOrgConfigs,
            customerCodeInfo: customerCodeInfo,
            salesOrganization: fakeMYSalesOrganisation,
            shipToInfo: shipToInfo,
            searchKey: searchKey,
            suggestedProductList: <MaterialInfo>[],
            isSearching: true,
            canLoadMore: true,
            apiFailureOrSuccessOption: none(),
            user: fakeClientUser,
          ),
          ProductSearchState.initial().copyWith(
            configs: fakeMYSalesOrgConfigs,
            customerCodeInfo: customerCodeInfo,
            salesOrganization: fakeMYSalesOrganisation,
            shipToInfo: shipToInfo,
            apiFailureOrSuccessOption: optionOf(Right(materialResponse)),
            suggestedProductList: materialResponse.products,
            isSearching: false,
            canLoadMore: true,
            searchKey: searchKey,
            user: fakeClientUser,
          ),
        ],
      );

      blocTest<ProductSearchBloc, ProductSearchState>(
        ' -> Emits failure state when repository returns a failure',
        seed: () => ProductSearchState.initial().copyWith(
          salesOrganization: fakeMYSalesOrganisation,
          configs: fakeMYSalesOrgConfigs,
          customerCodeInfo: customerCodeInfo,
          shipToInfo: shipToInfo,
          searchKey: SearchKey(''),
          user: fakeClientUser,
        ),
        build: () {
          when(
            () => productSearchRepository.searchProductList(
              salesOrganization: fakeMYSalesOrganisation,
              salesOrgConfig: fakeMYSalesOrgConfigs,
              customerCodeInfo: customerCodeInfo,
              shipToInfo: shipToInfo,
              searchKey: searchKey,
              pageSize: config.pageSize,
              offset: 0,
              materialFilter: MaterialFilter.empty(),
              user: fakeClientUser,
            ),
          ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('fake-error')),
          );
          return productSearchBloc;
        },
        act: (bloc) => bloc.add(
          ProductSearchEvent.searchProduct(
            searchKey: SearchKey.search(searchKey.getValue()),
            materialFilter: MaterialFilter.empty(),
          ),
        ),
        expect: () => [
          ProductSearchState.initial().copyWith(
            salesOrganization: fakeMYSalesOrganisation,
            configs: fakeMYSalesOrgConfigs,
            customerCodeInfo: customerCodeInfo,
            shipToInfo: shipToInfo,
            searchKey: searchKey,
            suggestedProductList: <MaterialInfo>[],
            isSearching: true,
            canLoadMore: true,
            apiFailureOrSuccessOption: none(),
            user: fakeClientUser,
          ),
          ProductSearchState.initial().copyWith(
            salesOrganization: fakeMYSalesOrganisation,
            configs: fakeMYSalesOrgConfigs,
            customerCodeInfo: customerCodeInfo,
            shipToInfo: shipToInfo,
            canLoadMore: true,
            searchKey: searchKey,
            apiFailureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
            suggestedProductList: <MaterialInfo>[],
            isSearching: false,
            user: fakeClientUser,
          ),
        ],
      );
    });
    group(' -> AutoSearchProduct', () {
      blocTest<ProductSearchBloc, ProductSearchState>(
        ' -> Search with different searchKey',
        seed: () => ProductSearchState.initial().copyWith(
          salesOrganization: fakeMYSalesOrganisation,
          configs: fakeMYSalesOrgConfigs,
          customerCodeInfo: customerCodeInfo,
          shipToInfo: shipToInfo,
          searchKey: searchKey,
          user: fakeClientUser,
        ),
        build: () {
          when(
            () => productSearchRepository.searchProductList(
              salesOrganization: fakeMYSalesOrganisation,
              salesOrgConfig: fakeMYSalesOrgConfigs,
              customerCodeInfo: customerCodeInfo,
              shipToInfo: shipToInfo,
              searchKey: SearchKey('diff-search-key'),
              pageSize: config.pageSize,
              offset: 0,
              materialFilter: MaterialFilter.empty(),
              user: fakeClientUser,
            ),
          ).thenAnswer((_) async => Right(materialResponse));
          return productSearchBloc;
        },
        act: (bloc) => bloc.add(
          ProductSearchEvent.searchProduct(
            searchKey: SearchKey.search('diff-search-key'),
            materialFilter: MaterialFilter.empty(),
          ),
        ),
        wait: const Duration(milliseconds: 1500),
        expect: () => [
          ProductSearchState.initial().copyWith(
            salesOrganization: fakeMYSalesOrganisation,
            configs: fakeMYSalesOrgConfigs,
            customerCodeInfo: customerCodeInfo,
            shipToInfo: shipToInfo,
            searchKey: SearchKey('diff-search-key'),
            suggestedProductList: <MaterialInfo>[],
            isSearching: true,
            canLoadMore: true,
            apiFailureOrSuccessOption: none(),
            user: fakeClientUser,
          ),
          ProductSearchState.initial().copyWith(
            salesOrganization: fakeMYSalesOrganisation,
            configs: fakeMYSalesOrgConfigs,
            customerCodeInfo: customerCodeInfo,
            shipToInfo: shipToInfo,
            apiFailureOrSuccessOption: optionOf(Right(materialResponse)),
            suggestedProductList: materialResponse.products,
            isSearching: false,
            canLoadMore: true,
            searchKey: SearchKey('diff-search-key'),
            user: fakeClientUser,
          ),
        ],
      );
    });

    group(' -> LoadMoreProductList', () {
      blocTest<ProductSearchBloc, ProductSearchState>(
        ' -> Emits correct states and responses',
        seed: () => ProductSearchState.initial().copyWith(
          apiFailureOrSuccessOption: optionOf(Right(fakeResponse1)),
          suggestedProductList: fakeResponse1.products,
          isSearching: false,
          canLoadMore: true,
          searchKey: searchKey,
          configs: fakeMYSalesOrgConfigs,
          customerCodeInfo: customerCodeInfo,
          salesOrganization: fakeMYSalesOrganisation,
          shipToInfo: shipToInfo,
          user: fakeClientUser,
        ),
        build: () {
          when(
            () => productSearchRepository.searchProductList(
              salesOrganization: fakeMYSalesOrganisation,
              salesOrgConfig: fakeMYSalesOrgConfigs,
              customerCodeInfo: customerCodeInfo,
              shipToInfo: shipToInfo,
              searchKey: searchKey,
              pageSize: config.pageSize,
              offset: config.productTabPageSize,
              materialFilter: MaterialFilter.empty(),
              user: fakeClientUser,
            ),
          ).thenAnswer((_) async => Right(fakeResponse2));
          return productSearchBloc;
        },
        act: (bloc) => bloc.add(
          const ProductSearchEvent.loadMoreProductList(),
        ),
        expect: () => [
          ProductSearchState.initial().copyWith(
            configs: fakeMYSalesOrgConfigs,
            customerCodeInfo: customerCodeInfo,
            salesOrganization: fakeMYSalesOrganisation,
            shipToInfo: shipToInfo,
            apiFailureOrSuccessOption: optionOf(Right(fakeResponse1)),
            suggestedProductList: fakeResponse1.products,
            isSearching: true,
            canLoadMore: true,
            searchKey: searchKey,
            user: fakeClientUser,
          ),
          ProductSearchState.initial().copyWith(
            configs: fakeMYSalesOrgConfigs,
            customerCodeInfo: customerCodeInfo,
            salesOrganization: fakeMYSalesOrganisation,
            shipToInfo: shipToInfo,
            apiFailureOrSuccessOption: optionOf(Right(fakeResponse2)),
            suggestedProductList:
                List<MaterialInfo>.from(fakeResponse1.products)
                  ..addAll(fakeResponse2.products),
            isSearching: false,
            canLoadMore: true,
            searchKey: searchKey,
            user: fakeClientUser,
          ),
        ],
      );

      blocTest<ProductSearchBloc, ProductSearchState>(
        ' -> Does not call repository when already searching or no more results',
        build: () {
          when(
            () => productSearchRepository.searchProductList(
              salesOrganization: fakeMYSalesOrganisation,
              salesOrgConfig: fakeMYSalesOrgConfigs,
              customerCodeInfo: customerCodeInfo,
              shipToInfo: shipToInfo,
              searchKey: searchKey,
              pageSize: config.pageSize,
              offset: 0,
              materialFilter: MaterialFilter.empty(),
              user: fakeClientUser,
            ),
          ).thenAnswer((_) async => Right(materialResponse));
          return productSearchBloc;
        },
        seed: () => ProductSearchState.initial().copyWith(
          configs: fakeMYSalesOrgConfigs,
          customerCodeInfo: customerCodeInfo,
          salesOrganization: fakeMYSalesOrganisation,
          shipToInfo: shipToInfo,
          apiFailureOrSuccessOption: optionOf(Right(materialResponse)),
          suggestedProductList: materialResponse.products,
          isSearching: true,
          canLoadMore: false,
          searchKey: searchKey,
        ),
        act: (bloc) => bloc.add(
          const ProductSearchEvent.loadMoreProductList(),
        ),
        expect: () => [],
      );

      blocTest<ProductSearchBloc, ProductSearchState>(
        ' -> LoadMoreProductList with error',
        seed: () => ProductSearchState.initial().copyWith(
          configs: fakeMYSalesOrgConfigs,
          customerCodeInfo: customerCodeInfo,
          salesOrganization: fakeMYSalesOrganisation,
          shipToInfo: shipToInfo,
          apiFailureOrSuccessOption: optionOf(Right(fakeResponse1)),
          suggestedProductList: fakeResponse1.products,
          isSearching: false,
          canLoadMore: true,
          searchKey: searchKey,
          user: fakeClientUser,
        ),
        build: () {
          when(
            () => productSearchRepository.searchProductList(
              salesOrganization: fakeMYSalesOrganisation,
              salesOrgConfig: fakeMYSalesOrgConfigs,
              customerCodeInfo: customerCodeInfo,
              shipToInfo: shipToInfo,
              searchKey: searchKey,
              pageSize: config.pageSize,
              offset: config.productTabPageSize,
              materialFilter: MaterialFilter.empty(),
              user: fakeClientUser,
            ),
          ).thenAnswer(
            (_) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
          return productSearchBloc;
        },
        act: (bloc) => bloc.add(
          const ProductSearchEvent.loadMoreProductList(),
        ),
        expect: () => [
          ProductSearchState.initial().copyWith(
            configs: fakeMYSalesOrgConfigs,
            customerCodeInfo: customerCodeInfo,
            salesOrganization: fakeMYSalesOrganisation,
            shipToInfo: shipToInfo,
            apiFailureOrSuccessOption: optionOf(Right(fakeResponse1)),
            suggestedProductList: fakeResponse1.products,
            isSearching: true,
            canLoadMore: true,
            searchKey: searchKey,
            user: fakeClientUser,
          ),
          ProductSearchState.initial().copyWith(
            configs: fakeMYSalesOrgConfigs,
            customerCodeInfo: customerCodeInfo,
            salesOrganization: fakeMYSalesOrganisation,
            shipToInfo: shipToInfo,
            suggestedProductList: fakeResponse1.products,
            canLoadMore: true,
            searchKey: searchKey,
            apiFailureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
            user: fakeClientUser,
          ),
        ],
      );
    });

    group(' -> ClearSearch', () {
      blocTest<ProductSearchBloc, ProductSearchState>(
        ' -> Emits correct state and triggers clearSearch',
        build: () {
          when(() => productSearchRepository.getSearchKeys())
              .thenAnswer((_) async => Right(searchKeys));
          return productSearchBloc;
        },
        seed: () => ProductSearchState.initial().copyWith(
          configs: fakeMYSalesOrgConfigs,
          customerCodeInfo: customerCodeInfo,
          salesOrganization: fakeMYSalesOrganisation,
          shipToInfo: shipToInfo,
          searchKey: searchKey,
          suggestedProductList: materialResponse.products,
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
          canLoadMore: true,
        ),
        act: (bloc) => bloc.add(const ProductSearchEvent.clearSearch()),
        expect: () => [
          ProductSearchState.initial().copyWith(
            configs: fakeMYSalesOrgConfigs,
            customerCodeInfo: customerCodeInfo,
            salesOrganization: fakeMYSalesOrganisation,
            shipToInfo: shipToInfo,
            searchKey: SearchKey.search(''),
            apiFailureOrSuccessOption: none(),
            canLoadMore: false,
            suggestedProductList: <MaterialInfo>[],
          ),
          ProductSearchState.initial().copyWith(
            configs: fakeMYSalesOrgConfigs,
            customerCodeInfo: customerCodeInfo,
            salesOrganization: fakeMYSalesOrganisation,
            shipToInfo: shipToInfo,
            searchKey: SearchKey.search(''),
            apiFailureOrSuccessOption: none(),
            canLoadMore: false,
            suggestedProductList: <MaterialInfo>[],
            productSuggestionHistory: searchKeys,
          ),
        ],
      );
    });

    group(' -> ClearSearchHistory', () {
      blocTest<ProductSearchBloc, ProductSearchState>(
        ' -> Clear search history successfully',
        seed: () => ProductSearchState.initial().copyWith(
          configs: fakeMYSalesOrgConfigs,
          customerCodeInfo: customerCodeInfo,
          salesOrganization: fakeMYSalesOrganisation,
          shipToInfo: shipToInfo,
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        ),
        build: () {
          when(() => productSearchRepository.clearSearchHistory())
              .thenAnswer((_) async => const Right(null));
          return productSearchBloc;
        },
        act: (bloc) => bloc.add(
          const ProductSearchEvent.clearProductSearchSuggestionHistory(),
        ),
        expect: () => [
          ProductSearchState.initial().copyWith(
            configs: fakeMYSalesOrgConfigs,
            customerCodeInfo: customerCodeInfo,
            salesOrganization: fakeMYSalesOrganisation,
            shipToInfo: shipToInfo,
            apiFailureOrSuccessOption: none(),
            productSuggestionHistory: ProductSuggestionHistory.empty(),
          ),
        ],
      );

      blocTest<ProductSearchBloc, ProductSearchState>(
        ' -> Clear search history with error',
        build: () {
          when(() => productSearchRepository.clearSearchHistory()).thenAnswer(
            (_) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
          return productSearchBloc;
        },
        act: (bloc) => bloc.add(
          const ProductSearchEvent.clearProductSearchSuggestionHistory(),
        ),
        expect: () => [
          ProductSearchState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
          ),
        ],
      );
    });
  });
}