import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/ez_point/ez_point_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_config.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/package_info/package_info.dart';
import 'package:ezrxmobile/application/account/notification_settings/notification_settings_bloc.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/more/section/help_and_support_section.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/presentation/more/more_tab.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/domain/account/entities/full_name.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';

import '../../common_mock_data/customer_code_mock.dart';
import '../../common_mock_data/mock_bloc.dart';
import '../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../common_mock_data/sales_org_config_mock/fake_ph_sales_org_config.dart';
import '../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../common_mock_data/sales_org_config_mock/fake_tw_sales_org_config.dart';
import '../../common_mock_data/sales_organsiation_mock.dart';
import '../../common_mock_data/user_mock.dart';
import '../../utils/widget_utils.dart';

void main() {
  late AuthBloc authBlocMock;
  late UserBloc userBlocMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late AnnouncementBlocMock announcementBlocMock;
  late EZPointBlocMock eZPointBlocMock;
  late NotificationSettingsBlocMock notificationSettingsBlocMock;
  late AppRouter autoRouterMock;

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerFactory<EZPointBlocMock>(() => eZPointBlocMock);
    locator.registerLazySingleton(() => PackageInfoService());
    locator.registerFactory<NotificationSettingsBlocMock>(
      () => notificationSettingsBlocMock,
    );
    autoRouterMock = locator<AppRouter>();
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    salesOrgBlocMock = SalesOrgBlocMock();
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    authBlocMock = AuthBlocMock();
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    userBlocMock = UserBlocMock();
    when(() => userBlocMock.state).thenReturn(UserState.initial());
    eligibilityBlocMock = EligibilityBlocMock();
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    announcementBlocMock = AnnouncementBlocMock();
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
    eZPointBlocMock = EZPointBlocMock();
    when(() => eZPointBlocMock.state).thenReturn(EZPointState.initial());
    notificationSettingsBlocMock = NotificationSettingsBlocMock();
    when(() => notificationSettingsBlocMock.state)
        .thenReturn(NotificationSettingsState.initial());
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
          BlocProvider<SalesOrgBloc>(
            create: (context) => salesOrgBlocMock,
          ),
          BlocProvider<AnnouncementBloc>(
            create: (context) => announcementBlocMock,
          ),
          BlocProvider<EZPointBloc>(
            create: (context) => eZPointBlocMock,
          ),
          BlocProvider<NotificationSettingsBloc>(
            create: (context) => notificationSettingsBlocMock,
          ),
        ],
        child: const MoreTab(),
      ),
    );
  }

  ///////////////////Finder/////////////////////////////////////////////////////
  final returnsTile = find.byKey(WidgetKeys.returnsTile);
  /////////////////////////////////////////////////////////////////////////////

  group('More Tab Test', () {
    testWidgets(
      ' -> Hide returnsTile when customer config disableReturn true',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeConfig: CustomerCodeConfig.empty().copyWith(
              disableReturns: true,
            ),
          ),
        );

        await getWidget(tester);
        await tester.pump();
        expect(returnsTile, findsNothing);
      },
    );

    testWidgets(
      ' -> Hide returnsTile when customer config disableReturn false',
      (WidgetTester tester) async {
        await getWidget(tester);
        await tester.pump();
        expect(returnsTile, findsOne);
      },
    );

    testWidgets(
      ' -> Hide returnsTile when disableReturn true',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: fakeClientUser.copyWith(disableReturns: true),
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        );

        await getWidget(tester);
        await tester.pump();
        expect(returnsTile, findsNothing);
      },
    );

    testWidgets(
      ' -> Hide returnsTile when salesOrgConfigs disableReturnsAccess true client user',
      (WidgetTester tester) async {
        final fakeUser = User.empty().copyWith(
          role: Role.empty().copyWith(
            type: RoleType('client_user'),
          ),
          fullName: const FullName(firstName: 'test', lastName: 'test'),
        );

        final expectedState = [
          EligibilityState.initial().copyWith(
            user: fakeUser,
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              salesOrg: SalesOrg('2001'),
              disableReturnsAccess: true,
            ),
          ),
        ];
        whenListen(eligibilityBlocMock, Stream.fromIterable(expectedState));

        when(() => userBlocMock.state).thenReturn(
          UserState.initial().copyWith(
            user: fakeUser,
          ),
        );

        await getWidget(tester);
        await tester.pumpAndSettle();
        expect(returnsTile, findsNothing);
      },
    );

    testWidgets(
      ' -> Hide returnsTile when salesOrgConfigs disableReturnsAccess false client user',
      (WidgetTester tester) async {
        final fakeUser = User.empty().copyWith(
          role: Role.empty().copyWith(
            type: RoleType('client_user'),
          ),
          fullName: const FullName(firstName: 'test', lastName: 'test'),
        );

        final expectedState = [
          EligibilityState.initial().copyWith(
            user: fakeUser,
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              salesOrg: SalesOrg('2001'),
              disableReturnsAccess: true,
            ),
          ),
          EligibilityState.initial().copyWith(
            user: fakeUser,
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              salesOrg: SalesOrg('2001'),
            ),
          ),
        ];
        whenListen(eligibilityBlocMock, Stream.fromIterable(expectedState));

        when(() => userBlocMock.state).thenReturn(
          UserState.initial().copyWith(
            user: fakeUser,
          ),
        );

        await getWidget(tester);
        await tester.pump();
        expect(returnsTile, findsOneWidget);
      },
    );

    testWidgets(
      ' -> Hide returnsTile when salesOrgConfigs disableReturnsAccess true sales rep user',
      (WidgetTester tester) async {
        final fakeUser = User.empty().copyWith(
          role: Role.empty().copyWith(
            type: RoleType('external_sales_rep'),
          ),
          fullName: const FullName(firstName: 'test', lastName: 'test'),
        );

        final expectedState = [
          EligibilityState.initial().copyWith(
            user: fakeUser,
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              salesOrg: SalesOrg('2001'),
              disableReturnsAccessSR: true,
            ),
          ),
        ];
        whenListen(eligibilityBlocMock, Stream.fromIterable(expectedState));

        when(() => userBlocMock.state).thenReturn(
          UserState.initial().copyWith(
            user: fakeUser,
          ),
        );

        await getWidget(tester);
        await tester.pumpAndSettle();
        expect(returnsTile, findsNothing);
      },
    );

    testWidgets(
      ' -> Hide returnsTile when salesOrgConfigs disableReturnsAccess false sales rep user',
      (WidgetTester tester) async {
        final fakeUser = User.empty().copyWith(
          role: Role.empty().copyWith(
            type: RoleType('external_sales_rep'),
          ),
          fullName: const FullName(firstName: 'test', lastName: 'test'),
        );

        final expectedState = [
          EligibilityState.initial().copyWith(
            user: fakeUser,
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              salesOrg: SalesOrg('2001'),
              disableReturnsAccessSR: true,
            ),
          ),
          EligibilityState.initial().copyWith(
            user: fakeUser,
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              salesOrg: SalesOrg('2001'),
            ),
          ),
        ];
        whenListen(eligibilityBlocMock, Stream.fromIterable(expectedState));

        when(() => userBlocMock.state).thenReturn(
          UserState.initial().copyWith(
            user: fakeUser,
          ),
        );

        await getWidget(tester);
        await tester.pump();
        expect(returnsTile, findsOneWidget);
      },
    );

    testWidgets(
      ' -> Show returnTile when Disable Returns for Customers is ON and Disable Returns for SalesRep is OFF for SalesRep User',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeMYSalesOrgConfigs.copyWith(
              disableReturnsAccess: true,
            ),
            user: fakeSalesRepUser,
          ),
        );

        await getWidget(tester);
        await tester.pump();
        expect(returnsTile, findsOneWidget);
      },
    );

    testWidgets(
      ' -> Hide paymentsTile when Enable Payment Configuration is off',
      (WidgetTester tester) async {
        VisibilityDetectorController.instance.updateInterval = Duration.zero;
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: SalesOrganisation.empty().copyWith(
              //Philippine market: ZPC PH
              salesOrg: SalesOrg('2500'),
            ),
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              //Enable Payment Configuration is off
              disablePayment: true,
            ),
          ),
        );
        when(() => userBlocMock.state).thenReturn(
          UserState.initial().copyWith(
            user: User.empty().copyWith(
              role: Role.empty().copyWith(
                type: RoleType('client_user'),
              ),
              fullName: const FullName(firstName: 'test', lastName: 'test'),
            ),
          ),
        );

        await getWidget(tester);
        await tester.pump();
        final paymentsTile = find.byKey(WidgetKeys.paymentsTile);
        expect(paymentsTile, findsNothing);
      },
    );

    testWidgets(
      ' -> Show paymentsTile when Enable Payment Configuration is on',
      (WidgetTester tester) async {
        VisibilityDetectorController.instance.updateInterval = Duration.zero;
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakePHSalesOrganisation,
            salesOrgConfigs: fakePHSalesOrgConfigs,
          ),
        );
        when(() => userBlocMock.state).thenReturn(
          UserState.initial().copyWith(
            user: fakeRootAdminUser.copyWith(
              fullName: const FullName(firstName: 'test', lastName: 'test'),
            ),
          ),
        );

        await getWidget(tester);
        await tester.pump();
        final paymentsTile = find.byKey(WidgetKeys.paymentsTile);
        expect(paymentsTile, findsOneWidget);
      },
    );

    testWidgets(
      ' -> Hidden paymentsTile when Enable Payment Configuration is off',
      (WidgetTester tester) async {
        VisibilityDetectorController.instance.updateInterval = Duration.zero;
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeTWSalesOrganisation,
            salesOrgConfigs: fakeTWSalesOrgConfigs,
          ),
        );
        when(() => userBlocMock.state).thenReturn(
          UserState.initial().copyWith(
            user: fakeRootAdminUser.copyWith(
              fullName: const FullName(firstName: 'test', lastName: 'test'),
            ),
          ),
        );

        await getWidget(tester);
        await tester.pump();
        final paymentsTile = find.byKey(WidgetKeys.paymentsTile);
        expect(paymentsTile, findsNothing);
      },
    );

    testWidgets(
      ' -> Hidden paymentsTile Sales Org SG and Customer Payment term is Outside of system --> A007',
      (WidgetTester tester) async {
        VisibilityDetectorController.instance.updateInterval = Duration.zero;
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeSGSalesOrganisation,
            salesOrgConfigs: fakeSGSalesOrgConfigs,
            customerCodeInfo: fakeCustomerCodeInfo.copyWith(
              paymentTerm: PaymentTermCode('A007'),
            ),
          ),
        );

        await getWidget(tester);
        await tester.pump();
        final paymentsTile = find.byKey(WidgetKeys.paymentsTile);
        expect(paymentsTile, findsNothing);
      },
    );

    testWidgets(
      ' -> Hidden paymentsTile Sales Org SG and Customer Payment term is Outside of system --> C024',
      (WidgetTester tester) async {
        VisibilityDetectorController.instance.updateInterval = Duration.zero;
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeSGSalesOrganisation,
            salesOrgConfigs: fakeSGSalesOrgConfigs,
            customerCodeInfo: fakeCustomerCodeInfo.copyWith(
              paymentTerm: PaymentTermCode('C024'),
            ),
          ),
        );

        await getWidget(tester);
        await tester.pump();
        final paymentsTile = find.byKey(WidgetKeys.paymentsTile);
        expect(paymentsTile, findsNothing);
      },
    );

    testWidgets(
      ' -> Show eZPoint tile for ID Market',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        );
        await getWidget(tester);
        await tester.pump();
        final eZPointTileFinder = find.byKey(WidgetKeys.eZPointTile);
        expect(eZPointTileFinder, findsOneWidget);
        await tester.tap(eZPointTileFinder);
        verify(
          () => eZPointBlocMock.add(
            EZPointEvent.fetch(
              customerCodeInfo: fakeCustomerCodeInfo,
            ),
          ),
        ).called(1);
        expect(autoRouterMock.current.path, 'eZPoint');
      },
    );

    testWidgets(
      ' -> Show Notification Settings Page for All Market',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeSalesOrganisation,
          ),
        );
        await getWidget(tester);
        await tester.pump();
        final notificationTileFinder = find.byKey(WidgetKeys.notificationTile);
        expect(notificationTileFinder, findsOneWidget);
        await tester.tap(notificationTileFinder);
        verify(
          () => notificationSettingsBlocMock.add(
            const NotificationSettingsEvent.fetch(),
          ),
        ).called(1);
        expect(autoRouterMock.current.path, 'notification_settings');
      },
    );
    testWidgets(
      ' -> Test Service tile buildWhen payment not show',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeTWSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrgConfigs: fakeTWSalesOrgConfigs,
            user: fakeZPAdminUser,
          ),
        );
        await getWidget(tester);
        await tester.pump();
        final returnsTileFinder = find.byKey(WidgetKeys.returnsTile);
        expect(returnsTileFinder, findsOneWidget);
        final paymentsTileFinder = find.byKey(WidgetKeys.paymentsTile);
        expect(paymentsTileFinder, findsNothing);
      },
    );

    testWidgets(
      ' -> Test Service tile buildWhen payment show',
      (WidgetTester tester) async {
        final expectedState = [
          EligibilityState.initial().copyWith(
            user: fakeClientUser,
            salesOrgConfigs: fakeIDSalesOrgConfigs.copyWith(
              disablePayment: true,
            ),
          ),
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
            salesOrgConfigs: fakeIDSalesOrgConfigs.copyWith(
              disablePayment: false,
            ),
            customerCodeInfo: fakeCustomerCodeInfo,
            user: fakeRootAdminUser,
          ),
        ];

        whenListen(eligibilityBlocMock, Stream.fromIterable(expectedState));
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
            salesOrgConfigs: fakeIDSalesOrgConfigs.copyWith(
              disablePayment: false,
            ),
            customerCodeInfo: fakeCustomerCodeInfo,
            user: fakeRootAdminUser,
          ),
        );

        await getWidget(tester);
        await tester.pump();
        final returnsTileFinder = find.byKey(WidgetKeys.returnsTile);
        expect(returnsTileFinder, findsOneWidget);
        final paymentsTileFinder = find.byKey(WidgetKeys.paymentsTile);
        expect(paymentsTileFinder, findsOneWidget);
      },
    );
    testWidgets(
      ' -> Test Service tile',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            user: fakeZPAdminUser,
          ),
        );
        await getWidget(tester);
        await tester.pump();
        final eZPointTileFinder = find.byKey(WidgetKeys.eZPointTile);
        expect(eZPointTileFinder, findsOneWidget);
        final returnsTileFinder = find.byKey(WidgetKeys.returnsTile);
        expect(returnsTileFinder, findsOneWidget);
        final orderTileFinder = find.byKey(WidgetKeys.orderTile);
        expect(orderTileFinder, findsOneWidget);
        final paymentsTileFinder = find.byKey(WidgetKeys.paymentsTile);
        expect(paymentsTileFinder, findsOneWidget);
      },
    );

    testWidgets(
      ' -> Help & Support - About us Section',
      (WidgetTester tester) async {
        final currentSalesOrgVariant =
            salesOrgVariant.currentValue ?? fakeSalesOrg;
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeSalesOrganisation.copyWith(
              salesOrg: currentSalesOrgVariant,
            ),
          ),
        );
        await getWidget(tester);
        await tester.pump();
        expect(
          find.descendant(
            of: find.byType(HelpAndSupportTile),
            matching: find.text('About us'.tr()),
          ),
          currentSalesOrgVariant.isAboutUsEnabled
              ? findsOneWidget
              : findsNothing,
        );
      },
      variant: salesOrgVariant,
    );

    testWidgets(
      ' -> Test User guide',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );

        await getWidget(tester);
        await tester.pump();
        final userGuideTileFinder = find.byKey(WidgetKeys.userGuideTile);
        await tester.dragUntilVisible(
          userGuideTileFinder,
          find.byKey(WidgetKeys.scrollList),
          const Offset(0, -500),
        );
        await tester.pumpAndSettle();
        expect(userGuideTileFinder, findsOneWidget);
        await tester.tap(userGuideTileFinder);
        await tester.pump();
        expect(autoRouterMock.current.name, 'PdfViewPageRoute');
      },
    );

    group('-> MP payment tile', () {
      testWidgets('visible when user can access to marketplace',
          (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: fakeClientUserAccessMarketPlace,
            customerCodeInfo: fakeMarketPlaceCustomerCode,
          ),
        );

        await getWidget(tester);
        await tester.pump();
        final paymentsTile = find.byKey(WidgetKeys.mpPaymentsTile);
        expect(paymentsTile, findsOne);
        expect(
          find.descendant(of: paymentsTile, matching: find.text('MP Payments')),
          findsOne,
        );
        await tester.tap(paymentsTile);
        await tester.pump();

        expect(
          autoRouterMock.currentPath,
          PaymentPageRoute(isMarketPlace: true).path,
        );
      });

      testWidgets('not visible when user can not access to marketplace',
          (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: fakeClient,
          ),
        );

        await getWidget(tester);
        await tester.pump();
        expect(find.byKey(WidgetKeys.mpPaymentsTile), findsNothing);
      });
    });

    testWidgets('-> Should show AUP, TnC, PC tiles', (tester) async {
      await getWidget(tester);
      await tester.pump();
      final aupTile = find.byKey(WidgetKeys.acceptableUsePolicy);
      await tester.dragUntilVisible(
        aupTile,
        find.byKey(WidgetKeys.scrollList),
        const Offset(0, -500),
      );
      expect(aupTile, findsOne);
      expect(
        find.descendant(
          of: aupTile,
          matching: find.text('Acceptable Use Policy'),
        ),
        findsOne,
      );
      expect(find.text('Privacy policy'), findsOne);
      expect(find.text('Terms of use'), findsOne);
    });
  });
}
