import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/aup_tc/aup_tc_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/core/package_info/package_info.dart';
import 'package:ezrxmobile/presentation/aup_tc/aup_tc.dart';
import 'package:ezrxmobile/presentation/home_tab.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/material_frame_wrapper.dart';

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class MockAupTcBloc extends MockBloc<AupTcEvent, AupTcState>
    implements AupTcBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class ShipToCodeBlocMock extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

void main() {
  late GetIt locator;
  late AuthBloc mockAuthBloc;
  late AppRouter autoRouterMock;
  late MockAupTcBloc mockAupTcBloc;
  late UserBloc userBlocMock;
  late AuthBloc authBlocMock;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    mockAuthBloc = MockAuthBloc();
    mockAupTcBloc = MockAupTcBloc();
    locator = GetIt.instance;
    locator.registerLazySingleton(() => AppRouter());
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    locator.registerLazySingleton(() => mockAuthBloc);
    locator.registerLazySingleton(() => PackageInfoService());
    autoRouterMock = locator<AppRouter>();
  });

  group('AupTc Widget Show hide base on state.showTermsAndConditon true', () {
    setUp(() {
      autoRouterMock = locator<AppRouter>();
      userBlocMock = UserBlocMock();
      authBlocMock = AuthBlocMock();
      autoRouterMock = locator<AppRouter>();
      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    });
    testWidgets(
        'Test - AupTc Widget Show AupTcBloc state.showTermsAndConditon=true',
        (tester) async {
      when(() => mockAupTcBloc.state).thenReturn(
        AupTcState.initial().copyWith(
          showTermsAndConditon: true,
        ),
      );
      await tester.pumpWidget(
        MaterialFrameWrapper(
          child: MultiBlocProvider(
            providers: [
              BlocProvider<AupTcBloc>(
                create: (context) => mockAupTcBloc,
              ),
            ],
            child: HomeNavigationTabbar(),
          ),
        ),
      );
      await tester.pump();

      final auptcscreen = find.byKey(const Key('auptcscreen'));
      final homeTabbar = find.byKey(const Key('homeTabbar'));
      final auptcappBar = find.byKey(const Key('auptcappBar'));
      final auptcwebview = find.byKey(const Key('auptcwebview'));
      final auptcAcceptButton = find.byKey(const Key('auptcAcceptButton'));
      expect(auptcscreen, findsOneWidget);
      expect(auptcappBar, findsOneWidget);
      expect(homeTabbar, findsNothing);
      expect(auptcwebview, findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 3));
      expect(auptcAcceptButton, findsOneWidget);
      await tester.tap(auptcAcceptButton);
      final snackBarMessage = find.byKey(const Key('snackBarMessage'));
      await tester.pump();
      expect(snackBarMessage, findsOneWidget);
    });

    // TODO: need Joseph fix this
    // testWidgets(
    //     'Test - AupTc Widget Show AupTcBloc state.showTermsAndConditon=false',
    //     (tester) async {
    //   final expectedStates = [
    //     const AuthState.authenticated(),
    //   ];
    //   when(() => mockAupTcBloc.state).thenReturn(
    //     AupTcState.initial().copyWith(
    //       showTermsAndConditon: false,
    //     ),
    //   );
    //   whenListen(authBlocMock, Stream.fromIterable(expectedStates),
    //       initialState: const AuthState.initial());

    //   await tester.pumpWidget(WidgetUtils.getScopedWidget(
    //     autoRouterMock: autoRouterMock,
    //     providers: [
    //       BlocProvider<AuthBloc>(
    //         create: (context) => authBlocMock,
    //       ),
    //       BlocProvider<AupTcBloc>(
    //         create: (context) => mockAupTcBloc,
    //       ),
    //     ],
    //     child: const SplashPage(),
    //   ));
    //   await tester.pumpAndSettle();
    //   final auptcscreen = find.byKey(const Key('auptcscreen'));
    //   expect(autoRouterMock.current.name, HomeNavigationTabbarRoute.name);
    //   expect(auptcscreen, findsNothing);
    // });
  });

  testWidgets('Test - AupTc Widget Show AupTcBloc on loading', (tester) async {
    when(() => mockAupTcBloc.state).thenReturn(
      AupTcState.initial().copyWith(
        showTermsAndConditon: true,
      ),
    );
    await tester.pumpWidget(
      MaterialFrameWrapper(
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AupTcBloc>(
              create: (context) => mockAupTcBloc,
            ),
          ],
          child: HomeNavigationTabbar(),
        ),
      ),
    );
    final auptcscreen = find.byKey(const Key('auptcscreen'));
    expect(auptcscreen, findsOneWidget);

    final auptcscreenElement = tester.state(auptcscreen) as AupTCDialogState;
    auptcscreenElement.isLoading = true;
    // ignore: invalid_use_of_protected_member
    auptcscreenElement.setState(() {});
    await tester.pump();
    final auptcAcceptButton = find.byKey(const Key('auptcAcceptButton'));
    expect(auptcAcceptButton, findsNothing);
  });

  testWidgets('Test - AupTc Widget localization test', (tester) async {
    when(() => mockAupTcBloc.state).thenReturn(
      AupTcState.initial().copyWith(
        showTermsAndConditon: true,
      ),
    );
    await tester.pumpWidget(
      MaterialFrameWrapper(
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AupTcBloc>(
              create: (context) => mockAupTcBloc,
            ),
          ],
          child: HomeNavigationTabbar(),
        ),
      ),
    );
    await tester.pump();
    final screenTitleFinder = find.text(mockAupTcBloc.state.title.tr());
    expect(screenTitleFinder, findsOneWidget);
    final acceptButtonTextFinder = find.text('Accept'.tr());
    expect(acceptButtonTextFinder, findsOneWidget);
    final auptcAcceptButton = find.byKey(const Key('auptcAcceptButton'));
    await tester.pumpAndSettle(const Duration(seconds: 3));
    await tester.tap(auptcAcceptButton);
    await tester.pump();
    final snackBarMsgFinder = find
        .text('You Need To read full Terms and Condition before Accept'.tr());
    expect(snackBarMsgFinder, findsOneWidget);
  });

  // TODO: need Joseph fix this
  // testWidgets('Setting screen toc tile', (tester) async {
  //   await tester.pumpWidget(EasyLocalization(
  //     supportedLocales: const [
  //       Locale('en', 'SG'),
  //     ],
  //     path: 'assets/langs/langs.csv',
  //     startLocale: const Locale('en', 'SG'),
  //     fallbackLocale: const Locale('en', 'SG'),
  //     saveLocale: true,
  //     useOnlyLangCode: false,
  //     assetLoader: CsvAssetLoader(),
  //     child: WidgetUtils.getScopedWidget(
  //       autoRouterMock: autoRouterMock,
  //       providers: [
  //         BlocProvider<AuthBloc>(
  //           create: (context) => authBlocMock,
  //         ),
  //         BlocProvider<AupTcBloc>(
  //           create: (context) => mockAupTcBloc,
  //         ),
  //       ],
  //       child: const SettingsPage(),
  //     ),
  //   ));
  //   await tester.pump();
  //   final tosTile = find.byKey(const Key('tostile'));
  //   expect(tosTile, findsOneWidget);
  //   final tosTileTextFinder = find.text('Tos'.tr());
  //   expect(tosTileTextFinder, findsOneWidget);
  //   await tester.tap(tosTile);
  //   await tester.pump();
  //   expect(autoRouterMock.current.name, AupTCDialogRoute.name);
  // });
}
