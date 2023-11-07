import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/core/package_info/package_info.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/browse_products/browse_products.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../utils/widget_utils.dart';

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class MockAppRouter extends Mock implements AppRouter {}

class MaterialListBlocMock
    extends MockBloc<MaterialListEvent, MaterialListState>
    implements MaterialListBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class BannerBlocMock extends MockBloc<BannerEvent, BannerState>
    implements BannerBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class ProductImageBlocMock
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

class MaterialPriceBlocMock
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class ProductDetailBlocMock
    extends MockBloc<ProductDetailEvent, ProductDetailState>
    implements ProductDetailBloc {}

class MockMixpanelService extends Mock implements MixpanelService {}

class MaterialPageXMock extends Mock implements MaterialPageX {}

void main() {
  late CustomerCodeBloc customerCodeBlocMock;
  late CartBloc cartBlocMock;
  late AuthBloc authBlocMock;
  late MaterialListBlocMock materialListBlocMock;
  late UserBloc userBlocMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late BannerBloc bannerBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late MaterialPriceBloc materialPriceBlocMock;
  late ProductDetailBloc productDetailBlocMock;
  late ProductImageBlocMock productImageBlocMock;
  late AppRouter autoRouterMock;
  final locator = GetIt.instance;
  late List<MaterialInfo> materialList;
  final routeData = RouteData(
    route: const RouteMatch(
      name: 'HomeTabRoute',
      segments: [],
      path: 'home',
      stringMatch: 'home',
      key: ValueKey('HomeTabRoute'),
    ),
    router: MockAppRouter(),
    pendingChildren: [],
  );

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    registerFallbackValue(const PageRouteInfo('HomeTabRoute', path: 'home'));
    locator.registerSingleton<MixpanelService>(MockMixpanelService());
    locator.registerFactory<BannerBloc>(() => bannerBlocMock);
    locator.registerFactory<MaterialListBloc>(() => materialListBlocMock);
    locator.registerLazySingleton(() => PackageInfoService());
    materialList = await MaterialListLocalDataSource().getMaterialList();
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    salesOrgBlocMock = SalesOrgBlocMock();
    autoRouterMock = MockAppRouter();
    materialPriceBlocMock = MaterialPriceBlocMock();
    productDetailBlocMock = ProductDetailBlocMock();
    when(() => autoRouterMock.currentPath).thenReturn('home');
    when(() => autoRouterMock.current).thenReturn(routeData);
    when(() => autoRouterMock.current).thenReturn(routeData);

    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    customerCodeBlocMock = CustomerCodeBlocMock();
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    cartBlocMock = CartBlocMock();
    when(() => cartBlocMock.state).thenReturn(CartState.initial());
    authBlocMock = AuthBlocMock();
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    materialListBlocMock = MaterialListBlocMock();
    when(() => materialListBlocMock.state)
        .thenReturn(MaterialListState.initial());
    userBlocMock = UserBlocMock();
    when(() => userBlocMock.state).thenReturn(UserState.initial());
    eligibilityBlocMock = EligibilityBlocMock();
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    bannerBlocMock = BannerBlocMock();
    when(() => bannerBlocMock.state).thenReturn(BannerState.initial());
    productImageBlocMock = ProductImageBlocMock();
    when(() => productImageBlocMock.state)
        .thenReturn(ProductImageState.initial());
    when(() => materialPriceBlocMock.state)
        .thenReturn(MaterialPriceState.initial());
    when(() => productDetailBlocMock.state)
        .thenReturn(ProductDetailState.initial());
  });

  Future getWidget(tester) async {
    return await tester.pumpWidget(
      WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<UserBloc>(
            create: (context) => userBlocMock,
          ),
          BlocProvider<AuthBloc>(
            create: (context) => authBlocMock,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBlocMock,
          ),
          BlocProvider<BannerBloc>(
            create: (context) => bannerBlocMock,
          ),
          BlocProvider<SalesOrgBloc>(
            create: (context) => salesOrgBlocMock,
          ),
          BlocProvider<MaterialListBloc>(
            create: (context) => materialListBlocMock,
          ),
          BlocProvider<CartBloc>(create: (context) => cartBlocMock),
          BlocProvider<ProductImageBloc>(
            create: (context) => productImageBlocMock,
          ),
          BlocProvider<MaterialPriceBloc>(
            create: (context) => materialPriceBlocMock,
          ),
          BlocProvider<ProductDetailBloc>(
            create: (context) => productDetailBlocMock,
          ),
        ],
        child: const Scaffold(body: BrowseProduct()),
      ),
    );
  }

  group('Browse Product Test', () {
    testWidgets(
      ' -> Find Browse Product',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );
        await getWidget(tester);
        await tester.pump();
        final browseProductFinder = find.byType(BrowseProduct);
        expect(browseProductFinder, findsOneWidget);
      },
    );
    testWidgets(
      ' -> Find Browse Product body loading test',
      (tester) async {
        when(() => materialListBlocMock.state).thenReturn(
          MaterialListState.initial().copyWith(
            isFetching: true,
          ),
        );
        await getWidget(tester);
        await tester.pump();
        final browseProductLoadingShimmerFinder =
            find.byKey(WidgetKeys.browseProductLoadingShimmer);
        expect(browseProductLoadingShimmerFinder, findsOneWidget);
      },
    );
    testWidgets(
      ' -> Find Browse Product body test',
      (WidgetTester tester) async {
        when(() => materialListBlocMock.state).thenReturn(
          MaterialListState.initial().copyWith(
            materialList: materialList,
          ),
        );

        await getWidget(tester);
        await tester.pump();
        final browseProductBodyFinder = find.byKey(WidgetKeys.browseProduct);
        expect(browseProductBodyFinder, findsOneWidget);
        final browseProductIconFinder =
            find.byKey(WidgetKeys.browseProductIcon);
        expect(browseProductIconFinder, findsOneWidget);
        final browseProductsListFinder = find.byKey(
          WidgetKeys.browseProductsList,
        );
        if (materialList.length > 4) {
          expect(browseProductsListFinder, findsNWidgets(4));
        } else {
          expect(browseProductsListFinder, findsNWidgets(materialList.length));
        }
      },
    );

    testWidgets(
      ' -> Tap Browse Product Icon test',
      (WidgetTester tester) async {
        when(() => autoRouterMock.navigate(any()))
            .thenAnswer((_) async => true);
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeSalesOrganisationConfigs,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            salesOrganisation: fakeSalesOrganisation,
          ),
        );
        when(() => materialListBlocMock.state).thenReturn(
          MaterialListState.initial().copyWith(
            materialList: materialList,
            selectedMaterialFilter:
                MaterialFilter.empty().copyWith(isFavourite: true),
          ),
        );

        await getWidget(tester);
        await tester.pump();
        final browseProductIconFinder =
            find.byKey(WidgetKeys.browseProductIcon);
        expect(browseProductIconFinder, findsOneWidget);
        final browseProductIcon =
            find.byKey(WidgetKeys.sectionTileIcon('Browse products'.tr()));
        expect(browseProductIcon, findsOneWidget);
        await tester.tap(browseProductIcon);
        await tester.pump();
        verify(
          () => materialListBlocMock.add(
            MaterialListEvent.fetch(
              configs: fakeSalesOrganisationConfigs,
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisation: fakeSalesOrganisation,
              selectedMaterialFilter: MaterialFilter.empty(),
              shipToInfo: fakeShipToInfo,
            ),
          ),
        ).called(1);
      },
    );

    testWidgets(
      ' -> Tap Browse Product List item test',
      (WidgetTester tester) async {
        when(() => autoRouterMock.pushNamed(any()))
            .thenAnswer((invocation) async => true);
        when(() => materialListBlocMock.state).thenReturn(
          MaterialListState.initial().copyWith(
            materialList: materialList,
          ),
        );

        await getWidget(tester);
        await tester.pump();
        final browseProductBodyFinder = find.byKey(WidgetKeys.browseProduct);
        expect(browseProductBodyFinder, findsOneWidget);
        await tester.drag(browseProductBodyFinder, const Offset(0, -1000));

        final browseProductsListFinder = find.byKey(
          WidgetKeys.browseProductsList,
        );
        if (materialList.length > 4) {
          expect(browseProductsListFinder, findsNWidgets(4));
        } else {
          expect(browseProductsListFinder, findsNWidgets(materialList.length));
        }
        await tester.tap(browseProductsListFinder.first);
        await tester.pump();
        verify(
          () => productDetailBlocMock.add(
            ProductDetailEvent.fetch(
              materialNumber: materialList.first.materialNumber,
              locale: const Locale('en'),
              type: materialList.first.type,
            ),
          ),
        ).called(1);
      },
    );
  });
}
