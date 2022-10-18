import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/config.dart';
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

void main() {
  final AuthBloc authBlocMock = AuthBlocMock();
  final UserBloc userBlocMock = UserBlocMock();
  final SalesOrgBloc salesOrgBlocMock = SalesOrgBlocMock();
  final CustomerCodeBloc customerCodeBlocMock = CustomerCodeBlocMock();
  final ShipToCodeBloc shipToCodeBLocMock = ShipToCodeBlocMock();

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
          ],
        );
    // TODO: need Wasim help
    // testWidgets('Test when in initial state', (tester) async {
    //   final expectedStates = [
    //     const AuthState.initial(),
    //   ];
    //   when(() => authBlocMock.state)
    //       .thenReturn(const AuthState.unauthenticated());
    //   whenListen(authBlocMock, Stream.fromIterable(expectedStates));
    //   await tester.pumpWidget(splashPage());
    //   await tester.pump();
    //   final splashLoadingIndicator =
    //       find.byKey(const Key('splashLoadingIndicator'), skipOffstage: false);
    //   expect(splashLoadingIndicator, findsOneWidget);
    // });
    // testWidgets('Test when in loading state', (tester) async {
    //   final expectedStates = [
    //     const AuthState.loading(),
    //   ];
    //   when(() => authBlocMock.state)
    //       .thenReturn(const AuthState.unauthenticated());
    //   whenListen(authBlocMock, Stream.fromIterable(expectedStates));
    //   await tester.pumpWidget(splashPage());
    //   await tester.pump();
    //   final splashLoadingIndicator =
    //       find.byKey(const Key('splashLoadingIndicator'), skipOffstage: false);
    //   expect(splashLoadingIndicator, findsOneWidget);
    // });

    // testWidgets('Test when in unauthenticated state', (tester) async {
    //   final expectedStates = [
    //     const AuthState.unauthenticated(),
    //   ];

    //   whenListen(authBlocMock, Stream.fromIterable(expectedStates),
    //       initialState: const AuthState.initial());

    //   await tester.pumpWidget(splashPage());
    //   await tester.pumpAndSettle();
    //   expect(router.current.name, LoginPageRoute.name);
    // });

    // testWidgets('Test when in authenticated state', (tester) async {
    //   final expectedStates = [
    //     const AuthState.authenticated(),
    //   ];

    //   whenListen(authBlocMock, Stream.fromIterable(expectedStates),
    //       initialState: const AuthState.initial());

    //   await tester.pumpWidget(splashPage());
    //   await tester.pumpAndSettle();
    //   expect(router.current.name, HomeNavigationTabbarRoute.name);
    // });

    // testWidgets('Test when User state change', (tester) async {
    //   final fakeSalesOrganisation = SalesOrganisation.empty();

    //   final userStream = [
    //     UserState.initial().copyWith(
    //         user: User.empty().copyWith(
    //             username: Username('fake-name'),
    //             userSalesOrganisations: [SalesOrganisation.empty()])),
    //   ];

    //   whenListen(userBlocMock, Stream.fromIterable(userStream),
    //       initialState: UserState.initial());

    //   await tester.pumpWidget(splashPage());

    //   expect(userBlocMock.state.user.userSalesOrganisations.first,
    //       fakeSalesOrganisation);

    //   verify(() => salesOrgBlocMock.add(
    //           SalesOrgEvent.selected(salesOrganisation: fakeSalesOrganisation)))
    //       .called(1);
    // });
  });
}
