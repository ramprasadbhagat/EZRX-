import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';

import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/orders/order_success/order_success_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';
import '../../order_history/order_history_details_widget_test.dart';

class AutoRouterMock extends Mock implements AppRouter {}

class MockSalesOrgBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  late AppRouter autoRouterMock;
  late SalesOrgBloc mockSalesOrgBloc;
  late CustomerCodeBloc customerCodeBlocMock;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  setUpAll(
    () {
      locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
      locator.registerLazySingleton(() => AppRouter());
      locator.registerLazySingleton(() => MixpanelService());
      locator<MixpanelService>().init(mixpanel: MixpanelMock());
    },
  );
  setUp(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      autoRouterMock = locator<AppRouter>();
      mockSalesOrgBloc = MockSalesOrgBloc();
      customerCodeBlocMock = CustomerCodeBlocMock();
      authBlocMock = AuthBlocMock();
      announcementBlocMock = AnnouncementBlocMock();

      when(() => mockSalesOrgBloc.state).thenReturn(SalesOrgState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
    },
  );
  group(
    'Test Order Success Page',
    () {
      Widget getWidget() {
        return WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          child: const OrderSuccessPage(),
          providers: [
            BlocProvider<SalesOrgBloc>(create: (context) => mockSalesOrgBloc),
            BlocProvider<CustomerCodeBloc>(
              create: (context) => customerCodeBlocMock,
            ),
            BlocProvider<AuthBloc>(create: (context) => authBlocMock),
            BlocProvider<AnnouncementBloc>(
              create: (context) => announcementBlocMock,
            ),
          ],
        );
      }

      testWidgets(
        'Load Order Success',
        (tester) async {
          await tester.pumpWidget(getWidget());
          await tester.pump();
          final orderSuccessPage = find.byKey(const Key('orderSuccessKey'));
          expect(orderSuccessPage, findsOneWidget);
        },
      );

      testWidgets(
        '=> Tap Create New Order',
        (tester) async {
          await tester.pumpWidget(getWidget());
          await tester.pump();
          final orderSuccessPage = find.byKey(const Key('orderSuccessKey'));
          expect(orderSuccessPage, findsOneWidget);
          final newOrderButton = find.text('Create New Order');
          expect(newOrderButton, findsOneWidget);
          await tester.tap(newOrderButton);
          await tester.pump();
        },
      );

      //TODO: Redirect not available currently. Change in layout
      // testWidgets(
      //   '=> Tap Go To Order History',
      //   (tester) async {
      //     await tester.pumpWidget(getWidget());
      //     await tester.pump();
      //     final orderSuccessPage = find.byKey(const Key('orderSuccessKey'));
      //     expect(orderSuccessPage, findsOneWidget);
      //     final goToOrderHistory = find.text('Go To Order History');
      //     expect(goToOrderHistory, findsOneWidget);
      //     await tester.tap(goToOrderHistory);
      //     await tester.pump();
      //   },
      // );

      testWidgets(
        '=> Tap Back Button',
        (tester) async {
          await tester.pumpWidget(getWidget());
          await tester.pump();
          final orderSuccessPage = find.byKey(const Key('orderSuccessKey'));
          expect(orderSuccessPage, findsOneWidget);
          final backButton = find.byIcon(Icons.arrow_back);
          expect(backButton, findsOneWidget);
          await tester.tap(backButton);
          await tester.pump();
        },
      );
    },
  );
}
