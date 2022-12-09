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
import 'package:ezrxmobile/application/order/covid_material_list/covid_material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/orders/create_order/covid_material_list.dart';
import 'package:ezrxmobile/presentation/orders/create_order/material_root.dart';
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

class CovidMaterialListBlocMock
    extends MockBloc<CovidMaterialListEvent, CovidMaterialListState>
    implements CovidMaterialListBloc {}

class OrderDocumentTypeBlocMock
    extends MockBloc<OrderDocumentTypeEvent, OrderDocumentTypeState>
    implements OrderDocumentTypeBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

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
  late CovidMaterialListBloc covidMaterialListBlocMock;
  final fakeMaterialNumber = MaterialNumber('000000000023168451');
  final fakeMaterialPrice = MaterialPrice(10.0);
  late MaterialFilterBloc mockMaterialFilterBloc;
  late OrderDocumentTypeBloc orderDocumentTypeBlocMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late AddToCartStub mockAddToCartStub;

  final fakeMaterialInfo = MaterialInfo(
    materialNumber: fakeMaterialNumber,
    materialDescription: "Reag Cup 15ml 1'S",
    governmentMaterialCode: '',
    therapeuticClass: 'All other non-therapeutic products',
    itemBrand: 'Item not listed in I',
    principalData: PrincipalData(
      principalName: '台灣羅氏醫療診斷設備(股)公司',
      principalCode: PrincipleCode('0000102004'),
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
    quantity: 0,
    remarks: '',
  );

  setUpAll(() async {
    setupLocator();
  });

  group('Covid Material List Test', () {
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
      autoRouterMock = locator<AppRouter>();
      covidMaterialListBlocMock = CovidMaterialListBlocMock();
      orderDocumentTypeBlocMock = OrderDocumentTypeBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      mockAddToCartStub = MockAddToCartStub();
      when(() => userBlocMock.state).thenReturn(UserState.initial().copyWith(
          user: User.empty().copyWith(
        role: Role(
          description: '',
          name: '',
          id: '',
          type: RoleType('client'),
        ),
      )));
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial()
          .copyWith(
              salesOrganisation: SalesOrganisation.empty()
                  .copyWith(salesOrg: SalesOrg('SG'))));
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => shipToCodeBlocMock.state)
          .thenReturn(ShipToCodeState.initial());
      when(() => mockFavouriteBloc.state).thenReturn(FavouriteState.initial());
      when(() => materialPriceBlocMock.state)
          .thenReturn(MaterialPriceState.initial());
      when(() => cartBlocMock.state).thenReturn(CartState.initial());
      when(() => mockMaterialFilterBloc.state)
          .thenReturn(MaterialFilterState.initial());
      when(() => customerCodeBlocMock.state).thenReturn(
          CustomerCodeState.initial().copyWith(
              customerCodeInfo: CustomerCodeInfo.empty().copyWith(
                  customerAttr7: CustomerAttr7('ZEV'),
                  customerGrp4: CustomerGrp4('VR'))));
      when(() => materialListBlocMock.state)
          .thenReturn(MaterialListState.initial());
      when(() => covidMaterialListBlocMock.state)
          .thenReturn(CovidMaterialListState.initial());
      when(() => orderDocumentTypeBlocMock.state)
          .thenReturn(OrderDocumentTypeState.initial());
      when(() => shipToCodeBlocMock.state)
          .thenReturn(ShipToCodeState.initial());
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
            user: User.empty().copyWith(
              role: Role(
                description: '',
                name: '',
                id: '',
                type: RoleType('client'),
              ),
            ),
            salesOrganisation:
                SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('SG')),
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
                customerAttr7: CustomerAttr7('ZEV'),
                customerGrp4: CustomerGrp4('VR'))),
      );
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
            BlocProvider<CovidMaterialListBloc>(
                create: ((context) => covidMaterialListBlocMock)),
            BlocProvider<OrderDocumentTypeBloc>(
                create: ((context) => orderDocumentTypeBlocMock)),
            BlocProvider<EligibilityBloc>(
                create: ((context) => eligibilityBlocMock)),
          ],
          child: child,
        ),
      );
    }

    testWidgets('Page Initialized', (tester) async {
      await tester.pumpWidget(getScopedWidget(const MaterialRoot()));
      final covidTabTitle = find.text('COVID-19');
      expect(covidTabTitle, findsOneWidget);
      await tester.tap(covidTabTitle);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      final laoder = find.byKey(const Key('loaderImage'));
      final covidMaterialsListPage =
          find.byKey(const Key('covidmaterialListPage'));
      final searchField = find.byKey(const Key('materialSearchField'));
      final cartButton = find.byKey(const Key('CartButton'));
      expect(laoder, findsOneWidget);
      expect(covidMaterialsListPage, findsOneWidget);
      expect(cartButton, findsOneWidget);
      expect(searchField, findsOneWidget);
    });

    testWidgets('Search input cannot be less than 3 characters.',
        (tester) async {
      await tester.pumpWidget(getScopedWidget(const MaterialRoot()));
      final covidTabTitle = find.text('COVID-19');
      expect(covidTabTitle, findsOneWidget);
      await tester.tap(covidTabTitle);
      await tester.pump(const Duration(seconds: 4));
      final txtForm = find.byType(TextFormField);
      await tester.enterText(txtForm, '99');
      expect(find.text('999'), findsNothing);
    });

    testWidgets('Covid Material List Failed To Load', (tester) async {
      when(() => covidMaterialListBlocMock.state).thenReturn(
          CovidMaterialListState.initial().copyWith(
              isFetching: false,
              apiFailureOrSuccessOption:
                  optionOf(const Left(ApiFailure.other('Fake-error')))));
      await tester.pumpWidget(getScopedWidget(const MaterialRoot()));

      await tester.tap(find.text('COVID-19'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      final covidMaterialsListPage =
          find.byKey(const Key('covidmaterialListPage'));
      expect(covidMaterialsListPage, findsOneWidget);

      expect(find.text('There are no vaccine in this customer code'.tr()),
          findsOneWidget);
    });

    testWidgets('Covid Material List Body Content Empty', (tester) async {
      when(() => covidMaterialListBlocMock.state).thenReturn(
          CovidMaterialListState.initial()
              .copyWith(isFetching: false, apiFailureOrSuccessOption: none()));
      await tester.pumpWidget(getScopedWidget(const MaterialRoot()));

      await tester.tap(find.text('COVID-19'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      final covidMaterialsListPage =
          find.byKey(const Key('covidmaterialListPage'));
      expect(covidMaterialsListPage, findsOneWidget);

      expect(find.text('There are no vaccine in this customer code'.tr()),
          findsOneWidget);
    });

    testWidgets('Covid Material List Body Content IsNotEmpty', (tester) async {
      when(() => covidMaterialListBlocMock.state)
          .thenReturn(CovidMaterialListState.initial().copyWith(
        apiFailureOrSuccessOption: none(),
        isFetching: false,
        nextPageIndex: 2,
        materialList: <MaterialInfo>[
          fakeMaterialInfo,
        ],
      ));
      await tester.pumpWidget(getScopedWidget(const MaterialRoot()));
      await tester.tap(find.text('COVID-19'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      final covidMaterialsListPage =
          find.byKey(const Key('covidmaterialListPage'));
      expect(covidMaterialsListPage, findsOneWidget);
      await tester.pump();
      final materialList = find.byKey(const Key('scrollList'));
      expect(materialList, findsOneWidget);
      final listcontent = find.byKey(Key(
          'covidMaterialOption${covidMaterialListBlocMock.state.materialList.first.materialNumber.getOrCrash()}'));
      await tester.pump();
      expect(listcontent, findsOneWidget);
    });

    testWidgets('Scroll List isEmpty', (tester) async {
      when(() => covidMaterialListBlocMock.state)
          .thenReturn(CovidMaterialListState.initial().copyWith(
        apiFailureOrSuccessOption: none(),
        isFetching: false,
        materialList: <MaterialInfo>[],
      ));
      await tester.pumpWidget(getScopedWidget(const MaterialRoot()));
      await tester.tap(find.text('COVID-19'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      final covidMaterialsListPage =
          find.byKey(const Key('covidmaterialListPage'));
      expect(covidMaterialsListPage, findsOneWidget);
      final covidMaterialList = find.byKey(const Key('scrollList'));
      expect(covidMaterialList, findsOneWidget);
      final noRecordFound =
          find.text('There are no vaccine in this customer code'.tr());
      expect(noRecordFound, findsOneWidget);
    });

    testWidgets('Covid Material List Body Content widget check',
        (tester) async {
      when(() => materialPriceBlocMock.state)
          .thenReturn(MaterialPriceState.initial().copyWith(
        materialPrice: {
          fakeMaterialNumber: Price.empty().copyWith(
            materialNumber: fakeMaterialNumber,
          )
        },
      ));
      when(() => covidMaterialListBlocMock.state)
          .thenReturn(CovidMaterialListState.initial().copyWith(
        apiFailureOrSuccessOption: none(),
        isFetching: false,
        nextPageIndex: 2,
        materialList: <MaterialInfo>[
          MaterialInfo(
            materialNumber: fakeMaterialNumber,
            materialDescription: "Reag Cup 15ml 1'S",
            governmentMaterialCode: '',
            therapeuticClass: 'All other non-therapeutic products',
            itemBrand: 'Item not listed in I',
            principalData: PrincipalData(
              principalName: '台灣羅氏醫療診斷設備(股)公司',
              principalCode: PrincipleCode('0000102004'),
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
            quantity: 0,
            remarks: '',
          )
        ],
      ));

      await tester.pumpWidget(getScopedWidget(const MaterialRoot()));
      await tester.tap(find.text('COVID-19'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      final covidMaterialsListPage =
          find.byKey(const Key('covidmaterialListPage'));
      expect(covidMaterialsListPage, findsOneWidget);
      await tester.pump();
      final materialList = find.byKey(const Key('scrollList'));
      expect(materialList, findsOneWidget);
      final listcontent = find.byKey(Key(
          'covidMaterialOption${covidMaterialListBlocMock.state.materialList.first.materialNumber.getOrCrash()}'));
      expect(listcontent, findsOneWidget);
      await tester.pump();
      expect(
          find.text(covidMaterialListBlocMock
              .state.materialList.first.materialNumber.displayMatNo),
          findsOneWidget);
      expect(
          find.text(covidMaterialListBlocMock
              .state.materialList.first.materialDescription),
          findsOneWidget);
      expect(
          find.text(covidMaterialListBlocMock
              .state.materialList.first.principalData.principalName),
          findsOneWidget);
      expect(
          find.textContaining(covidMaterialListBlocMock
              .state.materialList.first.principalData.principalName),
          findsOneWidget);

      if (salesOrgBlocMock.state.configs.enableListPrice) {
        expect(find.textContaining('List Price:'), findsOneWidget);
      }
      expect(find.textContaining('Unit Price:'), findsOneWidget);
    });

    testWidgets('Test loadingMore', (tester) async {
      when(() => covidMaterialListBlocMock.state).thenReturn(
        CovidMaterialListState.initial().copyWith(
          nextPageIndex: 2,
          materialList: [
            fakeMaterialInfo,
            fakeMaterialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168452'),
            ),
            fakeMaterialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168453'),
            ),
            fakeMaterialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168454'),
            ),
            fakeMaterialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168454'),
            ),
            fakeMaterialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168455'),
            ),
            fakeMaterialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168456'),
            ),
          ],
        ),
      );

      await tester
          .pumpWidget(getScopedWidget(CovidMaterialListPage(addToCart: () {})));

      final firstListItem = find.text('23168451');

      await tester.drag(
        firstListItem,
        const Offset(0.0, -1000.0),
      );
      await tester.pump(const Duration(seconds: 1));

      final loadIndicatorWidget = find.byKey(const Key('loadIndicator'));

      expect(loadIndicatorWidget, findsOneWidget);

      await tester
          .pump(const Duration(seconds: 1)); // finish the scroll animation
      await tester.pump(
          const Duration(seconds: 1)); // finish the indicator settle animation
      await tester.pump(const Duration(seconds: 1));
    });

    testWidgets('Test onRefresh', (tester) async {
      when(() => covidMaterialListBlocMock.state).thenReturn(
        CovidMaterialListState.initial().copyWith(
          nextPageIndex: 2,
          materialList: [
            fakeMaterialInfo,
            fakeMaterialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168452'),
            ),
            fakeMaterialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168453'),
            ),
            fakeMaterialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168454'),
            ),
            fakeMaterialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168454'),
            ),
            fakeMaterialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168455'),
            ),
            fakeMaterialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168456'),
            ),
          ],
        ),
      );

      final handle = tester.ensureSemantics();

      await tester
          .pumpWidget(getScopedWidget(CovidMaterialListPage(addToCart: () {})));

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

    testWidgets('Covid Material List Item tap when material price is null',
        (tester) async {
      when(() => covidMaterialListBlocMock.state).thenReturn(
        CovidMaterialListState.initial().copyWith(
          nextPageIndex: 2,
          materialList: [
            fakeMaterialInfo,
            fakeMaterialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168452'),
            ),
            fakeMaterialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168453'),
            ),
            fakeMaterialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168454'),
            ),
            fakeMaterialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168454'),
            ),
            fakeMaterialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168455'),
            ),
            fakeMaterialInfo.copyWith(
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

      await tester
          .pumpWidget(getScopedWidget(CovidMaterialListPage(addToCart: () {})));

      final firstListItem = find.text('23168451');

      await tester.tap(firstListItem);
      await tester.pump(const Duration(seconds: 1));

      const snackBarText = 'Product Not Available';
      final snackBar = find.text(snackBarText);

      await tester.pump(const Duration(seconds: 1));
      expect(snackBar, findsOneWidget);
    });

    testWidgets('Covid Material List Item tap when material price is not null',
        (tester) async {
      when(() => covidMaterialListBlocMock.state).thenReturn(
        CovidMaterialListState.initial().copyWith(
          nextPageIndex: 2,
          materialList: [
            fakeMaterialInfo,
            fakeMaterialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168452'),
            ),
            fakeMaterialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168453'),
            ),
            fakeMaterialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168454'),
            ),
            fakeMaterialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168454'),
            ),
            fakeMaterialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168455'),
            ),
            fakeMaterialInfo.copyWith(
              materialNumber: MaterialNumber('000000000023168456'),
            ),
          ],
        ),
      );

      when(() => materialPriceBlocMock.state).thenReturn(
        MaterialPriceState.initial().copyWith(
          isFetching: false,
          materialPrice: {
            fakeMaterialInfo.materialNumber: Price.empty().copyWith(
              materialNumber: fakeMaterialInfo.materialNumber,
              lastPrice: fakeMaterialPrice,
              finalPrice: fakeMaterialPrice,
            ),
          },
        ),
      );

      await tester.pumpWidget(
        getScopedWidget(
          CovidMaterialListPage(addToCart: ({
            required BuildContext context,
            required PriceAggregate priceAggregate,
            required bool isCovid19Tab,
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
  });
}
