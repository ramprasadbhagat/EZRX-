import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/aup_tc/aup_tc_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/account/settings_page.dart';
import 'package:ezrxmobile/presentation/aup_tc/aup_tc.dart';
import 'package:ezrxmobile/presentation/home_tab.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../utils/tester_utils.dart';
import '../../utils/widget_utils.dart';

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class MockAupTcBloc extends MockBloc<AupTcEvent, AupTcState>
    implements AupTcBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class ShipToCodeBlocMock extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class AutoRouterMock extends Mock implements AppRouter {
  @override
  String currentPath = '';
}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class PaymentCustomerInfoMockBloc extends MockBloc<
        PaymentCustomerInformationEvent, PaymentCustomerInformationState>
    implements PaymentCustomerInformationBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class ResetPasswordMockBloc
    extends MockBloc<ResetPasswordEvent, ResetPasswordState>
    implements ResetPasswordBloc {}

class OrderDocumentTypeMockBloc
    extends MockBloc<OrderDocumentTypeEvent, OrderDocumentTypeState>
    implements OrderDocumentTypeBloc {}

void main() {
  late GetIt locator;
  late SalesOrgBloc mockSalesOrgBloc;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late AppRouter autoRouterMock;
  late MockAupTcBloc mockAupTcBloc;
  late UserBloc userBlocMock;
  late CartBloc cartBlocMock;
  late PaymentCustomerInformationBloc paymentCustomerInformationBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late ResetPasswordBloc resetPasswordBlocMock;
  late OrderDocumentTypeBloc orderDocumentTypeBlocMock;

  setUpAll(() async {
    setupLocator();

    TestWidgetsFlutterBinding.ensureInitialized();
    mockSalesOrgBloc = SalesOrgBlocMock();
    authBlocMock = AuthBlocMock();
    announcementBlocMock = AnnouncementBlocMock();
    mockAupTcBloc = MockAupTcBloc();
    eligibilityBlocMock = EligibilityBlocMock();
    locator = GetIt.instance;
    locator<Config>().appFlavor = Flavor.mock;
    locator<Config>().appName;
    locator<Config>().getTCKHUrl;
    locator<Config>().getTCMMUrl;
    locator<Config>().getTCTHUrl;
    locator<Config>().getTCTWUrl;
    locator<Config>().getTCVNUrl;
    locator<Config>().getTCENUrl;
    locator<Config>().oktaConfig;
    locator<Config>().packageName;
    autoRouterMock = locator<AppRouter>();
    PackageInfo.setMockInitialValues(
        appName: '',
        packageName: '"packageName"',
        version: '',
        buildNumber: '',
        buildSignature: '',
        installerStore: '');
  });

  setUp(() {
    userBlocMock = UserBlocMock();
    cartBlocMock = CartBlocMock();
    paymentCustomerInformationBlocMock = PaymentCustomerInfoMockBloc();
    eligibilityBlocMock = EligibilityBlocMock();
    resetPasswordBlocMock = ResetPasswordMockBloc();
    orderDocumentTypeBlocMock = OrderDocumentTypeMockBloc();
    announcementBlocMock = AnnouncementBlocMock();
    when(() => userBlocMock.state).thenReturn(UserState.initial());

    when(() => cartBlocMock.state).thenReturn(CartState.initial());
    when(() => paymentCustomerInformationBlocMock.state)
        .thenReturn(PaymentCustomerInformationState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => resetPasswordBlocMock.state)
        .thenReturn(ResetPasswordState.initial());
    when(() => orderDocumentTypeBlocMock.state)
        .thenReturn(OrderDocumentTypeState.initial());
    when(() => mockSalesOrgBloc.state).thenReturn(SalesOrgState.initial());
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
  });

  group('AupTc Widget Show hide base on state.showTermsAndConditon true', () {
    testWidgets(
        'Test - AupTc Widget Show AupTcBloc state.showTermsAndConditon=true',
        (tester) async {
      when(() => mockAupTcBloc.state).thenReturn(
        AupTcState.initial().copyWith(
          showTermsAndConditon: true,
        ),
      );
      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          child: MultiBlocProvider(
            providers: [
              BlocProvider<AupTcBloc>(
                create: (context) => mockAupTcBloc,
              ),
              BlocProvider<AuthBloc>(create: (context) => authBlocMock),
              BlocProvider<AnnouncementBloc>(
                  create: (context) => announcementBlocMock),
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
      await tester.pump();
      var willPopCalled = false;
      final dynamic widgetsAppState = tester.state(find.byType(WidgetsApp));
      willPopCalled = await widgetsAppState.didPopRoute();
      await tester.pump();
      expect(willPopCalled, true);
    });

    testWidgets(
        'Test - AupTc Widget Show AupTcBloc state.showTermsAndConditon=false',
        (tester) async {
      when(() => mockAupTcBloc.state).thenReturn(
        AupTcState.initial().copyWith(
          showTermsAndConditon: false,
        ),
      );

      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          providers: [
            BlocProvider<SalesOrgBloc>(
              create: (context) => mockSalesOrgBloc,
            ),
            BlocProvider<AuthBloc>(
              create: (context) => authBlocMock,
            ),
            BlocProvider<AupTcBloc>(
              create: (context) => mockAupTcBloc,
            ),
            BlocProvider<UserBloc>(
              create: (context) => userBlocMock,
            ),
            BlocProvider<CartBloc>(
              create: (context) => cartBlocMock,
            ),
            BlocProvider<PaymentCustomerInformationBloc>(
              create: (context) => paymentCustomerInformationBlocMock,
            ),
            BlocProvider<EligibilityBloc>(
              create: (context) => eligibilityBlocMock,
            ),
            BlocProvider<ResetPasswordBloc>(
              create: (context) => resetPasswordBlocMock,
            ),
            BlocProvider<OrderDocumentTypeBloc>(
              create: (context) => orderDocumentTypeBlocMock,
            ),
            BlocProvider<AnnouncementBloc>(
              create: (context) => announcementBlocMock,
            ),
          ],
          child: const SplashPage(),
        ),
      );
      await tester.pump();
      final auptcscreen = find.byKey(const Key('auptcscreen'));
      expect(auptcscreen, findsNothing);
    });
  });

  testWidgets('Test - AupTc Widget Show AupTcBloc on loading', (tester) async {
    when(() => mockAupTcBloc.state).thenReturn(
      AupTcState.initial().copyWith(
        showTermsAndConditon: true,
      ),
    );
    await tester.pumpWidget(
      WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(create: (context) => authBlocMock),
            BlocProvider<AnnouncementBloc>(
                create: (context) => announcementBlocMock),
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
      WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(create: (context) => authBlocMock),
            BlocProvider<AnnouncementBloc>(
                create: (context) => announcementBlocMock),
            BlocProvider<AupTcBloc>(
              create: (context) => mockAupTcBloc,
            ),
          ],
          child: HomeNavigationTabbar(),
        ),
      ),
    );
    await tester.pump();
    final acceptButtonTextFinder = find.text('Accept');
    expect(acceptButtonTextFinder, findsOneWidget);
    final auptcAcceptButton = find.byKey(const Key('auptcAcceptButton'));
    await tester.pumpAndSettle(const Duration(seconds: 3));
    await tester.tap(auptcAcceptButton);
    await tester.pump();
    final snackBarMsgFinder = find
        .text('You Need To read full Terms and Condition before Accept'.tr());
    expect(snackBarMsgFinder, findsOneWidget);
  });

  testWidgets('Setting screen toc and notification and language tile',
      (tester) async {
    await TesterUtils.setUpLocalizationWrapper(
        tester: tester,
        home: const SettingsPage(),
        locale: const Locale('en', 'SG'),
        isAutoRouteEnabled: true,
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<AuthBloc>(create: (context) => authBlocMock),
          BlocProvider<AnnouncementBloc>(
              create: (context) => announcementBlocMock),
          BlocProvider<AupTcBloc>(
            create: (context) => mockAupTcBloc,
          ),
          BlocProvider<AnnouncementBloc>(
            create: (context) => announcementBlocMock,
          ),
        ]);
    await tester.pump();
    final tosTile = find.byKey(const Key('tostile'));
    expect(tosTile, findsOneWidget);
    await tester.tap(tosTile);
    await tester.pump();
    expect(autoRouterMock.current.name, AupTCDialogRoute.name);
    final notificationTile = find.byKey(const Key('notificationTile'));
    expect(notificationTile, findsOneWidget);
    await tester.tap(notificationTile);
    await tester.pump(const Duration(seconds: 2));
    final languageTile = find.byKey(const Key('languageTile'));
    expect(languageTile, findsOneWidget);
    await tester.pump(const Duration(seconds: 2));
    await tester.tap(languageTile);
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle(const Duration(
      seconds: 3,
    ));
    final languagePicker =
        find.byWidgetPredicate((w) => w is PlatformDialogAction);
    await tester.pump(const Duration(seconds: 2));
    expect(languagePicker, findsNWidgets(6));
    final salesOrg = find.byType(PlatformDialogAction).first;
    await tester.tap(salesOrg, warnIfMissed: false);
    await tester.pumpAndSettle(const Duration(seconds: 3));
  });

  testWidgets('Setting screen contactUsTile', (tester) async {
    await TesterUtils.setUpLocalizationWrapper(
        tester: tester,
        home: const SettingsPage(),
        locale: const Locale('en', 'SG'),
        isAutoRouteEnabled: true,
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<AuthBloc>(create: (context) => authBlocMock),
          BlocProvider<AnnouncementBloc>(
              create: (context) => announcementBlocMock),
          BlocProvider<AupTcBloc>(
            create: (context) => mockAupTcBloc,
          ),
        ]);
    await tester.pump();
    final contactUsTile = find.byKey(const Key('contactUsTile'));
    expect(contactUsTile, findsOneWidget);
    await tester.tap(contactUsTile);
    await tester.pump();
    expect(autoRouterMock.current.name, ContactUsPageRoute.name);
  });
  testWidgets('Setting screen changePasswordTile', (tester) async {
    await TesterUtils.setUpLocalizationWrapper(
        tester: tester,
        home: const SettingsPage(),
        locale: const Locale('en', 'SG'),
        isAutoRouteEnabled: true,
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<AuthBloc>(create: (context) => authBlocMock),
          BlocProvider<AnnouncementBloc>(
              create: (context) => announcementBlocMock),
          BlocProvider<AupTcBloc>(
            create: (context) => mockAupTcBloc,
          ),
          BlocProvider<ResetPasswordBloc>(
            create: (context) => resetPasswordBlocMock,
          ),
        ]);
    await tester.pump();
    final changePasswordTile = find.byKey(const Key('changePasswordTile'));
    expect(changePasswordTile, findsOneWidget);
    await tester.tap(changePasswordTile);
    await tester.pump();
    expect(autoRouterMock.current.name, ChangePasswordPageRoute.name);
  });
  testWidgets('Setting screen Privacy Policy', (tester) async {
    await TesterUtils.setUpLocalizationWrapper(
        tester: tester,
        home: const SettingsPage(),
        locale: const Locale('en', 'SG'),
        isAutoRouteEnabled: true,
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<AuthBloc>(create: (context) => authBlocMock),
          BlocProvider<AnnouncementBloc>(
              create: (context) => announcementBlocMock),
          BlocProvider<AupTcBloc>(
            create: (context) => mockAupTcBloc,
          ),
        ]);
    await tester.pump();
    final privacyPolicy = find.byKey(const Key('Privacy_Policy'));
    expect(privacyPolicy, findsOneWidget);
    await tester.tap(privacyPolicy);
    await tester.pump();
    expect(autoRouterMock.current.name, WebViewPageRoute.name);
  });
  testWidgets('Setting screen logoutTile', (tester) async {
    await TesterUtils.setUpLocalizationWrapper(
        tester: tester,
        home: const SettingsPage(),
        locale: const Locale('en', 'SG'),
        isAutoRouteEnabled: true,
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<AuthBloc>(create: (context) => authBlocMock),
          BlocProvider<AnnouncementBloc>(
              create: (context) => announcementBlocMock),
          BlocProvider<AupTcBloc>(
            create: (context) => mockAupTcBloc,
          ),
        ]);
    await tester.pump();
    final logoutTile = find.byKey(const Key('logoutTile'));
    expect(logoutTile, findsOneWidget);
    await tester.tap(logoutTile);
    // await tester.pump();
    // expect();
  });
}
