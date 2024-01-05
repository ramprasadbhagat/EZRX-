import 'package:ezrxmobile/locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../core/common.dart';
import '../../core/infrastructure/infra_core/zephyr_service/zephyr_service.dart';
import '../../core/infrastructure/zephyr/repository/zephyr_repository.dart';
import '../../robots/common/common_robot.dart';
import '../../robots/common/enum.dart';
import '../../robots/login_robot.dart';
import '../../robots/more/more_robot.dart';
import '../../robots/payments/new_payment/new_payment_robot.dart';
import '../../robots/payments/payment_home_robot.dart';
import '../../robots/payments/soa/statement_of_account_robot.dart';

void main() {
  late LoginRobot loginRobot;
  late CommonRobot commonRobot;
  late MoreRobot moreRobot;
  late StatementOfAccountRobot soaRootRobot;
  late PaymentHomeRobot paymentRobot;
  late NewPaymentRobot newPaymentRobot;

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // initialize variables
  const marketMalaysia = 'Malaysia';
  const username = 'myclientuser';
  const password = 'St@ysafe01';
  const shipToCode = '0070149863';
  const soldToCode = '0030082707';
  // Test data for no SOA
  // const shipToCode = '0000002010';
  // const soldToCode = '0000002010';

  void initializeRobot(WidgetTester tester) {
    loginRobot = LoginRobot(tester);
    commonRobot = CommonRobot(tester);
    moreRobot = MoreRobot(tester);
    soaRootRobot = StatementOfAccountRobot(tester);
    paymentRobot = PaymentHomeRobot(tester);
    newPaymentRobot = NewPaymentRobot(tester);
  }

  Future<void> goToStatementOfAccountPage({
    required String deliveryAddress,
  }) async {
    //Switch delivery address
    await commonRobot.changeDeliveryAddress(deliveryAddress);

    //Go returns
    await commonRobot.navigateToScreen(NavigationTab.more);
    await moreRobot.tapPaymentTile();
    await paymentRobot.tapStatementOfAccountTile();
  }

  testWidgets('EZRX-T190 | verify Statement of accounts Page', (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await loginRobot.loginToHomeScreen(username, password, marketMalaysia);
    await goToStatementOfAccountPage(deliveryAddress: shipToCode);

    soaRootRobot.verifySOAPage();
    soaRootRobot.verifySOACustomerCode(soldToCode);
    soaRootRobot.verifySOAFilterButton();
    soaRootRobot.verifySOAFilterCount();
    soaRootRobot.verifSOASearchResults();
    soaRootRobot.verifySOANewpaymentButton();
  });

  testWidgets('EZRX-T191 | Verify Filter by month Feature', (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToStatementOfAccountPage(deliveryAddress: shipToCode);

    soaRootRobot.verifySOAPage();
    soaRootRobot.verifySOACustomerCode(soldToCode);
    soaRootRobot.verifySOAFilterButton();
    await soaRootRobot.tapSOAFilterButton();
    soaRootRobot.verifySOAFilterbottomSheet();
    await soaRootRobot.enterTextSOAFilterDateField();
    await soaRootRobot.tapSOAApplyButton();
    soaRootRobot.verifySOAFilterbottomSheetNot();
    soaRootRobot.verifySOAItem();
    await soaRootRobot.tapSOAFilterButton();
    soaRootRobot.verifySOAFilterbottomSheet();
    await soaRootRobot.tapSOAResetFilterButton();
  });

  testWidgets('EZRX-T192 | Verify Download Feature', (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToStatementOfAccountPage(deliveryAddress: shipToCode);

    soaRootRobot.verifySOAPage();
    soaRootRobot.verifySOAItem();

    await soaRootRobot.verifyAndTapStatementOfAccountDownloadButton();
  });

  testWidgets('EZRX-T193 | Verify new Payment Feature', (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToStatementOfAccountPage(deliveryAddress: shipToCode);

    soaRootRobot.verifySOAPage();
    soaRootRobot.verifySOANewpaymentButton();
    await soaRootRobot.tapSOANewpaymentButton();
    newPaymentRobot.verifyPage();
  });

  testWidgets('EZRX-T263 | Verify pull to refresh Feature', (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToStatementOfAccountPage(deliveryAddress: shipToCode);

    soaRootRobot.verifySOAPage();

    await soaRootRobot.verifyPullToRefresh();
  });

  tearDown(() async {
    locator<ZephyrService>().setNameAndStatus();
    await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  });
}
