import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/covid_material_list/covid_material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_list/order_history_list_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/presentation/home/home_tab.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';

class MockHTTPService extends Mock implements HttpService {}

class MockBannerBloc extends MockBloc<BannerEvent, BannerState>
    implements BannerBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class ShipToCodeBlocMock extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class SavedOrderBlocMock
    extends MockBloc<SavedOrderListEvent, SavedOrderListState>
    implements SavedOrderListBloc {}

class MaterialListBlocMock
    extends MockBloc<MaterialListEvent, MaterialListState>
    implements MaterialListBloc {}

class OrderHistoryListBlocMock
    extends MockBloc<OrderHistoryListEvent, OrderHistoryListState>
    implements OrderHistoryListBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

final locator = GetIt.instance;

enum SalesOrgVariant { onn, off }

enum CustomerCodeVariant { onn, off }

enum ShipToCodeVariant { onn, off }

final salesOrgVariants = ValueVariant({...SalesOrgVariant.values});

final customerCodeVariants = ValueVariant({...CustomerCodeVariant.values});

final shipToCodeVariants = ValueVariant({...ShipToCodeVariant.values});

class CovidMaterialListBlocMock
    extends MockBloc<CovidMaterialListEvent, CovidMaterialListState>
    implements CovidMaterialListBloc {}

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  final mockBannerBloc = MockBannerBloc();
  late MockHTTPService mockHTTPService;
  late UserBloc userBlocMock;
  late CartBloc cartBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late ShipToCodeBloc shipToCodeBlocMock;
  late AppRouter autoRouterMock;
  late SavedOrderListBloc savedOrderBlocMock;
  late MaterialListBlocMock materialListBlocMock;
  late OrderHistoryListBlocMock orderHistoryListBlocMock;
  late CovidMaterialListBloc covidMaterialListBlocMock;

  // final fakeSaleOrgConfig = SalesOrganisationConfigs(
  //   currency: Currency(''),
  //   hideCustomer: false,
  //   disableOrderType: false,
  //   disablePrincipals: false,
  //   enableGimmickMaterial: false,
  //   languageFilter: false,
  //   languageValue: '',
  //   principalList: [],
  //   enableBatchNumber: false,
  // );

  setUpAll(() {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => mockBannerBloc);
    locator.registerLazySingleton(() => CountlyService());
    mockHTTPService = MockHTTPService();
    locator.registerLazySingleton<HttpService>(
      () => mockHTTPService,
    );
  });
  group('Home Tab Screen', () {
    setUp(() {
      userBlocMock = UserBlocMock();
      cartBlocMock = CartBlocMock();
      salesOrgBlocMock = SalesOrgBlocMock();
      customerCodeBlocMock = CustomerCodeBlocMock();
      shipToCodeBlocMock = ShipToCodeBlocMock();
      savedOrderBlocMock = SavedOrderBlocMock();
      materialListBlocMock = MaterialListBlocMock();
      orderHistoryListBlocMock = OrderHistoryListBlocMock();
      covidMaterialListBlocMock = CovidMaterialListBlocMock();
      autoRouterMock = locator<AppRouter>();
      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => cartBlocMock.state).thenReturn(CartState.initial());
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
      when(() => mockBannerBloc.state).thenReturn(BannerState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => shipToCodeBlocMock.state)
          .thenReturn(ShipToCodeState.initial());
      when(() => savedOrderBlocMock.state)
          .thenReturn(SavedOrderListState.initial());
      when(() => materialListBlocMock.state)
          .thenReturn(MaterialListState.initial());
      when(() => orderHistoryListBlocMock.state)
          .thenReturn(OrderHistoryListState.initial());
      when(() => covidMaterialListBlocMock.state)
          .thenReturn(CovidMaterialListState.initial());
    });

    Widget getScopedWidget() {
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
            BlocProvider<UserBloc>(create: (context) => userBlocMock),
            BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBlocMock),
            BlocProvider<CustomerCodeBloc>(
                create: (context) => customerCodeBlocMock),
            BlocProvider<ShipToCodeBloc>(
                create: (context) => shipToCodeBlocMock),
            BlocProvider<BannerBloc>(create: (context) => mockBannerBloc),
            BlocProvider<SavedOrderListBloc>(
              create: (context) => savedOrderBlocMock,
            ),
            BlocProvider<MaterialListBloc>(
              create: (context) => materialListBlocMock,
            ),
            BlocProvider<OrderHistoryListBloc>(
              create: (context) => orderHistoryListBlocMock,
            ),
            BlocProvider<CartBloc>(
              create: (context) => cartBlocMock,
            ),
            BlocProvider<CovidMaterialListBloc>(
                create: ((context) => covidMaterialListBlocMock)),
          ],
          child: const HomeTab(),
        ),
      );
    }

    // TODO: need Wasim help
    // testWidgets('Home Page Initialized', (tester) async {
    //   await tester.pumpWidget(getScopedWidget());
    //   final homeTileCard = find.byKey(const Key('HomeTileCard')).last;
    //   expect(homeTileCard, findsOneWidget);
    //   await tester.tap(homeTileCard);
    //   await tester.pump();
    // });

    testWidgets(
      'Test Sales Org Selector tile',
      (tester) async {
        final expectedStates = [
          SalesOrgState.initial().copyWith(
              salesOrganisation: SalesOrganisation.empty()
                  .copyWith(salesOrg: SalesOrg('FAKE-SALE-ORG'))),
        ];

        when(() => userBlocMock.state).thenReturn(UserState.initial().copyWith(
            user: User.empty().copyWith(userSalesOrganisations: [
          SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('FAKE-ZPMG')),
          SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('FAKE-TW'))
        ])));

        whenListen(salesOrgBlocMock, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final salesOrgSelectTile = find.byKey(const Key('salesOrgSelect')).last;
        await tester.tap(salesOrgSelectTile);
        await tester.pump();

        if (salesOrgVariants.currentValue == SalesOrgVariant.onn) {
          final salesOrgOption = find.byKey(const Key('salesOrgOptionFAKE-TW'));
          expect(salesOrgOption, findsOneWidget);
          await tester.tap(salesOrgOption);
          await tester.pump();
        }
        expect(find.text('Please select a Sales Org'.tr()), findsOneWidget);
      },
      variant: salesOrgVariants,
    );

    // TODO: need Wasim help

    // testWidgets(
    //   'Test Customer Code failed',
    //   (tester) async {
    //     final expectedStates = [
    //       CustomerCodeState.initial().copyWith(
    //           apiFailureOrSuccessOption:
    //               optionOf(const Left(ApiFailure.other('Fake-error')))),
    //     ];
    //     whenListen(customerCodeBlocMock, Stream.fromIterable(expectedStates));
    //     await tester.pumpWidget(getScopedWidget());
    //     final customerCodeSelectTile =
    //         find.byKey(const Key('customerCodeSelect')).last;
    //     await tester.tap(customerCodeSelectTile);
    //     await tester.pump();
    //     final errorMessage = find.byKey(const Key('snackBarMessage'));
    //     expect(errorMessage, findsOneWidget);
    //   },
    //   variant: customerCodeVariants,
    // );

    // testWidgets(
    //   'Test Customer Code Selector tile',
    //   (tester) async {
    //     final expectedStates = [
    //       CustomerCodeState.initial().copyWith(
    //           customerCodeInfo: CustomerCodeInfo.empty()
    //               .copyWith(customerCodeSoldTo: 'fake-customer-code')),
    //     ];
    //     whenListen(customerCodeBlocMock, Stream.fromIterable(expectedStates));
    //     await tester.pumpWidget(getScopedWidget());
    //     final customerCodeSelectTile =
    //         find.byKey(const Key('customerCodeSelect')).last;
    //     await tester.tap(customerCodeSelectTile);
    //     await tester.pump();
    //   },
    //   variant: customerCodeVariants,
    // );

    // TODO: need Wasim help
    // testWidgets(
    //   'Test Ship To Code Selector tile',
    //   (tester) async {
    //     final expectedStates = [
    //       ShipToCodeState.initial().copyWith(
    //           shipToInfo: ShipToInfo.empty()
    //               .copyWith(shipToCustomerCode: 'fake-ship-to-code')),
    //     ];
    //     whenListen(shipToCodeBlocMock, Stream.fromIterable(expectedStates));
    //     await tester.pumpWidget(getScopedWidget());
    //     final shipToCodeSelectTile =
    //         find.byKey(const Key('shipToCodeSelect')).last;
    //     await tester.tap(shipToCodeSelectTile);
    //     await tester.pump();
    //   },
    //   variant: shipToCodeVariants,
    // );

    testWidgets('Test when SalesOrg state change', (tester) async {
      final fakeSalesOrganisation = SalesOrganisation.empty()
          .copyWith(salesOrg: SalesOrg('fake-saleOrg'));

      final fakeUser = User.empty().copyWith(username: Username('fake-name'));
      final salesOrgStream = [
        SalesOrgState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          configs:
              SalesOrganisationConfigs.empty().copyWith(hideCustomer: true),
        )
      ];

      when(() => userBlocMock.state)
          .thenReturn(UserState.initial().copyWith(user: fakeUser));

      whenListen(salesOrgBlocMock, Stream.fromIterable(salesOrgStream),
          initialState: SalesOrgState.initial());

      await tester.pumpWidget(getScopedWidget());

      expect(salesOrgBlocMock.state.haveSelectedSalesOrganisation, true);
      expect(salesOrgBlocMock.state.configs.hideCustomer, true);
      expect(salesOrgBlocMock.state.salesOrganisation, fakeSalesOrganisation);
      expect(userBlocMock.state.user, fakeUser);

      verify(
        () => customerCodeBlocMock.add(
          CustomerCodeEvent.fetch(
            hidecustomer: true,
            userInfo: fakeUser,
            selectedSalesOrg: fakeSalesOrganisation,
            isRefresh: true,
          ),
        ),
      ).called(1);
    });

    // TODO: need Wasim help

    // testWidgets('Test when CustomerCode state change', (tester) async {
    //   final fakeShipToInfo1 = ShipToInfo.empty()
    //       .copyWith(defaultShipToAddress: false, building: 'fake-building1');
    //   final fakeShipToInfo2 = ShipToInfo.empty()
    //       .copyWith(defaultShipToAddress: true, building: 'fake-building2');
    //   final customerCodeStream = [
    //     CustomerCodeState.initial().copyWith(
    //         customerCodeInfo: CustomerCodeInfo.empty()
    //             .copyWith(shipToInfos: [fakeShipToInfo1, fakeShipToInfo2]))
    //   ];

    //   whenListen(customerCodeBlocMock, Stream.fromIterable(customerCodeStream),
    //       initialState: CustomerCodeState.initial());

    //   await tester.pumpWidget(getScopedWidget());

    //   expect(
    //     customerCodeBlocMock.state.defaultShipToInfo,
    //     fakeShipToInfo2,
    //   );

    //   verify(
    //     () => shipToCodeBlocMock
    //         .add(ShipToCodeEvent.selected(shipToInfo: fakeShipToInfo2)),
    //   ).called(1);
    // });

    // TODO: need Wasim help
    // testWidgets('Test when ShipToCode state change', (tester) async {
    //   final fakeShipToInfo1 = ShipToInfo.empty()
    //       .copyWith(defaultShipToAddress: false, building: 'fake-building1');
    //   final fakeShipToInfo2 = ShipToInfo.empty()
    //       .copyWith(defaultShipToAddress: true, building: 'fake-building2');
    //   final customerCodeStream = [
    //     CustomerCodeState.initial().copyWith(
    //         customerCodeInfo: CustomerCodeInfo.empty()
    //             .copyWith(shipToInfos: [fakeShipToInfo1, fakeShipToInfo2]))
    //   ];

    //   whenListen(customerCodeBlocMock, Stream.fromIterable(customerCodeStream),
    //       initialState: CustomerCodeState.initial());

    //   await tester.pumpWidget(getScopedWidget());

    //   expect(
    //     customerCodeBlocMock.state.defaultShipToInfo,
    //     fakeShipToInfo2,
    //   );

    //   verify(
    //     () => shipToCodeBlocMock
    //         .add(ShipToCodeEvent.selected(shipToInfo: fakeShipToInfo2)),
    //   ).called(1);
    // });

    // TODO: need Wasim help
    // testWidgets(
    //     'Test when ShipToCode state change and trigger Saved Order list fetch',
    //     (tester) async {
    //   final fakeUser = User.empty().copyWith(username: Username('fake-name'));
    //   final fakeSaleOrg =
    //       SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('fake-name'));
    //   final fakeCustomerCode =
    //       CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: 'fake-name');
    //   final fakeShipToCode = ShipToInfo.empty().copyWith(building: 'fake-name');
    //   final shipToCodeStream = [
    //     ShipToCodeState.initial().copyWith(shipToInfo: fakeShipToCode)
    //   ];

    //   whenListen(shipToCodeBlocMock, Stream.fromIterable(shipToCodeStream),
    //       initialState: ShipToCodeState.initial());

    //   when(() => userBlocMock.state)
    //       .thenReturn(UserState.initial().copyWith(user: fakeUser));
    //   when(() => salesOrgBlocMock.state).thenReturn(
    //       SalesOrgState.initial().copyWith(salesOrganisation: fakeSaleOrg));
    //   when(() => customerCodeBlocMock.state).thenReturn(
    //       CustomerCodeState.initial()
    //           .copyWith(customeCodeInfo: fakeCustomerCode));

    //   await tester.pumpWidget(getScopedWidget());

    //   expect(shipToCodeBlocMock.state.haveShipTo, true);
    //   expect(userBlocMock.state.user, fakeUser);
    //   expect(salesOrgBlocMock.state.salesOrganisation, fakeSaleOrg);
    //   expect(customerCodeBlocMock.state.customeCodeInfo, fakeCustomerCode);
    //   expect(shipToCodeBlocMock.state.shipToInfo, fakeShipToCode);

    //   verify(() => savedOrderBlocMock.add(
    //         SavedOrderListEvent.fetch(
    //             userInfo: fakeUser,
    //             selectedSalesOrganisation: fakeSaleOrg,
    //             selectedCustomerCode: fakeCustomerCode,
    //             selectedShipTo: fakeShipToCode),
    //       )).called(1);
    // });

    // testWidgets(
    //     'Test when ShipToCode state change and trigger Material list fetch',
    //     (tester) async {
    //   final fakeUser = User.empty().copyWith(username: Username('fake-name'));
    //   final fakeSaleOrg =
    //       SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('fake-name'));
    //   final fakeCustomerCode =
    //       CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: 'fake-name');
    //   final fakeShipToCode = ShipToInfo.empty().copyWith(building: 'fake-name');
    //   final shipToCodeStream = [
    //     ShipToCodeState.initial().copyWith(shipToInfo: fakeShipToCode)
    //   ];

    //   whenListen(shipToCodeBlocMock, Stream.fromIterable(shipToCodeStream),
    //       initialState: ShipToCodeState.initial());

    //   when(() => userBlocMock.state)
    //       .thenReturn(UserState.initial().copyWith(user: fakeUser));
    //   when(() => salesOrgBlocMock.state).thenReturn(
    //       SalesOrgState.initial().copyWith(salesOrganisation: fakeSaleOrg));
    //   when(() => customerCodeBlocMock.state).thenReturn(
    //       CustomerCodeState.initial()
    //           .copyWith(customeCodeInfo: fakeCustomerCode));

    //   await tester.pumpWidget(getScopedWidget());

    //   expect(shipToCodeBlocMock.state.haveShipTo, true);
    //   expect(userBlocMock.state.user, fakeUser);
    //   expect(salesOrgBlocMock.state.salesOrganisation, fakeSaleOrg);
    //   expect(customerCodeBlocMock.state.customeCodeInfo, fakeCustomerCode);
    //   expect(shipToCodeBlocMock.state.shipToInfo, fakeShipToCode);

    //   verify(() => materialListBlocMock.add(
    //         MaterialListEvent.fetch(
    //             user: fakeUser,
    //             salesOrganisation: fakeSaleOrg,
    //             configs: fakeSaleOrgConfig,
    //             customerCodeInfo: fakeCustomerCode,
    //             shipToInfo: fakeShipToCode),
    //       )).called(1);
    // });
  });
}
