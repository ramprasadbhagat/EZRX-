import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/covid_material_list/covid_material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_list/order_history_list_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/presentation/home/home_tab.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MaterialListBlocMock
    extends MockBloc<MaterialListEvent, MaterialListState>
    implements MaterialListBloc {}

class MaterialPriceBlocMock
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

class SavedOrderBlocMock
    extends MockBloc<SavedOrderListEvent, SavedOrderListState>
    implements SavedOrderListBloc {}

class OrderHistoryListBlocMock
    extends MockBloc<OrderHistoryListEvent, OrderHistoryListState>
    implements OrderHistoryListBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class CovidMaterialListBlocMock
    extends MockBloc<CovidMaterialListEvent, CovidMaterialListState>
    implements CovidMaterialListBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class BannerBlocMock extends MockBloc<BannerEvent, BannerState>
    implements BannerBloc {}

class ShipToCodeBlocMock extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class MockHTTPService extends Mock implements HttpService {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late CustomerCodeBlocMock mockCustomerCodeBloc;
  late SalesOrgBlocMock salesOrgBlocMock;
  late MaterialListBlocMock materialListBlocMock;
  late MaterialPriceBlocMock materialPriceBlocMock;
  late CovidMaterialListBlocMock covidMaterialListBlocMock;
  late CartBlocMock cartBlocMock;
  late BannerBlocMock mockBannerBloc;
  late ShipToCodeBlocMock shipToCodeBlocMock;
  late AuthBlocMock authBlocMock;
  late UserBlocMock userBlocMock;
  late HttpService mockHTTPService;
  final fakeMaterialNumber = MaterialNumber('000000000023168451');
  final fakematerialInfo1 = MaterialInfo(
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
      isFOCMaterial: false,
      remarks: '');
  final fakeCustomerCodeInfo = CustomerCodeInfo.empty().copyWith(
    customerCodeSoldTo: 'fake-1234',
  );
  final fakeSalesOrganisation =
      SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601'));

  group('Home banner test', () {
    setUpAll(() {
      locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
      locator.registerLazySingleton(() => AppRouter());
      locator.registerLazySingleton(() => mockBannerBloc);
      locator.registerLazySingleton(() => CountlyService(config: locator<Config>()));
      mockHTTPService = MockHTTPService();
      locator.registerLazySingleton<HttpService>(
        () => mockHTTPService,
      );
    });
    group('Home Tab Screen', () {
      setUp(() {
        mockCustomerCodeBloc = CustomerCodeBlocMock();
        salesOrgBlocMock = SalesOrgBlocMock();
        materialListBlocMock = MaterialListBlocMock();
        materialPriceBlocMock = MaterialPriceBlocMock();
        covidMaterialListBlocMock = CovidMaterialListBlocMock();
        mockBannerBloc = BannerBlocMock();
        shipToCodeBlocMock = ShipToCodeBlocMock();
        authBlocMock = AuthBlocMock();
        userBlocMock = UserBlocMock();
        cartBlocMock = CartBlocMock();
        mockHTTPService = MockHTTPService();

        when(() => mockCustomerCodeBloc.state).thenReturn(
            CustomerCodeState.initial()
                .copyWith(customerCodeInfo: fakeCustomerCodeInfo));
        when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial()
            .copyWith(salesOrganisation: fakeSalesOrganisation));
        when(() => materialListBlocMock.state).thenReturn(
            MaterialListState.initial()
                .copyWith(materialList: [fakematerialInfo1]));
        when(() => materialPriceBlocMock.state)
            .thenReturn(MaterialPriceState.initial());
        when(() => covidMaterialListBlocMock.state)
            .thenReturn(CovidMaterialListState.initial());
        when(() => cartBlocMock.state).thenReturn(CartState.initial());
        when(() => mockBannerBloc.state).thenReturn(BannerState.initial());
        when(() => shipToCodeBlocMock.state)
            .thenReturn(ShipToCodeState.initial());
        when(() => authBlocMock.state).thenReturn(const AuthState.initial());
        when(() => userBlocMock.state).thenReturn(UserState.initial());
      });

      Future getWidget(tester) async {
        return await tester.pumpWidget(
          MultiBlocProvider(
            providers: [
              BlocProvider<CustomerCodeBloc>(
                  create: (context) => mockCustomerCodeBloc),
              BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBlocMock),
              BlocProvider<MaterialListBloc>(
                  create: (context) => materialListBlocMock),
              BlocProvider<MaterialPriceBloc>(
                  create: (context) => materialPriceBlocMock),
              BlocProvider<CovidMaterialListBloc>(
                  create: (context) => covidMaterialListBlocMock),
              BlocProvider<CartBloc>(create: (context) => cartBlocMock),
              BlocProvider<BannerBloc>(create: (context) => mockBannerBloc),
              BlocProvider<ShipToCodeBloc>(
                  create: (context) => shipToCodeBlocMock),
              BlocProvider<AuthBloc>(create: (context) => authBlocMock),
              BlocProvider<UserBloc>(create: (context) => userBlocMock),
            ],
            child: const MaterialApp(
              home: Scaffold(
                body: HomeTab(),
              ),
            ),
          ),
        );
      }

      testWidgets('Home Tab  test', (WidgetTester tester) async {
        final expectedMaterialState = [
          MaterialListState.initial().copyWith(
              isFetching: true,
              nextPageIndex: 1,
              materialList: [fakematerialInfo1]),
          MaterialListState.initial().copyWith(
              isFetching: false,
              nextPageIndex: 1,
              materialList: [
                fakematerialInfo1.copyWith(materialNumber: fakeMaterialNumber)
              ]),
        ];
        final expectedCovidMaterialState = [
          CovidMaterialListState.initial().copyWith(
              isFetching: true,
              nextPageIndex: 1,
              materialList: [fakematerialInfo1]),
          CovidMaterialListState.initial().copyWith(
              isFetching: false,
              nextPageIndex: 1,
              materialList: [
                fakematerialInfo1.copyWith(materialNumber: fakeMaterialNumber)
              ]),
        ];

        whenListen(
            materialListBlocMock, Stream.fromIterable(expectedMaterialState));
        whenListen(covidMaterialListBlocMock,
            Stream.fromIterable(expectedCovidMaterialState));

        await getWidget(tester);
        await tester.pump(const Duration(seconds: 3));

        expect(find.byType(HomeTab), findsOneWidget);
        expect(
            find.byKey(const ValueKey('HomeSalesOrgSelector')), findsOneWidget);
        expect(find.byKey(const ValueKey('HomeCustomerCodeSelector')),
            findsOneWidget);
        expect(
            find.byKey(const ValueKey('HomeShipCodeSelector')), findsOneWidget);
        expect(find.byKey(const ValueKey('HomeBanner')), findsOneWidget);
        expect(find.text('Create Order'), findsOneWidget);
        expect(find.text('Saved Orders'), findsOneWidget);
        expect(find.text('Order Template'), findsOneWidget);

        verify(() => materialPriceBlocMock.add(MaterialPriceEvent.fetch(
            customerCode: fakeCustomerCodeInfo,
            materials: [fakematerialInfo1],
            salesOrganisation: fakeSalesOrganisation))).called(2);
      });
    });
  });
}
