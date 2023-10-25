import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ezrxmobile/locator.dart';

import '../../../core/common.dart';
import '../../../core/infrastructure/infra_core/zephyr_service/zephyr_service.dart';
import '../../../core/infrastructure/zephyr/repository/zephyr_repository.dart';
import '../../../robots/common/common_robot.dart';
import '../../../robots/login_robot.dart';
import '../../../robots/more/more_robot.dart';
import '../../../robots/payment/payment_robot.dart';
import '../../../robots/payment/step1/new_payment_step1_robot.dart';
import '../../../robots/payment/step2/new_payment_step2_robot.dart';
import '../../../robots/payment/step3/new_payment_step3_robot.dart';

void main() {
  late LoginRobot loginRobot;
  late CommonRobot commonRobot;
  late MoreRobot moreRobot;
  late PaymentRobot paymentRobot;
  late NewPaymentStep1Robot newPaymentStep1Robot;
  late NewPaymentStep2Robot newPaymentStep2Robot;
  late NewPaymentStep3Robot newPaymentStep3Robot;
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  void initializeRobot(WidgetTester tester) {
    loginRobot = LoginRobot(tester);
    commonRobot = CommonRobot(tester);
    moreRobot = MoreRobot(tester);
    paymentRobot = PaymentRobot(tester);
    newPaymentStep1Robot = NewPaymentStep1Robot(tester);
    newPaymentStep2Robot = NewPaymentStep2Robot(tester);
    newPaymentStep3Robot = NewPaymentStep3Robot(tester);
  }

  const marketMalaysia = 'Malaysia';
  const user = 'myclientuser';
  const password = 'St@ysafe01';
  const shipToCode = '0070149863';
  final fromDateStep1 = DateTime(2014, 1, 1);
  final fromDateStep2 = DateTime(2013, 1, 1);
  final toDate = DateTime.now();
  final invalidFromDate = DateTime(2099, 1, 1);
  final invalidToDate = DateTime.now();
  const invoiceNumberSearchKeyword = '0040177345';
  const noResultCreditSearchKeyword = '0000000000';
  const creditSearchKeyword = '4040000149';
  const priceWithoutCredit = 29958.00;
  const priceWithCredit = 438.00;

  Future<void> loginAndChangeDeliveryAddress() async {
    await loginRobot.loginToHomeScreen(user, password, marketMalaysia);
    await commonRobot.changeDeliveryAddress(shipToCode);
  }

  Future<void> filterTheDateToGetItem() async {
    await newPaymentStep2Robot.tapFilter();
    await newPaymentStep2Robot.clickDocumentDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDateStep2,
      toDate: toDate,
    );
    await newPaymentStep2Robot.tapApplyFilter();
  }

  Future<void> goToStep2() async {
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
    await commonRobot.searchWithKeyboardAction(invoiceNumberSearchKeyword);
    newPaymentStep1Robot.verifyAtLeast1ItemFound();
    await newPaymentStep1Robot.clickFirstItem();
    await newPaymentStep1Robot.tapNextButton();
  }

  testWidgets('EZRX-T224 | verify New Payment Page Step 2 - Initial Fields',
      (tester) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    await loginAndChangeDeliveryAddress();
    await tester.pumpAndSettle();
    await goToStep2();
    newPaymentStep2Robot.verifyStep2InitialField(priceWithoutCredit);
  });

  testWidgets(
      'EZRX-T255 | verify New Payment Page Step 2 - Text Field Unhappy flow',
      (tester) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    await goToStep2();
    newPaymentStep2Robot.verifyStep2InitialField(priceWithoutCredit);
    await filterTheDateToGetItem();
    await commonRobot.searchWithKeyboardAction('0');
    commonRobot.verifyInvalidLengthSearchMessage(isVisible: true);
    await commonRobot.dismissSnackbar();
    await commonRobot.searchWithKeyboardAction(noResultCreditSearchKeyword);
    newPaymentStep2Robot.verifyNoItemFound();
  });

  testWidgets(
      'EZRX-T256 | verify New Payment Page Step 2 - Text Field Textfield search on clear button',
      (tester) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    await goToStep2();
    newPaymentStep2Robot.verifyStep2InitialField(priceWithoutCredit);
    await filterTheDateToGetItem();
    newPaymentStep2Robot.verifyAtLeastOneItemFound();
    await commonRobot.searchWithKeyboardAction(noResultCreditSearchKeyword);
    newPaymentStep2Robot.verifyNoItemFound();
    await commonRobot.tapClearSearch();
    newPaymentStep2Robot.verifyAtLeastOneItemFound();
  });

  testWidgets(
      'EZRX-T257 | verify New Payment Page Step 2 - Text Field search on done keyboard button',
      (tester) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    await goToStep2();
    newPaymentStep2Robot.verifyStep2InitialField(priceWithoutCredit);
    await filterTheDateToGetItem();
    newPaymentStep2Robot.verifyAtLeastOneItemFound();
    await commonRobot.searchWithKeyboardAction(noResultCreditSearchKeyword);
    newPaymentStep2Robot.verifyNoItemFound();
  });

  testWidgets(
      'EZRX-T258 | verify New Payment Page Step 2 - Filter Tune Icon Feature - Un Happy flow',
      (tester) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    await goToStep2();
    newPaymentStep2Robot.verifyStep2InitialField(priceWithoutCredit);

    await newPaymentStep2Robot.tapFilter();
    newPaymentStep2Robot.verifyDefaultFilter();
    await newPaymentStep2Robot.clickDocumentDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: invalidFromDate,
      toDate: invalidToDate,
    );
    await newPaymentStep2Robot.verifyOutOfRangeError();
    await commonRobot.cancelDateRangePicker();
    await newPaymentStep2Robot.tapResetFilter();
    newPaymentStep2Robot.verifyAtLeastOneItemFound();
  });

  testWidgets(
      'EZRX-T259 | verify New Payment Page Step 2 - Filter Tune Icon Feature - Happy flow',
      (tester) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    await goToStep2();
    newPaymentStep2Robot.verifyStep2InitialField(priceWithoutCredit);

    await newPaymentStep2Robot.tapFilter();
    newPaymentStep2Robot.verifyDefaultFilter();
    await newPaymentStep2Robot.clickDocumentDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDateStep2,
      toDate: toDate,
    );
    await newPaymentStep2Robot.tapApplyFilter();
    newPaymentStep2Robot.verifyAtLeastOneItemFound();
    await newPaymentStep2Robot.tapFilter();
    await newPaymentStep2Robot.tapResetFilter();
    newPaymentStep2Robot.verifyAtLeastOneItemFound();
  });
  testWidgets('EZRX-T260 | verify New Payment Page Step 2 - All button Feature',
      (tester) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    await goToStep2();
    newPaymentStep2Robot.verifyStep2InitialField(priceWithoutCredit);
    await filterTheDateToGetItem();
    newPaymentStep2Robot.verifyCheckboxStatus(false);
    await newPaymentStep2Robot.tapAllCheckbox();
    newPaymentStep2Robot.verifyCheckboxStatus(true);
    newPaymentStep2Robot.verifyAtLeast1ItemIsCheck();
    await newPaymentStep2Robot.clickFirstItem();
    newPaymentStep2Robot.verifyCheckboxStatus(false);
    await newPaymentStep2Robot.clickFirstItem();
    newPaymentStep2Robot.verifyCheckboxStatus(true);
  });
  testWidgets(
      'EZRX-T261 | verify New Payment Page Step 2 - pull to refresh features',
      (tester) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    await goToStep2();
    newPaymentStep2Robot.verifyStep2InitialField(priceWithoutCredit);
    await filterTheDateToGetItem();
    newPaymentStep2Robot.verifyAtLeastOneItemFound();
    newPaymentStep2Robot.collectTheFirstItem();
    await commonRobot.pullToRefresh();
    await filterTheDateToGetItem();
    newPaymentStep2Robot.verifyTheFirstItemAfterRefresh();
  });

  testWidgets(
      'EZRX-T262 | verify New Payment Page Step 2 - Next Button Feature - Go to step 3',
      (tester) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    await goToStep2();
    newPaymentStep2Robot.verifyStep2InitialField(priceWithoutCredit);
    await filterTheDateToGetItem();
    await commonRobot.searchWithKeyboardAction(creditSearchKeyword);
    await newPaymentStep2Robot.clickFirstItem();
    newPaymentStep2Robot.verifyThePriceAndButton(
      priceWithoutCredit,
      priceWithCredit,
    );
    await newPaymentStep2Robot.tapNextButton();
    newPaymentStep3Robot.verifyStep3InitialField();
  });

  tearDown(() async {
    locator<ZephyrService>().setNameAndStatus();
    await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  });
}
