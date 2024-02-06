import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_bloc.dart';
import 'package:ezrxmobile/application/aup_tc/aup_tc_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/application/intro/intro_bloc.dart';
import 'package:ezrxmobile/application/notification/notification_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/product_search/product_search_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/access_right.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/banner/entities/ez_reach_banner.dart';
import 'package:ezrxmobile/domain/notification/entities/notification.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/notification/datasource/notification_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/browse_products/browse_products.dart';
import 'package:ezrxmobile/presentation/home/bundle_section/bundle_section.dart';
import 'package:ezrxmobile/presentation/home/home_tab.dart';
import 'package:ezrxmobile/presentation/home/product_offer_section/product_offer_section.dart';
import 'package:ezrxmobile/presentation/home/selector/home_product_search_bar.dart';
import 'package:ezrxmobile/presentation/home/widgets/explore_marketplace_banner.dart';
import 'package:ezrxmobile/presentation/home/widgets/quick_access_menu.dart';
import 'package:ezrxmobile/presentation/home_tab.dart';
import 'package:ezrxmobile/presentation/orders/recent_order/recent_order_section.dart';

import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../common_mock_data/customer_code_mock.dart';
import '../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../common_mock_data/sales_org_config_mock/fake_ph_sales_org_config.dart';
import '../../common_mock_data/sales_organsiation_mock.dart';
import '../../common_mock_data/user_mock.dart';
import '../../utils/widget_utils.dart';

class MaterialListBlocMock
    extends MockBloc<MaterialListEvent, MaterialListState>
    implements MaterialListBloc {}

class MockAupTcBloc extends MockBloc<AupTcEvent, AupTcState>
    implements AupTcBloc {}

class MockIntroBloc extends MockBloc<IntroEvent, IntroState>
    implements IntroBloc {}

class MaterialPriceBlocMock
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

class ViewByItemsBlocMock extends MockBloc<ViewByItemsEvent, ViewByItemsState>
    implements ViewByItemsBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class AnnouncementInfoBlocMock
    extends MockBloc<AnnouncementInfoEvent, AnnouncementInfoState>
    implements AnnouncementInfoBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class BannerBlocMock extends MockBloc<BannerEvent, BannerState>
    implements BannerBloc {}

class NotificationBlocMock
    extends MockBloc<NotificationEvent, NotificationState>
    implements NotificationBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class ProductSearchBlocMock
    extends MockBloc<ProductSearchEvent, ProductSearchState>
    implements ProductSearchBloc {}

class MockHTTPService extends Mock implements HttpService {}

class AutoRouterMock extends Mock implements AppRouter {}

class RemoteConfigServiceMock extends Mock implements RemoteConfigService {}

class ProductImageBlocMock
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  EasyLocalization.logger.enableLevels = [];
  late CustomerCodeBlocMock mockCustomerCodeBloc;
  late SalesOrgBlocMock salesOrgBlocMock;
  late NotificationBloc notificationBlocMock;
  late MaterialListBloc materialListBlocMock;
  late ViewByItemsBloc viewByItemsBlocMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late MaterialPriceBlocMock materialPriceBlocMock;
  late CartBlocMock cartBlocMock;
  late BannerBloc mockBannerBloc;
  late AuthBloc authBlocMock;
  late MockAupTcBloc mockAupTcBloc;
  late MockIntroBloc mockIntroBloc;
  late AnnouncementBloc announcementBlocMock;
  late UserBlocMock userBlocMock;
  late HttpService mockHTTPService;
  late AppRouter autoRouterMock;
  late RemoteConfigService remoteConfigServiceMock;
  late ProductSearchBloc productSearchBlocMock;
  late AnnouncementInfoBlocMock announcementInfoBlocMock;
  late ProductImageBlocMock productImageBlocMock;
  late Notifications notifications;

  final fakeUser = User.empty().copyWith(
    username: Username('fake-user'),
    role: Role.empty().copyWith(
      type: RoleType('client'),
    ),
    acceptPrivacyPolicy: true,
    enableOrderType: true,
  );

  //final fakeMaterialNumber = MaterialNumber('000000000023168451');
  // final fakematerialInfo1 = MaterialInfo.empty().copyWith(
  //   quantity: 0,
  //   materialNumber: fakeMaterialNumber,
  //   ean: '2234567890',
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
  //   unitOfMeasurement: StringValue('EA'),
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
  final fakeCustomerCodeInfo = CustomerCodeInfo.empty().copyWith(
    customerCodeSoldTo: 'fake-1234',
  );
  final fakeSalesOrganisation =
      SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601'));

  setUpAll(() async {
    locator.registerFactory(() => mockCustomerCodeBloc);
    locator.registerLazySingleton(
      () => MixpanelService(config: locator<Config>()),
    );
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerFactory(() => mockBannerBloc);
    locator.registerLazySingleton(() => eligibilityBlocMock);
    mockHTTPService = MockHTTPService();
    autoRouterMock = locator<AppRouter>();
    locator.registerLazySingleton<HttpService>(
      () => mockHTTPService,
    );
    locator.registerLazySingleton(() => remoteConfigServiceMock);
    locator.registerFactory(() => materialListBlocMock);
    locator.registerFactory(() => viewByItemsBlocMock);
    locator.registerFactory(() => notificationBlocMock);
    notifications = await NotificationLocalDataSource().getNotificationList();
  });

  group('Home Tab Screen', () {
    setUp(() {
      mockCustomerCodeBloc = CustomerCodeBlocMock();
      salesOrgBlocMock = SalesOrgBlocMock();
      materialListBlocMock = MaterialListBlocMock();
      viewByItemsBlocMock = ViewByItemsBlocMock();
      materialPriceBlocMock = MaterialPriceBlocMock();
      mockBannerBloc = BannerBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      authBlocMock = AuthBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      userBlocMock = UserBlocMock();
      cartBlocMock = CartBlocMock();
      mockAupTcBloc = MockAupTcBloc();
      mockHTTPService = MockHTTPService();
      remoteConfigServiceMock = RemoteConfigServiceMock();
      productSearchBlocMock = ProductSearchBlocMock();
      announcementInfoBlocMock = AnnouncementInfoBlocMock();
      productImageBlocMock = ProductImageBlocMock();
      mockIntroBloc = MockIntroBloc();
      notificationBlocMock = NotificationBlocMock();

      VisibilityDetectorController.instance.updateInterval = Duration.zero;

      when(() => mockAupTcBloc.state).thenReturn(
        AupTcState.initial().copyWith(
          privacyConsent: false,
          tncConsent: false,
        ),
      );
      when(() => mockIntroBloc.state).thenReturn(
        IntroState.initial().copyWith(
          index: 2,
        ),
      );
      when(() => salesOrgBlocMock.state).thenReturn(
        SalesOrgState.initial()
            .copyWith(salesOrganisation: fakeSalesOrganisation),
      );

      when(() => mockCustomerCodeBloc.state).thenReturn(
        CustomerCodeState.initial()
            .copyWith(customerCodeInfo: fakeCustomerCodeInfo),
      );

      when(() => materialListBlocMock.state).thenReturn(
        MaterialListState.initial(),
      );
      when(() => notificationBlocMock.state).thenReturn(
        NotificationState.initial(),
      );
      when(() => materialPriceBlocMock.state)
          .thenReturn(MaterialPriceState.initial());
      when(() => viewByItemsBlocMock.state)
          .thenReturn(ViewByItemsState.initial());
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          customerCodeInfo:
              CustomerCodeInfo.empty().copyWith(status: Status('EDI')),
        ),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo:
              CustomerCodeInfo.empty().copyWith(status: Status('EDI')),
          user: fakeUser,
        ),
      );
      when(() => cartBlocMock.state).thenReturn(CartState.initial());
      when(() => mockBannerBloc.state).thenReturn(
        BannerState.initial().copyWith(
          banner: [EZReachBanner.empty()],
        ),
      );
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => userBlocMock.state).thenReturn(
        UserState.initial().copyWith(
          user: fakeUser,
        ),
      );
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
      when(() => productSearchBlocMock.state).thenReturn(
        ProductSearchState.initial(),
      );
      when(() => announcementInfoBlocMock.state).thenReturn(
        AnnouncementInfoState.initial().copyWith(
          isLoading: false,
        ),
      );
      when(() => productImageBlocMock.state).thenReturn(
        ProductImageState.initial(),
      );
    });

    Widget getWidget({
      widget = const HomeTab(),
    }) =>
        WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          usingLocalization: true,
          useMediaQuery: false,
          providers: [
            BlocProvider<AupTcBloc>(create: (context) => mockAupTcBloc),
            BlocProvider<IntroBloc>(create: (context) => mockIntroBloc),
            BlocProvider<SalesOrgBloc>(
              create: (context) => salesOrgBlocMock,
            ),
            BlocProvider<NotificationBloc>(
              create: (context) => notificationBlocMock,
            ),
            BlocProvider<CustomerCodeBloc>(
              create: (context) => mockCustomerCodeBloc,
            ),
            BlocProvider<ViewByItemsBloc>(
              create: (context) => viewByItemsBlocMock,
            ),
            BlocProvider<MaterialListBloc>(
              create: (context) => materialListBlocMock,
            ),
            BlocProvider<MaterialPriceBloc>(
              create: (context) => materialPriceBlocMock,
            ),
            BlocProvider<CartBloc>(create: (context) => cartBlocMock),
            BlocProvider<EligibilityBloc>(
              create: (context) => eligibilityBlocMock,
            ),
            BlocProvider<BannerBloc>(create: (context) => mockBannerBloc),
            BlocProvider<AuthBloc>(create: (context) => authBlocMock),
            BlocProvider<UserBloc>(create: (context) => userBlocMock),
            BlocProvider<AuthBloc>(create: (context) => authBlocMock),
            BlocProvider<AnnouncementBloc>(
              create: (context) => announcementBlocMock,
            ),
            BlocProvider<ProductSearchBloc>(
              create: (context) => productSearchBlocMock,
            ),
            BlocProvider<AnnouncementInfoBloc>(
              create: (context) => announcementInfoBlocMock,
            ),
            BlocProvider<ProductImageBloc>(
              create: (context) => productImageBlocMock,
            ),
          ],
          child: widget,
          routeName: HomeNavigationTabbarRoute.name,
        );

    testWidgets(
      ' -> Find HomeScreen',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: User.empty().copyWith(
              accessRight: AccessRight.empty().copyWith(products: true),
              role: Role.empty().copyWith(
                type: RoleType('client_user'),
              ),
            ),
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();
        final homeScreen = find.byKey(
          WidgetKeys.homeScreen,
        );
        expect(homeScreen, findsOneWidget);
        expect(find.byType(ProductsOnOffer), findsOneWidget);
        expect(find.byType(BundleSection), findsOneWidget);
        expect(find.byType(BrowseProduct), findsOneWidget);
      },
    );
    testWidgets(
      ' -> HomeScreen on refresh',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: User.empty().copyWith(
              accessRight: AccessRight.empty().copyWith(products: true),
              role: Role.empty().copyWith(
                type: RoleType('client_user'),
              ),
              userSalesOrganisations: [
                SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2001'))
              ],
            ),
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        await tester.pump(const Duration(milliseconds: 100));
        final handle = tester.ensureSemantics();

        final homeScreen = find.byKey(
          WidgetKeys.homeScreen,
        );
        expect(homeScreen, findsOneWidget);
        await tester.dragUntilVisible(
          find.byType(
            RefreshProgressIndicator,
          ),
          find.byType(
            QuickAccessMenuPanel,
          ),
          const Offset(0.0, 1000.0),
        );
        await tester.pump(const Duration(seconds: 1));
        expect(
          find.byType(RefreshProgressIndicator),
          findsOneWidget,
        );
        await tester.pump(const Duration(milliseconds: 300));
        verify(
          () => salesOrgBlocMock.add(
            SalesOrgEvent.loadSavedOrganisation(
              salesOrganisations: [
                SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2001'))
              ],
            ),
          ),
        ).called(1);
        handle.dispose();
      },
    );

    testWidgets(
      ' -> Find customer blocked banner',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            shipToInfo: ShipToInfo.empty()
                .copyWith(customerBlock: CustomerBlock('blocked')),
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final homeScreen = find.byKey(
          WidgetKeys.homeScreen,
        );
        final customerBlockedBanner =
            find.byKey(WidgetKeys.customerBlockedBanner);
        expect(homeScreen, findsOneWidget);
        expect(customerBlockedBanner, findsOneWidget);
      },
    );
    testWidgets(
      ' -> Find Bundle Section for id market',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: fakeRootAdminUser,
            salesOrganisation: fakeIDSalesOrganisation,
            salesOrgConfigs: fakeIDSalesOrgConfigs,
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final bundlesFinder = find.byType(BundleSection);
        expect(bundlesFinder, findsNothing);
      },
    );

    testWidgets(
      ' -> Recently ordered section not visible when user does not have access to order history tab',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: fakeExternalSalesRepUser.copyWith(
              accessRight: AccessRight.empty().copyWith(
                orders: false,
              ),
            ),
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final recentOrderFinder = find.byType(RecentOrdersSection);
        expect(recentOrderFinder, findsNothing);
      },
    );

    testWidgets(
      ' -> Recently ordered section visible when user have access to order history tab',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: fakeExternalSalesRepUser.copyWith(
              accessRight: AccessRight.empty().copyWith(
                orders: true,
              ),
            ),
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final recentOrderFinder = find.byType(RecentOrdersSection);
        expect(recentOrderFinder, findsOneWidget);
      },
    );

    group('HomeQuickAccessPaymentsMenu Test', () {
      testWidgets(
        ' -> Hide homeQuickAccessPaymentsMenu when Enable Payment Configuration is off',
        (WidgetTester tester) async {
          VisibilityDetectorController.instance.updateInterval = Duration.zero;
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrganisation: SalesOrganisation.empty().copyWith(
                //Philippine market: ZPC PH
                salesOrg: SalesOrg('2500'),
              ),
              salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
                //Enable Payment Configuration is off
                disablePayment: true,
              ),
            ),
          );
          when(() => userBlocMock.state).thenReturn(
            UserState.initial().copyWith(
              user: User.empty().copyWith(
                role: Role.empty().copyWith(
                  type: RoleType('client_user'),
                ),
              ),
            ),
          );

          await tester.pumpWidget(getWidget());
          await tester.pump();
          final homeQuickAccessPaymentsMenu =
              find.byKey(WidgetKeys.homeQuickAccessPaymentsMenu);
          expect(homeQuickAccessPaymentsMenu, findsNothing);
        },
      );

      testWidgets(
        ' -> Show homeQuickAccessPaymentsMenu when Enable Payment Configuration is on',
        (WidgetTester tester) async {
          VisibilityDetectorController.instance.updateInterval = Duration.zero;
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrganisation: fakePHSalesOrganisation,
              salesOrgConfigs: fakePHSalesOrgConfigs,
              user: fakeClientUser,
            ),
          );

          await tester.pumpWidget(getWidget());
          await tester.pump();
          final homeQuickAccessPaymentsMenu =
              find.byKey(WidgetKeys.homeQuickAccessPaymentsMenu);
          expect(homeQuickAccessPaymentsMenu, findsOneWidget);
        },
      );

      testWidgets(
        ' -> show homeQuickAccessEZPointMenu for ID',
        (WidgetTester tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrganisation: SalesOrganisation.empty().copyWith(
                //For ID market
                salesOrg: SalesOrg('1900'),
              ),
            ),
          );

          await tester.pumpWidget(getWidget());
          await tester.pump();

          expect(find.text('eZPoint'), findsOneWidget);
          final homeQuickAccessEZPointMenu =
              find.byKey(WidgetKeys.homeQuickAccessEZPointMenu);
          expect(homeQuickAccessEZPointMenu, findsOneWidget);
        },
      );

      testWidgets(
        ' -> hide homeQuickAccessEZPointMenu for other market',
        (WidgetTester tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrganisation: SalesOrganisation.empty().copyWith(
                //For SG market
                salesOrg: SalesOrg('2601'),
              ),
            ),
          );

          await tester.pumpWidget(getWidget());
          await tester.pump();
          expect(find.text('eZPoint'), findsNothing);
          final homeQuickAccessEZPointMenu =
              find.byKey(WidgetKeys.homeQuickAccessEZPointMenu);
          expect(homeQuickAccessEZPointMenu, findsNothing);
        },
      );
    });

    group('Product accessright false', () {
      setUp(() {
        final fakeUser = User.empty().copyWith(
          accessRight: AccessRight.empty().copyWith(products: false),
          role: Role.empty().copyWith(type: RoleType('client_user')),
        );
        when(
          () => userBlocMock.state,
        ).thenReturn(
          UserState.initial().copyWith(
            user: fakeUser,
          ),
        );
      });

      testWidgets('Product SearchBar Hidden when product accessright is false',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final productSearchBar = find.byType(HomeProductSearchBar);
        expect(productSearchBar, findsNothing);
      });

      testWidgets('ProductsOnOffer Hidden when product accessright is false',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final productsOnOffer = find.byType(ProductsOnOffer);
        expect(productsOnOffer, findsNothing);
      });

      testWidgets('BundleSection Hidden when product accessright is false',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final bundleSection = find.byType(BundleSection);
        expect(bundleSection, findsNothing);
      });

      testWidgets('BrowseProduct Hidden when product accessright is false',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final browseProduct = find.byType(BrowseProduct);
        expect(browseProduct, findsNothing);
      });

      testWidgets('ProductTab Hidden when product accessright is false',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final productTab = find.byKey(WidgetKeys.productsTab);
        expect(productTab, findsNothing);
      });
    });

    group('Product access right is true', () {
      setUp(() {
        final fakeUser = User.empty().copyWith(
          accessRight: AccessRight.empty().copyWith(products: true),
          role: Role.empty().copyWith(type: RoleType('client_user')),
          acceptPrivacyPolicy: true,
        );
        when(
          () => userBlocMock.state,
        ).thenReturn(
          UserState.initial().copyWith(
            user: fakeUser,
          ),
        );
        when(
          () => eligibilityBlocMock.state,
        ).thenReturn(
          EligibilityState.initial().copyWith(
            user: fakeUser,
          ),
        );
        whenListen(
          eligibilityBlocMock,
          Stream.fromIterable([
            EligibilityState.initial().copyWith(isLoading: true),
            EligibilityState.initial().copyWith(isLoading: false),
          ]),
        );
      });
      testWidgets('Product SearchBar Visible when product accessright is true',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final productSearchBar = find.byType(HomeProductSearchBar);
        expect(productSearchBar, findsOneWidget);
      });

      testWidgets('ProductsOnOffer Visible when product accessright is true',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final productsOnOffer = find.byType(ProductsOnOffer);
        expect(productsOnOffer, findsOneWidget);
      });

      testWidgets('BundleSection Visible when product accessright is true',
          (tester) async {
        final materialListBloc = locator<MaterialListBloc>();
        when(() => userBlocMock.state).thenReturn(
          UserState.initial().copyWith(
            user: fakeClientUser,
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final bundleSection = find.byType(BundleSection);
        expect(bundleSection, findsOneWidget);
        verify(
          () => materialListBloc.add(
            MaterialListEvent.fetch(
              salesOrganisation: SalesOrganisation.empty(),
              configs: SalesOrganisationConfigs.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              shipToInfo: ShipToInfo.empty(),
              selectedMaterialFilter: MaterialFilter.empty().copyWith(
                bundleOffers: true,
              ),
              user: fakeClientUser,
            ),
          ),
        ).called(1);
      });

      testWidgets('BrowseProduct Visible when product accessright is true',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final browseProduct = find.byType(BrowseProduct);
        expect(browseProduct, findsOneWidget);
      });

      testWidgets('ProductTab Visible when product accessright is true',
          (tester) async {
        await tester.pumpWidget(
          getWidget(widget: const HomeNavigationTabbar()),
        );
        await tester.pump();

        final productTab = find.byKey(WidgetKeys.productsTab);
        expect(productTab, findsOneWidget);
      });
    });

    group('AdminOrderAccess', () {
      setUp(() {
        final fakeUser = User.empty().copyWith(
          accessRight: AccessRight.empty().copyWith(products: false),
          role: Role.empty().copyWith(type: RoleType('root_admin')),
          acceptPrivacyPolicy: true,
        );
        when(
          () => eligibilityBlocMock.state,
        ).thenReturn(
          EligibilityState.initial().copyWith(
            user: fakeUser,
          ),
        );
      });

      testWidgets(
          'Product SearchBar Visible when user role has AdminOrderAccess',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final productSearchBar = find.byType(HomeProductSearchBar);
        expect(productSearchBar, findsOneWidget);
      });

      testWidgets('ProductsOnOffer Visible when user role has AdminOrderAccess',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final productsOnOffer = find.byType(ProductsOnOffer);
        expect(productsOnOffer, findsOneWidget);
      });

      testWidgets('BundleSection Visible when user role has AdminOrderAccess',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final bundleSection = find.byType(BundleSection);
        expect(bundleSection, findsOneWidget);
      });

      testWidgets('BrowseProduct Visible when user role has AdminOrderAccess',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final browseProduct = find.byType(BrowseProduct);
        expect(browseProduct, findsOneWidget);
      });

      testWidgets('ProductTab Visible when user role has AdminOrderAccess',
          (tester) async {
        when(() => userBlocMock.state).thenReturn(
          UserState.initial().copyWith(
            user: fakeUser,
          ),
        );
        await tester.pumpWidget(
          getWidget(widget: const HomeNavigationTabbar()),
        );
        await tester.pump();

        final productTab = find.byKey(WidgetKeys.productsTab);
        expect(productTab, findsOneWidget);
      });
    });

    group('ReturnRole', () {
      setUp(() {
        final fakeUser = User.empty().copyWith(
          accessRight: AccessRight.empty().copyWith(products: true),
          role: Role.empty().copyWith(type: RoleType('return_admin')),
          acceptPrivacyPolicy: true,
        );
        when(
          () => userBlocMock.state,
        ).thenReturn(
          UserState.initial().copyWith(
            user: fakeUser,
          ),
        );
      });

      testWidgets(
          'Product SearchBar Hidden when product accessright is true and user role is return',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final productSearchBar = find.byType(HomeProductSearchBar);
        expect(productSearchBar, findsNothing);
      });

      testWidgets(
          'ProductsOnOffer Hidden when product accessright is true and user role is return',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final productsOnOffer = find.byType(ProductsOnOffer);
        expect(productsOnOffer, findsNothing);
      });

      testWidgets(
          'BundleSection Hidden when product accessright is true and user role is return',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final bundleSection = find.byType(BundleSection);
        expect(bundleSection, findsNothing);
      });

      testWidgets(
          'BrowseProduct Hidden when product accessright is true and user role is return',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final browseProduct = find.byType(BrowseProduct);
        expect(browseProduct, findsNothing);
      });

      testWidgets(
          'ProductTab Hidden when product accessright is true and user role is return',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final productTab = find.byKey(WidgetKeys.productsTab);
        expect(productTab, findsNothing);
      });

      testWidgets(
          'Find notification with badge icon when there is unread notification present',
          (tester) async {
        when(() => notificationBlocMock.state).thenReturn(
          NotificationState.initial().copyWith(
            notificationList: notifications,
          ),
        );
        await tester
            .pumpWidget(getWidget(widget: const HomeNavigationTabbar()));
        await tester.pump();

        final notificationWithBadgeIcon =
            find.byKey(WidgetKeys.notificationBadge);

        expect(notificationWithBadgeIcon, findsOneWidget);
      });

      testWidgets(
          'notification with badge icon not visible when there is no unread notification present',
          (tester) async {
        when(() => notificationBlocMock.state).thenReturn(
          NotificationState.initial().copyWith(
            notificationList: notifications.copyWith(
              notificationData: [
                notifications.notificationData.first.copyWith(
                  isRead: true,
                )
              ],
            ),
          ),
        );
        await tester
            .pumpWidget(getWidget(widget: const HomeNavigationTabbar()));
        await tester.pump();

        final notificationWithBadgeIcon =
            find.byKey(WidgetKeys.notificationBadge);

        expect(notificationWithBadgeIcon, findsNothing);
      });
    });

    group('Explore marketplace banner -', () {
      testWidgets('Visible when can access marketplace', (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: fakeClientUserAccessMarketPlace,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
            shipToInfo: fakeShipToInfoPeninsulaRegion,
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        expect(find.byType(ExploreMarketPlaceBanner), findsOneWidget);
      });

      testWidgets('Not visible when can not access marketplace',
          (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: fakeClientUser,
            salesOrgConfigs: fakeMYSalesOrgConfigs,
            shipToInfo: fakeShipToInfoPeninsulaRegion,
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        expect(find.byType(ExploreMarketPlaceBanner), findsNothing);
      });
    });

    // testWidgets(
    //   'Hide paymentsExpansionTile when enablePayments is false',
    //   (WidgetTester tester) async {
    //     VisibilityDetectorController.instance.updateInterval = Duration.zero;
    //     when(() => remoteConfigServiceMock.getPaymentsConfig())
    //         .thenReturn(false);
    //     when(() => userBlocMock.state).thenReturn(
    //       UserState.initial().copyWith(
    //         user: fakeUser.copyWith(
    //           role: Role.empty().copyWith(
    //             type: RoleType('root_admin'),
    //           ),
    //         ),
    //       ),
    //     );

    //     await getWidget(tester);
    //     await tester.pump();
    //     final paymentsExpansionTile =
    //         find.byKey(const Key('paymentsExpansionTile'));
    //     expect(paymentsExpansionTile, findsNothing);
    //   },
    // );

    // testWidgets(
    //   'Show paymentsExpansionTile when enablePayments is true',
    //   (WidgetTester tester) async {
    //     VisibilityDetectorController.instance.updateInterval = Duration.zero;
    //     when(() => remoteConfigServiceMock.getPaymentsConfig())
    //         .thenReturn(true);
    //     when(() => userBlocMock.state).thenReturn(
    //       UserState.initial().copyWith(
    //         user: fakeUser.copyWith(
    //           role: Role.empty().copyWith(
    //             type: RoleType('client_admin'),
    //           ),
    //         ),
    //       ),
    //     );

    //     await getWidget(tester);
    //     await tester.pump();
    //     final paymentsExpansionTile =
    //         find.byKey(const Key('paymentsExpansionTile'));
    //     expect(paymentsExpansionTile, findsNothing);
    //   },
    // );

    // testWidgets(
    //   'Home Screen orders is disabled, history is enabled when user is client admin/user, accessRight->orders is true and disableCreateOrder is true',
    //   (WidgetTester tester) async {
    //     VisibilityDetectorController.instance.updateInterval = Duration.zero;
    //     when(() => userBlocMock.state).thenReturn(
    //       UserState.initial().copyWith(
    //         user: fakeUser.copyWith(
    //           role: Role.empty().copyWith(
    //             type: RoleType('client_admin'),
    //           ),
    //           accessRight: AccessRight.empty().copyWith(
    //             orders: true,
    //           ),
    //           disableCreateOrder: true,
    //         ),
    //       ),
    //     );

    //     await getWidget(tester);
    //     await tester.pump();
    //     final orderExpansionTile =
    //         find.byKey(const Key('orderExpansionTile'));
    //     expect(orderExpansionTile, findsNothing);
    //   },
    // );

    // testWidgets(
    //   'Show payment when user is client admin/user, accessRight->orders is true and disableCreateOrder is true',
    //   (WidgetTester tester) async {
    //     VisibilityDetectorController.instance.updateInterval = Duration.zero;
    //     when(() => userBlocMock.state).thenReturn(
    //       UserState.initial().copyWith(
    //         user: fakeUser.copyWith(
    //           role: Role.empty().copyWith(
    //             type: RoleType('client_admin'),
    //           ),
    //           accessRight: AccessRight.empty().copyWith(
    //             orders: true,
    //           ),
    //           disableCreateOrder: true,
    //         ),
    //       ),
    //     );

    //     await getWidget(tester);
    //     await tester.pump();
    //     final orderExpansionTile =
    //         find.byKey(const Key('orderExpansionTile'));
    //     expect(orderExpansionTile, findsNothing);
    //   },
    // );

    // testWidgets(
    //   'Home Screen orders is enable, when user is client admin/user, accessRight->orders is true and disableCreateOrder is false',
    //   (WidgetTester tester) async {
    //     VisibilityDetectorController.instance.updateInterval = Duration.zero;
    //     when(() => userBlocMock.state).thenReturn(
    //       UserState.initial().copyWith(
    //         user: fakeUser.copyWith(
    //           role: Role.empty().copyWith(
    //             type: RoleType('client_admin'),
    //           ),
    //           accessRight: AccessRight.empty().copyWith(
    //             orders: true,
    //           ),
    //           disableCreateOrder: false,
    //         ),
    //       ),
    //     );

    //     await getWidget(tester);
    //     await tester.pump();
    //     final orderExpansionTile =
    //         find.byKey(const Key('orderExpansionTile'));
    //     expect(orderExpansionTile, findsOneWidget);
    //   },
    // );

    // testWidgets(
    //   'Home Screen orders is disable, when user is client admin/user, accessRight->orders is false and disableCreateOrder is false',
    //   (WidgetTester tester) async {
    //     VisibilityDetectorController.instance.updateInterval = Duration.zero;
    //     when(() => userBlocMock.state).thenReturn(
    //       UserState.initial().copyWith(
    //         user: fakeUser.copyWith(
    //           role: Role.empty().copyWith(
    //             type: RoleType('client_admin'),
    //           ),
    //           accessRight: AccessRight.empty().copyWith(
    //             orders: false,
    //           ),
    //           disableCreateOrder: false,
    //         ),
    //       ),
    //     );

    //     await getWidget(tester);
    //     await tester.pump();
    //     final orderExpansionTile =
    //         find.byKey(const Key('orderExpansionTile'));
    //     expect(orderExpansionTile, findsNothing);
    //   },
    // );

    // testWidgets(
    //   'Home Screen orders is enable, when user is not client admin/user, accessRight->orders is true and disableCreateOrder is false',
    //   (WidgetTester tester) async {
    //     VisibilityDetectorController.instance.updateInterval = Duration.zero;
    //     when(() => userBlocMock.state).thenReturn(
    //       UserState.initial().copyWith(
    //         user: fakeUser.copyWith(
    //           role: Role.empty().copyWith(
    //             type: RoleType('fake_type'),
    //           ),
    //           accessRight: AccessRight.empty().copyWith(
    //             orders: true,
    //           ),
    //           disableCreateOrder: false,
    //         ),
    //       ),
    //     );

    //     await getWidget(tester);
    //     await tester.pump();
    //     final orderExpansionTile =
    //         find.byKey(const Key('orderExpansionTile'));
    //     expect(orderExpansionTile, findsOneWidget);
    //   },
    // );

    // testWidgets(
    //   'Home Screen orders is enable, when user is not client admin/user, accessRight->orders is true and disableCreateOrder is false',
    //   (WidgetTester tester) async {
    //     VisibilityDetectorController.instance.updateInterval = Duration.zero;
    //     when(() => userBlocMock.state).thenReturn(
    //       UserState.initial().copyWith(
    //         user: fakeUser.copyWith(
    //           role: Role.empty().copyWith(
    //             type: RoleType('fake_type'),
    //           ),
    //           accessRight: AccessRight.empty().copyWith(
    //             orders: true,
    //           ),
    //           disableCreateOrder: true,
    //         ),
    //       ),
    //     );

    //     await getWidget(tester);
    //     await tester.pump();
    //     final orderExpansionTile =
    //         find.byKey(const Key('orderExpansionTile'));
    //     expect(orderExpansionTile, findsOneWidget);
    //   },
    // );

    // testWidgets(
    //   'Home Screen orders is disable, when user is not client admin/user, accessRight->orders is false and disableCreateOrder is true',
    //   (WidgetTester tester) async {
    //     VisibilityDetectorController.instance.updateInterval = Duration.zero;
    //     when(() => userBlocMock.state).thenReturn(
    //       UserState.initial().copyWith(
    //         user: fakeUser.copyWith(
    //           role: Role.empty().copyWith(
    //             type: RoleType('fake_type'),
    //           ),
    //           accessRight: AccessRight.empty().copyWith(
    //             orders: false,
    //           ),
    //           disableCreateOrder: true,
    //         ),
    //       ),
    //     );

    //     await getWidget(tester);
    //     await tester.pump();
    //     final orderExpansionTile =
    //         find.byKey(const Key('orderExpansionTile'));
    //     expect(orderExpansionTile, findsNothing);
    //   },
    // );

    // testWidgets(
    //   'Home Screen orders is disable, when user is not client admin/user, accessRight->orders is false and disableCreateOrder is false',
    //   (WidgetTester tester) async {
    //     VisibilityDetectorController.instance.updateInterval = Duration.zero;
    //     when(() => userBlocMock.state).thenReturn(
    //       UserState.initial().copyWith(
    //         user: fakeUser.copyWith(
    //           role: Role.empty().copyWith(
    //             type: RoleType('fake_type'),
    //           ),
    //           accessRight: AccessRight.empty().copyWith(
    //             orders: false,
    //           ),
    //           disableCreateOrder: false,
    //         ),
    //       ),
    //     );

    //     await getWidget(tester);
    //     await tester.pump();
    //     final orderExpansionTile =
    //         find.byKey(const Key('orderExpansionTile'));
    //     expect(orderExpansionTile, findsNothing);
    //   },
    // );

    // testWidgets('Home Tab disableCreateOrder test',
    //     (WidgetTester tester) async {
    //   when(() => userBlocMock.state).thenReturn(
    //     UserState.initial()
    //         .copyWith(user: User.empty().copyWith(disableCreateOrder: true)),
    //   );

    //   await getWidget(tester);
    // });

    // testWidgets(
    //   'Home Screen userCanCreateOrder test - History Disabled',
    //   (WidgetTester tester) async {
    //     when(() => userBlocMock.state).thenReturn(
    //       UserState.initial().copyWith(
    //         user: fakeUser.copyWith(
    //           disableCreateOrder: true,
    //         ),
    //       ),
    //     );

    //     await getWidget(tester);

    //     final historyTab = find.byKey(const Key('historyTab'));
    //     expect(historyTab, findsNothing);
    //   },
    // );
  });
}
