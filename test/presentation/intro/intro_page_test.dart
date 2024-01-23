import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/intro/intro_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/presentation/intro/intro_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import '../../common_mock_data/sales_org_config_mock/fake_kh_sales_org_config.dart';
import '../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../common_mock_data/sales_org_config_mock/fake_tw_sales_org_config.dart';
import '../../common_mock_data/sales_organsiation_mock.dart';
import '../../common_mock_data/user_mock.dart';
import '../../utils/widget_utils.dart';

class IntroBlocMock extends MockBloc<IntroEvent, IntroState>
    implements IntroBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

final locator = GetIt.instance;

void main() {
  late IntroBloc introBlocMock;
  late AppRouter autoRouterMock;
  late SalesOrgBloc salesOrgBlocMock;
  late EligibilityBloc eligibilityBloc;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerLazySingleton(() => AppRouter());
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    autoRouterMock = locator<AppRouter>();
    introBlocMock = IntroBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();
    eligibilityBloc = EligibilityBlocMock();
    when(() => introBlocMock.state).thenReturn(IntroState.initial());
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => eligibilityBloc.state).thenReturn(EligibilityState.initial());
  });

  ////////////////////Finder///////////////////////////////////////////////////
  final introGetStartedButton = find.byKey(const Key('getStarted'));
  final introSkipButton = find.byKey(const Key('skipButton'));
  //////////////////////////////////////////////////////////////////////////

  Widget getIntroPage() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<IntroBloc>(
          create: (context) => introBlocMock,
        ),
        BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBlocMock),
        BlocProvider<EligibilityBloc>(create: (context) => eligibilityBloc),
      ],
      child: const IntroPage(),
    );
  }

  group('Test "Intro Page"', () {
    testWidgets('Get Started Button On Tap', (tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: fakeClientUser.copyWith(
            userSalesOrganisations: [fakeSalesOrganisation],
          ),
        ),
      );
      await tester.pumpWidget(getIntroPage());
      await tester.pumpAndSettle();
      expect(introGetStartedButton, findsOneWidget);
      expect(introSkipButton, findsOneWidget);

      await tester.tap(introSkipButton);
      await tester.pumpAndSettle();

      verify(
        () => introBlocMock.add(
          const IntroEvent.setAppFirstLaunch(),
        ),
      ).called(1);
      verify(
        () => introBlocMock.add(
          const IntroEvent.initialIndex(),
        ),
      ).called(1);
      // await tester.pumpAndSettle();
      verify(
        () => salesOrgBlocMock.add(
          SalesOrgEvent.loadSavedOrganisation(
            salesOrganisations: [fakeSalesOrganisation],
          ),
        ),
      ).called(1);
    });

    testWidgets('User disable Payment & Return - Get started button only',
        (tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeTWSalesOrgConfigs,
          user: fakeClientUser.copyWith(
            disablePaymentAccess: true,
            disableReturns: true,
            userSalesOrganisations: [fakeSalesOrganisation],
          ),
        ),
      );
      await tester.pumpWidget(getIntroPage());
      await tester.pumpAndSettle();
      expect(introGetStartedButton, findsOneWidget);
      expect(introSkipButton, findsNothing);

      await tester.tap(introGetStartedButton);
      await tester.pumpAndSettle();

      verify(
        () => introBlocMock.add(
          const IntroEvent.setAppFirstLaunch(),
        ),
      ).called(1);
      verify(
        () => introBlocMock.add(
          const IntroEvent.initialIndex(),
        ),
      ).called(1);
      // await tester.pumpAndSettle();
      verify(
        () => salesOrgBlocMock.add(
          SalesOrgEvent.loadSavedOrganisation(
            salesOrganisations: [fakeSalesOrganisation],
          ),
        ),
      ).called(1);
    });

    testWidgets('SaleOrg disable Payment & Return - Get started button only',
        (tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          //Due to this ticket https://zuelligpharma.atlassian.net/browse/EZRX-16961?focusedCommentId=118024
          //we need to create TWSalesOrgConfigs disable return and payment of client_user, but the fakeTWSalesOrgConfigs wont' match
          //so it will need copyWith in here
          salesOrgConfigs: fakeTWSalesOrgConfigs.copyWith(
            disableReturnsAccess: true,
            disablePayment: true,
          ),
          user: fakeClientUser.copyWith(
            disablePaymentAccess: false,
            disableReturns: false,
            userSalesOrganisations: [fakeSalesOrganisation],
          ),
        ),
      );
      await tester.pumpWidget(getIntroPage());
      await tester.pumpAndSettle();
      expect(introGetStartedButton, findsOneWidget);
      expect(introSkipButton, findsNothing);

      await tester.tap(introGetStartedButton);
      await tester.pumpAndSettle();

      verify(
        () => introBlocMock.add(
          const IntroEvent.setAppFirstLaunch(),
        ),
      ).called(1);
      verify(
        () => introBlocMock.add(
          const IntroEvent.initialIndex(),
        ),
      ).called(1);
      // await tester.pumpAndSettle();
      verify(
        () => salesOrgBlocMock.add(
          SalesOrgEvent.loadSavedOrganisation(
            salesOrganisations: [fakeSalesOrganisation],
          ),
        ),
      ).called(1);
    });

    testWidgets('Root admin - SaleOrg return disable & payment enable',
        (tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeKHSalesOrgConfigs,
          user: fakeRootAdminUser.copyWith(
            userSalesOrganisations: [fakeSalesOrganisation],
          ),
        ),
      );
      await tester.pumpWidget(getIntroPage());
      await tester.pumpAndSettle();
      expect(introGetStartedButton, findsOneWidget);
      expect(introSkipButton, findsOneWidget);
      expect(find.text('Order and track easily'), findsOneWidget);

      await tester.tap(introGetStartedButton);
      await tester.pumpAndSettle();

      expect(find.text('Payments on the go'), findsOneWidget);
      expect(introSkipButton, findsOneWidget);

      await tester.tap(introSkipButton);
      await tester.pumpAndSettle();

      verify(
        () => introBlocMock.add(
          const IntroEvent.setAppFirstLaunch(),
        ),
      ).called(1);
      verify(
        () => introBlocMock.add(
          const IntroEvent.initialIndex(),
        ),
      ).called(1);
      // await tester.pumpAndSettle();
      verify(
        () => salesOrgBlocMock.add(
          SalesOrgEvent.loadSavedOrganisation(
            salesOrganisations: [fakeSalesOrganisation],
          ),
        ),
      ).called(1);
    });

    testWidgets('Client user - MY SaleOrg & Return & Payment enable',
        (tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          user: fakeClientUser.copyWith(
            userSalesOrganisations: [fakeSalesOrganisation],
          ),
        ),
      );
      await tester.pumpWidget(getIntroPage());
      await tester.pumpAndSettle();
      expect(introGetStartedButton, findsOneWidget);
      expect(introSkipButton, findsOneWidget);
      expect(find.text('Order and track easily'), findsOneWidget);

      await tester.tap(introGetStartedButton);
      await tester.pumpAndSettle();

      expect(find.text('Payments on the go'), findsOneWidget);
      expect(introSkipButton, findsOneWidget);

      await tester.tap(introGetStartedButton);
      await tester.pumpAndSettle();

      expect(find.text('Hassle-free returns'), findsOneWidget);
      expect(introSkipButton, findsNothing);

      await tester.tap(introGetStartedButton);
      await tester.pumpAndSettle();

      verify(
        () => introBlocMock.add(
          const IntroEvent.setAppFirstLaunch(),
        ),
      ).called(1);
      verify(
        () => introBlocMock.add(
          const IntroEvent.initialIndex(),
        ),
      ).called(1);
      // await tester.pumpAndSettle();
      verify(
        () => salesOrgBlocMock.add(
          SalesOrgEvent.loadSavedOrganisation(
            salesOrganisations: [fakeSalesOrganisation],
          ),
        ),
      ).called(1);
    });
  });
}
