import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/material_frame_wrapper.dart';
import '../../utils/widget_utils.dart';

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  late AuthBloc authBlocMock;
  late AppRouter router;
  setUpAll(() {
    GetIt.instance.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
  });

  group('Splash Screen', () {
    setUp(() {
      authBlocMock = AuthBlocMock();
      router = AppRouter();
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    });

    testWidgets('Test when in initial state', (tester) async {
      final expectedStates = [
        const AuthState.initial(),
      ];
      when(() => authBlocMock.state)
          .thenReturn(const AuthState.unauthenticated());
      whenListen(authBlocMock, Stream.fromIterable(expectedStates));
      await tester.pumpWidget(MaterialFrameWrapper(
        child: BlocProvider<AuthBloc>(
          create: (context) => authBlocMock,
          child: const SplashPage(),
        ),
      ));
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
      await tester.pumpWidget(MaterialFrameWrapper(
        child: BlocProvider<AuthBloc>(
          create: (context) => authBlocMock,
          child: const SplashPage(),
        ),
      ));
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

      await tester.pumpWidget(WidgetUtils.getScopedWidget(
        autoRouterMock: router,
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => authBlocMock,
          )
        ],
        child: const SplashPage(),
      ));
      await tester.pumpAndSettle();
      expect(router.current.name, LoginPageRoute.name);
    });

    testWidgets('Test when in authenticated state', (tester) async {
      final expectedStates = [
        const AuthState.authenticated(),
      ];

      whenListen(authBlocMock, Stream.fromIterable(expectedStates),
          initialState: const AuthState.initial());

      await tester.pumpWidget(WidgetUtils.getScopedWidget(
        autoRouterMock: router,
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => authBlocMock,
          )
        ],
        child: const SplashPage(),
      ));
      await tester.pumpAndSettle();
      expect(router.current.name, HomeNavigationTabbarRoute.name);
    });
  });
}
