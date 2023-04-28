import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/aup_tc/aup_tc_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/covid_material_list/covid_material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_list/order_history_list_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/access_right.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';

import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/home/expansion_tiles/returns_expansion_tile.dart';
import 'package:ezrxmobile/presentation/home/home_tab.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../utils/widget_utils.dart';
import '../order_history/order_history_details_widget_test.dart';
import 'selectors/shipping_address_selector_test.dart';

class MaterialListBlocMock
    extends MockBloc<MaterialListEvent, MaterialListState>
    implements MaterialListBloc {}

class MockAupTcBloc extends MockBloc<AupTcEvent, AupTcState>
    implements AupTcBloc {}

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

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class MockHTTPService extends Mock implements HttpService {}

class AutoRouterMock extends Mock implements AppRouter {}

class RemoteConfigServiceMock extends Mock implements RemoteConfigService {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  EasyLocalization.logger.enableLevels = [];
  late CustomerCodeBlocMock mockCustomerCodeBloc;
  late SalesOrgBlocMock salesOrgBlocMock;
  late MaterialListBlocMock materialListBlocMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late MaterialPriceBlocMock materialPriceBlocMock;
  late CovidMaterialListBlocMock covidMaterialListBlocMock;
  late CartBlocMock cartBlocMock;
  late BannerBlocMock mockBannerBloc;
  late ShipToCodeBlocMock shipToCodeBlocMock;
  late AuthBloc authBlocMock;
  late MockAupTcBloc mockAupTcBloc;
  late AnnouncementBloc announcementBlocMock;
  late UserBlocMock userBlocMock;
  late HttpService mockHTTPService;
  late AppRouter autoRouterMock;
  late RemoteConfigService remoteConfigServiceMock;
  final fakeMaterialNumber = MaterialNumber('000000000023168451');
  final fakematerialInfo1 = MaterialInfo(
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
    genericMaterialName: '',
  );
  final fakeCustomerCodeInfo = CustomerCodeInfo.empty().copyWith(
    customerCodeSoldTo: 'fake-1234',
  );
  final fakeSalesOrganisation =
      SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601'));

  group('Home banner test', () {
    setUpAll(() async {
      locator.registerLazySingleton(() => MixpanelService());
      locator<MixpanelService>().init(mixpanel: MixpanelMock());
      locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
      locator.registerLazySingleton(() => AppRouter());
      locator.registerLazySingleton(() => mockBannerBloc);
      locator.registerLazySingleton(() => eligibilityBlocMock);
      mockHTTPService = MockHTTPService();
      autoRouterMock = locator<AppRouter>();
      locator.registerLazySingleton<HttpService>(
        () => mockHTTPService,
      );
      autoRouterMock = locator<AppRouter>();
      locator.registerLazySingleton(() => remoteConfigServiceMock);
    });
    group('Home Tab Screen', () {
      setUp(() {
        mockCustomerCodeBloc = CustomerCodeBlocMock();
        salesOrgBlocMock = SalesOrgBlocMock();
        materialListBlocMock = MaterialListBlocMock();
        materialPriceBlocMock = MaterialPriceBlocMock();
        covidMaterialListBlocMock = CovidMaterialListBlocMock();
        mockBannerBloc = BannerBlocMock();
        eligibilityBlocMock = EligibilityBlocMock();
        shipToCodeBlocMock = ShipToCodeBlocMock();
        authBlocMock = AuthBlocMock();
        announcementBlocMock = AnnouncementBlocMock();
        userBlocMock = UserBlocMock();
        cartBlocMock = CartBlocMock();
        mockAupTcBloc = MockAupTcBloc();
        mockHTTPService = MockHTTPService();
        remoteConfigServiceMock = RemoteConfigServiceMock();

        when(() => mockCustomerCodeBloc.state).thenReturn(
            CustomerCodeState.initial()
                .copyWith(customerCodeInfo: fakeCustomerCodeInfo));
        when(() => mockAupTcBloc.state).thenReturn(
          AupTcState.initial().copyWith(
            showTermsAndConditon: false,
          ),
        );
        when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial()
            .copyWith(salesOrganisation: fakeSalesOrganisation));
        when(() => materialListBlocMock.state).thenReturn(
            MaterialListState.initial()
                .copyWith(materialList: [fakematerialInfo1]));
        when(() => materialPriceBlocMock.state)
            .thenReturn(MaterialPriceState.initial());
        when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
                customerCodeInfo:
                    CustomerCodeInfo.empty().copyWith(status: Status('EDI'))));
        when(() => covidMaterialListBlocMock.state)
            .thenReturn(CovidMaterialListState.initial());
        when(() => cartBlocMock.state).thenReturn(CartState.initial());
        when(() => mockBannerBloc.state).thenReturn(BannerState.initial());
        when(() => shipToCodeBlocMock.state)
            .thenReturn(ShipToCodeState.initial());
        when(() => authBlocMock.state).thenReturn(const AuthState.initial());
        when(() => userBlocMock.state).thenReturn(
          UserState.initial().copyWith(
            user: fakeUser,
          ),
        );
        when(() => remoteConfigServiceMock.getReturnsConfig()).thenReturn(true);
        when(() => authBlocMock.state).thenReturn(const AuthState.initial());
        when(() => announcementBlocMock.state)
            .thenReturn(AnnouncementState.initial());
      });

      Future getWidget(tester) async {
        return await tester.pumpWidget(
          EasyLocalization(
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
                BlocProvider<CustomerCodeBloc>(
                    create: (context) => mockCustomerCodeBloc),
                BlocProvider<SalesOrgBloc>(
                    create: (context) => salesOrgBlocMock),
                BlocProvider<MaterialListBloc>(
                    create: (context) => materialListBlocMock),
                BlocProvider<MaterialPriceBloc>(
                    create: (context) => materialPriceBlocMock),
                BlocProvider<CovidMaterialListBloc>(
                    create: (context) => covidMaterialListBlocMock),
                BlocProvider<CartBloc>(create: (context) => cartBlocMock),
                BlocProvider<EligibilityBloc>(
                    create: (context) => eligibilityBlocMock),
                BlocProvider<BannerBloc>(create: (context) => mockBannerBloc),
                BlocProvider<ShipToCodeBloc>(
                    create: (context) => shipToCodeBlocMock),
                BlocProvider<AuthBloc>(create: (context) => authBlocMock),
                BlocProvider<UserBloc>(create: (context) => userBlocMock),
                BlocProvider<AuthBloc>(create: (context) => authBlocMock),
                BlocProvider<AnnouncementBloc>(
                    create: (context) => announcementBlocMock),
              ],
              child: const HomeTab(),
            ),
          ),
        );
      }

      testWidgets(
        'Home Screen orders is disabled, history is enabled when user is client admin/user, accessRight->orders is true and disableCreateOrder is true',
        (WidgetTester tester) async {
          VisibilityDetectorController.instance.updateInterval = Duration.zero;
          when(() => userBlocMock.state).thenReturn(
            UserState.initial().copyWith(
              user: fakeUser.copyWith(
                role: Role.empty().copyWith(
                  type: RoleType('client_admin'),
                ),
                accessRight: AccessRight.empty().copyWith(
                  orders: true,
                ),
                disableCreateOrder: true,
              ),
            ),
          );

          await getWidget(tester);
          await tester.pump();
          final orderExpansionTile =
              find.byKey(const Key('orderExpansionTile'));
          expect(orderExpansionTile, findsNothing);
        },
      );

      testWidgets(
        'Home Screen orders is enable, when user is client admin/user, accessRight->orders is true and disableCreateOrder is false',
        (WidgetTester tester) async {
          VisibilityDetectorController.instance.updateInterval = Duration.zero;
          when(() => userBlocMock.state).thenReturn(
            UserState.initial().copyWith(
              user: fakeUser.copyWith(
                role: Role.empty().copyWith(
                  type: RoleType('client_admin'),
                ),
                accessRight: AccessRight.empty().copyWith(
                  orders: true,
                ),
                disableCreateOrder: false,
              ),
            ),
          );

          await getWidget(tester);
          await tester.pump();
          final orderExpansionTile =
              find.byKey(const Key('orderExpansionTile'));
          expect(orderExpansionTile, findsOneWidget);
        },
      );

      testWidgets(
        'Home Screen orders is disable, when user is client admin/user, accessRight->orders is false and disableCreateOrder is false',
        (WidgetTester tester) async {
          VisibilityDetectorController.instance.updateInterval = Duration.zero;
          when(() => userBlocMock.state).thenReturn(
            UserState.initial().copyWith(
              user: fakeUser.copyWith(
                role: Role.empty().copyWith(
                  type: RoleType('client_admin'),
                ),
                accessRight: AccessRight.empty().copyWith(
                  orders: false,
                ),
                disableCreateOrder: false,
              ),
            ),
          );

          await getWidget(tester);
          await tester.pump();
          final orderExpansionTile =
              find.byKey(const Key('orderExpansionTile'));
          expect(orderExpansionTile, findsNothing);
        },
      );

      testWidgets(
        'Home Screen orders is enable, when user is not client admin/user, accessRight->orders is true and disableCreateOrder is false',
        (WidgetTester tester) async {
          VisibilityDetectorController.instance.updateInterval = Duration.zero;
          when(() => userBlocMock.state).thenReturn(
            UserState.initial().copyWith(
              user: fakeUser.copyWith(
                role: Role.empty().copyWith(
                  type: RoleType('fake_type'),
                ),
                accessRight: AccessRight.empty().copyWith(
                  orders: true,
                ),
                disableCreateOrder: false,
              ),
            ),
          );

          await getWidget(tester);
          await tester.pump();
          final orderExpansionTile =
              find.byKey(const Key('orderExpansionTile'));
          expect(orderExpansionTile, findsOneWidget);
        },
      );

      testWidgets(
        'Home Screen orders is enable, when user is not client admin/user, accessRight->orders is true and disableCreateOrder is false',
        (WidgetTester tester) async {
          VisibilityDetectorController.instance.updateInterval = Duration.zero;
          when(() => userBlocMock.state).thenReturn(
            UserState.initial().copyWith(
              user: fakeUser.copyWith(
                role: Role.empty().copyWith(
                  type: RoleType('fake_type'),
                ),
                accessRight: AccessRight.empty().copyWith(
                  orders: true,
                ),
                disableCreateOrder: true,
              ),
            ),
          );

          await getWidget(tester);
          await tester.pump();
          final orderExpansionTile =
              find.byKey(const Key('orderExpansionTile'));
          expect(orderExpansionTile, findsOneWidget);
        },
      );

      testWidgets(
        'Home Screen orders is disable, when user is not client admin/user, accessRight->orders is false and disableCreateOrder is true',
        (WidgetTester tester) async {
          VisibilityDetectorController.instance.updateInterval = Duration.zero;
          when(() => userBlocMock.state).thenReturn(
            UserState.initial().copyWith(
              user: fakeUser.copyWith(
                role: Role.empty().copyWith(
                  type: RoleType('fake_type'),
                ),
                accessRight: AccessRight.empty().copyWith(
                  orders: false,
                ),
                disableCreateOrder: true,
              ),
            ),
          );

          await getWidget(tester);
          await tester.pump();
          final orderExpansionTile =
              find.byKey(const Key('orderExpansionTile'));
          expect(orderExpansionTile, findsNothing);
        },
      );

      testWidgets(
        'Home Screen orders is disable, when user is not client admin/user, accessRight->orders is false and disableCreateOrder is false',
        (WidgetTester tester) async {
          VisibilityDetectorController.instance.updateInterval = Duration.zero;
          when(() => userBlocMock.state).thenReturn(
            UserState.initial().copyWith(
              user: fakeUser.copyWith(
                role: Role.empty().copyWith(
                  type: RoleType('fake_type'),
                ),
                accessRight: AccessRight.empty().copyWith(
                  orders: false,
                ),
                disableCreateOrder: false,
              ),
            ),
          );

          await getWidget(tester);
          await tester.pump();
          final orderExpansionTile =
              find.byKey(const Key('orderExpansionTile'));
          expect(orderExpansionTile, findsNothing);
        },
      );

      testWidgets('Home Tab  test', (WidgetTester tester) async {
        VisibilityDetectorController.instance.updateInterval = Duration.zero;
        when(() => userBlocMock.state).thenReturn(
          UserState.initial().copyWith(
            user: fakeUser.copyWith(
              role: Role.empty().copyWith(
                type: RoleType('fake_type'),
              ),
              accessRight: AccessRight.empty().copyWith(
                orders: true,
              ),
              disableCreateOrder: false,
            ),
          ),
        );
        final expectedEligibilityState = [
          EligibilityState.initial().copyWith(
              user: fakeUser.copyWith(
                role: Role.empty().copyWith(
                  type: RoleType('fake_type'),
                ),
                accessRight: AccessRight.empty().copyWith(
                  orders: true,
                ),
                disableCreateOrder: false,
              ),
              customerCodeInfo: CustomerCodeInfo.empty().copyWith(
                status: Status(''),
              )),
          EligibilityState.initial().copyWith(
              user: User.empty().copyWith(disableCreateOrder: true),
              customerCodeInfo: CustomerCodeInfo.empty().copyWith(
                status: Status('EDI'),
              )),
        ];
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
        whenListen(
            eligibilityBlocMock, Stream.fromIterable(expectedEligibilityState));
        await getWidget(tester);
        await tester.pump(const Duration(seconds: 3));
        expect(find.byType(HomeTab), findsOneWidget);
        expect(
            find.byKey(const ValueKey('homeSalesOrgSelector')), findsOneWidget);
        final ediUserBanner = find.byKey(const ValueKey('ediUserBanner'));
        final returnsExpansionTile = find.byType(ReturnsExpansionTile);
        if (remoteConfigServiceMock.getReturnsConfig()) {
          expect(returnsExpansionTile, findsOneWidget);
        }
        expect(ediUserBanner, findsOneWidget);
        expect(find.byKey(const ValueKey('homeCustomerCodeSelector')),
            findsOneWidget);
        expect(
            find.byKey(const ValueKey('homeShipCodeSelector')), findsOneWidget);
        expect(find.byKey(const ValueKey('HomeBanner')), findsOneWidget);

        expect(find.text('Orders'), findsOneWidget);
        expect(find.text('Create Order'), findsOneWidget);
        expect(find.text('Saved Orders'), findsOneWidget);
        expect(find.text('Order Template'), findsOneWidget);
        verify(() => materialPriceBlocMock.add(MaterialPriceEvent.fetch(
              customerCodeInfo: fakeCustomerCodeInfo,
              materials: [fakematerialInfo1],
              salesConfigs: SalesOrganisationConfigs.empty(),
              shipToInfo: ShipToInfo.empty(),
              salesOrganisation: fakeSalesOrganisation,
              comboDealEligible: false,
            ))).called(2);
      });

      testWidgets('Home Tab _TileCard onTap test', (WidgetTester tester) async {
        VisibilityDetectorController.instance.updateInterval = Duration.zero;
        when(() => userBlocMock.state).thenReturn(
          UserState.initial().copyWith(
            user: fakeUser.copyWith(
              role: Role.empty().copyWith(
                type: RoleType('fake_type'),
              ),
              accessRight: AccessRight.empty().copyWith(
                orders: true,
              ),
              disableCreateOrder: false,
            ),
          ),
        );
        final expectedEligibilityState = [
          EligibilityState.initial().copyWith(
              user: User.empty().copyWith(
                role: Role.empty().copyWith(type: RoleType('fake')),
                disableCreateOrder: false,
                accessRight: AccessRight.empty().copyWith(
                  orders: true,
                ),
              ),
              customerCodeInfo: CustomerCodeInfo.empty().copyWith(
                status: Status('EDI'),
              )),
        ];
        whenListen(
            eligibilityBlocMock, Stream.fromIterable(expectedEligibilityState));
        await getWidget(tester);
        await tester.pump();

        final onTapTest = find.byKey(const Key('orders/material_list'));
        expect(onTapTest, findsOneWidget);
        await tester.tap(onTapTest);

        expect(onTapTest, findsAtLeastNWidgets(1));

        expect(autoRouterMock.current.name, MaterialRootRoute.name);
        final onTapTest1 = find.byKey(const Key('orders/saved_order_list'));
        expect(onTapTest1, findsOneWidget);
        await tester.tap(onTapTest1);

        expect(onTapTest1, findsAtLeastNWidgets(1));

        expect(autoRouterMock.current.name, SavedOrderListPageRoute.name);
        final onTapTest2 = find.byKey(const Key('orders/order_template_list'));
        expect(onTapTest2, findsOneWidget);
        await tester.tap(onTapTest2);

        expect(onTapTest2, findsAtLeastNWidgets(1));

        expect(autoRouterMock.current.name, OrderTemplateListPageRoute.name);
      });

      testWidgets('Home Tab disableCreateOrder test',
          (WidgetTester tester) async {
        when(() => userBlocMock.state).thenReturn(
          UserState.initial()
              .copyWith(user: User.empty().copyWith(disableCreateOrder: true)),
        );

        await getWidget(tester);
      });

      testWidgets(
        'Home Screen userCanCreateOrder test - History Disabled',
        (WidgetTester tester) async {
          when(() => userBlocMock.state).thenReturn(
            UserState.initial().copyWith(
              user: fakeUser.copyWith(
                disableCreateOrder: true,
              ),
            ),
          );

          await getWidget(tester);

          final historyTab = find.byKey(const Key('historyTab'));
          expect(historyTab, findsNothing);
        },
      );
    });
  });
}
