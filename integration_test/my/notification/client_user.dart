import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../core/common.dart';
import '../../core/infrastructure/infra_core/zephyr_service/zephyr_service.dart';
import '../../core/infrastructure/zephyr/repository/zephyr_repository.dart';
import '../../robots/common/common_robot.dart';
import '../../robots/common/enum.dart';
import '../../robots/login_robot.dart';
import '../../robots/notification/notification_robot.dart';
import '../../robots/orders/view_by_orders/view_by_orders_detail_robot.dart';
import '../../robots/payments/payment_detail_robot.dart';
import '../../robots/returns/returns_by_items/returns_by_items_detail_robot.dart';

void main() {
  late LoginRobot loginRobot;
  late NotificationRobot notificationRobot;
  late CommonRobot commonRobot;
  late ViewByOrdersDetailRobot viewByOrdersDetailRobot;
  late ReturnsByItemsDetailRobot returnsByItemsDetailRobot;
  late PaymentDetailRobot paymentDetailRobot;

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // initialize variables
  const marketMalaysia = 'Malaysia';
  const username = 'myclientuser';
  const password = 'St@ysafe01';

  void initializeRobot(WidgetTester tester) {
    loginRobot = LoginRobot(tester);
    viewByOrdersDetailRobot = ViewByOrdersDetailRobot(tester);
    returnsByItemsDetailRobot = ReturnsByItemsDetailRobot(tester);
    paymentDetailRobot = PaymentDetailRobot(tester);
    notificationRobot = NotificationRobot(tester);
    commonRobot = CommonRobot(tester);
  }

  testWidgets('EZRX-T95 | Verify Notification Tab with Default Values',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await loginRobot.loginToHomeScreen(username, password, marketMalaysia);
    await commonRobot.navigateToScreen(NavigationTab.notifications);

    //verify
    notificationRobot.verifyPage();
    notificationRobot.verifyScrollList();
    notificationRobot.verifyDeleteButton();
  });

  testWidgets(
      'EZRX-T96 | Verify at least one notification item if list not empty',
      (tester) async {
    const orderNotificationKeyword = 'Order';
    const returnNotificationKeyword = 'Return request';
    const paymentNotificationKeyword = 'Payment';
    const notificationIndex = 0;
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await commonRobot.dismissSnackbar();
    await commonRobot.navigateToScreen(NavigationTab.notifications);

    //verify
    if (notificationRobot.checkIfNotificationListEmpty()) {
      notificationRobot.verifyNoRecordFound();

      return;
    }
    notificationRobot.verifyNotificationItems();
    final itemDescription =
        notificationRobot.getNotificationDescription(notificationIndex);
    await notificationRobot.tapNotificationItem(notificationIndex);
    if (itemDescription.startsWith(orderNotificationKeyword.tr())) {
      viewByOrdersDetailRobot.verifyPage();
    } else if (itemDescription.startsWith(returnNotificationKeyword.tr())) {
      returnsByItemsDetailRobot.verifyPage();
    } else if (itemDescription.startsWith(paymentNotificationKeyword.tr())) {
      paymentDetailRobot.verifyPage();
    } else {
      notificationRobot.verifyRedirectNotAvailableMessage();
    }
  });

  testWidgets('EZRX-T128 | Pull to Refresh Feature - verify item visible',
      (tester) async {
    const notificationIndex = 0;

    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await commonRobot.navigateToScreen(NavigationTab.notifications);

    //verify
    if (notificationRobot.checkIfNotificationListEmpty()) {
      notificationRobot.verifyNoRecordFound();

      return;
    }
    notificationRobot.verifyNotificationItems();
    final itemDescription =
        notificationRobot.getNotificationDescription(notificationIndex);
    await notificationRobot.pullToRefresh();
    notificationRobot.verifyNotificationItems();
    notificationRobot.verifyNotificationWithDescription(
      notificationIndex,
      itemDescription,
    );
  });

  tearDown(() async {
    locator<ZephyrService>().setNameAndStatus();
    await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  });
}
