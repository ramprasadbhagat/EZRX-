import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/config.dart';

import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/returns/request_return/return_request_success.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class AutoRouterMock extends Mock implements AppRouter {}

class MockSalesOrgBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class ShipToCodeBlocMock extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

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
  late ShipToCodeBloc shipToCodeBlocMock;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  setUpAll(
    () {
      locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
      locator.registerLazySingleton(() => AppRouter());
    },
  );
  setUp(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      autoRouterMock = locator<AppRouter>();
      mockSalesOrgBloc = MockSalesOrgBloc();
      customerCodeBlocMock = CustomerCodeBlocMock();
      shipToCodeBlocMock = ShipToCodeBlocMock();
      authBlocMock = AuthBlocMock();
      announcementBlocMock = AnnouncementBlocMock();

      when(() => mockSalesOrgBloc.state).thenReturn(SalesOrgState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => shipToCodeBlocMock.state)
          .thenReturn(ShipToCodeState.initial());
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
          child: const ReturnRequestSuccessPage(),
          providers: [
            BlocProvider<SalesOrgBloc>(create: (context) => mockSalesOrgBloc),
            BlocProvider<CustomerCodeBloc>(
                create: (context) => customerCodeBlocMock),
            BlocProvider<ShipToCodeBloc>(
                create: (context) => shipToCodeBlocMock),
            BlocProvider<AuthBloc>(create: (context) => authBlocMock),
            BlocProvider<AnnouncementBloc>(
                create: (context) => announcementBlocMock),
          ],
        );
      }

      testWidgets(
        '=> Tap Create New Return Request',
        (tester) async {
          await tester.pumpWidget(getWidget());
          await tester.pump();
          final newReturnRequest = find.byKey(const Key('createNewReturnRequest'));
          expect(newReturnRequest, findsOneWidget);
          await tester.tap(newReturnRequest);
          await tester.pump();
        },
      );

      testWidgets(
        '=> Tap Go To return summary',
        (tester) async {
          await tester.pumpWidget(getWidget());
          await tester.pump();
          final goToOrderHistory = find.byKey(const Key('gotToReturnsSummary'));
          expect(goToOrderHistory, findsOneWidget);
          await tester.tap(goToOrderHistory);
          await tester.pump();
        },
      );
    },
  );
}
