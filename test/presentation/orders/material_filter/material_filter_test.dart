import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/orders/create_order/material_filter.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';
import '../../order_history/order_history_details_widget_test.dart';

class AutoRouterMock extends Mock implements AppRouter {}

class MockMaterialFilterBloc
    extends MockBloc<MaterialFilterEvent, MaterialFilterState>
    implements MaterialFilterBloc {}

class MockMaterialListBloc
    extends MockBloc<MaterialListEvent, MaterialListState>
    implements MaterialListBloc {}

class MockUserBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class MockSalesOrgBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class MockCustomerCodeBloc
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class MockShipToCodeBloc extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class MockEligibilityBloc extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class MockOrderDocumentTypeBloc
    extends MockBloc<OrderDocumentTypeEvent, OrderDocumentTypeState>
    implements OrderDocumentTypeBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MaterialFilterBloc materialfilterBlocMock;
  late AppRouter autoRouterMock;
  late MockMaterialListBloc materialListBloc;
  late MockCustomerCodeBloc customerCodeBloc;
  late MockEligibilityBloc eligibilityBloc;
  late MockSalesOrgBloc salesOrgBloc;
  late MockShipToCodeBloc shipToCodeBloc;
  late MockUserBloc userBloc;
  late MockOrderDocumentTypeBloc orderDocumentTypeBloc;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;

  setUpAll(() async {
    setupLocator();
    locator<MixpanelService>().init(mixpanel: MixpanelMock());
  });

  group('Material Filter Test', () {
    setUp(() {
      materialfilterBlocMock = MockMaterialFilterBloc();
      autoRouterMock = locator<AppRouter>();
      materialListBloc = MockMaterialListBloc();
      salesOrgBloc = MockSalesOrgBloc();
      shipToCodeBloc = MockShipToCodeBloc();
      userBloc = MockUserBloc();
      eligibilityBloc = MockEligibilityBloc();
      customerCodeBloc = MockCustomerCodeBloc();
      orderDocumentTypeBloc = MockOrderDocumentTypeBloc();
      authBlocMock = AuthBlocMock();
      announcementBlocMock = AnnouncementBlocMock();

      when(() => materialfilterBlocMock.state)
          .thenReturn(MaterialFilterState.initial());
      when(() => salesOrgBloc.state).thenReturn(SalesOrgState.initial());
      when(() => materialListBloc.state)
          .thenReturn(MaterialListState.initial());
      when(() => shipToCodeBloc.state).thenReturn(ShipToCodeState.initial());
      when(() => userBloc.state).thenReturn(UserState.initial());
      when(() => eligibilityBloc.state).thenReturn(EligibilityState.initial());
      when(() => customerCodeBloc.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => orderDocumentTypeBloc.state)
          .thenReturn(OrderDocumentTypeState.initial());
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
    });

    Widget getScopedWidget(Widget child) {
      return EasyLocalization(
        supportedLocales: const [
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
            BlocProvider<MaterialFilterBloc>(
                create: ((context) => materialfilterBlocMock)),
            BlocProvider<MaterialListBloc>(
                create: ((context) => materialListBloc)),
            BlocProvider<CustomerCodeBloc>(
                create: ((context) => customerCodeBloc)),
            BlocProvider<UserBloc>(create: ((context) => userBloc)),
            BlocProvider<SalesOrgBloc>(create: ((context) => salesOrgBloc)),
            BlocProvider<ShipToCodeBloc>(create: ((context) => shipToCodeBloc)),
            BlocProvider<EligibilityBloc>(
                create: ((context) => eligibilityBloc)),
            BlocProvider<OrderDocumentTypeBloc>(
                create: ((context) => orderDocumentTypeBloc)),
            BlocProvider<AuthBloc>(create: (context) => authBlocMock),
            BlocProvider<AnnouncementBloc>(
                create: (context) => announcementBlocMock),
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

    testWidgets('Material Filter Page Body Content with valid search input',
        (tester) async {
      final expectedState = [
        MaterialFilterState.initial().copyWith(
          apiFailureOrSuccessOption: optionOf(const Right('success')),
          materialFilter: const MaterialFilter(
              uniqueItemBrand: [],
              uniquePrincipalName: [
                'GSK Consumer Healthcare',
                'Pfizer PFE Private Limited test'
              ],
              uniqueTherapeuticClass: []),
        )
      ];
      when(() => materialListBloc.state).thenReturn(MaterialListState.initial()
          .copyWith(searchKey: SearchKey.search('mat')));
      whenListen(materialfilterBlocMock, Stream.fromIterable(expectedState));
      await tester.pumpWidget(getScopedWidget(const MaterialFilterPage(
        filterType: MaterialFilterType.principal,
      )));
      await tester.pump();
      final materialFilterList = find.byKey(const Key('materialFilterPage'));
      expect(materialFilterList, findsOneWidget);

      final dynamic widgetsAppState = tester.state(find.byType(WidgetsApp));
      final willPopCalled = await widgetsAppState.didPopRoute();
      await tester.pump();

      expect(willPopCalled, false);
    });

    testWidgets(
        'Material Filter Page Body Content with invalid search input but selected and filter material are same',
        (tester) async {
      final expectedState = [
        MaterialFilterState.initial().copyWith(
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Fake-error'))),
        ),
        MaterialFilterState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
        ),
      ];
      when(() => materialListBloc.state).thenReturn(MaterialListState.initial()
          .copyWith(searchKey: SearchKey.search('at')));
      whenListen(materialfilterBlocMock, Stream.fromIterable(expectedState));
      await tester.pumpWidget(getScopedWidget(const MaterialFilterPage(
        filterType: MaterialFilterType.principal,
      )));
      await tester.pump();
      final materialFilterList = find.byKey(const Key('materialFilterPage'));
      expect(materialFilterList, findsOneWidget);

      final dynamic widgetsAppState = tester.state(find.byType(WidgetsApp));
      final willPopCalled = await widgetsAppState.didPopRoute();
      await tester.pump();

      expect(willPopCalled, false);
    });

    testWidgets(
        'Material Filter Page Body Content with invalid search input but selected and filter material are different',
        (tester) async {
      final expectedState = [
        MaterialFilterState.initial().copyWith(
            selectedMaterialFilter: MaterialFilter.empty().copyWith(
          uniquePrincipalName: [
            'GSK Consumer Healthcare',
            'Pfizer PFE Private Limited test'
          ],
        )),
      ];
      when(() => materialListBloc.state).thenReturn(MaterialListState.initial()
          .copyWith(
              searchKey: SearchKey.search('at'),
              selectedFilters: MaterialFilter.empty()));
      whenListen(materialfilterBlocMock, Stream.fromIterable(expectedState));
      await tester.pumpWidget(getScopedWidget(const MaterialFilterPage(
        filterType: MaterialFilterType.principal,
      )));
      await tester.pump();
      final materialFilterList = find.byKey(const Key('materialFilterPage'));
      expect(materialFilterList, findsOneWidget);

      final dynamic widgetsAppState = tester.state(find.byType(WidgetsApp));
      final willPopCalled = await widgetsAppState.didPopRoute();
      await tester.pump();

      expect(willPopCalled, false);
    });

    testWidgets('Material Filter Page Select Filter Options', (tester) async {
      final expectedState = [
        MaterialFilterState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          selectedMaterialFilter: const MaterialFilter(
              uniqueItemBrand: [],
              uniquePrincipalName: [
                'GSK Consumer Healthcare',
                'Pfizer PFE Private Limited test'
              ],
              uniqueTherapeuticClass: []),
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
      // final clearMaterialFiltereSearch =
      //     find.byKey(const Key('clearMaterialFilterSearch'));
      // expect(clearMaterialFiltereSearch, findsOneWidget);
      // await tester.tap(clearMaterialFiltereSearch);
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
      await tester.enterText(
          find.byKey(const Key('materialFilterSearchField')), 'GSK');
      await tester.pump();
      expect(find.text('123'), findsNothing);
      expect(find.text('GSK'), findsOneWidget);
    });

    testWidgets('Enter Search Key in Search Field', (tester) async {
      final expected = [
        MaterialFilterState.initial().copyWith(
          searchKey: 'Growth hormones',
        )
      ];
      when(() => materialfilterBlocMock.state)
          .thenReturn(MaterialFilterState.initial().copyWith(
              materialFilter: const MaterialFilter(
        uniqueItemBrand: [],
        uniquePrincipalName: [],
        uniqueTherapeuticClass: ['Growth hormones'],
      )));
      whenListen(materialfilterBlocMock, Stream.fromIterable(expected));

      await tester.runAsync(() async {
        await tester.pumpWidget(getScopedWidget(const MaterialFilterPage(
          filterType: MaterialFilterType.therapeutic,
        )));
      });

      await tester.pump();
      await tester.enterText(find.byKey(const Key('materialFilterSearchField')),
          'Growth hormones');
      await tester.pump();
      expect(find.text('123'), findsNothing);
      expect(find.text('Growth hormones'), findsOneWidget);
    });

    testWidgets('Enter Search Key in Search Field', (tester) async {
      final expected = [
        MaterialFilterState.initial().copyWith(
          searchKey: 'Dequadin',
        )
      ];
      when(() => materialfilterBlocMock.state)
          .thenReturn(MaterialFilterState.initial().copyWith(
              materialFilter: const MaterialFilter(
        uniqueItemBrand: ['Dequadin Extra Lemon'],
        uniquePrincipalName: [],
        uniqueTherapeuticClass: [],
      )));
      whenListen(materialfilterBlocMock, Stream.fromIterable(expected));

      await tester.runAsync(() async {
        await tester.pumpWidget(getScopedWidget(const MaterialFilterPage(
          filterType: MaterialFilterType.brand,
        )));
      });

      await tester.pump();
      await tester.enterText(find.byKey(const Key('materialFilterSearchField')),
          'Dequadin Extra Lemon');
      await tester.pump();
      expect(find.text('123'), findsNothing);
      expect(find.text('Dequadin Extra Lemon'), findsOneWidget);
    });

    testWidgets('Enter random Search Key in Search Field', (tester) async {
      final expected = [
        MaterialFilterState.initial().copyWith(
          searchKey: 'RandomKey',
        )
      ];
      when(() => materialfilterBlocMock.state)
          .thenReturn(MaterialFilterState.initial().copyWith(
              materialFilter: const MaterialFilter(
        uniqueItemBrand: [],
        uniquePrincipalName: [],
        uniqueTherapeuticClass: [],
      )));
      whenListen(materialfilterBlocMock, Stream.fromIterable(expected));

      await tester.runAsync(() async {
        await tester.pumpWidget(getScopedWidget(const MaterialFilterPage(
          filterType: MaterialFilterType.brand,
        )));
      });

      await tester.pump();
      await tester.enterText(
          find.byKey(const Key('materialFilterSearchField')), 'RandomKey');
      await tester.pump();
      expect(find.text('RandomKey'), findsOneWidget);
    });

    testWidgets('Enter text in Search Field and press submit', (tester) async {
      when(() => materialfilterBlocMock.state).thenReturn(
        MaterialFilterState.initial().copyWith(
          materialFilter: const MaterialFilter(
            uniqueItemBrand: [],
            uniquePrincipalName: [
              'GSK Consumer Healthcare',
              'Pfizer PFE Private Limited test'
            ],
            uniqueTherapeuticClass: [],
          ),
        ),
      );

      await tester.runAsync(() async {
        await tester.pumpWidget(getScopedWidget(const MaterialFilterPage(
          filterType: MaterialFilterType.principal,
        )));
      });

      await tester.pump();
      final searchBarField = find.byKey(const Key('materialFilterSearchField'));
      await tester.enterText(searchBarField, 'GSK');
      await tester.pump();
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      verify(
        () => materialfilterBlocMock.add(
          const MaterialFilterEvent.updateSearchKey('GSK'),
        ),
      ).called(1);
    });

    testWidgets(
        'Material Filter Clear All button appears when atleast one item in the selected list and onTapping clears the selected item for respective type',
        (tester) async {
      final expectedState = [
        MaterialFilterState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          selectedMaterialFilter: const MaterialFilter(
              uniqueItemBrand: [],
              uniquePrincipalName: [
                'GSK Consumer Healthcare',
                'Pfizer PFE Private Limited test'
              ],
              uniqueTherapeuticClass: []),
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
      final clearAllButton = find.byKey(const Key('filterclearMaterialList'));
      expect(clearAllButton, findsNothing);
      await tester.tap(optionTile);
      await tester.pump();
      expect(clearAllButton, findsOneWidget);
      await tester.tap(clearAllButton);
      verify(
        () => materialfilterBlocMock.add(
          const MaterialFilterEvent.clearAllSelected(
            MaterialFilterType.principal,
          ),
        ),
      ).called(1);
    });

    testWidgets('Material Filter Page loading test', (tester) async {
      whenListen(
          materialfilterBlocMock,
          Stream.fromIterable([
            MaterialFilterState.initial().copyWith(
              isFetching: true,
            )
          ]));
      await tester.pumpWidget(getScopedWidget(const MaterialFilterPage(
        filterType: MaterialFilterType.principal,
      )));
      await tester.pump();

      final loaderImage = find.byKey(const Key('loaderImage'));
      expect(loaderImage, findsOneWidget);
    });
  });
}
