import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/application/order/product_search/product_search_bloc.dart';
import 'package:ezrxmobile/application/order/scan_material_info/scan_material_info_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/product_suggestion_history.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/clevertap/clevertap_service.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/product_search_local.dart';
import 'package:ezrxmobile/presentation/core/custom_search_bar.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/product_suggestion/product_suggestion_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import 'package:mocktail/mocktail.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../common_mock_data/mock_bloc.dart';
import '../../common_mock_data/mock_other.dart';
import '../../utils/widget_utils.dart';

class MockMixPanelService extends Mock implements MixpanelService {}

class ProductSearchBlocMock
    extends MockBloc<ProductSearchEvent, ProductSearchState>
    implements ProductSearchBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class ProductDetailBlocMock
    extends MockBloc<ProductDetailEvent, ProductDetailState>
    implements ProductDetailBloc {}

class MaterialPriceBlocMock
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

class ScanMaterialInfoBlocMock
    extends MockBloc<ScanMaterialInfoEvent, ScanMaterialInfoState>
    implements ScanMaterialInfoBloc {}

class MockMaterialFilterBloc
    extends MockBloc<MaterialFilterEvent, MaterialFilterState>
    implements MaterialFilterBloc {}

void main() {
  late ProductSearchBloc productSearchBlocMock;
  late EligibilityBloc eligibilityBloc;
  late ProductDetailBloc productDetailBloc;
  late MaterialPriceBloc materialPriceBloc;
  late ScanMaterialInfoBloc scanMaterialInfoBlocMock;
  late AppRouter autoRouterMock;
  late MaterialFilterBloc materialFilterBlocMock;
  final locator = GetIt.instance;
  const fakeSearchText = 'fake-search-text';
  late List<MaterialInfo> materialSearchResults;
  late MaterialListBloc materialListBlocMock;

  /////////////////////////key///////////////////////////////////
  final productSearchSuggestionSection =
      find.byKey(WidgetKeys.productSearchSuggestion);
  final searchHistoryText = find.text('Search History');

  //////////////////////////////////////////////////////////////

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton<MixpanelService>(() => MockMixPanelService());
    locator.registerSingleton<ClevertapService>(ClevertapServiceMock());
    locator.registerLazySingleton(() => AppRouter());
    autoRouterMock = locator<AppRouter>();
    materialSearchResults =
        (await ProductSearchLocalDataSource().getSearchedProductList())
            .products;
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    eligibilityBloc = EligibilityBlocMock();
    productDetailBloc = ProductDetailBlocMock();
    materialPriceBloc = MaterialPriceBlocMock();
    scanMaterialInfoBlocMock = ScanMaterialInfoBlocMock();
    productSearchBlocMock = ProductSearchBlocMock();
    materialFilterBlocMock = MockMaterialFilterBloc();
    materialListBlocMock = MaterialListBlocMock();

    when(() => productSearchBlocMock.state).thenReturn(
      ProductSearchState.initial().copyWith(
        productSuggestionHistory: ProductSuggestionHistory.empty()
            .copyWith(searchKeyList: [SearchKey('test-search')]),
      ),
    );
    when(() => eligibilityBloc.state).thenReturn(
      EligibilityState.initial(),
    );
    when(() => productDetailBloc.state).thenReturn(
      ProductDetailState.initial(),
    );
    when(() => materialPriceBloc.state).thenReturn(
      MaterialPriceState.initial(),
    );
    when(() => scanMaterialInfoBlocMock.state).thenReturn(
      ScanMaterialInfoState.initial(),
    );
    when(() => materialFilterBlocMock.state)
        .thenReturn(MaterialFilterState.initial());
    when(() => materialListBlocMock.state)
        .thenReturn(MaterialListState.initial());
  });

  Widget getWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<ProductSearchBloc>(
          create: (context) => productSearchBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBloc,
        ),
        BlocProvider<ProductDetailBloc>(
          create: (context) => productDetailBloc,
        ),
        BlocProvider<MaterialPriceBloc>(
          create: (context) => materialPriceBloc,
        ),
        BlocProvider<ScanMaterialInfoBloc>(
          create: (context) => scanMaterialInfoBlocMock,
        ),
        BlocProvider<MaterialFilterBloc>(
          create: (context) => materialFilterBlocMock,
        ),
        BlocProvider<MaterialListBloc>(
          create: (context) => materialListBlocMock,
        ),
      ],
      child: const ProductSuggestionPage(parentRoute: ''),
    );
  }

  group('Product suggestion page test', () {
    testWidgets(
        '=> Test to check search history when search field is empty but search history list is not empty',
        (tester) async {
      final expectedState = <ProductSearchState>[
        ProductSearchState.initial().copyWith(
          productSuggestionHistory: ProductSuggestionHistory.empty()
              .copyWith(searchKeyList: [SearchKey('test-search')]),
        ),
      ];
      whenListen(productSearchBlocMock, Stream.fromIterable(expectedState));
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(searchHistoryText, findsOneWidget);
      expect(productSearchSuggestionSection, findsNothing);
    });

    testWidgets(
        '=> search material on suggestion page - verify material list fetch',
        (tester) async {
      final selectedFilter = MaterialFilter.empty().copyWith(
        isCovidSelected: true,
      );

      when(() => materialFilterBlocMock.state).thenReturn(
        MaterialFilterState.initial().copyWith(
          materialFilter: selectedFilter,
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();
      final searchBar = find.byType(CustomSearchBar);
      expect(searchBar, findsOneWidget);

      await tester.tap(searchBar);

      await tester.enterText(searchBar, fakeSearchText);
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      verify(
        () => productSearchBlocMock.add(
          ProductSearchEvent.saveSearchHistory(
            searchKey: SearchKey.search(fakeSearchText),
          ),
        ),
      ).called(1);

      verify(
        () => materialListBlocMock
          ..add(
            const MaterialListEvent.updateSearchKey(
              searchKey: fakeSearchText,
            ),
          ),
      ).called(1);

      verify(
        () => materialListBlocMock.add(
          MaterialListEvent.fetch(
            selectedMaterialFilter: selectedFilter,
          ),
        ),
      ).called(1);
    });

    testWidgets(
        '=> Test to check search history when search field is empty but search history list is also empty',
        (tester) async {
      when(() => productSearchBlocMock.state)
          .thenReturn(ProductSearchState.initial());
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(searchHistoryText, findsOneWidget);
      expect(productSearchSuggestionSection, findsNothing);
      expect(
        find.text('No search history available'.tr()),
        findsOneWidget,
      );
    });

    group('Marketplace logo -', () {
      testWidgets('Visible when material is from marketplace', (tester) async {
        final marketPlaceMaterial =
            materialSearchResults.firstWhere((e) => e.isMarketPlace);
        when(() => productSearchBlocMock.state).thenReturn(
          ProductSearchState.initial().copyWith(
            suggestedProductList: [marketPlaceMaterial],
            searchKey: SearchKey(fakeSearchText),
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        expect(
          find.descendant(
            of: find.byKey(
              WidgetKeys.searchedProduct(
                marketPlaceMaterial.materialNumber.displayMatNo,
              ),
            ),
            matching: find.byType(MarketPlaceLogo),
          ),
          findsOneWidget,
        );
      });

      testWidgets('Not visible when material is not from marketplace',
          (tester) async {
        final nonMarketPlaceMaterial =
            materialSearchResults.firstWhere((e) => !e.isMarketPlace);
        when(() => productSearchBlocMock.state).thenReturn(
          ProductSearchState.initial().copyWith(
            suggestedProductList: [nonMarketPlaceMaterial],
            searchKey: SearchKey(fakeSearchText),
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        expect(
          find.descendant(
            of: find.byKey(
              WidgetKeys.searchedProduct(
                nonMarketPlaceMaterial.materialNumber.displayMatNo,
              ),
            ),
            matching: find.byType(MarketPlaceLogo),
          ),
          findsNothing,
        );
      });
    });
  });

  group(
    'Product suggestion page navigation to material or bundle details test',
    () {
      testWidgets('=> Material Navigation', (tester) async {
        final expectedState = <ProductSearchState>[
          ProductSearchState.initial(),
          ProductSearchState.initial().copyWith(
            searchKey: SearchKey('test-search'),
            suggestedProductList: <MaterialInfo>[
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-number'),
                type: MaterialInfoType('material'),
              ),
            ],
          ),
        ];
        whenListen(productSearchBlocMock, Stream.fromIterable(expectedState));
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        expect(searchHistoryText, findsNothing);
        expect(productSearchSuggestionSection, findsOneWidget);
        final productTile = find.byKey(
          WidgetKeys.searchedProduct(
            MaterialNumber('fake-material-number').displayMatNo,
          ),
        );
        expect(productTile, findsOneWidget);
        await tester.tap(productTile);
        await tester.pumpAndSettle();

        expect(autoRouterMock.current.name, ProductDetailsPageRoute.name);
      });

      testWidgets(
        '=> Bundle Navigation',
        (tester) async {
          await tester
              .pump(VisibilityDetectorController.instance.updateInterval);
          final expectedState = [
            ProductSearchState.initial(),
            ProductSearchState.initial().copyWith(
              searchKey: SearchKey('test-search'),
              suggestedProductList: <MaterialInfo>[
                MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('fake-material-number'),
                  type: MaterialInfoType('bundle'),
                ),
              ],
            ),
          ];
          whenListen(productSearchBlocMock, Stream.fromIterable(expectedState));
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();
          expect(searchHistoryText, findsNothing);
          expect(productSearchSuggestionSection, findsOneWidget);
          final productTile = find.byKey(
            WidgetKeys.searchedProduct(
              MaterialNumber('fake-material-number').displayMatNo,
            ),
          );
          expect(productTile, findsOneWidget);
          await tester.tap(productTile);
          await tester.pumpAndSettle();

          expect(autoRouterMock.current.name, BundleDetailPageRoute.name);
        },
      );

      testWidgets(
        'Test Product Search Section',
        (tester) async {
          await tester.pumpWidget(getWidget());
          await tester.pump();
          final searchBarFinder = find.byKey(WidgetKeys.searchBar);
          expect(searchBarFinder, findsOneWidget);
          await tester.enterText(searchBarFinder, fakeSearchText);
          await tester.testTextInput.receiveAction(TextInputAction.done);
          verify(
            () => productSearchBlocMock.add(
              ProductSearchEvent.saveSearchHistory(
                searchKey: SearchKey.search(fakeSearchText),
              ),
            ),
          ).called(1);
          verify(
            () => materialListBlocMock.add(
              const MaterialListEvent.updateSearchKey(
                searchKey: fakeSearchText,
              ),
            ),
          ).called(1);
          verify(
            () => materialListBlocMock.add(
              MaterialListEvent.fetch(
                selectedMaterialFilter: MaterialFilter.empty(),
              ),
            ),
          ).called(1);
        },
      );

      testWidgets(
        'Test Product Search open scan camera',
        (tester) async {
          await tester.pumpWidget(getWidget());
          await tester.pump();
          final searchBarFinder = find.byKey(WidgetKeys.searchBar);
          expect(searchBarFinder, findsOneWidget);

          final scanIconFinder = find.byKey(WidgetKeys.productScanCameraKey);
          expect(scanIconFinder, findsOneWidget);
          await tester.tap(scanIconFinder);
          verify(
            () => scanMaterialInfoBlocMock.add(
              ScanMaterialInfoEvent.scanMaterialNumberFromCamera(
                materialFilter: MaterialFilter.empty(),
              ),
            ),
          ).called(1);
          expect(autoRouterMock.current.path, 'orders/scan_material_info');
        },
      );

      testWidgets(
        '=> Test Product Suggestion Section Reload',
        (tester) async {
          when(() => productSearchBlocMock.state).thenReturn(
            ProductSearchState.initial().copyWith(
              searchKey: SearchKey.search(fakeSearchText),
              suggestedProductList: List<MaterialInfo>.generate(
                10,
                (i) => MaterialInfo.empty(),
              ),
            ),
          );
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();
          await tester.fling(
            find.byKey(WidgetKeys.productSearchSuggestion),
            const Offset(0.0, 500.0),
            800.0,
          );
          expect(
            find.byType(RefreshProgressIndicator),
            findsOneWidget,
          );
          await tester.pumpAndSettle();
          verify(
            () => productSearchBlocMock.add(
              const ProductSearchEvent.clearSearch(),
            ),
          ).called(1);
        },
      );

      testWidgets('=> Test Product Suggestion Section Dispose', (tester) async {
        when(() => productSearchBlocMock.state).thenReturn(
          ProductSearchState.initial().copyWith(
            searchKey: SearchKey.search(fakeSearchText),
            suggestedProductList: List<MaterialInfo>.generate(
              10,
              (i) => MaterialInfo.empty(),
            ),
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        await tester.pumpWidget(Container());
        await tester.pumpAndSettle();
        verify(
          () => productSearchBlocMock.add(
            const ProductSearchEvent.clearSearch(),
          ),
        ).called(1);
      });

      testWidgets(
        '=> Test Product Suggestion Section Load More',
        (tester) async {
          when(() => productSearchBlocMock.state).thenReturn(
            ProductSearchState.initial().copyWith(
              searchKey: SearchKey.search(fakeSearchText),
              suggestedProductList: List<MaterialInfo>.generate(
                10,
                (i) => MaterialInfo.empty(),
              ),
              canLoadMore: true,
            ),
          );
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          await tester.fling(
            find.byKey(WidgetKeys.productSearchSuggestion),
            const Offset(0.0, -5000.0),
            800.0,
          );
          verify(
            () => productSearchBlocMock.add(
              const ProductSearchEvent.loadMoreProductList(),
            ),
          ).called(1);
        },
      );

      testWidgets(
        '=> Test Product Suggestion Section loading',
        (tester) async {
          when(() => productSearchBlocMock.state).thenReturn(
            ProductSearchState.initial().copyWith(
              searchKey: SearchKey.search(fakeSearchText),
              isSearching: true,
            ),
          );
          await tester.pumpWidget(getWidget());
          await tester.pump();
          expect(find.byType(LoadingShimmer), findsOneWidget);
        },
      );

      testWidgets(
        '=> Test history tile',
        (tester) async {
          when(() => productSearchBlocMock.state).thenReturn(
            ProductSearchState.initial().copyWith(
              productSuggestionHistory:
                  ProductSuggestionHistory.empty().copyWith(
                searchKeyList: [
                  SearchKey.search(
                    fakeSearchText,
                  ),
                ],
              ),
            ),
          );
          await tester.pumpWidget(getWidget());
          await tester.pump();
          final historyTileFinder =
              find.widgetWithIcon(ListTile, Icons.history);
          await tester.tap(historyTileFinder.first);
          await tester.pump();

          verify(
            () => productSearchBlocMock.add(
              ProductSearchEvent.searchProduct(
                searchKey: SearchKey.search(
                  fakeSearchText,
                ),
                materialFilter: MaterialFilter.empty(),
              ),
            ),
          ).called(1);
        },
      );
    },
  );
}
