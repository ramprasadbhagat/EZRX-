import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/orders/order_success/order_success_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class AutoRouterMock extends Mock implements AppRouter {}

void main() {
  late AppRouter autoRouterMock;
  setUpAll(
    () {
      locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
      locator.registerLazySingleton(() => AppRouter());
    },
  );
  setUp(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      autoRouterMock = locator<AppRouter>();
    },
  );
  group(
    'Test Order Success Page',
    () {
      Widget getWidget() {
        return WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          child: const OrderSuccessPage(),
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

      testWidgets(
        '=> Tap Go To Order History',
        (tester) async {
          await tester.pumpWidget(getWidget());
          await tester.pump();
          final orderSuccessPage = find.byKey(const Key('orderSuccessKey'));
          expect(orderSuccessPage, findsOneWidget);
          final goToOrderHistory = find.text('Go To Order History');
          expect(goToOrderHistory, findsOneWidget);
          await tester.tap(goToOrderHistory);
          await tester.pump();
        },
      );

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
