import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/application/order/product_search/product_search_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/product_suggestion_history.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';

import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/product_suggestion/product_suggestion_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

import 'package:mocktail/mocktail.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../utils/widget_utils.dart';

class MixpanelMock extends Mock implements Mixpanel {}

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

void main() {
  late ProductSearchBloc productSearchBlocMock;
  late EligibilityBloc eligibilityBloc;
  late ProductDetailBloc productDetailBloc;
  late MaterialPriceBloc materialPriceBloc;
  late AppRouter autoRouterMock;
  final locator = GetIt.instance;

  /////////////////////////key///////////////////////////////////
  final productSearchSuggestionSection =
      find.byKey(WidgetKeys.productSearchSuggestion);
  final searchHistoryText = find.text('Search History');

  //////////////////////////////////////////////////////////////

  setUpAll(() async {
    locator.registerLazySingleton(
      () => MixpanelService(config: locator<Config>()),
    );
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    autoRouterMock = locator<AppRouter>();
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    eligibilityBloc = EligibilityBlocMock();
    productDetailBloc = ProductDetailBlocMock();
    materialPriceBloc = MaterialPriceBlocMock();
    productSearchBlocMock = ProductSearchBlocMock();

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
  });

  Widget getWidget() {
    return EasyLocalization(
      supportedLocales: const <Locale>[
        Locale('en'),
      ],
      path: 'assets/langs/langs.csv',
      startLocale: const Locale('en'),
      fallbackLocale: const Locale('en'),
      saveLocale: true,
      useOnlyLangCode: true,
      assetLoader: CsvAssetLoader(),
      child: WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
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
        ],
        child: const ProductSuggestionPage(),
      ),
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
      await tester.pump();
      expect(searchHistoryText, findsOneWidget);
      expect(productSearchSuggestionSection, findsNothing);
    });

    testWidgets(
        '=> Test to check search history when search field is empty but search history list is also empty',
        (tester) async {
      final expectedState = <ProductSearchState>[ProductSearchState.initial()];
      whenListen(productSearchBlocMock, Stream.fromIterable(expectedState));
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(searchHistoryText, findsNothing);
      expect(productSearchSuggestionSection, findsNothing);
    });
  });

  group('Product suggestion page navigation to material or bundle details test',
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
            )
          ],
        )
      ];
      whenListen(productSearchBlocMock, Stream.fromIterable(expectedState));
      await tester.pumpWidget(getWidget());
      await tester.pump();
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
      verify(
        () => productDetailBloc.add(
          ProductDetailEvent.fetch(
            materialNumber: MaterialNumber('fake-material-number'),
            locale: const Locale('en'),
            type: MaterialInfoType('material'),
          ),
        ),
      ).called(1);
      verify(
        () => materialPriceBloc.add(
          MaterialPriceEvent.fetch(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            shipToInfo: ShipToInfo.empty(),
            comboDealEligible: false,
            materials: <MaterialInfo>[
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-number'),
                type: MaterialInfoType('material'),
              ),
            ],
            salesConfigs: SalesOrganisationConfigs.empty(),
          ),
        ),
      ).called(1);
      expect(autoRouterMock.current.name, ProductDetailsPageRoute.name);
    });

    testWidgets('=> Bundle Navigation', (tester) async {
      await tester.pump(VisibilityDetectorController.instance.updateInterval);
      final expectedState = [
        ProductSearchState.initial(),
        ProductSearchState.initial().copyWith(
          searchKey: SearchKey('test-search'),
          suggestedProductList: <MaterialInfo>[
            MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-material-number'),
              type: MaterialInfoType('bundle'),
            )
          ],
        )
      ];
      whenListen(productSearchBlocMock, Stream.fromIterable(expectedState));
      await tester.pumpWidget(getWidget());
      await tester.pump();
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
      verify(
        () => productDetailBloc.add(
          ProductDetailEvent.fetch(
            materialNumber: MaterialNumber('fake-material-number'),
            locale: const Locale('en'),
            type: MaterialInfoType('bundle'),
          ),
        ),
      ).called(1);
      expect(autoRouterMock.current.name, BundleDetailPageRoute.name);
    });
  });
}
