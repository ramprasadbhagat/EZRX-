import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../../core/common.dart';
import '../../../core/test_locator.dart';
import '../../../robots/common/common_robot.dart';
import '../../../robots/home/home_robot.dart';
import '../../../robots/login_robot.dart';
import '../../../robots/payments/new_payment/new_payment_robot.dart';
import '../../../robots/payments/payment_home_robot.dart';
import '../../../robots/payments/payment_summary/payment_summary_robot.dart';
import '../../../core/infrastructure/infra_core/zephyr_service/zephyr_service.dart';
import '../../../core/infrastructure/zephyr/repository/zephyr_repository.dart';
import '../../../robots/payments/soa/statement_of_account_robot.dart';

void main() {
  late LoginRobot loginRobot;
  late PaymentHomeRobot paymentHomeRobot;
  late PaymentSummaryRobot paymentSummaryRobot;
  late StatementOfAccountRobot statementAccountRobot;
  late NewPaymentRobot newPaymentRobot;
  late CommonRobot commonRobot;
  late HomeRobot homeRobot;

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  void initializeRobot(WidgetTester tester) {
    //initialize necessary robots
    loginRobot = LoginRobot(tester);
    commonRobot = CommonRobot(tester);
    paymentHomeRobot = PaymentHomeRobot(tester);
    paymentSummaryRobot = PaymentSummaryRobot(tester);
    statementAccountRobot = StatementOfAccountRobot(tester);
    newPaymentRobot = NewPaymentRobot(tester);
    homeRobot = HomeRobot(tester);
  }

  // initialize variables
  const marketMalaysia = 'Malaysia';
  const username = 'myclientuser';
  const password = 'St@ysafe01';
  const customerCode = '0070149863';

  testWidgets('EZRX-T181 | Verify Payments Page', (tester) async {
    //init app
    await runAppForTesting(tester);

    initializeRobot(tester);
    //select market
    loginRobot.findMarketSelector();
    await loginRobot.tapToMarketSelector();
    await loginRobot.selectMarket(marketMalaysia);
    loginRobot.verifySelectedMarket(marketMalaysia);
    //login without username and password
    await loginRobot.login(username, password);

    await loginRobot.tapSkipIntroButton();
    await commonRobot.changeDeliveryAddress(customerCode);

    await homeRobot.tapPaymentQuickAccess();
    paymentHomeRobot.verifyPaymentsTabPage();
    paymentHomeRobot.verifyNewPaymentsButton();
    paymentHomeRobot.verifyPaymentHomeOptionMenu();
    paymentHomeRobot.verifyPaymentHomeInvoiceCard();
    paymentHomeRobot.verifyPaymentHomeCreditCard();
    paymentHomeRobot.verifyPaymentHomeInProgressCard();
    await paymentHomeRobot.verifyPaymentStatementAccount();
  });

  testWidgets('EZRX-T182 | Verify Obscure & Download property', (tester) async {
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);

    await homeRobot.tapPaymentQuickAccess();
    paymentHomeRobot.verifyPaymentsTabPage();

    paymentHomeRobot.verifyPaymentHomeInvoiceCardObscure();
    paymentHomeRobot.verifyPaymentHomeCreditCardObscure();
    paymentHomeRobot.verifyPaymentSummaryObscure();

    await paymentHomeRobot.tapToAllObscureButton();
    paymentHomeRobot.verifyNoObscureTextPresent();

    await paymentHomeRobot.verifyPaymentStatementAccount();

    await paymentHomeRobot.downloadFirstStatementAccount();

    paymentHomeRobot.verifyCustomSnackBar(
      message: 'File downloaded successfully',
    );
  });

  testWidgets(
      'EZRX-T183 | Verify Redirection Feature - Payment summary & Statement of accounts & New Payment Button',
      (tester) async {
    //init app
    await runAppForTesting(tester);

    await homeRobot.tapPaymentQuickAccess();
    paymentHomeRobot.verifyPaymentHomeInProgressCard();

    await paymentHomeRobot.navigateToPaymentSummaryScreen();
    paymentSummaryRobot.verifyPageVisible();
    await commonRobot.tapToBackScreen();

    await paymentHomeRobot.navigateToStatementOfAccountScreen();
    statementAccountRobot.verifySOAPage();
    await commonRobot.tapToBackScreen();

    await paymentHomeRobot.tapNewPayment();
    newPaymentRobot.verifyPage();
  });

  tearDown(() async {
    locator<ZephyrService>().setNameAndStatus();
    await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  });
}
