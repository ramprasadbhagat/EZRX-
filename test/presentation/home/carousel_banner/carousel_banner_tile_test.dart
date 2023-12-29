import 'package:bloc_test/bloc_test.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/product_search/product_search_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/banner/entities/ez_reach_banner.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/home/banners/carousel_banner/carousel_banner_tile.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';

import '../../../utils/widget_utils.dart';

class MockHTTPService extends Mock implements HttpService {}

class MixpanelServiceMock extends Mock implements MixpanelService {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class MaterialListBlocMock
    extends MockBloc<MaterialListEvent, MaterialListState>
    implements MaterialListBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class MockMaterialFilterBloc
    extends MockBloc<MaterialFilterEvent, MaterialFilterState>
    implements MaterialFilterBloc {}

class MockProductSearchBloc
    extends MockBloc<ProductSearchEvent, ProductSearchState>
    implements ProductSearchBloc {}

void main() {
  late GetIt locator;
  late HttpService mockHTTPService;
  late MixpanelService mixpanelServiceMock;
  late UserBloc userBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late AuthBloc authBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late MaterialListBloc materialListBloc;
  late EligibilityBlocMock eligibilityBlocMock;
  late MaterialFilterBloc materialFilterBlocMock;
  late ProductSearchBloc productSearchBlocMock;
  late AppRouter autoRouterMock;
  const fakeKeyword = 'Test Keyword';

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    WidgetsFlutterBinding.ensureInitialized();
    locator = GetIt.instance;
    locator.registerLazySingleton(
      () => mixpanelServiceMock,
    );

    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    mockHTTPService = MockHTTPService();
    locator.registerLazySingleton<HttpService>(
      () => mockHTTPService,
    );
    mixpanelServiceMock = MixpanelServiceMock();
    userBlocMock = UserBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();
    authBlocMock = AuthBlocMock();
    customerCodeBlocMock = CustomerCodeBlocMock();
    materialListBloc = MaterialListBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    materialFilterBlocMock = MockMaterialFilterBloc();
    productSearchBlocMock = MockProductSearchBloc();
    autoRouterMock = locator<AppRouter>();

    when(() => userBlocMock.state).thenReturn(UserState.initial());
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    when(() => materialListBloc.state).thenReturn(MaterialListState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => materialFilterBlocMock.state)
        .thenReturn(MaterialFilterState.initial());

    when(() => productSearchBlocMock.state)
        .thenReturn(ProductSearchState.initial());
  });

  group('Banner Tile', () {
    Widget getWUT() {
      final banner = EZReachBanner.empty().copyWith(
        id: '1',
        title: 'Test Banner',
        tabBannerUrl: 'https://test.com/banner.jpg',
        navigationalURL: 'https://test.com',
        isKeyword: true,
        keyword: fakeKeyword,
      );
      final bannerTile = CarouselBannerTile(banner: banner, bannerPosition: 1);
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<ProductSearchBloc>(
            create: (context) => productSearchBlocMock,
          ),
          BlocProvider<MaterialFilterBloc>(
            create: (context) => materialFilterBlocMock,
          ),
        ],
        child: Material(
          child: bannerTile,
        ),
      );
    }

    testWidgets('Banner test', (tester) async {
      await tester.pumpWidget(getWUT());
      await tester.pump();

      final bannerTile = find.byType(CarouselBannerTile);
      expect(
        bannerTile,
        findsOneWidget,
      );
    });

    testWidgets('BannerTile renders correctly with given banner item',
        (WidgetTester tester) async {
      final banner = EZReachBanner.empty().copyWith(
        id: '1',
        title: 'Test Banner',
        tabBannerUrl: 'https://example.com/banner.jpg',
        navigationalURL: 'https://example.com',
        isKeyword: true,
        keyword: 'test',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: CarouselBannerTile(banner: banner, bannerPosition: 1),
        ),
      );

      expect(find.text('Test Banner'), findsNothing);
      expect(find.byType(CachedNetworkImage), findsOneWidget);
      expect(find.byType(LoadingShimmer), findsOneWidget);
    });

    testWidgets('Tap on banner and search keyword', (tester) async {
      await tester.pumpWidget(getWUT());
      await tester.pump();
      final bannerTile = find.byType(CarouselBannerTile);
      await tester.tap(bannerTile);
      verify(
        () => productSearchBlocMock.add(
          ProductSearchEvent.searchProduct(
            searchKey: SearchKey.search(
              fakeKeyword,
            ),
            materialFilter: MaterialFilter.empty(),
          ),
        ),
      ).called(1);
      expect(autoRouterMock.current.path, 'product_suggestion_page');
    });
  });
}
