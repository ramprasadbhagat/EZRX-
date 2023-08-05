import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/order/product_search/product_search_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/product_suggestion_history.dart';

import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/product_suggestion_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';
import '../order_history/order_history_details_widget_test.dart';

class ProductSearchBlocMock
    extends MockBloc<ProductSearchEvent, ProductSearchState>
    implements ProductSearchBloc {}

void main() {
  late ProductSearchBloc productSearchBlocMock;
  late AppRouter autoRouterMock;
  final locator = GetIt.instance;

  setUpAll(() async {
    locator.registerLazySingleton(() => MixpanelService());
    locator<MixpanelService>().init(mixpanel: MixpanelMock());
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    autoRouterMock = locator<AppRouter>();
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    productSearchBlocMock = ProductSearchBlocMock();

    when(() => productSearchBlocMock.state).thenReturn(
      ProductSearchState.initial().copyWith(
        productSuggestionHistory: ProductSuggestionHistory.empty()
            .copyWith(searchKeyList: [SearchKey('test-search')]),
      ),
    );
  });

  Future getWidget(tester) async {
    return tester.pumpWidget(
      WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<ProductSearchBloc>(
            create: (context) => productSearchBlocMock,
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
      final expectedState = [
        ProductSearchState.initial().copyWith(
          productSuggestionHistory: ProductSuggestionHistory.empty()
              .copyWith(searchKeyList: [SearchKey('test-search')]),
        ),
      ];
      whenListen(productSearchBlocMock, Stream.fromIterable(expectedState));
      await getWidget(tester);
      await tester.pump();
      final searchHistoryText = find.text('Search History');
      final productSearchSuggestionSection =
          find.byKey(WidgetKeys.productSearchSuggestion);

      expect(searchHistoryText, findsOneWidget);
      expect(productSearchSuggestionSection, findsNothing);
    });

    testWidgets(
        '=> Test to check search history when search field is empty but search history list is also empty',
        (tester) async {
      final expectedState = [ProductSearchState.initial()];
      whenListen(productSearchBlocMock, Stream.fromIterable(expectedState));
      await getWidget(tester);
      await tester.pump();
      final searchHistoryText = find.text('Search History');
      final productSearchSuggestionSection =
          find.byKey(WidgetKeys.productSearchSuggestion);

      expect(searchHistoryText, findsNothing);
      expect(productSearchSuggestionSection, findsNothing);
    });
  });
}
