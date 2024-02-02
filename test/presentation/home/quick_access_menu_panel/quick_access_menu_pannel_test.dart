import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/package_info/package_info.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/widgets/quick_access_menu.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_kh_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';
import '../../../utils/widget_utils.dart';

class MockAppRouter extends Mock implements AppRouter {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class MaterialPageXMock extends Mock implements MaterialPageX {}

void main() {
  late CustomerCodeBloc customerCodeBlocMock;
  late AuthBloc authBlocMock;
  late UserBloc userBlocMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late AppRouter autoRouterMock;
  final locator = GetIt.instance;

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => PackageInfoService());
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    salesOrgBlocMock = SalesOrgBlocMock();
    autoRouterMock = MockAppRouter();

    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    customerCodeBlocMock = CustomerCodeBlocMock();
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    authBlocMock = AuthBlocMock();
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());

    userBlocMock = UserBlocMock();
    when(() => userBlocMock.state).thenReturn(UserState.initial());
    eligibilityBlocMock = EligibilityBlocMock();
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
  });

  Future getWidget(WidgetTester tester) async {
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
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBlocMock,
          ),
          BlocProvider<SalesOrgBloc>(
            create: (context) => salesOrgBlocMock,
          ),
        ],
        child: const Scaffold(body: QuickAccessMenuPanel()),
      ),
    );
  }

  group('Quick Access Menu Panel Test', () {
    testWidgets(
      ' -> Find Quick Access Menu Panel',
      (WidgetTester tester) async {
        await getWidget(tester);
        await tester.pump();
        final comboOffersSectionFinder = find.byType(QuickAccessMenuPanel);
        expect(comboOffersSectionFinder, findsOneWidget);
      },
    );

    group('Test homeQuickAccessPaymentsMenu', () {
      testWidgets(
        ' -> Show paymentsTile when Enable Payment Configuration is On for Client User',
        (WidgetTester tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeSGSalesOrgConfigs,
              user: fakeClientUser,
            ),
          );

          await getWidget(tester);
          await tester.pumpAndSettle();
          final paymentsTile =
              find.byKey(WidgetKeys.homeQuickAccessPaymentsMenu);
          expect(paymentsTile, findsOneWidget);
        },
      );

      testWidgets(
        ' -> Show paymentsTile when user is RootAdmin ',
        (WidgetTester tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              user: fakeRootAdminUser,
            ),
          );

          await getWidget(tester);
          await tester.pumpAndSettle();
          final paymentsTile =
              find.byKey(WidgetKeys.homeQuickAccessPaymentsMenu);
          expect(paymentsTile, findsOneWidget);
        },
      );

      testWidgets(
        ' -> Hide paymentsTile when Enable Payment Configuration is Off',
        (WidgetTester tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeKHSalesOrgConfigs,
            ),
          );

          await getWidget(tester);
          await tester.pump();
          final paymentsTile =
              find.byKey(WidgetKeys.homeQuickAccessPaymentsMenu);
          expect(paymentsTile, findsNothing);
        },
      );

      testWidgets(
        ' -> Hide paymentsTile when user is customer and paymentAccess is disable from user level',
        (WidgetTester tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeSGSalesOrgConfigs,
              user: fakeClientUser.copyWith(
                disablePaymentAccess: true,
              ),
            ),
          );

          await getWidget(tester);
          await tester.pump();
          final paymentsTile =
              find.byKey(WidgetKeys.homeQuickAccessPaymentsMenu);
          expect(paymentsTile, findsNothing);
        },
      );

      testWidgets(
        ' -> Hide paymentsTile Sales Org SG and Customer Payment term is Outside of system --> A007',
        (WidgetTester tester) async {
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
          final paymentsTile =
              find.byKey(WidgetKeys.homeQuickAccessPaymentsMenu);
          expect(paymentsTile, findsNothing);
        },
      );

      testWidgets(
        ' -> Hide paymentsTile Sales Org SG and Customer Payment term is Outside of system --> C024',
        (WidgetTester tester) async {
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
          final paymentsTile =
              find.byKey(WidgetKeys.homeQuickAccessPaymentsMenu);
          expect(paymentsTile, findsNothing);
        },
      );
    });
  });
}
