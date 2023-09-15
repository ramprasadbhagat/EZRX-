import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/account/sales_org_search.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import '../../utils/widget_utils.dart';
import '../order_history/order_history_details_widget_test.dart';

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class MockAppRouter extends Mock implements AppRouter {}

final locator = GetIt.instance;

void main() {
  final availableSalesOrgList = [
    SalesOrganisation.empty().copyWith(
      salesOrg: SalesOrg('2501'),
    ),
    SalesOrganisation.empty().copyWith(
      salesOrg: SalesOrg('2504'),
    )
  ];
  final salesOrgState = SalesOrgState.initial().copyWith(
    searchKey: SearchKey(''),
    availableSalesOrg: availableSalesOrgList,
  );
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late UserBloc userBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late AppRouter autoRouterMock;
  late CartBloc cartBlocMock;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  setUpAll(() {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(
      () => MixpanelService(config: locator<Config>()),
    );
    locator.registerLazySingleton(() => AppRouter());
  });

  group('Test "Sales Org Search"', () {
    setUp(() async {
      userBlocMock = UserBlocMock();
      salesOrgBlocMock = SalesOrgBlocMock();
      customerCodeBlocMock = CustomerCodeBlocMock();
      cartBlocMock = CartBlocMock();
      authBlocMock = AuthBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      autoRouterMock = locator<AppRouter>();
      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => cartBlocMock.state).thenReturn(CartState.initial());
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
    });
    tearDownAll(() {
      locator.unregister<AppRouter>();
    });

    RouteDataScope getScopedWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<UserBloc>(create: (context) => userBlocMock),
          BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBlocMock),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBlocMock,
          ),
          BlocProvider<CartBloc>(create: (context) => cartBlocMock),
          BlocProvider<AuthBloc>(create: (context) => authBlocMock),
          BlocProvider<AnnouncementBloc>(
            create: (context) => announcementBlocMock,
          ),
        ],
        child: SalesOrgSearch(
          key: const Key('salesOrgSearchPage'),
          avialableSalesOrgList: availableSalesOrgList,
        ),
      );
    }

    testWidgets('Content Display When User Can Search Sales Org',
        (tester) async {
      when(() => salesOrgBlocMock.state).thenReturn(
        salesOrgState,
      );

      await tester.pumpWidget(getScopedWidget());
      final salesOrgSearchPage = find.byKey(const Key('salesOrgSearchPage'));
      expect(salesOrgSearchPage, findsOneWidget);

      final salesOrgSearchField = find.byType(TextFormField);
      expect(salesOrgSearchField, findsOneWidget);

      final salesOrgSearchListView = find.byType(ListView);
      expect(salesOrgSearchListView, findsOneWidget);
    });

    testWidgets('User Search Sales Org', (tester) async {
      when(() => salesOrgBlocMock.state).thenReturn(
        salesOrgState,
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextFormField), '2501');
      await tester.pumpAndSettle(const Duration(seconds: 2));
      verify(
        () => salesOrgBlocMock.add(
          SalesOrgEvent.searchSalesOrg(
            searchKey: SearchKey('2501'),
            salesOrgList: availableSalesOrgList,
          ),
        ),
      ).called(1);

      final firstSaleOrgItem = find.byType(ListView).first;
      expect(firstSaleOrgItem, findsOneWidget);
    });

    testWidgets('User Search Error Sales Org', (tester) async {
      when(() => salesOrgBlocMock.state).thenReturn(
        salesOrgState,
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextFormField), '2502');
      await tester.pumpAndSettle(const Duration(seconds: 2));

      verify(
        () => salesOrgBlocMock.add(
          SalesOrgEvent.searchSalesOrg(
            searchKey: SearchKey('2502'),
            salesOrgList: availableSalesOrgList,
          ),
        ),
      ).called(1);

      final firstSaleOrgItem = find.widgetWithText(Text, '2502');
      expect(firstSaleOrgItem, findsNothing);
    });

    testWidgets('Tap on SaleOrgItem', (tester) async {
      when(() => salesOrgBlocMock.state).thenReturn(
        salesOrgState,
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextFormField), '2501');
      await tester.pumpAndSettle(const Duration(seconds: 2));

      final firstSaleOrgItem = find.byType(ListTile).first;
      expect(firstSaleOrgItem, findsOneWidget);

      await tester.tap(firstSaleOrgItem);
      verify(
        () => salesOrgBlocMock.add(
          SalesOrgEvent.selected(
            salesOrganisation:
                SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2501')),
          ),
        ),
      ).called(1);
      await tester.pumpAndSettle();
    });
  });
}
