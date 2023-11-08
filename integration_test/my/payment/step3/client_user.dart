import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ezrxmobile/locator.dart';

import '../../../core/common.dart';
import '../../../core/infrastructure/infra_core/zephyr_service/zephyr_service.dart';
import '../../../core/infrastructure/zephyr/repository/zephyr_repository.dart';
import '../../../robots/common/common_robot.dart';
import '../../../robots/login_robot.dart';
import '../../../robots/more/more_robot.dart';
import '../../../robots/payments/new_payment/new_payment_step1_robot.dart';
import '../../../robots/payments/new_payment/new_payment_step2_robot.dart';
import '../../../robots/payments/new_payment/new_payment_step3_robot.dart';
import '../../../robots/payments/payment_home_robot.dart';

void main() {
  late LoginRobot loginRobot;
  late CommonRobot commonRobot;
  late MoreRobot moreRobot;
  late PaymentHomeRobot paymentRobot;
  late NewPaymentStep1Robot newPaymentStep1Robot;
  late NewPaymentStep2Robot newPaymentStep2Robot;
  late NewPaymentStep3Robot newPaymentStep3Robot;
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  void initializeRobot(WidgetTester tester) {
    loginRobot = LoginRobot(tester);
    commonRobot = CommonRobot(tester);
    moreRobot = MoreRobot(tester);
    paymentRobot = PaymentHomeRobot(tester);
    newPaymentStep1Robot = NewPaymentStep1Robot(tester);
    newPaymentStep2Robot = NewPaymentStep2Robot(tester);
    newPaymentStep3Robot = NewPaymentStep3Robot(tester);
  }

  const marketMalaysia = 'Malaysia';
  const user = 'myclientuser';
  const password = 'St@ysafe01';
  const shipToCode = '0070149863';
  final fromDateStep1 = DateTime(2014, 1, 1);
  final toDate = DateTime.now();
  final defaultPaymentMethod = 'Payment Gateway'.tr();
  final step3Title = 'Select payment method'.tr();
  final paymentAdviceGenerated = 'Payment advice generated'.tr();
  const salesOrg = 'RSD';

  Future<void> loginWithBehalfToHomeTab() async {
    await loginRobot.loginToHomeScreen(user, password, marketMalaysia);
    await commonRobot.changeDeliveryAddress(shipToCode);
  }

  Future<void> goToStep3() async {
    await commonRobot.goToMoreTab();
    await moreRobot.tapPaymentTile();
    await paymentRobot.tapNewPayment();
    await newPaymentStep1Robot.clickFilter();
    await newPaymentStep1Robot.clickDocumentDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDateStep1,
      toDate: toDate,
    );
    await newPaymentStep1Robot.tapApplyFilter();
    newPaymentStep1Robot.verifyAtLeast1ItemFound();
    await newPaymentStep1Robot.clickFirstItem();
    await newPaymentStep1Robot.tapNextButton();
    await newPaymentStep2Robot.tapNextButton();
  }

  testWidgets('EZRX-T225 | verify New Payment Page Step 3 - Initial Fields',
      (tester) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    await loginWithBehalfToHomeTab();
    await tester.pumpAndSettle();
    await goToStep3();
    newPaymentStep3Robot.verifyStep3InitialField(
      defaultPaymentMethod: defaultPaymentMethod,
      salesOrg: salesOrg,
      step3Title: step3Title,
    );
  });
  testWidgets('EZRX-T226 | verify New Payment Page Step 3 - Pay now Button',
      (tester) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    await goToStep3();
    newPaymentStep3Robot.verifyStep3InitialField(
      defaultPaymentMethod: defaultPaymentMethod,
      salesOrg: salesOrg,
      step3Title: step3Title,
    );
    await newPaymentStep3Robot.tapGeneratePaymentAdvice();
    newPaymentStep3Robot.verifyPaymentAdviceGenerated(paymentAdviceGenerated);
    await newPaymentStep3Robot.tapPayNow();
    newPaymentStep3Robot.verifyWebviewVisible();
  });
  tearDown(() async {
    locator<ZephyrService>().setNameAndStatus();
    await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  });
}
