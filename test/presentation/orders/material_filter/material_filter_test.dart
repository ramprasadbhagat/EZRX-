import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/orders/create_order/material_filter.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';


class AutoRouterMock extends Mock implements AppRouter {}

class MockMaterialFilterBloc
    extends MockBloc<MaterialFilterEvent, MaterialFilterState>
    implements MaterialFilterBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MaterialFilterBloc materialfilterBlocMock;
  late AppRouter autoRouterMock;

  setUpAll(() async {
    setupLocator();
  });

  group('Material Filter Test', () {
    setUp(() {
      materialfilterBlocMock = MockMaterialFilterBloc();
      autoRouterMock = locator<AppRouter>();
    });

    Widget getScopedWidget(Widget child) {
      return EasyLocalization(
        supportedLocales: const [
          Locale('en', 'SG'),
        ],
        path: 'assets/langs/langs.csv',
        startLocale: const Locale('en', 'SG'),
        fallbackLocale: const Locale('en', 'SG'),
        saveLocale: true,
        useOnlyLangCode: false,
        assetLoader: CsvAssetLoader(),
        child: WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          providers: [
            BlocProvider<MaterialFilterBloc>(
                create: ((context) => materialfilterBlocMock)), 
          ],
          child: child,
        ),
      );
    }

    testWidgets('Material Filter Page Failed To Load', (tester) async {
      final expectedState = [
        MaterialFilterState.initial().copyWith(
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Fake-error'))),
        )
      ];
      when(() => materialfilterBlocMock.state)
          .thenReturn(MaterialFilterState.initial());
      whenListen(materialfilterBlocMock, Stream.fromIterable(expectedState));
      await tester.pumpWidget(getScopedWidget(const MaterialFilterPage(
        filterType: MaterialFilterType.principal,
      )));
    });

    testWidgets('Material Filter Page Body Content', (tester) async {
      final expectedState = [
        MaterialFilterState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          materialFilter: const MaterialFilter(
              uniqueItemBrand: [],
              uniquePrincipalName: [
                'GSK Consumer Healthcare',
                'Pfizer PFE Private Limited test'
              ],
              uniqueTherapeuticClass: []),
        )
      ];
      when(() => materialfilterBlocMock.state)
          .thenReturn(MaterialFilterState.initial());
      whenListen(materialfilterBlocMock, Stream.fromIterable(expectedState));
      await tester.pumpWidget(getScopedWidget(const MaterialFilterPage(
        filterType: MaterialFilterType.principal,
      )));
      await tester.pump();
      final materialFilterList = find.byKey(const Key('materialFilterPage'));
      expect(materialFilterList, findsOneWidget);
    });

    testWidgets('Material Filter Page Select Filter Options', (tester) async {
      final expectedState = [
        MaterialFilterState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          selectedMaterialFilter:
              const MaterialFilter(uniqueItemBrand: [], uniquePrincipalName: [
            'GSK Consumer Healthcare',
          ], uniqueTherapeuticClass: []),
        )
      ];
      when(() => materialfilterBlocMock.state).thenReturn(
        MaterialFilterState.initial().copyWith(
            materialFilter: const MaterialFilter(
                uniqueItemBrand: [],
                uniquePrincipalName: [
                  'GSK Consumer Healthcare',
                  'Pfizer PFE Private Limited test'
                ],
            uniqueTherapeuticClass: [])));
      whenListen(materialfilterBlocMock, Stream.fromIterable(expectedState));
      await tester.pumpWidget(getScopedWidget(const MaterialFilterPage(
        filterType: MaterialFilterType.principal,
      )));
      
      final optionTile =
          find.byKey(const Key('filterOption-GSK Consumer Healthcare'));
      expect(optionTile, findsOneWidget);
      await tester.tap(optionTile);
      await tester.pump();
    });

    testWidgets('Clear Material Filter Search', (tester) async {
      final expected = [
        MaterialFilterState.initial().copyWith(
          searchKey: '',
        )
      ];
      when(() => materialfilterBlocMock.state).thenReturn(

          MaterialFilterState.initial().copyWith(
              materialFilter: const MaterialFilter(
                  uniqueItemBrand: [],
                  uniquePrincipalName: [
            'GSK Consumer Healthcare',
            'Pfizer PFE Private Limited test'
          ],
                  uniqueTherapeuticClass: [])));
      whenListen(materialfilterBlocMock, Stream.fromIterable(expected));

      await tester.runAsync(() async {
        await tester.pumpWidget(getScopedWidget(const MaterialFilterPage(
          filterType: MaterialFilterType.principal,
        )));
      });

      await tester.pump();
      final clearMaterialFiltereSearch =
          find.byKey(const Key('clearMaterialFilterSearch'));
      expect(clearMaterialFiltereSearch, findsOneWidget);
      await tester.tap(clearMaterialFiltereSearch);
    });


     testWidgets('Enter Search Key in Search Field', (tester) async {
      final expected = [
        MaterialFilterState.initial().copyWith(
          searchKey: 'GSK',
        )
      ];
      when(() => materialfilterBlocMock.state).thenReturn(
          MaterialFilterState.initial().copyWith(
              materialFilter: const MaterialFilter(
                  uniqueItemBrand: [],
                  uniquePrincipalName: [
            'GSK Consumer Healthcare',
            'Pfizer PFE Private Limited test'
          ],
                  uniqueTherapeuticClass: [])));
      whenListen(materialfilterBlocMock, Stream.fromIterable(expected));

      await tester.runAsync(() async {
        await tester.pumpWidget(getScopedWidget(const MaterialFilterPage(
          filterType: MaterialFilterType.principal,
        )));
      });

      await tester.pump();
      await tester.enterText(find.byKey(const Key('materialFilterSearchField')), 'GSK');
      await tester.pump();
      expect(find.text('123'), findsNothing);
      expect(find.text('GSK'), findsOneWidget);
      
    });

    
  });
}
