import 'package:ezrxmobile/locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../../core/common.dart';
import '../../../core/infrastructure/infra_core/zephyr_service/zephyr_service.dart';
import '../../../core/infrastructure/zephyr/repository/zephyr_repository.dart';
import '../../../robots/common/common_robot.dart';
import '../../../robots/login_robot.dart';
import '../../../robots/more/more_robot.dart';
import '../../../robots/payment/payment_robot.dart';
import '../../../robots/payment/step1/new_payment_step1_robot.dart';
import '../../../robots/payment/step2/new_payment_step2_robot.dart';

void main() {
  late LoginRobot loginRobot;
  late CommonRobot commonRobot;
  late MoreRobot moreRobot;
  late PaymentRobot paymentRobot;
  late NewPaymentStep1Robot newPaymentStep1Robot;
  late NewPaymentStep2Robot newPaymentStep2Robot;
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  void initializeRobot(WidgetTester tester) {
    loginRobot = LoginRobot(tester);
    commonRobot = CommonRobot(tester);
    moreRobot = MoreRobot(tester);
    paymentRobot = PaymentRobot(tester);
    newPaymentStep1Robot = NewPaymentStep1Robot(tester);
    newPaymentStep2Robot = NewPaymentStep2Robot(tester);
  }

  const marketMalaysia = 'Malaysia';
  const rootUser = 'myclientuser';
  const password = 'St@ysafe01';
  const shipToCode = '0070149863';
  const dummyKeyword = '00000000000';
  const validKeyword = '66';
  final fromDate = DateTime(2014, 1, 1);
  final toDate = DateTime.now();
  final invalidFromDate = DateTime(2099, 1, 1);
  final invalidToDate = DateTime.now();
  const invoiceNumberSearchKeyword = '1040002361';
  const priceWithoutCredit = 7084.66;
  Future<void> loginToHomeTab() async {
    await loginRobot.loginToHomeScreen(rootUser, password, marketMalaysia);
    await commonRobot.changeDeliveryAddress(shipToCode);
  }

  testWidgets('EZRX-T194 | verify New Payment Page Step 1 - Initial Fields',
      (tester) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    await loginToHomeTab();
    await tester.pumpAndSettle();
    await commonRobot.goToMoreTab();
    await moreRobot.tapPaymentTile();
    await paymentRobot.tapNewPayment();
    newPaymentStep1Robot.verifyStep1InitialField();
  });

  testWidgets(
      'EZRX-T195 | verify New Payment Page Step 1 - search Text Fields Unhappy flow',
      (tester) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    await commonRobot.goToMoreTab();
    await moreRobot.tapPaymentTile();
    await paymentRobot.tapNewPayment();
    await commonRobot.searchWithSearchIcon('');
    await commonRobot.verifySnackbarVisible();
    await commonRobot.dismissSnackbar();
    await commonRobot.searchWithSearchIcon(dummyKeyword);
    newPaymentStep1Robot.verifyNoItemFound();
  });
  testWidgets(
      'EZRX-T196 | verify New Payment Page Step 1 - Text Field Happy flow',
      (tester) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    await commonRobot.goToMoreTab();
    await moreRobot.tapPaymentTile();
    await paymentRobot.tapNewPayment();
    await newPaymentStep1Robot.clickFilter();
    await newPaymentStep1Robot.clickDocumentDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate,
      toDate: toDate,
    );
    await newPaymentStep1Robot.tapApplyFilter();
    await commonRobot.searchWithKeyboardAction(validKeyword);
    newPaymentStep1Robot.verifyAtLeast1ItemFound();
    await commonRobot.autoSearch(validKeyword);
    newPaymentStep1Robot.verifyAtLeast1ItemFound();
    await commonRobot.tapClearSearch();
    newPaymentStep1Robot.verifyAtLeast1ItemFound();
  });

  testWidgets(
      'EZRX-T197 | verify New Payment Page Step 1 - Filter Tune Icon Feature - Happy flow',
      (tester) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    await commonRobot.goToMoreTab();
    await moreRobot.tapPaymentTile();
    await paymentRobot.tapNewPayment();
    await newPaymentStep1Robot.clickFilter();
    newPaymentStep1Robot.verifyDefaultFilter();
    await newPaymentStep1Robot.clickDocumentDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate,
      toDate: toDate,
    );
    await newPaymentStep1Robot.clickDueDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate,
      toDate: toDate,
    );
    await newPaymentStep1Robot.clickOpenSelector();
    await newPaymentStep1Robot.tapApplyFilter();
    newPaymentStep1Robot.verifyNoItemFound();
    await newPaymentStep1Robot.clickFilter();
    await newPaymentStep1Robot.clickOverDueSelector();
    await newPaymentStep1Robot.tapApplyFilter();
    newPaymentStep1Robot.verifyAtLeast1ItemFound();
    await newPaymentStep1Robot.clickFilter();
    await newPaymentStep1Robot.tapResetFilter();
    newPaymentStep1Robot.verifyAtLeast1ItemFound();
  });
  testWidgets('EZRX-T198 | verify New Payment Page Step 1 - All button Feature',
      (tester) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    await commonRobot.goToMoreTab();
    await moreRobot.tapPaymentTile();
    await paymentRobot.tapNewPayment();
    await newPaymentStep1Robot.clickFilter();
    await newPaymentStep1Robot.clickDocumentDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate,
      toDate: toDate,
    );
    await newPaymentStep1Robot.tapApplyFilter();
    await newPaymentStep1Robot.tapAllCheckbox();
    newPaymentStep1Robot.verifyAtLeast1ItemIsCheck();
    await newPaymentStep1Robot.clickFirstItem();
    newPaymentStep1Robot.verifyCheckboxStatus(false);
    await newPaymentStep1Robot.clickFirstItem();
    newPaymentStep1Robot.verifyCheckboxStatus(true);
    await newPaymentStep1Robot.tapAllCheckbox();
    newPaymentStep1Robot.verifyNoItemIsCheck();
  });
  testWidgets(
      'EZRX-T199 | verify New Payment Page Step 1 - Next Button Feature - Go to step 2',
      (tester) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    await commonRobot.goToMoreTab();
    await moreRobot.tapPaymentTile();
    await paymentRobot.tapNewPayment();
    await newPaymentStep1Robot.clickFilter();
    await newPaymentStep1Robot.clickDocumentDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate,
      toDate: toDate,
    );
    await newPaymentStep1Robot.tapApplyFilter();
    await commonRobot.searchWithKeyboardAction(invoiceNumberSearchKeyword);
    newPaymentStep1Robot.verifyAtLeast1ItemFound();
    await newPaymentStep1Robot.clickFirstItem();
    newPaymentStep1Robot.verifyButtonEnable();
    await newPaymentStep1Robot.tapNextButton();
    newPaymentStep2Robot.verifyStep2InitialField(priceWithoutCredit);
  });

  testWidgets(
      'EZRX-T200 | verify New Payment Page Step 1 - pull to refresh features',
      (tester) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    await commonRobot.goToMoreTab();
    await moreRobot.tapPaymentTile();
    await paymentRobot.tapNewPayment();
    await newPaymentStep1Robot.clickFilter();
    await newPaymentStep1Robot.clickDocumentDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate,
      toDate: toDate,
    );
    await newPaymentStep1Robot.tapApplyFilter();
    newPaymentStep1Robot.collectTheFirstItem();
    await newPaymentStep1Robot.pullToRefresh();
    await newPaymentStep1Robot.clickFilter();
    await newPaymentStep1Robot.clickDocumentDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate,
      toDate: toDate,
    );
    await newPaymentStep1Robot.tapApplyFilter();
    newPaymentStep1Robot.verifyTheFirstItemAfterRefresh();
  });
  testWidgets(
      'EZRX-T223 | verify New Payment Page Step 1 - Filter Tune Icon Feature - Un Happy flow',
      (tester) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    await commonRobot.goToMoreTab();
    await moreRobot.tapPaymentTile();
    await paymentRobot.tapNewPayment();
    await newPaymentStep1Robot.clickFilter();
    newPaymentStep1Robot.verifyDefaultFilter();
    await newPaymentStep1Robot.clickDocumentDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: invalidFromDate,
      toDate: invalidToDate,
    );
    newPaymentStep1Robot.verifyOutOfRangeError();
    await commonRobot.cancelDateRangePicker();
    await newPaymentStep1Robot.tapResetFilter();
    newPaymentStep1Robot.verifyAtLeast1ItemFound();
  });

  testWidgets(
      'EZRX-T254 | verify New Payment Page Step 1 - Textfield search on clear button',
      (tester) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    await commonRobot.goToMoreTab();
    await moreRobot.tapPaymentTile();
    await paymentRobot.tapNewPayment();
    await newPaymentStep1Robot.clickFilter();
    await newPaymentStep1Robot.clickDocumentDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate,
      toDate: toDate,
    );
    await newPaymentStep1Robot.tapApplyFilter();
    newPaymentStep1Robot.verifyAtLeast1ItemFound();
    await commonRobot.searchWithKeyboardAction(dummyKeyword);
    newPaymentStep1Robot.verifyNoItemFound();
    await commonRobot.tapClearSearch();
    newPaymentStep1Robot.verifyAtLeast1ItemFound();
  });
  testWidgets(
      'EZRX-T253 | verify New Payment Page Step 1 - Textfield search on done keyboard button',
      (tester) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    await commonRobot.goToMoreTab();
    await moreRobot.tapPaymentTile();
    await paymentRobot.tapNewPayment();
    await newPaymentStep1Robot.clickFilter();
    await newPaymentStep1Robot.clickDocumentDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate,
      toDate: toDate,
    );
    await newPaymentStep1Robot.tapApplyFilter();
    newPaymentStep1Robot.verifyAtLeast1ItemFound();
    await commonRobot.searchWithKeyboardAction(dummyKeyword);
    newPaymentStep1Robot.verifyNoItemFound();
  });

  tearDown(() async {
    locator<ZephyrService>().setNameAndStatus();
    await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  });
}
