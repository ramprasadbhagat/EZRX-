import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/package_info/package_info.dart';
import 'package:ezrxmobile/presentation/home/combo_offers_section/combo_offers_section.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';

import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../utils/widget_utils.dart';

class MockAppRouter extends Mock implements AppRouter {}

class MaterialListBlocMock
    extends MockBloc<MaterialListEvent, MaterialListState>
    implements MaterialListBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class MaterialFilterBlocMock
    extends MockBloc<MaterialFilterEvent, MaterialFilterState>
    implements MaterialFilterBloc {}

void main() {
  late CustomerCodeBloc customerCodeBlocMock;
  late AuthBloc authBlocMock;
  late MaterialListBlocMock materialListBlocMock;
  late UserBloc userBlocMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late MaterialFilterBloc materialFilterBlocMock;
  late AppRouter autoRouterMock;
  final locator = GetIt.instance;
  final routeData = RouteData(
    stackKey: const Key(''),
    type: const RouteType.adaptive(),
    route: RouteMatch(
      segments: const [],
      config: AutoRoute(
        page: const PageInfo(HomeTabRoute.name),
      ),
      stringMatch: 'home',
      key: const ValueKey('HomeTabRoute'),
    ),
    router: MockAppRouter(),
    pendingChildren: [],
  );

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    registerFallbackValue(const PageRouteInfo('HomeTabRoute'));
    locator.registerFactory<MaterialListBloc>(() => materialListBlocMock);
    locator.registerLazySingleton(() => PackageInfoService());
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    salesOrgBlocMock = SalesOrgBlocMock();
    autoRouterMock = MockAppRouter();
    materialFilterBlocMock = MaterialFilterBlocMock();
    when(() => autoRouterMock.currentPath).thenReturn('home');
    when(() => autoRouterMock.current).thenReturn(routeData);
    when(() => autoRouterMock.current).thenReturn(routeData);

    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    customerCodeBlocMock = CustomerCodeBlocMock();
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
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
    when(() => materialFilterBlocMock.state)
        .thenReturn(MaterialFilterState.initial());
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
          BlocProvider<SalesOrgBloc>(
            create: (context) => salesOrgBlocMock,
          ),
          BlocProvider<MaterialListBloc>(
            create: (context) => materialListBlocMock,
          ),
          BlocProvider<MaterialFilterBloc>(
            create: (context) => materialFilterBlocMock,
          ),
        ],
        child: const Scaffold(body: ComboOffersSection()),
      ),
    );
  }

  group('Combo Offers Section Test', () {
    testWidgets(
      ' -> Find Combo Offers Section',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );
        await getWidget(tester);
        await tester.pump();
        final comboOffersSectionFinder = find.byType(ComboOffersSection);
        expect(comboOffersSectionFinder, findsOneWidget);
      },
    );
  });
}
