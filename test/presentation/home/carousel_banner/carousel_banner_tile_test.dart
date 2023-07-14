import 'package:bloc_test/bloc_test.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/home/banners/carousel_banner/carousel_banner_tile.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';

import '../../order_history/order_history_details_widget_test.dart';

class MockHTTPService extends Mock implements HttpService {}

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

void main() {
  late GetIt locator;
  late HttpService mockHTTPService;
  late UserBloc userBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late AuthBloc authBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late MaterialListBloc materialListBloc;
  late EligibilityBlocMock eligibilityBlocMock;
  late MaterialFilterBloc materialfilterBlocMock;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    WidgetsFlutterBinding.ensureInitialized();
    locator = GetIt.instance;
    locator.registerLazySingleton(() => MixpanelService());
    locator<MixpanelService>().init(mixpanel: MixpanelMock());
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    mockHTTPService = MockHTTPService();
    locator.registerLazySingleton<HttpService>(
      () => mockHTTPService,
    );
  });

  group('Banner Tile', () {
    setUp(() {
      userBlocMock = UserBlocMock();
      salesOrgBlocMock = SalesOrgBlocMock();
      authBlocMock = AuthBlocMock();
      customerCodeBlocMock = CustomerCodeBlocMock();
      materialListBloc = MaterialListBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      materialfilterBlocMock = MockMaterialFilterBloc();

      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => materialListBloc.state)
          .thenReturn(MaterialListState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
      when(() => materialfilterBlocMock.state)
          .thenReturn(MaterialFilterState.initial());
    });

    Widget getWUT() {
      final banner = BannerItem.empty().copyWith(
        id: 1,
        title: 'Test Banner',
        url: 'https://test.com/banner.jpg',
        urlLink: 'https://test.com',
        isKeyword: true,
        keyword: 'Test Keyword',
      );
      final bannerTile = CarouselBannerTile(banner: banner, bannerPosition: 1);
      return MaterialApp(
        home: Scaffold(
          body: bannerTile,
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
      final banner = BannerItem.empty().copyWith(
        id: 1,
        title: 'Test Banner',
        url: 'https://example.com/banner.jpg',
        urlLink: 'https://example.com',
        isKeyword: true,
        keyword: 'test',
      );

      await tester.pumpWidget(
          MaterialApp(home: CarouselBannerTile(banner: banner, bannerPosition: 1)));

      expect(find.text('Test Banner'), findsNothing);
      expect(find.byType(CachedNetworkImage), findsOneWidget);
      expect(find.byType(LoadingShimmer), findsOneWidget);
    });
  });
}
