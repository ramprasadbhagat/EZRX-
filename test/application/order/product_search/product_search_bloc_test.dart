import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/product_search/product_search_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/product_suggestion_history.dart';
import 'package:ezrxmobile/domain/order/repository/i_product_search_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/product_search_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockProductSearchRepository extends Mock
    implements IProductSearchRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  late IProductSearchRepository productSearchRepository;
  late ProductSearchBloc productSearchBloc;

  final salesOrg = SalesOrg('fake-salesOrg');
  final salesOrganization =
      SalesOrganisation.empty().copyWith(salesOrg: salesOrg);
  final salesOrgConfigs =
      SalesOrganisationConfigs.empty().copyWith(salesOrg: salesOrg);
  final customerCodeInfo = CustomerCodeInfo.empty();
  final shipToInfo = ShipToInfo.empty();
  final searchKey = SearchKey('fake-text');

  late MaterialResponse materialResponse;
  late MaterialResponse fakeResponse1;
  late MaterialResponse fakeResponse2;

  final searchKeys = ProductSuggestionHistory(
    searchKeyList: [
      SearchKey('searchKey1'),
      SearchKey('searchKey2'),
      SearchKey('searchKey3'),
    ],
  );

  setUp(() async {
    productSearchRepository = MockProductSearchRepository();
    productSearchBloc = ProductSearchBloc(
      productSearchRepository: productSearchRepository,
    );
    materialResponse =
        await ProductSearchLocalDataSource().getSearchedProductList();
    fakeResponse1 = MaterialResponse(
      count: 50,
      products: List.generate(24, (index) => materialResponse.products[0]),
    );
    fakeResponse2 = MaterialResponse(
      count: 50,
      products: List.generate(24, (index) => materialResponse.products[1]),
    );
  });

  group('ProductSearchBloc', () {
    test(' -> Initial state is correct', () {
      expect(productSearchBloc.state, equals(ProductSearchState.initial()));
    });

    group(' -> SearchProduct', () {
      blocTest<ProductSearchBloc, ProductSearchState>(
        ' -> Search with different searchKey',
        seed: () => ProductSearchState.initial().copyWith(
          searchKey: searchKey,
        ),
        build: () {
          when(
            () => productSearchRepository.searchProductList(
              salesOrganization: salesOrganization,
              salesOrgConfig: salesOrgConfigs,
              customerCodeInfo: customerCodeInfo,
              shipToInfo: shipToInfo,
              searchKey: SearchKey('diff-search-key'),
              pageSize: 24,
              offset: 0,
            ),
          ).thenAnswer((_) async => Right(materialResponse));
          return productSearchBloc;
        },
        act: (bloc) => bloc.add(
          ProductSearchEvent.searchProduct(
            configs: salesOrgConfigs,
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
            shipToInfo: shipToInfo,
            searchKey: 'diff-search-key',
          ),
        ),
        expect: () => [
          ProductSearchState.initial().copyWith(
            searchKey: SearchKey('diff-search-key'),
            suggestedProductList: <MaterialInfo>[],
            isSearching: true,
            canLoadMore: true,
            apiFailureOrSuccessOption: none(),
          ),
          ProductSearchState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(Right(materialResponse)),
            suggestedProductList: materialResponse.products,
            isSearching: false,
            canLoadMore: true,
            searchKey: SearchKey('diff-search-key'),
          ),
        ],
      );
      blocTest<ProductSearchBloc, ProductSearchState>(
        ' -> Emits correct states and responses',
        build: () {
          when(
            () => productSearchRepository.searchProductList(
              salesOrganization: salesOrganization,
              salesOrgConfig: salesOrgConfigs,
              customerCodeInfo: customerCodeInfo,
              shipToInfo: shipToInfo,
              searchKey: searchKey,
              pageSize: 24,
              offset: 0,
            ),
          ).thenAnswer((_) async => Right(materialResponse));
          return productSearchBloc;
        },
        act: (bloc) => bloc.add(
          ProductSearchEvent.searchProduct(
            configs: salesOrgConfigs,
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
            shipToInfo: shipToInfo,
            searchKey: searchKey.getValue(),
          ),
        ),
        expect: () => [
          ProductSearchState.initial().copyWith(
            searchKey: searchKey,
            suggestedProductList: <MaterialInfo>[],
            isSearching: true,
            canLoadMore: true,
            apiFailureOrSuccessOption: none(),
          ),
          ProductSearchState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(Right(materialResponse)),
            suggestedProductList: materialResponse.products,
            isSearching: false,
            canLoadMore: true,
            searchKey: searchKey,
          ),
        ],
      );

      blocTest<ProductSearchBloc, ProductSearchState>(
        ' -> Emits failure state when repository returns a failure',
        build: () {
          when(
            () => productSearchRepository.searchProductList(
              salesOrganization: salesOrganization,
              salesOrgConfig: salesOrgConfigs,
              customerCodeInfo: customerCodeInfo,
              shipToInfo: shipToInfo,
              searchKey: searchKey,
              pageSize: 24,
              offset: 0,
            ),
          ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('fake-error')),
          );
          return productSearchBloc;
        },
        act: (bloc) => bloc.add(
          ProductSearchEvent.searchProduct(
            configs: salesOrgConfigs,
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
            shipToInfo: shipToInfo,
            searchKey: searchKey.getValue(),
          ),
        ),
        expect: () => [
          ProductSearchState.initial().copyWith(
            searchKey: searchKey,
            suggestedProductList: <MaterialInfo>[],
            isSearching: true,
            canLoadMore: true,
            apiFailureOrSuccessOption: none(),
          ),
          ProductSearchState.initial().copyWith(
            canLoadMore: true,
            searchKey: searchKey,
            apiFailureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
            suggestedProductList: <MaterialInfo>[],
            isSearching: false,
          ),
        ],
      );
    });
    group(' -> AutoSearchProduct', () {
      blocTest<ProductSearchBloc, ProductSearchState>(
        ' -> Search with different searchKey',
        seed: () => ProductSearchState.initial().copyWith(
          searchKey: searchKey,
        ),
        build: () {
          when(
            () => productSearchRepository.searchProductList(
              salesOrganization: salesOrganization,
              salesOrgConfig: salesOrgConfigs,
              customerCodeInfo: customerCodeInfo,
              shipToInfo: shipToInfo,
              searchKey: SearchKey('diff-search-key'),
              pageSize: 24,
              offset: 0,
            ),
          ).thenAnswer((_) async => Right(materialResponse));
          return productSearchBloc;
        },
        act: (bloc) => bloc.add(
          ProductSearchEvent.autoSearchProduct(
            configs: salesOrgConfigs,
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
            shipToInfo: shipToInfo,
            searchKey: 'diff-search-key',
          ),
        ),
        expect: () => [
          ProductSearchState.initial().copyWith(
            searchKey: SearchKey('diff-search-key'),
            suggestedProductList: <MaterialInfo>[],
            isSearching: true,
            canLoadMore: true,
            apiFailureOrSuccessOption: none(),
          ),
          ProductSearchState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(Right(materialResponse)),
            suggestedProductList: materialResponse.products,
            isSearching: false,
            canLoadMore: true,
            searchKey: SearchKey('diff-search-key'),
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
        ),
        build: () {
          when(
            () => productSearchRepository.searchProductList(
              salesOrganization: salesOrganization,
              salesOrgConfig: salesOrgConfigs,
              customerCodeInfo: customerCodeInfo,
              shipToInfo: shipToInfo,
              searchKey: searchKey,
              pageSize: 24,
              offset: 24,
            ),
          ).thenAnswer((_) async => Right(fakeResponse2));
          return productSearchBloc;
        },
        act: (bloc) => bloc.add(
          ProductSearchEvent.loadMoreProductList(
            configs: salesOrgConfigs,
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
            shipToInfo: shipToInfo,
          ),
        ),
        expect: () => [
          ProductSearchState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(Right(fakeResponse1)),
            suggestedProductList: fakeResponse1.products,
            isSearching: true,
            canLoadMore: true,
            searchKey: searchKey,
          ),
          ProductSearchState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(Right(fakeResponse2)),
            suggestedProductList:
                List<MaterialInfo>.from(fakeResponse1.products)
                  ..addAll(fakeResponse2.products),
            isSearching: false,
            canLoadMore: true,
            searchKey: searchKey,
          ),
        ],
      );

      blocTest<ProductSearchBloc, ProductSearchState>(
        ' -> Does not call repository when already searching or no more results',
        build: () {
          when(
            () => productSearchRepository.searchProductList(
              salesOrganization: salesOrganization,
              salesOrgConfig: salesOrgConfigs,
              customerCodeInfo: customerCodeInfo,
              shipToInfo: shipToInfo,
              searchKey: searchKey,
              pageSize: 24,
              offset: 0,
            ),
          ).thenAnswer((_) async => Right(materialResponse));
          return productSearchBloc;
        },
        seed: () => ProductSearchState.initial().copyWith(
          apiFailureOrSuccessOption: optionOf(Right(materialResponse)),
          suggestedProductList: materialResponse.products,
          isSearching: true,
          canLoadMore: false,
          searchKey: searchKey,
        ),
        act: (bloc) => bloc.add(
          ProductSearchEvent.loadMoreProductList(
            configs: salesOrgConfigs,
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
            shipToInfo: shipToInfo,
          ),
        ),
        expect: () => [],
      );

      blocTest<ProductSearchBloc, ProductSearchState>(
        ' -> LoadMoreProductList with error',
        seed: () => ProductSearchState.initial().copyWith(
          apiFailureOrSuccessOption: optionOf(Right(fakeResponse1)),
          suggestedProductList: fakeResponse1.products,
          isSearching: false,
          canLoadMore: true,
          searchKey: searchKey,
        ),
        build: () {
          when(
            () => productSearchRepository.searchProductList(
              salesOrganization: salesOrganization,
              salesOrgConfig: salesOrgConfigs,
              customerCodeInfo: customerCodeInfo,
              shipToInfo: shipToInfo,
              searchKey: searchKey,
              pageSize: 24,
              offset: 24,
            ),
          ).thenAnswer(
            (_) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
          return productSearchBloc;
        },
        act: (bloc) => bloc.add(
          ProductSearchEvent.loadMoreProductList(
            configs: salesOrgConfigs,
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
            shipToInfo: shipToInfo,
          ),
        ),
        expect: () => [
          ProductSearchState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(Right(fakeResponse1)),
            suggestedProductList: fakeResponse1.products,
            isSearching: true,
            canLoadMore: true,
            searchKey: searchKey,
          ),
          ProductSearchState.initial().copyWith(
            suggestedProductList: fakeResponse1.products,
            canLoadMore: true,
            searchKey: searchKey,
            apiFailureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
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
            searchKey: SearchKey(''),
            apiFailureOrSuccessOption: none(),
            canLoadMore: false,
            suggestedProductList: <MaterialInfo>[],
          ),
          ProductSearchState.initial().copyWith(
            searchKey: SearchKey(''),
            apiFailureOrSuccessOption: none(),
            canLoadMore: false,
            suggestedProductList: <MaterialInfo>[],
            productSuggestionHistory: searchKeys,
          ),
        ],
      );
    });

    group(' -> FetchProductSuggestionHistory', () {
      blocTest<ProductSearchBloc, ProductSearchState>(
        ' -> Emits correct state and response',
        build: () {
          when(() => productSearchRepository.getSearchKeys())
              .thenAnswer((_) async => Right(searchKeys));
          return productSearchBloc;
        },
        act: (bloc) => bloc.add(
          const ProductSearchEvent.fetchProductSearchSuggestionHistory(),
        ),
        expect: () => [
          ProductSearchState.initial().copyWith(
            productSuggestionHistory: searchKeys,
          ),
        ],
      );

      blocTest<ProductSearchBloc, ProductSearchState>(
        ' -> FetchProductSuggestionHistory with error',
        build: () {
          when(() => productSearchRepository.getSearchKeys()).thenAnswer(
            (_) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
          return productSearchBloc;
        },
        act: (bloc) => bloc.add(
          const ProductSearchEvent.fetchProductSearchSuggestionHistory(),
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

    group(' -> ClearSearchHistory', () {
      blocTest<ProductSearchBloc, ProductSearchState>(
        ' -> Clear search history successfully',
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
