import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/favourites/favourite_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/orders/create_order/material_list.dart';
import 'package:ezrxmobile/presentation/orders/create_order/material_root.dart';
import 'package:ezrxmobile/presentation/orders/create_order/order_type_selector.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/widget_utils.dart';

class SalesOrgMockBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CustomerCodeMockBloc
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class CartMockBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}

class ShipToCodeMockBloc extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class UserMockBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class MaterialMockBloc extends MockBloc<MaterialListEvent, MaterialListState>
    implements MaterialListBloc {}

class MockFavouriteBloc extends MockBloc<FavouriteEvent, FavouriteState>
    implements FavouriteBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

class MaterialPriceBlocMock
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class MockMaterialFilterBloc
    extends MockBloc<MaterialFilterEvent, MaterialFilterState>
    implements MaterialFilterBloc {}

class MaterialListBlocMock
    extends MockBloc<MaterialListEvent, MaterialListState>
    implements MaterialListBloc {}

class OrderDocumentTypeBlocMock
    extends MockBloc<OrderDocumentTypeEvent, OrderDocumentTypeState>
    implements OrderDocumentTypeBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MaterialListBloc materialListBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late ShipToCodeBloc shipToCodeBlocMock;
  late UserBloc userBlocMock;
  late AppRouter autoRouterMock;
  late MockFavouriteBloc mockFavouriteBloc;
  late MaterialPriceBloc materialPriceBlocMock;
  late CartBloc cartBlocMock;
  // late MaterialListBloc materialListBloc;
  late OrderDocumentTypeBloc orderDocumentTypeBlocMock;
  late EligibilityBlocMock eligibilityBlocMock;

  final fakeMaterialNumber = MaterialNumber('000000000023168451');
  final fakeMaterialPrice = MaterialPrice(10.0);

  final fakeOrderDocumentTypeList = [
    OrderDocumentType.empty().copyWith(documentType: 'ZPOR'),
    OrderDocumentType.empty().copyWith(documentType: 'ZPFB'),
    OrderDocumentType.empty().copyWith(documentType: 'ZPFC'),
  ];

  final fakematerialInfo = MaterialInfo(
      quantity: 0,
      materialNumber: fakeMaterialNumber,
      materialDescription: "Reag Cup 15ml 1'S",
      governmentMaterialCode: '',
      therapeuticClass: 'All other non-therapeutic products',
      itemBrand: 'Item not listed in I',
      principalData: const PrincipalData(
        principalName: '台灣羅氏醫療診斷設備(股)公司',
        principalCode: '0000102004',
      ),
      taxClassification: MaterialTaxClassification('Product : Full Tax'),
      itemRegistrationNumber: 'NA',
      unitOfMeasurement: 'EA',
      materialGroup2: MaterialGroup.two(''),
      materialGroup4: MaterialGroup.four('OTH'),
      isSampleMaterial: false,
      hidePrice: false,
      hasValidTenderContract: false,
      hasMandatoryTenderContract: false,
      taxes: ['5'],
      bundles: [],
      defaultMaterialDescription: '',
      isFOCMaterial: false);
  late MaterialFilterBloc mockMaterialFilterBloc;

  setUpAll(() async {
    setupLocator();
  });

  group('Material List Test', () {
    setUp(() {
      materialListBlocMock = MaterialMockBloc();
      salesOrgBlocMock = SalesOrgMockBloc();
      customerCodeBlocMock = CustomerCodeMockBloc();
      shipToCodeBlocMock = ShipToCodeMockBloc();
      userBlocMock = UserMockBloc();
      mockFavouriteBloc = MockFavouriteBloc();
      materialPriceBlocMock = MaterialPriceBlocMock();
      cartBlocMock = CartBlocMock();
      mockMaterialFilterBloc = MockMaterialFilterBloc();
      orderDocumentTypeBlocMock = OrderDocumentTypeBlocMock();
      autoRouterMock = locator<AppRouter>();
      eligibilityBlocMock = EligibilityBlocMock();
      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => mockFavouriteBloc.state).thenReturn(FavouriteState.initial());
      when(() => materialPriceBlocMock.state)
          .thenReturn(MaterialPriceState.initial());
      when(() => cartBlocMock.state).thenReturn(CartState.initial());
      when(() => mockMaterialFilterBloc.state)
          .thenReturn(MaterialFilterState.initial());
      when(() => materialListBlocMock.state)
          .thenReturn(MaterialListState.initial());
      when(() => orderDocumentTypeBlocMock.state)
          .thenReturn(OrderDocumentTypeState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
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
            BlocProvider<UserBloc>(create: ((context) => userBlocMock)),
            BlocProvider<SalesOrgBloc>(create: ((context) => salesOrgBlocMock)),
            BlocProvider<CustomerCodeBloc>(
                create: ((context) => customerCodeBlocMock)),
            BlocProvider<ShipToCodeBloc>(
                create: ((context) => shipToCodeBlocMock)),
            BlocProvider<MaterialListBloc>(
                create: ((context) => materialListBlocMock)),
            BlocProvider<FavouriteBloc>(
                create: ((context) => mockFavouriteBloc)),
            BlocProvider<MaterialPriceBloc>(
                create: ((context) => materialPriceBlocMock)),
            BlocProvider<CartBloc>(create: ((context) => cartBlocMock)),
            BlocProvider<MaterialFilterBloc>(
                create: ((context) => mockMaterialFilterBloc)),
            BlocProvider<MaterialListBloc>(
                create: ((context) => materialListBlocMock)),
            BlocProvider<OrderDocumentTypeBloc>(
                create: ((context) => orderDocumentTypeBlocMock)),
            BlocProvider<EligibilityBloc>(
                create: ((context) => eligibilityBlocMock)),
          ],
          child: child,
        ),
      );
    }

    testWidgets('Matrials List Page Initialized', (tester) async {
      when(() => materialListBlocMock.state)
          .thenReturn(MaterialListState.initial());
      await tester.pumpWidget(getScopedWidget(const MaterialRoot()));
      final materialsListPage = find.byKey(const Key('materialListPage'));
      final searchButton = find.byKey(const Key('CartButton'));
      expect(materialsListPage, findsOneWidget);
      expect(searchButton, findsOneWidget);
      await tester.tap(searchButton);
      await tester.pump();
    });

    testWidgets('Material List Failed To Load', (tester) async {
      final expectedState = [
        MaterialListState.initial().copyWith(
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Fake-error'))),
        )
      ];
      when(() => materialListBlocMock.state)
          .thenReturn(MaterialListState.initial());
      whenListen(materialListBlocMock, Stream.fromIterable(expectedState));
      await tester.pumpWidget(getScopedWidget(const MaterialRoot()));
    });

    testWidgets('Material List Body Content Empty', (tester) async {
      final expectedState = [
        MaterialListState.initial().copyWith(
          isFetching: true,
        ),
        MaterialListState.initial().copyWith(
          isFetching: true,
          apiFailureOrSuccessOption: none(),
          materialList: <MaterialInfo>[],
        )
      ];
      // optionOf(const Right(<MaterialInfo>[])),
      when(() => materialListBlocMock.state)
          .thenReturn(MaterialListState.initial());
      await tester.pumpWidget(getScopedWidget(const MaterialRoot()));
      whenListen(materialListBlocMock, Stream.fromIterable(expectedState));
      final loaderImage = find.byKey(const Key('loaderImage'));
      expect(loaderImage, findsOneWidget);
    });

    testWidgets('Material List Body Content IsNotEmpty', (tester) async {
      final expectedState = [
        MaterialListState.initial().copyWith(isFetching: true),
        MaterialListState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          isFetching: false,
          nextPageIndex: 2,
          materialList: <MaterialInfo>[
            MaterialInfo(
                quantity: 0,
                materialNumber: fakeMaterialNumber,
                materialDescription: "Reag Cup 15ml 1'S",
                governmentMaterialCode: '',
                therapeuticClass: 'All other non-therapeutic products',
                itemBrand: 'Item not listed in I',
                principalData: const PrincipalData(
                  principalName: '台灣羅氏醫療診斷設備(股)公司',
                  principalCode: '0000102004',
                ),
                taxClassification:
                    MaterialTaxClassification('Product : Full Tax'),
                itemRegistrationNumber: 'NA',
                unitOfMeasurement: 'EA',
                materialGroup2: MaterialGroup.two(''),
                materialGroup4: MaterialGroup.four('OTH'),
                isSampleMaterial: false,
                hidePrice: false,
                hasValidTenderContract: false,
                hasMandatoryTenderContract: false,
                taxes: ['5'],
                bundles: [],
                defaultMaterialDescription: '',
                isFOCMaterial: false)
          ],
        )
      ];
      when(() => materialListBlocMock.state)
          .thenReturn(MaterialListState.initial());
      whenListen(materialListBlocMock, Stream.fromIterable(expectedState));
      await tester.pumpWidget(getScopedWidget(const MaterialRoot()));
      await tester.pump();
      final materialList = find.byKey(const Key('scrollList'));
      expect(materialList, findsOneWidget);
      await tester.drag(materialList, const Offset(0.0, -300));
      await tester.pump();
      final listcontent = find.byKey(Key(
          'materialOption${materialListBlocMock.state.materialList.first.materialNumber.getOrCrash()}'));
      expect(listcontent, findsOneWidget);
    });

    testWidgets('Scroll List isEmpty', (tester) async {
      final expectedState = [
        MaterialListState.initial().copyWith(isFetching: true),
        MaterialListState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          isFetching: false,
          materialList: <MaterialInfo>[],
        )
      ];
      when(() => materialListBlocMock.state)
          .thenReturn(MaterialListState.initial());
      whenListen(materialListBlocMock, Stream.fromIterable(expectedState));
      await tester.pumpWidget(getScopedWidget(const MaterialRoot()));
      await tester.pump();
      final materialList = find.byKey(const Key('scrollList'));
      expect(materialList, findsOneWidget);
      final noRecordFound = find.text('No material found');
      expect(noRecordFound, findsOneWidget);
    });

    testWidgets(
      'Test material list search',
      (tester) async {
        final expectedCustomerCodeListStates = [
          MaterialListState.initial().copyWith(isFetching: true),
          MaterialListState.initial()
              .copyWith(isFetching: false, searchKey: SearchKey('')),
        ];

        whenListen(materialListBlocMock,
            Stream.fromIterable(expectedCustomerCodeListStates));
        await tester.pumpWidget(getScopedWidget(
          MaterialListPage(addToCart: () {}),
        ));
        await tester.pumpAndSettle(const Duration(seconds: 3));

        expect(find.byKey(const Key('materialSearchField')), findsOneWidget);
      },
    );
    testWidgets('Search input must be greater than 3 characters.',
        (WidgetTester tester) async {
      final expectedCustomerCodeListStates = [
        MaterialListState.initial().copyWith(isFetching: true),
        MaterialListState.initial()
            .copyWith(isFetching: false, searchKey: SearchKey('')),
      ];

      whenListen(materialListBlocMock,
          Stream.fromIterable(expectedCustomerCodeListStates));
      await tester.pumpWidget(getScopedWidget(
        MaterialListPage(addToCart: () {}),
      ));
      await tester.pumpAndSettle(const Duration(seconds: 3));

      final textField = find.byType(TextField);

      await tester.enterText(textField, '1234');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      expect(textField, findsOneWidget);
      expect(
          find.text('123'), findsNothing); // 3 characters shouldn't be allowed

      expect(find.text('1234'), findsOneWidget);
    });

    testWidgets('Order Type Document type disable',
        (WidgetTester tester) async {
      final isOrderTypeEnable = eligibilityBlocMock.state.isOrderTypeEnable;
      final orderDocumentTypedialog =
          find.byKey(const Key('orderDocumentTypedialog'));
      expect(isOrderTypeEnable, false);
      expect(orderDocumentTypedialog, findsNothing);
    });

    testWidgets('Order Type Document type enable', (tester) async {
      final eligibilityState = eligibilityBlocMock.state.copyWith(
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601')),
          user: User.empty().copyWith(
              role:
                  Role.empty().copyWith(type: RoleType('internal_sales_rep'))),
          salesOrgConfigs: SalesOrganisationConfigs.empty()
              .copyWith(disableOrderType: false));
      final isOrderTypeEnable = eligibilityState.isOrderTypeEnable;
      expect(isOrderTypeEnable, true);

      when(() => orderDocumentTypeBlocMock.state).thenReturn(
        OrderDocumentTypeState.initial().copyWith(
          isSubmitting: false,
          orderDocumentTypeList: fakeOrderDocumentTypeList,
        ),
      );

      await tester.pumpWidget(getScopedWidget(const Material(
          child: OrderTypeSelector(
        hideReasonField: true,
      ))));
      await tester.pump();
      await tester.pumpAndSettle(const Duration(seconds: 1));
      final orderTypeSelector = find.byKey(const Key('orderTypeSelector'));
      expect(orderTypeSelector, findsOneWidget);
    });

    testWidgets('Order Type Document type enable with selected order type',
        (tester) async {
      final eligibilityState = eligibilityBlocMock.state.copyWith(
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601')),
          user: User.empty().copyWith(
              role:
                  Role.empty().copyWith(type: RoleType('internal_sales_rep'))),
          salesOrgConfigs: SalesOrganisationConfigs.empty()
              .copyWith(disableOrderType: false));
      final isOrderTypeEnable = eligibilityState.isOrderTypeEnable;
      expect(isOrderTypeEnable, true);

      when(() => orderDocumentTypeBlocMock.state).thenReturn(
        OrderDocumentTypeState.initial().copyWith(
          isSubmitting: false,
          orderDocumentTypeList: fakeOrderDocumentTypeList,
        ),
      );

      await tester.pumpWidget(getScopedWidget(const Material(
          child: OrderTypeSelector(
        hideReasonField: true,
      ))));
      await tester.pump();
      await tester.pumpAndSettle(const Duration(seconds: 1));
      final orderTypeSelector = find.byKey(const Key('orderTypeSelector'));
      expect(orderTypeSelector, findsOneWidget);

      final orderDocumentTypedialog =
          find.byKey(const Key('orderDocumentTypedialog'));
      expect(orderDocumentTypedialog, findsOneWidget);
      await tester.tap(orderDocumentTypedialog);

      await tester.pumpAndSettle(const Duration(seconds: 1));

      final documentType =
          find.byKey(Key(fakeOrderDocumentTypeList.last.documentType));
      expect(documentType, findsOneWidget);
      await tester.tap(documentType);
      await tester.pumpAndSettle(const Duration(seconds: 1));
    });

    testWidgets('Change order type when already cart item added, success',
        (tester) async {
      final eligibilityState = eligibilityBlocMock.state.copyWith(
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601')),
          user: User.empty().copyWith(
              role:
                  Role.empty().copyWith(type: RoleType('internal_sales_rep'))),
          salesOrgConfigs: SalesOrganisationConfigs.empty()
              .copyWith(disableOrderType: false));
      final isOrderTypeEnable = eligibilityState.isOrderTypeEnable;
      expect(isOrderTypeEnable, true);

      when(() => orderDocumentTypeBlocMock.state).thenReturn(
        OrderDocumentTypeState.initial().copyWith(
          isSubmitting: false,
          orderDocumentTypeList: fakeOrderDocumentTypeList,
        ),
      );

      await tester.pumpWidget(getScopedWidget(const Material(
          child: OrderTypeSelector(
        hideReasonField: true,
      ))));
      await tester.pump();
      await tester.pumpAndSettle(const Duration(seconds: 1));
      final orderTypeSelector = find.byKey(const Key('orderTypeSelector'));
      expect(orderTypeSelector, findsOneWidget);

      final orderDocumentTypedialog =
          find.byKey(const Key('orderDocumentTypedialog'));
      expect(orderDocumentTypedialog, findsOneWidget);
      await tester.tap(orderDocumentTypedialog);

      await tester.pumpAndSettle(const Duration(seconds: 1));

      final documentType =
          find.byKey(Key(fakeOrderDocumentTypeList.last.documentType));
      expect(documentType, findsOneWidget);
      await tester.tap(documentType);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      //add to cart
      when(() => cartBlocMock.state).thenReturn(
        cartBlocMock.state.copyWith(cartItemList: [
          PriceAggregate.empty().copyWith(
            materialInfo: fakematerialInfo,
          ),
        ]),
      );

      final orderDocumentTypedialog2 =
          find.byKey(const Key('orderDocumentTypedialog'));
      expect(orderDocumentTypedialog2, findsOneWidget);
      await tester.tap(orderDocumentTypedialog2);

      await tester.pumpAndSettle(const Duration(seconds: 2));

      final documentType2 =
          find.byKey(Key(fakeOrderDocumentTypeList.last.documentType));
      expect(documentType2, findsOneWidget);
      await tester.tap(documentType2);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      final changeAction = find.byKey(const Key('Change'));
      expect(changeAction, findsOneWidget);
      await tester.tap(changeAction);
      await tester.pumpAndSettle(const Duration(seconds: 1));
    });

    testWidgets('Change order type when already cart item added, fails',
        (tester) async {
      final eligibilityState = eligibilityBlocMock.state.copyWith(
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601')),
          user: User.empty().copyWith(
              role:
                  Role.empty().copyWith(type: RoleType('internal_sales_rep'))),
          salesOrgConfigs: SalesOrganisationConfigs.empty()
              .copyWith(disableOrderType: false));
      final isOrderTypeEnable = eligibilityState.isOrderTypeEnable;
      expect(isOrderTypeEnable, true);

      when(() => orderDocumentTypeBlocMock.state).thenReturn(
        OrderDocumentTypeState.initial().copyWith(
          isSubmitting: false,
          orderDocumentTypeList: fakeOrderDocumentTypeList,
        ),
      );

      await tester.pumpWidget(getScopedWidget(const Material(
          child: OrderTypeSelector(
        hideReasonField: true,
      ))));
      await tester.pump();
      await tester.pumpAndSettle(const Duration(seconds: 3));
      final orderTypeSelector = find.byKey(const Key('orderTypeSelector'));
      expect(orderTypeSelector, findsOneWidget);

      final orderDocumentTypedialog =
          find.byKey(const Key('orderDocumentTypedialog'));
      expect(orderDocumentTypedialog, findsOneWidget);
      await tester.tap(orderDocumentTypedialog);

      await tester.pumpAndSettle(const Duration(seconds: 2));

      final documentType =
          find.byKey(Key(fakeOrderDocumentTypeList.last.documentType));
      expect(documentType, findsOneWidget);
      await tester.tap(documentType);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      //add to cart
      when(() => cartBlocMock.state).thenReturn(
        cartBlocMock.state.copyWith(cartItemList: [
          PriceAggregate.empty().copyWith(
            materialInfo: fakematerialInfo,
          ),
        ]),
      );

      final orderDocumentTypedialog2 =
          find.byKey(const Key('orderDocumentTypedialog'));
      expect(orderDocumentTypedialog2, findsOneWidget);
      await tester.tap(orderDocumentTypedialog2);

      await tester.pumpAndSettle(const Duration(seconds: 2));

      final documentType2 =
          find.byKey(Key(fakeOrderDocumentTypeList.last.documentType));
      expect(documentType2, findsOneWidget);
      await tester.tap(documentType2);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      final cancelAction = find.byKey(const Key('Cancel'));
      expect(cancelAction, findsOneWidget);
      await tester.tap(cancelAction);
      await tester.pumpAndSettle(const Duration(seconds: 1));
    });

    // TODO: need Wasim help
    // testWidgets('Clear material list Search', (tester) async {
    //   final expectedMaterialListStates = [
    //     MaterialListState.initial().copyWith(
    //       isFetching: false,
    //       materialList: [],
    //     ),
    //   ];

    //   whenListen(
    //       customerCodeBlocMock, Stream.fromIterable(expectedMaterialListStates),
    //       initialState: materialListBlocMock.state.copyWith(
    //           isFetching: true,
    //           canLoadMore: true,
    //           materialList: [MaterialInfo.empty()]));

    //   await tester.runAsync(() async {
    //     await tester.pumpWidget(getScopedWidget(
    //       MaterialListPage(addToCart: () {}),
    //     ));
    //   });

    //   await tester.pump();
    //   final clearMaterialListSearch =
    //       find.byKey(const Key('clearMaterialListSearch'));
    //   expect(clearMaterialListSearch, findsOneWidget);
    // });

    // testWidgets('Start to fetch price', (tester) async {
    //   final fakeMaterial = MaterialInfo.empty().copyWith(
    //     materialNumber: MaterialNumber('fake-number'),
    //   );
    //   final fakeCustomerCodeInfo =
    //       CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: 'fake-code');
    //   final fakeSalesOrg = SalesOrganisation.empty().copyWith(
    //     salesOrg: SalesOrg('fake-name'),
    //   );
    //   final expectedState = [
    //     MaterialListState.initial().copyWith(
    //       nextPageIndex: 2,
    //       materialList: [fakeMaterial],
    //     )
    //   ];
    //   when(() => materialListBlocMock.state).thenReturn(
    //     MaterialListState.initial(),
    //   );
    //   whenListen(
    //     materialListBlocMock,
    //     Stream.fromIterable(expectedState),
    //   );
    //   when(() => customerCodeBlocMock.state).thenReturn(
    //     CustomerCodeState.initial().copyWith(
    //       customeCodeInfo: fakeCustomerCodeInfo,
    //     ),
    //   );
    //   when(() => salesOrgBlocMock.state).thenReturn(
    //     SalesOrgState.initial().copyWith(
    //       salesOrganisation: fakeSalesOrg,
    //     ),
    //   );
    //   await tester.pumpWidget(
    //     getScopedWidget(
    //       const MaterialListPage(),
    //     ),
    //   );
    //   await tester.pump();

    //   expect(customerCodeBlocMock.state.customeCodeInfo, fakeCustomerCodeInfo);
    //   expect(salesOrgBlocMock.state.salesOrganisation, fakeSalesOrg);

    //   verify(() => materialPriceBlocMock.add(MaterialPriceEvent.fetch(
    //       customerCode: fakeCustomerCodeInfo,
    //       salesOrganisation: fakeSalesOrg,
    //       materialNumbers: [MaterialNumber('fake-number')]))).called(1);
    // });

    // testWidgets('Material List show price properly', (tester) async {
    //   final expectedState = [
    //     MaterialListState.initial().copyWith(isFetching: true),
    //     MaterialListState.initial().copyWith(
    //       apiFailureOrSuccessOption: none(),
    //       isFetching: false,
    //       nextPageIndex: 2,
    //       materialList: <MaterialInfo>[
    //         MaterialInfo.empty().copyWith(materialNumber: fakeMaterialNumber)
    //       ],
    //     )
    //   ];
    //   when(() => materialListBlocMock.state)
    //       .thenReturn(MaterialListState.initial());
    //   whenListen(materialListBlocMock, Stream.fromIterable(expectedState));
    //   when(() => materialPriceBlocMock.state).thenReturn(
    //     MaterialPriceState.initial().copyWith(
    //       isFetching: false,
    //       materialPrice: {
    //         fakeMaterialNumber: Price.empty().copyWith(
    //           finalPrice: MaterialPrice(10),
    //         )
    //       },
    //     ),
    //   );
    //   await tester.pumpWidget(getScopedWidget(const MaterialListPage()));
    //   await tester.pump();
    //   final materialList = find.byKey(const Key('scrollList'));
    //   expect(materialList, findsOneWidget);
    //   await tester.drag(materialList, const Offset(0.0, -300));
    //   await tester.pump();
    //   final listContent = find.byKey(Key(
    //       'materialOption${materialListBlocMock.state.materialList.first.materialNumber.getOrCrash()}'));
    //   expect(listContent, findsOneWidget);
    //   await tester.pump();
    //   final price = find.text('${'Unit Price: '.tr()}\$10');
    //   expect(price, findsOneWidget);
    // });

    // testWidgets('Material List show loading price', (tester) async {
    //   final expectedState = [
    //     MaterialListState.initial().copyWith(isFetching: true),
    //     MaterialListState.initial().copyWith(
    //       apiFailureOrSuccessOption: none(),
    //       isFetching: false,
    //       nextPageIndex: 2,
    //       materialList: <MaterialInfo>[
    //         MaterialInfo.empty().copyWith(materialNumber: fakeMaterialNumber)
    //       ],
    //     )
    //   ];
    //   when(() => materialListBlocMock.state)
    //       .thenReturn(MaterialListState.initial());
    //   whenListen(materialListBlocMock, Stream.fromIterable(expectedState));
    //   when(() => materialPriceBlocMock.state).thenReturn(
    //     MaterialPriceState.initial().copyWith(
    //       isFetching: true,
    //     ),
    //   );
    //   await tester.pumpWidget(getScopedWidget(const MaterialListPage()));
    //   await tester.pump();
    //   final materialList = find.byKey(const Key('scrollList'));
    //   expect(materialList, findsOneWidget);
    //   await tester.drag(materialList, const Offset(0.0, -300));
    //   await tester.pump();
    //   final listContent = find.byKey(Key(
    //       'materialOption${materialListBlocMock.state.materialList.first.materialNumber.getOrCrash()}'));
    //   expect(listContent, findsOneWidget);
    //   await tester.pump();
    //   final loadingIndicator = find.byKey(const Key('price-loading'));
    //   expect(loadingIndicator, findsOneWidget);

    //   await tester.fling(listContent, const Offset(0, 300), 600);
    //   await tester.pump(const Duration(seconds: 1));
    //   await tester.pump(const Duration(seconds: 1));
    //   verify(() =>
    //           materialPriceBlocMock.add(const MaterialPriceEvent.initialized()))
    //       .called(1);
    // });

    //Test for Pricing
    testWidgets('show list price and unit price', (tester) async {
      final expectedState = [
        MaterialListState.initial().copyWith(isFetching: true),
        MaterialListState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          isFetching: false,
          nextPageIndex: 2,
          materialList: <MaterialInfo>[
            MaterialInfo.empty().copyWith(materialNumber: fakeMaterialNumber)
          ],
        )
      ];
      when(() => materialListBlocMock.state)
          .thenReturn(MaterialListState.initial());
      whenListen(materialListBlocMock, Stream.fromIterable(expectedState));
      when(() => materialPriceBlocMock.state).thenReturn(
        MaterialPriceState.initial().copyWith(
          isFetching: false,
          materialPrice: {
            fakeMaterialNumber: Price.empty().copyWith(
              finalPrice: fakeMaterialPrice,
            )
          },
        ),
      );
      await tester
          .pumpWidget(getScopedWidget(MaterialListPage(addToCart: () {})));
      await tester.pump();
      final materialList = find.byKey(const Key('scrollList'));
      expect(materialList, findsOneWidget);
      await tester.drag(materialList, const Offset(0.0, -300));
      await tester.pump();
      final listContent = find.byKey(Key(
          'materialOption${materialListBlocMock.state.materialList.first.materialNumber.getOrCrash()}'));
      expect(listContent, findsOneWidget);
      final listPrice = find.textContaining('List Price: '.tr());
      if (salesOrgBlocMock.state.configs.enableListPrice) {
        expect(listPrice, findsOneWidget);
      }
      final unitPrice = find.textContaining('Unit Price: '.tr());
      expect(unitPrice, findsOneWidget);
    });

    testWidgets('zmg discount lable', (tester) async {
      final expectedState = [
        MaterialListState.initial().copyWith(isFetching: true),
        MaterialListState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          isFetching: false,
          nextPageIndex: 2,
          materialList: <MaterialInfo>[
            MaterialInfo.empty().copyWith(materialNumber: fakeMaterialNumber)
          ],
        )
      ];
      whenListen(materialListBlocMock, Stream.fromIterable(expectedState));
      when(() => materialPriceBlocMock.state).thenReturn(
        MaterialPriceState.initial().copyWith(
          isFetching: false,
          materialPrice: {
            fakeMaterialNumber: Price.empty().copyWith(
              zmgDiscount: true,
              tiers: [
                PriceTier.empty().copyWith(items: [PriceTierItem.empty()])
              ],
            )
          },
        ),
      );
      await tester
          .pumpWidget(getScopedWidget(MaterialListPage(addToCart: () {})));
      await tester.pump();
      final listContent = find.byKey(Key(
          'materialOption${materialListBlocMock.state.materialList.first.materialNumber.getOrCrash()}'));
      expect(listContent, findsOneWidget);
      final zmgDiscountLable = find.byKey(const Key('zmgDiscountLable'));
      expect(zmgDiscountLable, findsOneWidget);
    });

    testWidgets('test Bonus Logo', (tester) async {
      final expectedState = [
        MaterialListState.initial().copyWith(isFetching: true),
        MaterialListState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          isFetching: false,
          nextPageIndex: 2,
          materialList: <MaterialInfo>[
            MaterialInfo.empty().copyWith(materialNumber: fakeMaterialNumber)
          ],
        )
      ];
      whenListen(materialListBlocMock, Stream.fromIterable(expectedState));
      when(() => materialPriceBlocMock.state).thenReturn(
        MaterialPriceState.initial().copyWith(
          isFetching: false,
          materialPrice: {
            fakeMaterialNumber: Price.empty().copyWith(
              zmgDiscount: true,
              tiers: [
                PriceTier.empty().copyWith(items: [PriceTierItem.empty()])
              ],
              bonuses: [
                PriceBonus.empty().copyWith(
                  items: [
                    PriceBonusItem.empty(),
                  ],
                ),
              ],
            )
          },
        ),
      );
      await tester
          .pumpWidget(getScopedWidget(MaterialListPage(addToCart: () {})));
      await tester.pump();
      final listContent = find.byKey(Key(
          'materialOption${materialListBlocMock.state.materialList.first.materialNumber.getOrCrash()}'));
      expect(listContent, findsOneWidget);
      final zmgDiscountLable = find.byKey(const Key('bonusLogo'));
      expect(zmgDiscountLable, findsOneWidget);
    });

    testWidgets('test TieredPricing Logo', (tester) async {
      final expectedState = [
        MaterialListState.initial().copyWith(isFetching: true),
        MaterialListState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          isFetching: false,
          nextPageIndex: 2,
          materialList: <MaterialInfo>[
            MaterialInfo.empty().copyWith(materialNumber: fakeMaterialNumber)
          ],
        )
      ];
      whenListen(materialListBlocMock, Stream.fromIterable(expectedState));
      when(() => materialPriceBlocMock.state).thenReturn(
        MaterialPriceState.initial().copyWith(
          isFetching: false,
          materialPrice: {
            fakeMaterialNumber: Price.empty().copyWith(
              zmgDiscount: true,
              tiers: [
                PriceTier.empty().copyWith(
                  items: [
                    PriceTierItem.empty(),
                  ],
                ),
              ],
            )
          },
        ),
      );
      await tester
          .pumpWidget(getScopedWidget(MaterialListPage(addToCart: () {})));
      await tester.pump();
      final listContent = find.byKey(Key(
          'materialOption${materialListBlocMock.state.materialList.first.materialNumber.getOrCrash()}'));
      expect(listContent, findsOneWidget);
      final zmgDiscountLable = find.byKey(const Key('tieredPricingLogo'));
      expect(zmgDiscountLable, findsOneWidget);
    });
  });
}
