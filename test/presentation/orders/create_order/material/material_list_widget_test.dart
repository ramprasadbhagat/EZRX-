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
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/add_to_cart/add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/application/order/scan_material_info/scan_material_info_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/favourites/entities/favourite_item.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/custom_selector.dart';
import 'package:ezrxmobile/presentation/orders/create_order/favorite_button.dart';
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

class TenderContractBlocMock
    extends MockBloc<TenderContractEvent, TenderContractState>
    implements TenderContractBloc {}

class AdditionalDetailsBlocMock
    extends MockBloc<AdditionalDetailsEvent, AdditionalDetailsState>
    implements AdditionalDetailsBloc {}

class ScanMaterialinfoBlocMock
    extends MockBloc<ScanMaterialInfoEvent, ScanMaterialInfoState>
    implements ScanMaterialInfoBloc {}

class AddToCartBlocMock extends MockBloc<AddToCartEvent, AddToCartState>
    implements AddToCartBloc {}

class AddToCartStub {
  void addToCart() {
    // Do nothing
  }
}

class MockAddToCartStub extends Mock implements AddToCartStub {}

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
  late AddToCartStub mockAddToCartStub;
  late TenderContractBloc mockTenderContractBloc;
  late AdditionalDetailsBloc mockAdditionalDetailsBloc;
  late ScanMaterialInfoBloc mockScanMaterialInfoBloc;
  late AddToCartBloc mockAddToCartBloc;

  final fakeMaterialNumber = MaterialNumber('000000000023168451');
  final fakeMaterialPrice = MaterialPrice(10.0);

  final fakeOrderDocumentTypeList = [
    OrderDocumentType.empty()
        .copyWith(documentType: DocumentType('ZPOR (ZPOR)')),
    OrderDocumentType.empty()
        .copyWith(documentType: DocumentType('ZPFB (ZPFB)')),
    OrderDocumentType.empty()
        .copyWith(documentType: DocumentType('ZPFC (ZPFC)')),
  ];

  final fakematerialInfo = MaterialInfo(
    quantity: 0,
    materialNumber: fakeMaterialNumber,
    materialDescription: "Reag Cup 15ml 1'S",
    governmentMaterialCode: '',
    therapeuticClass: 'All other non-therapeutic products',
    itemBrand: 'Item not listed in I',
    principalData: PrincipalData(
      principalName: PrincipalName('台灣羅氏醫療診斷設備(股)公司'),
      principalCode: PrincipalCode('0000102004'),
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
    isFOCMaterial: false,
    remarks: '',
  );
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
      mockAddToCartStub = MockAddToCartStub();
      autoRouterMock = locator<AppRouter>();
      eligibilityBlocMock = EligibilityBlocMock();
      mockTenderContractBloc = TenderContractBlocMock();
      mockAdditionalDetailsBloc = AdditionalDetailsBlocMock();
      mockScanMaterialInfoBloc = ScanMaterialinfoBlocMock();
      mockAddToCartBloc = AddToCartBlocMock();
      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => mockFavouriteBloc.state).thenReturn(FavouriteState.initial());
      when(() => materialPriceBlocMock.state)
          .thenReturn(MaterialPriceState.initial());
      when(() => cartBlocMock.state).thenReturn(CartState.initial());
      when(() => mockAddToCartBloc.state).thenReturn(AddToCartState.initial());
      when(() => mockMaterialFilterBloc.state).thenReturn(
        MaterialFilterState.initial().copyWith(
          selectedMaterialFilter:
              MaterialFilterState.initial().selectedMaterialFilter.copyWith(
            uniqueTherapeuticClass: [
              'GSK Consumer Healthcare',
              'All other non-therapeutic products',
            ],
          ),
        ),
      );
      when(() => materialListBlocMock.state)
          .thenReturn(MaterialListState.initial());
      when(() => orderDocumentTypeBlocMock.state)
          .thenReturn(OrderDocumentTypeState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
      when(() => shipToCodeBlocMock.state)
          .thenReturn(ShipToCodeState.initial());
      when(() => mockTenderContractBloc.state)
          .thenReturn(TenderContractState.initial());
      when(() => mockScanMaterialInfoBloc.state)
          .thenReturn(ScanMaterialInfoState.initial());
      when(() => mockAdditionalDetailsBloc.state)
          .thenReturn(AdditionalDetailsState.initial());
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
            BlocProvider<TenderContractBloc>(
                create: ((context) => mockTenderContractBloc)),
            BlocProvider<ScanMaterialInfoBloc>(
                create: ((context) => mockScanMaterialInfoBloc)),
            BlocProvider<AdditionalDetailsBloc>(
                create: ((context) => mockAdditionalDetailsBloc)),
            BlocProvider<AddToCartBloc>(
                create: ((context) => mockAddToCartBloc)),
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
      when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
              customerCodeInfo: CustomerCodeInfo.empty()
                  .copyWith(customerGrp4: CustomerGrp4('VR'))));
      whenListen(eligibilityBlocMock,
          Stream.fromIterable([eligibilityBlocMock.state]));
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
          .thenReturn(MaterialListState.initial().copyWith(isFetching: true));
      await tester.pumpWidget(getScopedWidget(const MaterialRoot()));
      whenListen(materialListBlocMock, Stream.fromIterable(expectedState));
      final loaderImage = find.byKey(const Key('loaderImage'));
      expect(loaderImage, findsOneWidget);
    });

    testWidgets('Material List Body Content IsNotEmpty', (tester) async {
      final expectedState = [
        MaterialListState.initial().copyWith(isFetching: true),
        MaterialListState.initial().copyWith(
          apiFailureOrSuccessOption: optionOf(const Right('success')),
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
              principalData: PrincipalData(
                principalName: PrincipalName('台灣羅氏醫療診斷設備(股)公司'),
                principalCode: PrincipalCode('0000102004'),
              ),
              taxClassification:
                  MaterialTaxClassification('Product : Full Tax'),
              itemRegistrationNumber: 'NA',
              unitOfMeasurement: 'EA',
              materialGroup2: MaterialGroup.two(''),
              materialGroup4: MaterialGroup.four('OTH'),
              isSampleMaterial: false,
              hidePrice: false,
              hasValidTenderContract: true,
              hasMandatoryTenderContract: false,
              taxes: ['5'],
              bundles: [],
              defaultMaterialDescription: '',
              isFOCMaterial: false,
              remarks: '',
            )
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
        await tester.pumpWidget(getScopedWidget(
          MaterialListPage(addToCart: () {}),
        ));

        await tester.pumpAndSettle(const Duration(seconds: 3));

        expect(find.byKey(const Key('materialSearchField')), findsOneWidget);
        final clearSearch = find.byKey(const Key('clearSearch'));
        expect(clearSearch, findsOneWidget);
        await tester.tap(clearSearch);
      },
    );
    testWidgets('Search input must be greater than 2 characters.',
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
      whenListen(
          orderDocumentTypeBlocMock,
          Stream.fromIterable([
            orderDocumentTypeBlocMock.state.copyWith(
              selectedReason:
                  OrderDocumentType.empty().copyWith(orderReason: 'testing'),
            )
          ]));

      await tester.pumpWidget(getScopedWidget(const Material(
          child: OrderTypeSelector(
        hideReasonField: true,
      ))));
      await tester.pump();
      await tester.pumpAndSettle(const Duration(seconds: 1));
      final orderTypeSelector = find.byKey(const Key('orderTypeSelector'));
      expect(orderTypeSelector, findsOneWidget);

      final isZPOR =
          orderDocumentTypeBlocMock.state.selectedOrderType.documentType.isZPOR;
      final isReasonFieldEnable =
          orderDocumentTypeBlocMock.state.isOrderTypeSelected &&
              !isZPOR &&
              orderDocumentTypeBlocMock.state.reasonList.isNotEmpty;
      expect(isReasonFieldEnable, false);
      final reasonField = find.byKey(const Key('reasonField'));
      expect(reasonField, findsNothing);
    });

    testWidgets(
        'Order Type Document type enable with selected order type as ZPFC',
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

      final displayReasonText =
          orderDocumentTypeBlocMock.state.selectedReason.displayReasonText;

      final displayItemText = orderDocumentTypeBlocMock.state.isReasonSelected
          ? displayReasonText
          : '';

      final displayItemTextWidget = find.text(displayItemText);
      expect(displayItemTextWidget, findsNothing);

      final documentType = find
          .byKey(Key(fakeOrderDocumentTypeList.last.documentType.getOrCrash()));
      expect(documentType, findsOneWidget);
      await tester.tap(documentType);
      await tester.pumpAndSettle(const Duration(seconds: 1));
    });

    testWidgets(
        'Order Type Document type enable with selected order type as ZPOR',
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

      final displayReasonText =
          orderDocumentTypeBlocMock.state.selectedReason.displayReasonText;

      final displayItemText = orderDocumentTypeBlocMock.state.isReasonSelected
          ? displayReasonText
          : '';

      final displayItemTextWidget = find.text(displayItemText);
      expect(displayItemTextWidget, findsNothing);

      final documentType = find.byKey(
          Key(fakeOrderDocumentTypeList.first.documentType.getOrCrash()));
      expect(documentType, findsOneWidget);
      await tester.tap(documentType);
      await tester.pumpAndSettle(const Duration(seconds: 1));
    });

    testWidgets(
        'Order Type Document type enable with selected order type as ZPFB',
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

      final displayReasonText =
          orderDocumentTypeBlocMock.state.selectedReason.displayReasonText;

      final displayItemText = orderDocumentTypeBlocMock.state.isReasonSelected
          ? displayReasonText
          : '';

      final displayItemTextWidget = find.text(displayItemText);
      expect(displayItemTextWidget, findsNothing);

      final documentType = find.byKey(Key(
          fakeOrderDocumentTypeList.elementAt(1).documentType.getOrCrash()));

      expect(documentType, findsOneWidget);
      await tester.tap(documentType);
      await tester.pumpAndSettle(const Duration(seconds: 1));
    });

    testWidgets('Change order type when already cart item added, success',
        (tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      final eligibilityState = eligibilityBlocMock.state.copyWith(
        salesOrganisation:
            SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601')),
        user: User.empty().copyWith(
            role: Role.empty().copyWith(type: RoleType('internal_sales_rep'))),
        salesOrgConfigs:
            SalesOrganisationConfigs.empty().copyWith(disableOrderType: false),
      );
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

      //add to cart
      when(() => cartBlocMock.state).thenReturn(
        cartBlocMock.state.copyWith(cartItems: [
          CartItem.material(
            PriceAggregate.empty().copyWith(
              materialInfo: fakematerialInfo,
            ),
          ),
        ]),
      );

      final orderDocumentTypedialog2 =
          find.byKey(const Key('orderDocumentTypedialog'));
      expect(orderDocumentTypedialog2, findsOneWidget);
      await tester.tap(orderDocumentTypedialog2);

      await tester.pumpAndSettle(const Duration(seconds: 2));

      final documentType2 = find
          .byKey(Key(fakeOrderDocumentTypeList.last.documentType.getOrCrash()));
      expect(documentType2, findsOneWidget);
      await tester.tap(documentType2);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // final changeAction = find.byKey(const Key('Change'));
      // expect(changeAction, findsOneWidget);
      // await tester.tap(changeAction);
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

      //add to cart
      when(() => cartBlocMock.state).thenReturn(
        cartBlocMock.state.copyWith(cartItems: [
          CartItem.material(
            PriceAggregate.empty().copyWith(
              materialInfo: fakematerialInfo,
            ),
          ),
        ]),
      );

      final orderDocumentTypedialog2 =
          find.byKey(const Key('orderDocumentTypedialog'));
      expect(orderDocumentTypedialog2, findsOneWidget);
      await tester.tap(orderDocumentTypedialog2);

      await tester.pumpAndSettle(const Duration(seconds: 2));

      final documentType2 = find
          .byKey(Key(fakeOrderDocumentTypeList.last.documentType.getOrCrash()));
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
            MaterialInfo.empty().copyWith(
                materialNumber: fakeMaterialNumber,
                materialDescription: fakematerialInfo.materialDescription)
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

      final priceAggregate = PriceAggregate.empty().copyWith(
        materialInfo: materialListBlocMock.state.materialList.first,
        salesOrgConfig: salesOrgBlocMock.state.configs.copyWith(
          enableTaxClassification: true,
          enableTaxDisplay: true,
          currency: Currency('vnd'),
        ),
      );
      final taxDetailsText = find.textContaining('Total Tax: ');
      final taxClassification = find.textContaining(
          MaterialTaxClassification('taxClassification').getOrCrash());
      if (priceAggregate.materialInfo.materialDescription.isNotEmpty) {
        final mat = find.textContaining(
            materialListBlocMock.state.materialList.first.materialDescription);
        expect(mat, findsOneWidget);
      }
      if (priceAggregate.taxDetails.isNotEmpty) {
        if (salesOrgBlocMock.state.configs.enableTaxDisplay) {
          expect(taxDetailsText, findsOneWidget);
        }
      }
      final listPrice = find.textContaining('List Price: '.tr());
      if (salesOrgBlocMock.state.configs.enableListPrice) {
        expect(listPrice, findsOneWidget);
      }
      final unitPrice = find.textContaining('Unit Price: '.tr());
      expect(unitPrice, findsOneWidget);

      final priceAggregatetest = PriceAggregate.empty().copyWith(
        materialInfo: materialListBlocMock.state.materialList.first,
        salesOrgConfig: salesOrgBlocMock.state.configs.copyWith(
          enableTaxClassification: true,
          enableTaxDisplay: true,
          currency: Currency(''),
        ),
      );
      if (priceAggregatetest.taxDetails.isNotEmpty) {
        if (salesOrgBlocMock.state.configs.enableTaxDisplay &&
            salesOrgBlocMock.state.configs.enableTaxClassification) {
          expect(taxClassification, findsOneWidget);
        }
      }
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

    testWidgets('Test loadingMore', (tester) async {
      when(() => materialListBlocMock.state).thenReturn(
        MaterialListState.initial().copyWith(
          nextPageIndex: 2,
          isFetching: true,
          materialList: [
            fakematerialInfo,
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168452'),
            ),
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168453'),
            ),
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168454'),
            ),
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168454'),
            ),
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168455'),
            ),
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168456'),
            ),
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168456'),
            ),
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168457'),
            ),
          ],
        ),
      );

      await tester
          .pumpWidget(getScopedWidget(MaterialListPage(addToCart: () {})));

      final thirdListItem = find.text('23168453');

      await tester.drag(
        thirdListItem,
        const Offset(0.0, -1000.0),
      );
      await tester.pump(const Duration(seconds: 2));

      final loadIndicatorWidget = find.byKey(const Key('loadIndicator'));

      expect(loadIndicatorWidget, findsOneWidget);

      await tester
          .pump(const Duration(seconds: 1)); // finish the scroll animation
      await tester.pump(
          const Duration(seconds: 1)); // finish the indicator settle animation
      await tester.pump(const Duration(seconds: 1));
    });

    testWidgets('Test onRefresh', (tester) async {
      when(() => materialListBlocMock.state).thenReturn(
        MaterialListState.initial().copyWith(
          nextPageIndex: 2,
          materialList: [
            fakematerialInfo,
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168452'),
            ),
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168453'),
            ),
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168454'),
            ),
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168454'),
            ),
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168455'),
            ),
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168456'),
            ),
          ],
        ),
      );

      final handle = tester.ensureSemantics();

      await tester
          .pumpWidget(getScopedWidget(MaterialListPage(addToCart: () {})));

      // debugDumpApp();

      await tester.drag(
        find.text('23168451'),
        const Offset(0.0, 1000.0),
      );
      await tester.pump(const Duration(seconds: 1));

      expect(
        tester.getSemantics(find.byType(RefreshProgressIndicator)),
        matchesSemantics(
          label: 'Refresh',
        ),
      );

      await tester
          .pump(const Duration(seconds: 1)); // finish the scroll animation
      await tester.pump(
          const Duration(seconds: 1)); // finish the indicator settle animation
      await tester.pump(
          const Duration(seconds: 1)); // finish the indicator hide animation

      handle.dispose();
    });

    testWidgets('Order Document type fetch success', (tester) async {
      when(() => materialListBlocMock.state)
          .thenReturn(MaterialListState.initial().copyWith(
        isFetching: true,
      ));

      final expectedState = [
        OrderDocumentTypeState.initial().copyWith(
          isSubmitting: true,
        ),
        OrderDocumentTypeState.initial().copyWith(
          isSubmitting: false,
        )
      ];

      when(() => orderDocumentTypeBlocMock.state)
          .thenReturn(OrderDocumentTypeState.initial());

      whenListen(orderDocumentTypeBlocMock, Stream.fromIterable(expectedState));

      await tester.pumpWidget(getScopedWidget(const MaterialRoot()));

      final loaderImage = find.byKey(const Key('loaderImage'));

      expect(loaderImage, findsOneWidget);
    });

    testWidgets('Order Document type fetch failed', (tester) async {
      final expectedState = [
        OrderDocumentTypeState.initial().copyWith(
          isSubmitting: true,
        ),
        OrderDocumentTypeState.initial().copyWith(
          isSubmitting: false,
          orderDocumentTypeListFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('mock_error'))),
        ),
      ];

      when(() => orderDocumentTypeBlocMock.state)
          .thenReturn(OrderDocumentTypeState.initial());

      whenListen(orderDocumentTypeBlocMock, Stream.fromIterable(expectedState));

      await tester.pumpWidget(getScopedWidget(const MaterialRoot()));

      const snackBarText = 'Unable to fetch Order Type';
      final snackBar = find.text(snackBarText);

      await tester.pump();
      expect(snackBar, findsOneWidget);
    });

    testWidgets('Material List Item tap when material price is null',
        (tester) async {
      when(() => materialListBlocMock.state).thenReturn(
        MaterialListState.initial().copyWith(
          nextPageIndex: 2,
          materialList: [
            fakematerialInfo,
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168452'),
            ),
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168453'),
            ),
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168454'),
            ),
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168454'),
            ),
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168455'),
            ),
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168456'),
            ),
          ],
        ),
      );

      when(() => materialPriceBlocMock.state).thenReturn(
        MaterialPriceState.initial().copyWith(
          isFetching: false,
          materialPrice: {},
        ),
      );

      await tester.pumpWidget(getScopedWidget(const MaterialRoot()));

      final firstListItem = find.text('23168451');

      await tester.tap(firstListItem);
      await tester.pump(const Duration(seconds: 1));

      const snackBarText = 'Product Not Available';
      final snackBar = find.text(snackBarText);

      await tester.pump(const Duration(seconds: 1));
      expect(snackBar, findsOneWidget);
    });

    testWidgets('Material List Item tap when material price is not null',
        (tester) async {
      when(() => materialListBlocMock.state).thenReturn(
        MaterialListState.initial().copyWith(
          nextPageIndex: 2,
          materialList: [
            fakematerialInfo,
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168452'),
            ),
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168453'),
            ),
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168454'),
            ),
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168454'),
            ),
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168455'),
            ),
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168456'),
            ),
          ],
        ),
      );

      when(() => materialPriceBlocMock.state).thenReturn(
        MaterialPriceState.initial().copyWith(
          isFetching: false,
          materialPrice: {
            fakematerialInfo.materialNumber: Price.empty().copyWith(
              materialNumber: fakematerialInfo.materialNumber,
              lastPrice: fakeMaterialPrice,
              finalPrice: fakeMaterialPrice,
            ),
          },
        ),
      );

      await tester.pumpWidget(
        getScopedWidget(
          MaterialListPage(addToCart: ({
            required BuildContext context,
            required PriceAggregate priceAggregate,
          }) {
            mockAddToCartStub.addToCart();
          }),
        ),
      );

      final firstListItem = find.text('23168451');

      await tester.tap(firstListItem);
      await tester.pump(const Duration(seconds: 1));

      verify(
        () => mockAddToCartStub.addToCart(),
      ).called(1);
    });

    testWidgets('Material List Item favorite button tap', (tester) async {
      when(() => materialListBlocMock.state).thenReturn(
        MaterialListState.initial().copyWith(
          nextPageIndex: 2,
          materialList: [
            fakematerialInfo,
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168452'),
            ),
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168453'),
            ),
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168454'),
            ),
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168454'),
            ),
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168455'),
            ),
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168456'),
            ),
          ],
        ),
      );

      await tester.pumpWidget(
        getScopedWidget(
          MaterialListPage(addToCart: (
              {required BuildContext context,
              required PriceAggregate priceAggregate}) {
            mockAddToCartStub.addToCart();
          }),
        ),
      );

      final favoriteButton = find.byType(FavoriteButton).first;

      await tester.tap(favoriteButton);
      await tester.pump(const Duration(seconds: 1));
    });

    testWidgets(
        'Material List Item favorite button tap when favourite item is not empty',
        (tester) async {
      when(() => materialListBlocMock.state).thenReturn(
        MaterialListState.initial().copyWith(
          nextPageIndex: 2,
          materialList: [
            fakematerialInfo,
          ],
        ),
      );

      whenListen(
          mockFavouriteBloc,
          Stream.fromIterable([
            FavouriteState.initial().copyWith(
              favouriteItems: [
                Favourite.empty().copyWith(materialNumber: fakeMaterialNumber),
              ],
            ),
          ]));

      await tester.pumpWidget(
        getScopedWidget(
          MaterialListPage(addToCart: (
              {required BuildContext context,
              required PriceAggregate priceAggregate}) {
            mockAddToCartStub.addToCart();
          }),
        ),
      );

      final favoriteButton = find.byType(FavoriteButton).first;

      await tester.tap(favoriteButton);
      await tester.pump(const Duration(seconds: 1));

      await tester.tap(find.byIcon(Icons.favorite));
      await tester.pump();
    });

    testWidgets('Test material List none condition', (tester) async {
      when(() => materialListBlocMock.state).thenReturn(
        MaterialListState.initial().copyWith(
          nextPageIndex: 2,
          apiFailureOrSuccessOption: optionOf(const Right('success')),
          materialList: [
            fakematerialInfo,
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168452'),
            ),
          ],
        ),
      );

      final expectedStatesSuccess = [
        MaterialListState.initial().copyWith(
          nextPageIndex: 2,
          apiFailureOrSuccessOption: none(),
          materialList: [
            fakematerialInfo,
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168452'),
            ),
          ],
        ),
      ];

      whenListen(
          materialListBlocMock, Stream.fromIterable(expectedStatesSuccess));
      await tester
          .pumpWidget(getScopedWidget(MaterialListPage(addToCart: () {})));
    });

    testWidgets('Test orderDocumentType List success', (tester) async {
      when(() => materialListBlocMock.state).thenReturn(
        MaterialListState.initial().copyWith(
          nextPageIndex: 2,
          materialList: [
            fakematerialInfo,
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168452'),
            ),
          ],
        ),
      );

      when(() => orderDocumentTypeBlocMock.state).thenReturn(
        OrderDocumentTypeState.initial().copyWith(
          isSubmitting: false,
          orderDocumentTypeList: fakeOrderDocumentTypeList,
        ),
      );

      final expectedStatesSuccess = [
        OrderDocumentTypeState.initial().copyWith(
          orderDocumentTypeListFailureOrSuccessOption:
              optionOf(Right(fakeOrderDocumentTypeList)),
          isSubmitting: true,
          orderDocumentTypeList: fakeOrderDocumentTypeList,
        ),
      ];

      whenListen(orderDocumentTypeBlocMock,
          Stream.fromIterable(expectedStatesSuccess));
      await tester
          .pumpWidget(getScopedWidget(MaterialListPage(addToCart: () {})));
    });

    testWidgets('Test EligibilityBloc OrderTypeEnable true', (tester) async {
      when(() => materialListBlocMock.state).thenReturn(
        MaterialListState.initial().copyWith(
          nextPageIndex: 2,
          materialList: [
            fakematerialInfo,
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168452'),
            ),
          ],
        ),
      );
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial().copyWith(
        salesOrganisation: SalesOrganisation.empty().copyWith(
          salesOrg: SalesOrg('2601'),
        ),
        user: User.empty().copyWith(
            role: Role.empty().copyWith(type: RoleType('internal_sales_rep'))),
        salesOrgConfigs:
            SalesOrganisationConfigs.empty().copyWith(disableOrderType: false),
      ));
      await tester
          .pumpWidget(getScopedWidget(MaterialListPage(addToCart: () {})));
    });
    testWidgets('Test hasValidTenderContract is true with empty price',
        (tester) async {
      when(() => materialListBlocMock.state).thenReturn(
        MaterialListState.initial().copyWith(
          nextPageIndex: 2,
          materialList: [
            fakematerialInfo.copyWith(
              hasValidTenderContract: true,
            ),
          ],
        ),
      );
      when(() => salesOrgBlocMock.state)
          .thenReturn(SalesOrgState.initial().copyWith(
              configs: SalesOrganisationConfigs.empty().copyWith(
        materialWithoutPrice: true,
      )));

      await tester.pumpWidget(
        getScopedWidget(
          MaterialListPage(addToCart: ({
            required BuildContext context,
            required PriceAggregate priceAggregate,
          }) {
            mockAddToCartStub.addToCart();
          }),
        ),
      );

      final listcontent = find.byKey(Key(
          'materialOption${materialListBlocMock.state.materialList.first.materialNumber.getOrCrash()}'));
      expect(listcontent, findsOneWidget);
      final firstListItem = find.text('23168451');
      await tester.tap(firstListItem);
      await tester.pump(const Duration(seconds: 1));

      verify(
        () => mockAddToCartStub.addToCart(),
      ).called(1);
    });

    testWidgets('Test enableDefaultMD true and enableIRN true enableGMC true',
        (tester) async {
      when(() => materialListBlocMock.state).thenReturn(
        MaterialListState.initial().copyWith(
          nextPageIndex: 2,
          materialList: [
            fakematerialInfo.copyWith(
              hasValidTenderContract: true,
              defaultMaterialDescription: 'test',
              itemRegistrationNumber: 'test',
              governmentMaterialCode: 'test',
            ),
          ],
        ),
      );

      when(() => salesOrgBlocMock.state).thenReturn(
        SalesOrgState.initial().copyWith(
          configs: SalesOrganisationConfigs.empty().copyWith(
            enableDefaultMD: true,
            enableIRN: true,
            enableGMC: true,
          ),
        ),
      );
      await tester
          .pumpWidget(getScopedWidget(MaterialListPage(addToCart: () {})));
      await tester.pump();
    });
    testWidgets('Test Show Material Price Label', (tester) async {
      when(() => materialListBlocMock.state).thenReturn(
        MaterialListState.initial().copyWith(
          nextPageIndex: 2,
          materialList: [
            fakematerialInfo,
          ],
        ),
      );
      when(() => materialPriceBlocMock.state).thenReturn(
        MaterialPriceState.initial().copyWith(
          isFetching: true,
          materialPrice: {},
        ),
      );
      final expectedState = [
        MaterialPriceState.initial().copyWith(
          isFetching: false,
          materialPrice: {
            fakematerialInfo.materialNumber: Price.empty().copyWith(
              materialNumber: fakematerialInfo.materialNumber,
              lastPrice: fakeMaterialPrice,
              finalPrice: fakeMaterialPrice,
            ),
          },
        ),
      ];

      when(() => salesOrgBlocMock.state).thenReturn(
        SalesOrgState.initial().copyWith(
          configs: SalesOrganisationConfigs.empty().copyWith(
            enableDefaultMD: true,
            enableIRN: true,
            enableGMC: true,
            enableVat: true,
            enableListPrice: true,
            currency: Currency('vnd'),
            enableTaxDisplay: true,
          ),
        ),
      );
      whenListen(materialPriceBlocMock, Stream.fromIterable(expectedState));

      await tester
          .pumpWidget(getScopedWidget(MaterialListPage(addToCart: () {})));
      await tester.pump();
    });

    testWidgets('Test SearchBar onFieldSumitted test', (tester) async {
      when(() => materialListBlocMock.state).thenReturn(
        MaterialListState.initial().copyWith(
          nextPageIndex: 2,
          searchKey: SearchKey('23168452'),
          materialList: [
            fakematerialInfo,
            fakematerialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168452'),
            ),
          ],
        ),
      );
      when(() => salesOrgBlocMock.state).thenReturn(
        SalesOrgState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('2601'),
          ),
        ),
      );
      whenListen(
          materialListBlocMock,
          Stream.fromIterable([
            MaterialListState.initial(),
            materialListBlocMock.state,
          ]));
      await tester
          .pumpWidget(getScopedWidget(MaterialListPage(addToCart: () {})));
      await tester.pump();

      final findTextField = find.byKey(const Key('materialSearchField'));
      await tester.enterText(findTextField, '23168452');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump(const Duration(seconds: 3));
      expect(find.text('23168452'), findsNWidgets(2));
    });

    testWidgets('Test MaterialFilters test', (tester) async {
      when(() => materialListBlocMock.state).thenReturn(
        MaterialListState.initial().copyWith(
          nextPageIndex: 2,
          searchKey: SearchKey('test'),
          materialList: [
            fakematerialInfo.copyWith(
              hasValidTenderContract: true,
              defaultMaterialDescription: 'test',
              itemRegistrationNumber: 'test',
              governmentMaterialCode: 'test',
            ),
          ],
        ),
      );
      await tester
          .pumpWidget(getScopedWidget(MaterialListPage(addToCart: () {})));

      final findPrincipal = find.text('Principal'.tr());
      expect(findPrincipal, findsOneWidget);
      final customSelectorPrincipal = find.ancestor(
          of: findPrincipal, matching: find.byType(CustomSelector));

      final findTherapeutic = find.text('Therapeutic'.tr());
      expect(findTherapeutic, findsOneWidget);
      final customSelectorTherapeutic = find.ancestor(
          of: findTherapeutic, matching: find.byType(CustomSelector));

      final findBrand = find.text('Brand'.tr());
      expect(findBrand, findsOneWidget);
      final customSelectorBrand =
          find.ancestor(of: findBrand, matching: find.byType(CustomSelector));

      await tester.tap(customSelectorPrincipal);
      await tester.tap(customSelectorTherapeutic);
      await tester.tap(customSelectorBrand);

      await tester.pump();
    });
  });
}
