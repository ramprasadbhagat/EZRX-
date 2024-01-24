import 'package:ezrxmobile/locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../../core/common.dart';
import '../../../core/infrastructure/infra_core/zephyr_service/zephyr_service.dart';
import '../../../core/infrastructure/zephyr/repository/zephyr_repository.dart';
import '../../../robots/common/common_robot.dart';
import '../../../robots/common/enum.dart';
import '../../../robots/login_robot.dart';
import '../../../robots/more/more_robot.dart';
import '../../../robots/payments/payment_home_robot.dart';
import '../../../robots/payments/payment_summary/payment_summary_filter_robot.dart';
import '../../../robots/payments/payment_summary/payment_summary_robot.dart';

void main() {
  late LoginRobot loginRobot;
  late CommonRobot commonRobot;
  late MoreRobot moreRobot;
  late PaymentSummaryRobot paymentSummaryRobot;
  late PaymentSummaryFilterRobot paymentSummaryFilterRobot;
  late PaymentHomeRobot paymentHomeRobot;

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // initialize variables
  const marketPhilippines = 'Philippines';
  const username = 'rootadmin';
  const password = 'Pa55word@1234';
  const shipToCode = '0070023262';
  const statusFilter = 'In Progress';

  void initializeRobot(WidgetTester tester) {
    loginRobot = LoginRobot(tester);
    commonRobot = CommonRobot(tester);
    moreRobot = MoreRobot(tester);
    paymentHomeRobot = PaymentHomeRobot(tester);
    paymentSummaryRobot = PaymentSummaryRobot(tester);
    paymentSummaryFilterRobot = PaymentSummaryFilterRobot(tester);
  }

  Future goToPaymentSummaryPage(
    WidgetTester tester, {
    bool loginNeeded = false,
  }) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);

    if (loginNeeded) {
      await loginRobot.loginToHomeScreen(username, password, marketPhilippines);
      //Switch delivery address
      await commonRobot.changeDeliveryAddress(shipToCode);
    }

    //Go Payment summary page
    await commonRobot.navigateToScreen(NavigationTab.more);
    await moreRobot.tapPaymentTile();
    await paymentHomeRobot.tapPaymentSummaryMenu();
  }

  testWidgets('EZRX-T184 | Verify Payment Summary Page', (tester) async {
    //navigate to page
    await goToPaymentSummaryPage(tester, loginNeeded: true);

    //verify
    paymentSummaryRobot.verifyPageVisible();
    paymentSummaryRobot.verifyDownloadButtonVisible();
    paymentSummaryRobot.verifySearchBarVisible();
    paymentSummaryRobot.verifyFilterButtonVisible();
    paymentSummaryRobot.verifyPaymentSummaryGroupListVisible();
    paymentSummaryRobot.verifyNewPaymentButtonVisible();

    await paymentSummaryRobot.scrollDown();
    paymentSummaryRobot.verifyScrollToTopButtonVisible();

    await paymentSummaryRobot.tapScrollToTopButton();
    paymentSummaryRobot.verifyScrollToTopButtonInvisible();
  });

  testWidgets('EZRX-T188 | Verify Filter Tune Icon', (tester) async {
    //navigate to page
    await goToPaymentSummaryPage(tester);

    //verify
    paymentSummaryRobot.verifyPageVisible();

    //change status
    await paymentSummaryRobot.tapFilterButton();
    paymentSummaryFilterRobot.verifyDefaultFilterApplied();
    await paymentSummaryFilterRobot.tapStatusCheckbox(statusFilter);
    paymentSummaryFilterRobot.verifyStatusFilterValue(statusFilter);
    await paymentSummaryFilterRobot.tapApplyButton();
    paymentSummaryRobot.verifyFilterApplied(1);

    //check status
    paymentSummaryRobot.verifyStatusValue('Pending');
    paymentSummaryRobot.verifyStatusValue('In Progress');
    paymentSummaryRobot.verifyStatusNonContains('Failed');
    paymentSummaryRobot.verifyStatusNonContains('Processed');
    paymentSummaryRobot.verifyStatusNonContains('Successful');
  });

  tearDown(() async {
    locator<ZephyrService>().setNameAndStatus();
    await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  });
}
