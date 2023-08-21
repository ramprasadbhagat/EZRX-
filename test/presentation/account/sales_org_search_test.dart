import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/account/sales_org_search.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
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
    locator.registerLazySingleton(() => MixpanelService());
    locator<MixpanelService>().init(mixpanel: MixpanelMock());
    locator.registerLazySingleton(() => AppRouter());
  });

  group('Customer Search Screen', () {
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
          avialableSalesOrgList: availableSalesOrgList,
        ),
      );
    }

    testWidgets(
      'Test delivery address search',
      (tester) async {
        when(() => customerCodeBlocMock.state).thenReturn(
          CustomerCodeState.initial().copyWith(
            customerCodeList: [
              CustomerCodeInfo.empty().copyWith(
                telephoneNumber: PhoneNumber('1234567890'),
                customerCodeSoldTo: '123456789',
                shipToInfos: <ShipToInfo>[
                  ShipToInfo.empty().copyWith(
                    shipToCustomerCode: '12345678',
                    defaultShipToAddress: true,
                  ),
                ],
                paymentTermDescription: '30 days',
              ),
            ],
            shipToInfo: ShipToInfo.empty().copyWith(
              shipToCustomerCode: '12345678',
            ),
            searchKey: SearchKey('fake-key'),
          ),
        );
        when(() => salesOrgBlocMock.state).thenReturn(
          SalesOrgState.initial().copyWith(
            salesOrganisation:
                SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2501')),
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final salesOrgText = find.text('Select sales org');
        expect(salesOrgText, findsOneWidget);
        final searchField = find.byType(TextFormField);

        await tester.enterText(searchField, 'fake-salesOrg');
        await tester.pump(const Duration(seconds: 5));
        verify(
          () => salesOrgBlocMock.add(
            SalesOrgEvent.searchSalesOrg(
              salesOrgList: availableSalesOrgList,
              searchKey: SearchKey('fake-salesOrg'),
            ),
          ),
        );
        await tester.pump();
      },
    );

    testWidgets(
      'Test select sales org',
      (tester) async {
        when(() => customerCodeBlocMock.state).thenReturn(
          CustomerCodeState.initial().copyWith(
            customerCodeList: [
              CustomerCodeInfo.empty().copyWith(
                telephoneNumber: PhoneNumber('1234567890'),
                customerCodeSoldTo: '123456789',
                shipToInfos: <ShipToInfo>[
                  ShipToInfo.empty().copyWith(
                    shipToCustomerCode: '12345678',
                    defaultShipToAddress: true,
                  ),
                ],
                paymentTermDescription: '30 days',
              ),
            ],
            shipToInfo: ShipToInfo.empty().copyWith(
              shipToCustomerCode: '12345678',
            ),
            searchKey: SearchKey('fake-key'),
          ),
        );
        when(() => salesOrgBlocMock.state).thenReturn(
          SalesOrgState.initial().copyWith(
            availableSalesOrg: availableSalesOrgList,
            salesOrganisation:
                SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2501')),
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final salesOrgText = find.text('Select sales org');
        expect(salesOrgText, findsOneWidget);
        final searchField = find.byType(TextFormField);

        await tester.enterText(searchField, 'fake-salesOrg');
        await tester.pump(const Duration(seconds: 5));
        verify(
          () => salesOrgBlocMock.add(
            SalesOrgEvent.searchSalesOrg(
              salesOrgList: availableSalesOrgList,
              searchKey: SearchKey('fake-salesOrg'),
            ),
          ),
        );
        await tester.pump(const Duration(seconds: 5));
        final salesOrgTile = find.byKey(WidgetKeys.genericKey(key: '2501'));

        await tester.tap(salesOrgTile);

        await tester.pump();
      },
    );
  });
}
