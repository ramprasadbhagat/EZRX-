import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import '../../utils/widget_utils.dart';

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class ShipToCodeBlocMock extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class SavedOrderBlocMock
    extends MockBloc<SavedOrderListEvent, SavedOrderListState>
    implements SavedOrderListBloc {}

void main() {
  final AuthBloc authBlocMock = AuthBlocMock();
  final UserBloc userBlocMock = UserBlocMock();
  final SalesOrgBloc salesOrgBlocMock = SalesOrgBlocMock();
  final CustomerCodeBloc customerCodeBlocMock = CustomerCodeBlocMock();
  final ShipToCodeBloc shipToCodeBLocMock = ShipToCodeBlocMock();

  final SavedOrderListBloc savedOrderBlocMock = SavedOrderBlocMock();

  late AppRouter router;
  setUpAll(() {
    GetIt.instance.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
  });

  group('Splash Screen', () {
    setUp(() {
      router = AppRouter();
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => shipToCodeBLocMock.state)
          .thenReturn(ShipToCodeState.initial());

      when(() => savedOrderBlocMock.state)
          .thenReturn(SavedOrderListState.initial());
    });

    Widget splashPage() => WidgetUtils.getScopedWidget(
          child: const SplashPage(),
          autoRouterMock: router,
          providers: [
            BlocProvider<AuthBloc>(
              create: (context) => authBlocMock,
            ),
            BlocProvider<UserBloc>(
              create: (context) => userBlocMock,
            ),
            BlocProvider<SalesOrgBloc>(
              create: (context) => salesOrgBlocMock,
            ),
            BlocProvider<CustomerCodeBloc>(
              create: (context) => customerCodeBlocMock,
            ),
            BlocProvider<ShipToCodeBloc>(
              create: (context) => shipToCodeBLocMock,
            ),
            BlocProvider<SavedOrderListBloc>(
              create: (context) => savedOrderBlocMock,
            ),
          ],
        );

    testWidgets('Test when in initial state', (tester) async {
      final expectedStates = [
        const AuthState.initial(),
      ];
      when(() => authBlocMock.state)
          .thenReturn(const AuthState.unauthenticated());
      whenListen(authBlocMock, Stream.fromIterable(expectedStates));
      await tester.pumpWidget(splashPage());
      await tester.pump();
      final splashLoadingIndicator =
          find.byKey(const Key('splashLoadingIndicator'), skipOffstage: false);
      expect(splashLoadingIndicator, findsOneWidget);
    });
    testWidgets('Test when in loading state', (tester) async {
      final expectedStates = [
        const AuthState.loading(),
      ];
      when(() => authBlocMock.state)
          .thenReturn(const AuthState.unauthenticated());
      whenListen(authBlocMock, Stream.fromIterable(expectedStates));
      await tester.pumpWidget(splashPage());
      await tester.pump();
      final splashLoadingIndicator =
          find.byKey(const Key('splashLoadingIndicator'), skipOffstage: false);
      expect(splashLoadingIndicator, findsOneWidget);
    });

    testWidgets('Test when in unauthenticated state', (tester) async {
      final expectedStates = [
        const AuthState.unauthenticated(),
      ];

      whenListen(authBlocMock, Stream.fromIterable(expectedStates),
          initialState: const AuthState.initial());

      await tester.pumpWidget(splashPage());
      await tester.pumpAndSettle();
      expect(router.current.name, LoginPageRoute.name);
    });

    testWidgets('Test when in authenticated state', (tester) async {
      final expectedStates = [
        const AuthState.authenticated(),
      ];

      whenListen(authBlocMock, Stream.fromIterable(expectedStates),
          initialState: const AuthState.initial());

      await tester.pumpWidget(splashPage());
      await tester.pumpAndSettle();
      expect(router.current.name, HomeNavigationTabbarRoute.name);
    });

    testWidgets('Test when User state change', (tester) async {
      final fakeSalesOrganisation = SalesOrganisation.empty();

      final userStream = [
        UserState.initial().copyWith(
            user: User.empty().copyWith(
                username: Username('fake-name'),
                userSalesOrganisations: [SalesOrganisation.empty()])),
      ];

      whenListen(userBlocMock, Stream.fromIterable(userStream),
          initialState: UserState.initial());

      await tester.pumpWidget(splashPage());

      expect(userBlocMock.state.user.userSalesOrganisations.first,
          fakeSalesOrganisation);

      verify(() => salesOrgBlocMock.add(
              SalesOrgEvent.selected(salesOrganisation: fakeSalesOrganisation)))
          .called(1);
    });

    //TODO: Wasim move these to home tab

    // testWidgets('Test when SalesOrg state change', (tester) async {
    //   final fakeSalesOrganisation = SalesOrganisation.empty()
    //       .copyWith(salesOrg: SalesOrg('fake-saleOrg'));

    //   final fakeUser = User.empty().copyWith(username: Username('fake-name'));
    //   final salesOrgStream = [
    //     SalesOrgState.initial().copyWith(
    //       salesOrganisation: fakeSalesOrganisation,
    //       configs:
    //           SalesOrganisationConfigs.empty().copyWith(hideCustomer: true),
    //     )
    //   ];

    //   when(() => userBlocMock.state)
    //       .thenReturn(UserState.initial().copyWith(user: fakeUser));

    //   whenListen(salesOrgBlocMock, Stream.fromIterable(salesOrgStream),
    //       initialState: SalesOrgState.initial());

    //   await tester.pumpWidget(splashPage());

    //   expect(salesOrgBlocMock.state.haveSelectedSalesOrganisation, true);
    //   expect(salesOrgBlocMock.state.configs.hideCustomer, true);
    //   expect(salesOrgBlocMock.state.salesOrganisation, fakeSalesOrganisation);
    //   expect(userBlocMock.state.user, fakeUser);

    //   verify(
    //     () => customerCodeBlocMock.add(
    //       CustomerCodeEvent.fetch(
    //         hidecustomer: true,
    //         userInfo: fakeUser,
    //         selectedSalesOrg: fakeSalesOrganisation,
    //         isRefresh: true,
    //       ),
    //     ),
    //   ).called(1);
    // });

    // testWidgets('Test when CustomerCode state change', (tester) async {
    //   final fakeShipToInfo1 = ShipToInfo.empty()
    //       .copyWith(defaultShipToAddress: false, building: 'fake-building1');
    //   final fakeShipToInfo2 = ShipToInfo.empty()
    //       .copyWith(defaultShipToAddress: true, building: 'fake-building2');
    //   final customerCodeStream = [
    //     CustomerCodeState.initial().copyWith(
    //         customeCodeInfo: CustomerCodeInfo.empty()
    //             .copyWith(shipToInfos: [fakeShipToInfo1, fakeShipToInfo2]))
    //   ];

    //   whenListen(customerCodeBlocMock, Stream.fromIterable(customerCodeStream),
    //       initialState: CustomerCodeState.initial());

    //   await tester.pumpWidget(splashPage());

    //   expect(
    //     customerCodeBlocMock.state.defaultShipToInfo,
    //     fakeShipToInfo2,
    //   );

    //   verify(
    //     () => shipToCodeBLocMock
    //         .add(ShipToCodeEvent.selected(shipToInfo: fakeShipToInfo2)),
    //   ).called(1);
    // });

    // testWidgets(
    //     'Test when ShipToCode state change and trigger Saved Order list fetch',
    //     (tester) async {
    //   final fakeUser = User.empty().copyWith(username: Username('fake-name'));
    //   final fakeSaleOrg =
    //       SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('fake-name'));
    //   final fakeCustomerCode =
    //       CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: 'fake-name');
    //   final fakeShipToCode = ShipToInfo.empty().copyWith(building: 'fake-name');
    //   final shipToCodeStream = [
    //     ShipToCodeState.initial().copyWith(shipToInfo: fakeShipToCode)
    //   ];

    //   whenListen(shipToCodeBLocMock, Stream.fromIterable(shipToCodeStream),
    //       initialState: ShipToCodeState.initial());

    //   when(() => userBlocMock.state)
    //       .thenReturn(UserState.initial().copyWith(user: fakeUser));
    //   when(() => salesOrgBlocMock.state).thenReturn(
    //       SalesOrgState.initial().copyWith(salesOrganisation: fakeSaleOrg));
    //   when(() => customerCodeBlocMock.state).thenReturn(
    //       CustomerCodeState.initial()
    //           .copyWith(customeCodeInfo: fakeCustomerCode));

    //   await tester.pumpWidget(splashPage());

    //   expect(shipToCodeBLocMock.state.haveShipTo, true);
    //   expect(userBlocMock.state.user, fakeUser);
    //   expect(salesOrgBlocMock.state.salesOrganisation, fakeSaleOrg);
    //   expect(customerCodeBlocMock.state.customeCodeInfo, fakeCustomerCode);
    //   expect(shipToCodeBLocMock.state.shipToInfo, fakeShipToCode);

    //   verify(() => savedOrderBlocMock.add(
    //         SavedOrderListEvent.fetch(
    //             userInfo: fakeUser,
    //             selectedSalesOrganisation: fakeSaleOrg,
    //             selectedCustomerCode: fakeCustomerCode,
    //             selectedShipTo: fakeShipToCode),
    //       )).called(1);
    // });
  });
}
