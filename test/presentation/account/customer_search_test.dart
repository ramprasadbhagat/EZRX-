import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_local.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/account/customer_search.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import '../../utils/widget_utils.dart';
import '../order_history/order_history_details_widget_test.dart';

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

enum SalesOrgVariant { onn, off }

enum CustomerCodeVariant { onn, off }

final salesOrgVariants = ValueVariant({...SalesOrgVariant.values});

final customerCodeVariants = ValueVariant({...CustomerCodeVariant.values});

class MockAppRouter extends Mock implements AppRouter {}

class MaterialPageXMock extends Mock implements MaterialPageX {}

final locator = GetIt.instance;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late UserBloc userBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late AppRouter autoRouterMock;
  late List<CustomerCodeInfo> customerCodeListMock;
  late CartBloc cartBlocMock;
  //final fakeMaterialNumber = MaterialNumber('000000000023168451');
  // final fakeMaterialInfo = MaterialInfo(
  //   quantity: 0,
  //   ean: '2234567890',
  //   materialNumber: fakeMaterialNumber,
  //   materialDescription: "Reag Cup 15ml 1'S",
  //   governmentMaterialCode: '',
  //   therapeuticClass: 'All other non-therapeutic products',
  //   itemBrand: 'Item not listed in I',
  //   principalData: PrincipalData(
  //     principalName: PrincipalName('台灣羅氏醫療診斷設備(股)公司'),
  //     principalCode: PrincipalCode('0000102004'),
  //   ),
  //   taxClassification: MaterialTaxClassification('Product : Full Tax'),
  //   itemRegistrationNumber: 'NA',
  //   unitOfMeasurement: 'EA',
  //   materialGroup2: MaterialGroup.two(''),
  //   materialGroup4: MaterialGroup.four('OTH'),
  //   isSampleMaterial: false,
  //   hidePrice: false,
  //   hasValidTenderContract: false,
  //   hasMandatoryTenderContract: false,
  //   taxes: ['5'],
  //   bundles: [],
  //   defaultMaterialDescription: '',
  //   isFOCMaterial: false,
  //   remarks: '',
  //   genericMaterialName: '',
  // );
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  setUpAll(() {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => MixpanelService());
    locator<MixpanelService>().init(mixpanel: MixpanelMock());
    locator.registerLazySingleton(() => AppRouter());
  });

  group('Customer Search Screen', () {
    setUp(() async {
      userBlocMock = UserBlocMock();
      salesOrgBlocMock = SalesOrgBlocMock();
      customerCodeBlocMock = CustomerCodeBlocMock();
      cartBlocMock = CartBlocMock();
      authBlocMock = AuthBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      autoRouterMock = locator<AppRouter>();
      customerCodeListMock =
          await CustomerCodeLocalDataSource().getCustomerCodeList();
      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => cartBlocMock.state).thenReturn(CartState.initial());
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
    });
    tearDownAll(() {
      locator.unregister<AppRouter>();
    });

    RouteDataScope getScopedWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<UserBloc>(create: (context) => userBlocMock),
          BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBlocMock),
          BlocProvider<CustomerCodeBloc>(
              create: (context) => customerCodeBlocMock),
          BlocProvider<CartBloc>(create: (context) => cartBlocMock),
          BlocProvider<AuthBloc>(create: (context) => authBlocMock),
          BlocProvider<AnnouncementBloc>(
              create: (context) => announcementBlocMock),
        ],
        child: const CustomerSearchPage(),
      );
    }

    testWidgets('Load customer Search Widget', (tester) async {
      whenListen(
          customerCodeBlocMock,
          Stream.fromIterable(
            [
              CustomerCodeState.initial().copyWith(
                searchKey: SearchKey(''),
                isSearchActive: false,
                isFetching: false,
                customerCodeInfo: CustomerCodeInfo.empty()
                    .copyWith(customerCodeSoldTo: '123456'),
                apiFailureOrSuccessOption: none(),
                customerCodeList: [
                  CustomerCodeInfo.empty(),
                ],
              ),
              CustomerCodeState.initial().copyWith(
                searchKey: SearchKey('GSK'),
                isSearchActive: true,
                isFetching: true,
                customerCodeInfo: CustomerCodeInfo.empty()
                    .copyWith(customerCodeSoldTo: 'fake-123456'),
                apiFailureOrSuccessOption: none(),
                customerCodeList: [
                  CustomerCodeInfo.empty(),
                ],
              ),
            ],
          ));
          when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial().copyWith(
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('2501')
            )
          ));
      await tester.pumpWidget(getScopedWidget());
      final customerSearchPage = find.byKey(const Key('customerSearchPage'));
      expect(customerSearchPage, findsOneWidget);
    });

    // testWidgets(
    //   'Test Customer Code Selector tile and search',
    //   (tester) async {
    //     final expectedCustomerCodeListStates = [
    //       CustomerCodeState.initial().copyWith(isFetching: true),
    //       CustomerCodeState.initial().copyWith(
    //         isFetching: false,
    //         customerCodeInfo: CustomerCodeInfo.empty()
    //             .copyWith(customerCodeSoldTo: 'fake-123456'),
    //         customerCodeList: [
    //           CustomerCodeInfo.empty(),
    //         ],
    //       ),
    //     ];

    //     whenListen(customerCodeBlocMock,
    //         Stream.fromIterable(expectedCustomerCodeListStates));
    //     await tester.pumpWidget(getScopedWidget());
    //     await tester.pumpAndSettle(const Duration(seconds: 3));

    //     expect(find.byKey(const Key('customerCodeSelect')), findsOneWidget);
    //     expect(find.text('Please select a customer code'.tr()), findsOneWidget);

    //     if (salesOrgVariants.currentValue == SalesOrgVariant.onn) {
    //       final customerCodeOption =
    //           find.byKey(const Key('customerCodeOptionfake-123456'));
    //       expect(customerCodeOption, findsOneWidget);
    //       await tester.tap(customerCodeOption);
    //       await tester.pump();
    //     }
    //   },
    //   variant: customerCodeVariants,
    // );
    // testWidgets('Please enter at least 2 characters.', (tester) async {
    //   await tester.pumpWidget(getScopedWidget());
    //   await tester.pumpAndSettle(const Duration(seconds: 3));

    //   final txtForm = find.byKey(const Key('customerCodeSearchField'));
    //   await tester.enterText(txtForm, '12');
    //   expect(find.text('12'), findsOneWidget);
    // });

    testWidgets('Test have customer code list and emit load more state include',
        (tester) async {
      final expectedCustomerCodeListStates = [
        CustomerCodeState.initial().copyWith(
          isFetching: true,
        ),
      ];

      whenListen(customerCodeBlocMock,
          Stream.fromIterable(expectedCustomerCodeListStates),
          initialState: customerCodeBlocMock.state.copyWith(
            isFetching: false,
            canLoadMore: true,
            customerCodeInfo: customerCodeListMock.first,
            customerCodeList: customerCodeListMock,
          ));
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial().copyWith(
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('2501')
            )
          ));    

      await tester.runAsync(() async {
        await tester.pumpWidget(getScopedWidget());
      });

      await tester.pump();

      final noCustomerFound = find.text('No Customer Code Found');
      final loadIndicator = find.byKey(WidgetKeys.loaderImage);

      final gesture = await tester
          .startGesture(const Offset(50, 100)); //Position of the scrollview
      await gesture.moveBy(const Offset(50, -2000)); //How much to scroll by
      await tester.pump(const Duration(seconds: 5));

      await tester.pump();
      expect(loadIndicator, findsOneWidget);
      expect(noCustomerFound, findsNothing);
    });

    testWidgets(
        'Test have customer code list and emit load more state include and found no data',
        (tester) async {
      final expectedCustomerCodeListStates = [
        CustomerCodeState.initial().copyWith(
          isFetching: false,
          customerCodeList: [],
        ),
      ];

      whenListen(customerCodeBlocMock,
          Stream.fromIterable(expectedCustomerCodeListStates),
          initialState: customerCodeBlocMock.state.copyWith(
            isFetching: true,
            canLoadMore: true,
            customerCodeInfo: customerCodeListMock.first,
            customerCodeList: customerCodeListMock,
          ));
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial().copyWith(
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('2501')
            )
          ));    

      await tester.runAsync(() async {
        await tester.pumpWidget(getScopedWidget());
      });

      await tester.pump();

      final noCustomerFound = find.text('That didn’t match anything');
      final loadIndicator = find.byKey(const Key('loadIndicator'));

      final gesture = await tester
          .startGesture(const Offset(50, 100)); //Position of the scrollview
      await gesture.moveBy(const Offset(50, -2000)); //How much to scroll by
      await tester.pump(const Duration(seconds: 5));

      await tester.pump();
      expect(loadIndicator, findsNothing);
      expect(noCustomerFound, findsOneWidget);
    });

    // testWidgets('Clear Customer code Search', (tester) async {
    //   when(() => customerCodeBlocMock.state).thenReturn(
    //     CustomerCodeState.initial().copyWith(
    //       searchKey: SearchKey('GSK'),
    //       isSearchActive: true,
    //       isFetching: false,
    //       customerCodeInfo: CustomerCodeInfo.empty()
    //           .copyWith(customerCodeSoldTo: 'fake-123456'),
    //       customerCodeList: [
    //         CustomerCodeInfo.empty(),
    //       ],
    //     ),
    //   );
    //   await tester.runAsync(() async {
    //     await tester.pumpWidget(getScopedWidget());
    //   });

    //   final clearCusromerCodeSearch =
    //       find.byKey(const Key('clearCustomerCodeSearch'));
    //   expect(clearCusromerCodeSearch, findsOneWidget);
    //   await tester.tap(clearCusromerCodeSearch);
    // });

    // testWidgets('Test onRefresh', (tester) async {
    //   when(() => customerCodeBlocMock.state).thenReturn(
    //     CustomerCodeState.initial().copyWith(customerCodeList: [
    //       CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '1000'),
    //       CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '1100'),
    //       CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '1200'),
    //     ]),
    //   );

    //   final handle = tester.ensureSemantics();

    //   await tester.pumpWidget(getScopedWidget());

    //   await tester.drag(
    //     find.text('1000'),
    //     const Offset(0.0, 1000.0),
    //   );
    //   await tester.pump(const Duration(seconds: 1));

    //   expect(
    //     tester.getSemantics(find.byType(RefreshProgressIndicator)),
    //     matchesSemantics(
    //       label: 'Refresh',
    //     ),
    //   );

    //   await tester
    //       .pump(const Duration(seconds: 1)); // finish the scroll animation
    //   await tester.pump(
    //       const Duration(seconds: 1)); // finish the indicator settle animation
    //   await tester.pump(
    //       const Duration(seconds: 1)); // finish the indicator hide animation

    //   handle.dispose();
    // });
    // testWidgets('Test loadingMore', (tester) async {
    //   when(() => customerCodeBlocMock.state).thenReturn(
    //     CustomerCodeState.initial().copyWith(
    //       customerCodeList: [
    //         fakeCustomerCodeInfo,
    //         CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '0000100728'),
    //         CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '0000100729'),
    //         CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '0000100731'),
    //         CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '0000100732'),
    //         CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '0000100733'),
    //         CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '0000100734'),
    //         CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '0000100738'),
    //         CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '0000100739'),
    //         CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '0000100741'),
    //         CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '0000100742'),
    //         CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '0000100743'),
    //         CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '0000100744'),
    //         CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '0000100748'),
    //         CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '0000100749'),
    //         CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '0000100751'),
    //         CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '0000100752'),
    //         CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '0000100753'),
    //         CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '0000100754')
    //       ],
    //       isFetching: true,
    //     ),
    //   );

    //   await tester.pumpWidget(getScopedWidget());

    //   final firstListItem = find.text('0000100730');

    //   await tester.drag(
    //     firstListItem,
    //     const Offset(0.0, -1000.0),
    //   );
    //   await tester.pump(const Duration(seconds: 1));

    //   final loadIndicatorWidget = find.byKey(const Key('loadIndicator'));

    //   expect(loadIndicatorWidget, findsOneWidget);
    //   await tester.pump(const Duration(seconds: 1));
    //   await tester.pump(const Duration(seconds: 1));
    //   await tester.pump(const Duration(seconds: 1));
    // });

    // testWidgets('Field Submitted Customer code Search', (tester) async {
    //   final expectedCustomerCodeListStates = [
    //     CustomerCodeState.initial().copyWith(
    //         isFetching: false,
    //         customerCodeList: [],
    //         apiFailureOrSuccessOption: none(),
    //         searchKey: SearchKey('')),
    //     CustomerCodeState.initial().copyWith(
    //       isFetching: false,
    //       customerCodeList: [],
    //       searchKey: SearchKey('GSK'),
    //       apiFailureOrSuccessOption: optionOf(
    //         const Left(
    //           ApiFailure.other('fake-error'),
    //         ),
    //       ),
    //     ),
    //   ];

    //   whenListen(customerCodeBlocMock,
    //       Stream.fromIterable(expectedCustomerCodeListStates),
    //       initialState: customerCodeBlocMock.state.copyWith(
    //         isFetching: true,
    //         canLoadMore: true,
    //         customerCodeInfo: customerCodeListMock.first,
    //         customerCodeList: customerCodeListMock,
    //       ));

    //   await tester.runAsync(() async {
    //     await tester.pumpWidget(getScopedWidget());
    //   });

    //   await tester.pump();
    //   await tester.enterText(
    //       find.byKey(const Key('customerCodeSearchField')), 'GSK');
    //   await tester.testTextInput.receiveAction(TextInputAction.done);
    //   await tester.pump();
    //   expect(find.text('123'), findsNothing);
    //   expect(find.text('GSK'), findsOneWidget);
    // });

    // testWidgets('Search', (tester) async {
    //   when(() => customerCodeBlocMock.state).thenReturn(CustomerCodeState.initial().copyWith(
    //       isFetching: false,
    //       customerCodeList: [],
    //       apiFailureOrSuccessOption: none(),
    //       searchKey: SearchKey('')),);

    //   await tester.runAsync(() async {
    //     await tester.pumpWidget(getScopedWidget());
    //   });

    //   await tester.pump();
    //   await tester.enterText(
    //       find.byKey(const Key('customerCodeSearchField')), 'GSK');
    //   await tester.testTextInput.receiveAction(TextInputAction.done);
    //   verify(
    //         () => customerCodeBlocMock.add(
    //       CustomerCodeEvent.autoSearch(
    //         userInfo: User.empty(),
    //         selectedSalesOrg: SalesOrganisation.empty(),
    //         hidecustomer: false,
    //         searchValue: 'GSK',
    //       ),
    //     ),
    //   ).called(1);
    // });

    // testWidgets('Auto Search', (tester) async {
    //   when(() => customerCodeBlocMock.state).thenReturn(CustomerCodeState.initial().copyWith(
    //       isFetching: false,
    //       customerCodeList: [],
    //       apiFailureOrSuccessOption: none(),
    //       searchKey: SearchKey('')),);

    //   await tester.runAsync(() async {
    //     await tester.pumpWidget(getScopedWidget());
    //   });

    //   await tester.pump();
    //   await tester.enterText(
    //       find.byKey(const Key('customerCodeSearchField')), 'GSK');
    //   await tester.pump(const Duration(milliseconds: 3000));
    //   verify(
    //         () => customerCodeBlocMock.add(
    //           CustomerCodeEvent.autoSearch(
    //             userInfo: User.empty(),
    //             selectedSalesOrg: SalesOrganisation.empty(),
    //             hidecustomer: false,
    //             searchValue: 'GSK',
    //           ),
    //     ),
    //   ).called(1);
    // });

    // testWidgets('Test error Message to Customer code Search', (tester) async {
    //   final expectedCustomerCodeListStates = [
    //     CustomerCodeState.initial().copyWith(
    //         isFetching: false,
    //         customerCodeList: [],
    //         apiFailureOrSuccessOption: none(),
    //         searchKey: SearchKey('')),
    //     CustomerCodeState.initial().copyWith(
    //       isFetching: false,
    //       customerCodeList: [],
    //       searchKey: SearchKey('12'),
    //       apiFailureOrSuccessOption: optionOf(
    //         const Left(
    //           ApiFailure.other('fake-error'),
    //         ),
    //       ),
    //     ),
    //   ];

    //   whenListen(customerCodeBlocMock,
    //       Stream.fromIterable(expectedCustomerCodeListStates),
    //       initialState: customerCodeBlocMock.state.copyWith(
    //         isFetching: true,
    //         canLoadMore: true,
    //         customerCodeInfo: customerCodeListMock.first,
    //         customerCodeList: customerCodeListMock,
    //       ));

    //   await tester.runAsync(() async {
    //     await tester.pumpWidget(getScopedWidget());
    //   });

    //   await tester.pump();
    //   await tester.enterText(
    //       find.byKey(const Key('customerCodeSearchField')), '12');
    //   await tester.testTextInput.receiveAction(TextInputAction.done);
    //   await tester.pump();
    //   final errorMessage = find.byKey(const Key('snackBarMessage'));
    //   await tester.pump();
    //   expect(errorMessage, findsOneWidget);
    // });
  });

  group('Customer Code Change with Item on cart', () {
    setUpAll(() {
      locator.registerLazySingleton(() => MockAppRouter());
    });
    setUp(() async {
      userBlocMock = UserBlocMock();
      salesOrgBlocMock = SalesOrgBlocMock();
      customerCodeBlocMock = CustomerCodeBlocMock();
      cartBlocMock = CartBlocMock();
      authBlocMock = AuthBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      autoRouterMock = locator<MockAppRouter>();
      customerCodeListMock =
          await CustomerCodeLocalDataSource().getCustomerCodeList();
      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => cartBlocMock.state).thenReturn(CartState.initial());
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
      when(() => autoRouterMock.currentPath).thenReturn('fake-path');
      when(() => autoRouterMock.stack).thenReturn([MaterialPageXMock()]);
      when(() => autoRouterMock.pop()).thenAnswer((invocation) async => true);
    });

    RouteDataScope getScopedWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<UserBloc>(create: (context) => userBlocMock),
          BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBlocMock),
          BlocProvider<CustomerCodeBloc>(
              create: (context) => customerCodeBlocMock),
          BlocProvider<CartBloc>(create: (context) => cartBlocMock),
          BlocProvider<AuthBloc>(create: (context) => authBlocMock),
          BlocProvider<AnnouncementBloc>(
              create: (context) => announcementBlocMock),
        ],
        child: const CustomerSearchPage(),
      );
    }

    // testWidgets(
    //   'Test when cart item is not empty',
    //   (tester) async {
    //     when(() => cartBlocMock.state)
    //         .thenReturn(CartState.initial().copyWith(cartItems: [
    //       CartItem.material(
    //         PriceAggregate.empty().copyWith(
    //           materialInfo: fakeMaterialInfo,
    //         ),
    //       ),
    //     ]));

    //     when(() => customerCodeBlocMock.state).thenReturn(
    //       CustomerCodeState.initial().copyWith(customerCodeList: [
    //         CustomerCodeInfo.empty().copyWith(
    //           telephoneNumber: PhoneNumber('1234567890'),
    //           customerCodeSoldTo: '123456789',
    //           shipToInfos: <ShipToInfo>[
    //             ShipToInfo.empty().copyWith(
    //               shipToCustomerCode: '12345678',
    //             ),
    //           ],
    //           paymentTermDescription: '30 days',
    //         ),
    //       ]),
    //     );

    //     await tester.pumpWidget(getScopedWidget());
    //     await tester.pump();
    //     final customerCodeSelect = find.byKey(const Key('customerCodeSelect'));
    //     expect(customerCodeSelect, findsOneWidget);
    //     await tester.pump(const Duration(seconds: 1));
    //     expect(find.byType(ListTile), findsWidgets);
    //     await tester.tap(
    //       find.byType(ListTile).first,
    //     );
    //     await tester.pump(const Duration(seconds: 1));
    //     expect(find.text('Change Customer Code'), findsOneWidget);
    //     await tester.tap(find.text('Cancel'));
    //     await tester.pumpAndSettle(const Duration(seconds: 3));
    //     await tester.tap(find.text('Change'));
    //     await tester.pumpAndSettle(const Duration(seconds: 3));
    //   },
    // );
    testWidgets(
      'Test when cartList is empty',
      (tester) async {
        when(() => cartBlocMock.state).thenReturn(CartState.initial());

        when(() => customerCodeBlocMock.state).thenReturn(
          CustomerCodeState.initial().copyWith(customerCodeList: [
            CustomerCodeInfo.empty().copyWith(
              telephoneNumber: PhoneNumber('1234567890'),
              customerCodeSoldTo: '123456789',
              shipToInfos: <ShipToInfo>[
                ShipToInfo.empty().copyWith(
                  shipToCustomerCode: '12345678',
                ),
              ],
              paymentTermDescription: '30 days',
            ),
          ]),
        );
        when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial().copyWith(
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('2501')
            )
          ));

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final customerCodeSelect = find.byKey(const Key('customerCodeSelect'));
        expect(customerCodeSelect, findsOneWidget);
        await tester.pump(const Duration(seconds: 1));
        expect(find.byType(ListTile), findsWidgets);
        await tester.tap(
          find.byType(ListTile).first,
        );
        await tester.pump(const Duration(seconds: 1));
        expect(find.text('Change Customer Code'), findsNothing);
      },
    );
  });
}
