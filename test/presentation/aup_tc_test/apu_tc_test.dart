import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/settings/setting_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/aup_tc/aup_tc_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:ezrxmobile/application/deep_linking/deep_linking_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/application/payments/account_summary/account_summary_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/static_html_viewer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home_tab.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../utils/widget_utils.dart';

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AccountSummaryBlocMock
    extends MockBloc<AccountSummaryEvent, AccountSummaryState>
    implements AccountSummaryBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class MockAupTcBloc extends MockBloc<AupTcEvent, AupTcState>
    implements AupTcBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

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

class SettingMockBloc extends MockBloc<SettingEvent, SettingState>
    implements SettingBloc {}

class DeepLinkingMockBloc extends MockBloc<DeepLinkingEvent, DeepLinkingState>
    implements DeepLinkingBloc {}

class MaterialListMockBloc
    extends MockBloc<MaterialListEvent, MaterialListState>
    implements MaterialListBloc {}

void main() {
  late GetIt locator;
  late SalesOrgBloc mockSalesOrgBloc;
  late AuthBloc authBlocMock;
  late AccountSummaryBloc accountSummaryMock;
  late AnnouncementBloc announcementBlocMock;
  late AppRouter autoRouterMock;
  late MockAupTcBloc mockAupTcBloc;
  late UserBloc userBlocMock;
  late CartBloc cartBlocMock;
  late SettingBloc settingBlocMock;
  late PaymentCustomerInformationBloc paymentCustomerInformationBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late ResetPasswordBloc resetPasswordBlocMock;
  late OrderDocumentTypeBloc orderDocumentTypeBlocMock;
  late DeepLinkingBloc deepLinkingBlocMock;
  late CustomerCodeBloc customerCodeBloc;
  late MaterialListBloc materialListBloc;

  setUpAll(() async {
    setupLocator();
    WidgetsFlutterBinding.ensureInitialized();
    TestWidgetsFlutterBinding.ensureInitialized();
    mockSalesOrgBloc = SalesOrgBlocMock();
    authBlocMock = AuthBlocMock();
    settingBlocMock = SettingMockBloc();
    accountSummaryMock = AccountSummaryBlocMock();
    announcementBlocMock = AnnouncementBlocMock();
    mockAupTcBloc = MockAupTcBloc();
    eligibilityBlocMock = EligibilityBlocMock();
    materialListBloc = MaterialListMockBloc();
    locator = GetIt.instance;
    locator<Config>().appFlavor = Flavor.mock;
    locator<Config>().appName;
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
    deepLinkingBlocMock = DeepLinkingMockBloc();
    customerCodeBloc = CustomerCodeBlocMock();
    when(() => customerCodeBloc.state).thenReturn(CustomerCodeState.initial());
    when(() => userBlocMock.state).thenReturn(UserState.initial());

    when(() => cartBlocMock.state).thenReturn(CartState.initial());
    when(() => accountSummaryMock.state)
        .thenReturn(AccountSummaryState.initial());
    when(() => settingBlocMock.state).thenReturn(SettingState.initial());
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
    when(() => deepLinkingBlocMock.state)
        .thenReturn(const DeepLinkingState.initial());
    when(() => materialListBloc.state).thenReturn(MaterialListState.initial());
  });

  group('AupTc Widget Show hide base on state.showTermsAndCondition true', () {
    // TODO: V3 break
    testWidgets(
        'Test - AupTc Widget Show AupTcBloc state.showTermsAndCondition=true',
        (tester) async {
      when(() => mockAupTcBloc.state).thenReturn(
        AupTcState.initial().copyWith(
            showTermsAndCondition: true,
            privacyConsent: true,
            tncConsent: true),
      );
      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          child: MultiBlocProvider(
            providers: [
              BlocProvider<UserBloc>(create: (context) => userBlocMock),
              BlocProvider<AupTcBloc>(
                create: (context) => mockAupTcBloc,
              ),
              BlocProvider<AuthBloc>(create: (context) => authBlocMock),
              BlocProvider<AnnouncementBloc>(
                  create: (context) => announcementBlocMock),
              BlocProvider<MaterialListBloc>(
                  create: (context) => materialListBloc),
            ],
            child: HomeNavigationTabbar(),
          ),
        ),
      );
      final aupTcWebView = find.byKey(WidgetKeys.aupTcWebView);
      expect(aupTcWebView, findsNWidgets(2));
      final staticHtmlViewerElement1 =
          tester.state(aupTcWebView.first) as StaticHtmlViewerState;
      staticHtmlViewerElement1.isLoading = false;
      // ignore: invalid_use_of_protected_member
      staticHtmlViewerElement1.setState(() {});

      final staticHtmlViewerElement2 =
          tester.state(aupTcWebView.last) as StaticHtmlViewerState;
      staticHtmlViewerElement2.isLoading = false;
      // ignore: invalid_use_of_protected_member
      staticHtmlViewerElement2.setState(() {});

      await tester.pump();
      final aupTcScreen = find.byKey(WidgetKeys.aupTcScreen);
      final homeTabBar = find.byKey(const Key('homeTabBar'));
      final aupTcaAppBar = find.byKey(const Key('auptcappBar'));
      final aupTcAcceptButton = find.byKey(const Key('auptcAcceptButton'));

      expect(aupTcScreen, findsOneWidget);
      expect(aupTcaAppBar, findsOneWidget);
      expect(homeTabBar, findsNothing);
      expect(aupTcAcceptButton, findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.tap(aupTcAcceptButton);
      await tester.pump();
      var willPopCalled = false;
      final dynamic widgetsAppState = tester.state(find.byType(WidgetsApp));
      willPopCalled = await widgetsAppState.didPopRoute();
      await tester.pump();
      expect(willPopCalled, false);
    });

    testWidgets(
        'Test - AupTc Widget Show AupTcBloc state.showTermsAndCondition=false',
        (tester) async {
      when(() => mockAupTcBloc.state).thenReturn(
        AupTcState.initial().copyWith(
          showTermsAndCondition: false,
        ),
      );

      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          providers: [
            BlocProvider<CustomerCodeBloc>(
              create: (context) => customerCodeBloc,
            ),
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
            BlocProvider<DeepLinkingBloc>(
              create: (context) => deepLinkingBlocMock,
            ),
            BlocProvider<AccountSummaryBloc>(
              create: (context) => accountSummaryMock,
            ),
            BlocProvider<MaterialListBloc>(
                create: (context) => materialListBloc),
          ],
          child: const SplashPage(),
        ),
      );
      await tester.pumpAndSettle();
      final aupTcScreen = find.byKey(WidgetKeys.aupTcScreen);
      expect(aupTcScreen, findsNothing);
    });
  });

  testWidgets('Test - AupTc Widget localization test', (tester) async {
    when(() => mockAupTcBloc.state).thenReturn(
      AupTcState.initial().copyWith(
          showTermsAndCondition: true,
          privacyConsent: false,
          tncConsent: false),
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
    //This is for setting the isLoading false
    final aupTcWebView = find.byKey(WidgetKeys.aupTcWebView);
    expect(aupTcWebView, findsNWidgets(2));
    final staticHtmlViewerElement1 =
        tester.state(aupTcWebView.first) as StaticHtmlViewerState;
    staticHtmlViewerElement1.isLoading = false;
    // ignore: invalid_use_of_protected_member
    staticHtmlViewerElement1.setState(() {});

    final staticHtmlViewerElement2 =
        tester.state(aupTcWebView.last) as StaticHtmlViewerState;
    staticHtmlViewerElement2.isLoading = false;
    // ignore: invalid_use_of_protected_member
    staticHtmlViewerElement2.setState(() {});

    await tester.pump();
    await tester.pump(const Duration(seconds: 5));
    final acceptButtonTextFinder = find.text('Accept and continue');
    expect(acceptButtonTextFinder, findsOneWidget);
    final aupTcAcceptButton = find.byKey(const Key('auptcAcceptButton'));
    await tester.tap(aupTcAcceptButton);
    await tester.pumpAndSettle();
    final snackBarMsgFinder = find.text(
        'You need to read and accept full Terms of use and Privacy Policy before continue.'
            .tr());
    expect(snackBarMsgFinder, findsOneWidget);
  });

  // TODO: V3 break
  // testWidgets('Setting screen toc and notification and language tile',
  //     (tester) async {
  //   await TesterUtils.setUpLocalizationWrapper(
  //       tester: tester,
  //       home: const SettingsPage(),
  //       locale: const Locale('en'),
  //       isAutoRouteEnabled: true,
  //       autoRouterMock: autoRouterMock,
  //       providers: [
  //         BlocProvider<AuthBloc>(create: (context) => authBlocMock),
  //         BlocProvider<AnnouncementBloc>(
  //             create: (context) => announcementBlocMock),
  //         BlocProvider<AupTcBloc>(
  //           create: (context) => mockAupTcBloc,
  //         ),
  //         BlocProvider<AnnouncementBloc>(
  //           create: (context) => announcementBlocMock,
  //         ),
  //         BlocProvider<SalesOrgBloc>(
  //           create: (context) => mockSalesOrgBloc,
  //         ),
  //         BlocProvider<SettingBloc>(
  //           create: (context) => settingBlocMock,
  //         ),
  //       ]);
  //   await tester.pump();
  //   final tosTile = find.byKey(const Key('tostile'));
  //   expect(tosTile, findsOneWidget);
  //   await tester.tap(tosTile);
  //   await tester.pump();
  //   expect(autoRouterMock.current.name, AupTCDialogRoute.name);
  //   final notificationTile = find.byKey(const Key('notificationTile'));
  //   expect(notificationTile, findsOneWidget);
  //   await tester.tap(notificationTile);
  //   await tester.pump(const Duration(seconds: 2));
  //   final languageTile = find.byKey(const Key('languageTile'));
  //   expect(languageTile, findsOneWidget);
  //   await tester.pump(const Duration(seconds: 2));
  //   await tester.tap(languageTile);
  //   await tester.pump(const Duration(seconds: 2));
  //   await tester.pumpAndSettle(const Duration(
  //     seconds: 3,
  //   ));
  //   final languagePicker =
  //       find.byWidgetPredicate((w) => w is PlatformDialogAction);
  //   await tester.pump(const Duration(seconds: 2));
  //   expect(languagePicker, findsNWidgets(6));
  //   final salesOrg = find.byType(PlatformDialogAction).first;
  //   await tester.tap(salesOrg, warnIfMissed: false);
  //   await tester.pumpAndSettle(const Duration(seconds: 3));
  // });

  // testWidgets('Setting screen contactUsTile', (tester) async {
  //   await TesterUtils.setUpLocalizationWrapper(
  //       tester: tester,
  //       home: const SettingsPage(),
  //       locale: const Locale('en'),
  //       isAutoRouteEnabled: true,
  //       autoRouterMock: autoRouterMock,
  //       providers: [
  //         BlocProvider<AuthBloc>(create: (context) => authBlocMock),
  //         BlocProvider<AnnouncementBloc>(
  //             create: (context) => announcementBlocMock),
  //         BlocProvider<AupTcBloc>(
  //           create: (context) => mockAupTcBloc,
  //         ),
  //         BlocProvider<SettingBloc>(
  //           create: (context) => settingBlocMock,
  //         ),
  //       ]);
  //   await tester.pump();
  //   final contactUsTile = find.byKey(const Key('contactUsTile'));
  //   expect(contactUsTile, findsOneWidget);
  //   await tester.tap(contactUsTile);
  //   await tester.pump();
  //   expect(autoRouterMock.current.name, ContactUsPageRoute.name);
  // });
  // testWidgets('Setting screen changePasswordTile', (tester) async {
  //   await TesterUtils.setUpLocalizationWrapper(
  //       tester: tester,
  //       home: const SettingsPage(),
  //       locale: const Locale('en'),
  //       isAutoRouteEnabled: true,
  //       autoRouterMock: autoRouterMock,
  //       providers: [
  //         BlocProvider<AuthBloc>(create: (context) => authBlocMock),
  //         BlocProvider<AnnouncementBloc>(
  //             create: (context) => announcementBlocMock),
  //         BlocProvider<AupTcBloc>(
  //           create: (context) => mockAupTcBloc,
  //         ),
  //         BlocProvider<ResetPasswordBloc>(
  //           create: (context) => resetPasswordBlocMock,
  //         ),
  //         BlocProvider<SettingBloc>(
  //           create: (context) => settingBlocMock,
  //         ),
  //       ]);
  //   await tester.pump();
  //   final changePasswordTile = find.byKey(const Key('changePasswordTile'));
  //   expect(changePasswordTile, findsOneWidget);
  //   await tester.tap(changePasswordTile);
  //   await tester.pump();
  //   expect(autoRouterMock.current.name, ChangePasswordPageRoute.name);
  // });
  // testWidgets('Setting screen Privacy Policy', (tester) async {
  //   await TesterUtils.setUpLocalizationWrapper(
  //       tester: tester,
  //       home: const SettingsPage(),
  //       locale: const Locale('en'),
  //       isAutoRouteEnabled: true,
  //       autoRouterMock: autoRouterMock,
  //       providers: [
  //         BlocProvider<AuthBloc>(create: (context) => authBlocMock),
  //         BlocProvider<AnnouncementBloc>(
  //             create: (context) => announcementBlocMock),
  //         BlocProvider<AupTcBloc>(
  //           create: (context) => mockAupTcBloc,
  //         ),
  //         BlocProvider<SettingBloc>(
  //           create: (context) => settingBlocMock,
  //         ),
  //       ]);
  //   await tester.pump();
  //   final privacyPolicy = find.byKey(const Key('Privacy_Policy'));
  //   expect(privacyPolicy, findsOneWidget);
  //   await tester.tap(privacyPolicy);
  //   await tester.pump();
  //   expect(autoRouterMock.current.name, WebViewPageRoute.name);
  // });
  // testWidgets('Setting screen logoutTile', (tester) async {
  //   await TesterUtils.setUpLocalizationWrapper(
  //       tester: tester,
  //       home: const SettingsPage(),
  //       locale: const Locale('en'),
  //       isAutoRouteEnabled: true,
  //       autoRouterMock: autoRouterMock,
  //       providers: [
  //         BlocProvider<AuthBloc>(create: (context) => authBlocMock),
  //         BlocProvider<AnnouncementBloc>(
  //             create: (context) => announcementBlocMock),
  //         BlocProvider<AupTcBloc>(
  //           create: (context) => mockAupTcBloc,
  //         ),
  //         BlocProvider<SettingBloc>(
  //           create: (context) => settingBlocMock,
  //         ),
  //       ]);
  //   await tester.pump();
  //   final logoutTile = find.byKey(const Key('logoutTile'));
  //   expect(logoutTile, findsOneWidget);
  //   await tester.tap(logoutTile);
  //   // await tester.pump();
  //   // expect();
  // });

  // testWidgets('Setting screen Biometric Login with State change',
  //     (tester) async {
  //   final expectedStates = [
  //     SettingState.initial().copyWith(
  //       isBiometricEnable: true,
  //       isBiometricPossible: true,
  //       failureOrSuccessOption: none(),
  //     ),
  //     SettingState.initial().copyWith(
  //       isBiometricEnable: false,
  //       isBiometricPossible: true,
  //       failureOrSuccessOption: none(),
  //     ),
  //   ];
  //   whenListen(settingBlocMock, Stream.fromIterable(expectedStates));
  //   await TesterUtils.setUpLocalizationWrapper(
  //       tester: tester,
  //       home: const SettingsPage(),
  //       locale: const Locale('en'),
  //       isAutoRouteEnabled: true,
  //       autoRouterMock: autoRouterMock,
  //       providers: [
  //         BlocProvider<AuthBloc>(create: (context) => authBlocMock),
  //         BlocProvider<AnnouncementBloc>(
  //             create: (context) => announcementBlocMock),
  //         BlocProvider<AupTcBloc>(
  //           create: (context) => mockAupTcBloc,
  //         ),
  //         BlocProvider<SettingBloc>(
  //           create: (context) => settingBlocMock,
  //         ),
  //       ]);
  //   await tester.pump();
  //   final biometricLoginToggle = find.byKey(const Key('biometricLoginToggle'));
  //   expect(biometricLoginToggle, findsOneWidget);
  //   await tester.tap(biometricLoginToggle);
  //   await tester.pump();
  //   verify(
  //     () => settingBlocMock.add(const SettingEvent.toggleBiometric(
  //       isBiometricEnabled: true,
  //     )),
  //   ).called(1);
  // });
}
