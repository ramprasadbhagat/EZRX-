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
  const marketMalaysia = 'Malaysia';
  const username = 'myclientuser';
  const password = 'St@ysafe01';
  const shipToCode = '0070149863';
  const invalidSearchKey = 'invalid keyword';
  const invalidLengthSearchKey = 'a';
  const validLengthSearchKey = 'ab';
  const validSearchKey = 'EZ';
  final fromDate = DateTime.now().subtract(const Duration(days: 360));
  final toDate = DateTime.now().subtract(const Duration(days: 2));
  const fromAmount = '100.123400';
  const toAmount = '200.20';
  const invalidToAmount = '1';
  const formattedFromAmount = '100.1234';
  const formattedToAmount = '200.2';
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
      await loginRobot.loginToHomeScreen(username, password, marketMalaysia);
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

  testWidgets(
      'EZRX-T185 | Verify search payment advice by inputting invalid keyword - Unhappy Flow',
      (tester) async {
    //navigate to page
    await goToPaymentSummaryPage(tester);

    //verify
    paymentSummaryRobot.verifyPageVisible();

    await commonRobot.autoSearch(invalidLengthSearchKey);
    commonRobot.verifyInvalidLengthSearchMessage(isVisible: false);

    await commonRobot.searchWithKeyboardAction(invalidLengthSearchKey);
    commonRobot.verifyInvalidLengthSearchMessage(isVisible: true);
    await commonRobot.dismissSnackbar();

    await commonRobot.searchWithKeyboardAction(invalidSearchKey);
    paymentSummaryRobot.verifyNoRecordFoundVisible();
    await commonRobot.tapClearSearch();
  });

  testWidgets(
      'EZRX-T186 | Verify search payment advice by inputting valid keyword - happy Flow',
      (tester) async {
    //navigate to page
    await goToPaymentSummaryPage(tester);

    //verify
    paymentSummaryRobot.verifyPageVisible();

    await commonRobot.searchWithKeyboardAction(validLengthSearchKey);
    paymentSummaryRobot.verifyNoRecordFoundVisible();

    await commonRobot.autoSearch(validLengthSearchKey);
    paymentSummaryRobot.verifyNoRecordFoundVisible();
    await commonRobot.tapClearSearch();

    await commonRobot.searchWithSearchIcon(validLengthSearchKey);
    paymentSummaryRobot.verifyNoRecordFoundVisible();
    await commonRobot.tapClearSearch();

    await commonRobot.searchWithKeyboardAction(validSearchKey);
    paymentSummaryRobot.verifyPaymentSummaryGroupListVisible();
    await commonRobot.tapClearSearch();

    await commonRobot.autoSearch(validSearchKey);
    paymentSummaryRobot.verifyPaymentSummaryGroupListVisible();
    await commonRobot.tapClearSearch();

    await commonRobot.searchWithSearchIcon(validSearchKey);
    paymentSummaryRobot.verifyPaymentSummaryGroupListVisible();

    await commonRobot.tapClearSearch();
    paymentSummaryRobot.verifyPaymentSummaryGroupListVisible();

    await commonRobot.searchWithKeyboardAction(validSearchKey);
    await commonRobot.waitAutoSearchDuration();
    commonRobot.verifyLoadingImage(isVisible: false);
    paymentSummaryRobot.verifyPaymentSummaryGroupListVisible();
    await commonRobot.tapClearSearch();

    await commonRobot.searchWithSearchIcon(validSearchKey);
    await commonRobot.waitAutoSearchDuration();
    commonRobot.verifyLoadingImage(isVisible: false);
    paymentSummaryRobot.verifyPaymentSummaryGroupListVisible();
    await commonRobot.tapClearSearch();
  });

  testWidgets('EZRX-T187 | Verify Download Feature', (tester) async {
    //navigate to page
    await goToPaymentSummaryPage(tester);

    //verify
    paymentSummaryRobot.verifyPageVisible();
    paymentSummaryRobot.verifyDownloadButtonVisible();
    await paymentSummaryRobot.tapDownloadButton();
    paymentSummaryRobot.verifyDownloadSuccessSnackbarVisible();
  });

  testWidgets('EZRX-T188 | Verify Filter Tune Icon', (tester) async {
    //navigate to page
    await goToPaymentSummaryPage(tester);

    //verify
    paymentSummaryRobot.verifyPageVisible();

    //change filter date
    await paymentSummaryRobot.tapFilterButton();
    paymentSummaryFilterRobot.verifyDefaultFilterApplied();
    await paymentSummaryFilterRobot.tapFromDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate,
      toDate: toDate,
    );
    await paymentSummaryFilterRobot.tapApplyButton();
    paymentSummaryRobot.verifyFilterApplied(1);

    //change amount range
    await paymentSummaryRobot.tapFilterButton();
    await paymentSummaryFilterRobot.enterFromAmount(fromAmount);
    await paymentSummaryFilterRobot.enterToAmount(invalidToAmount);
    await paymentSummaryFilterRobot.tapApplyButton();
    paymentSummaryFilterRobot.verifyInvalidAmountErrorVisible();
    await paymentSummaryFilterRobot.enterToAmount(toAmount);
    await paymentSummaryFilterRobot.tapApplyButton();
    await paymentSummaryFilterRobot.tapApplyButton();
    await paymentSummaryRobot.tapFilterButton();
    paymentSummaryFilterRobot.verifyAmountRangeFilterApplied(
      fromAmount: formattedFromAmount,
      toAmount: formattedToAmount,
    );
    await paymentSummaryFilterRobot.tapCloseIcon();
    paymentSummaryRobot.verifyFilterApplied(2);

    //change status
    await paymentSummaryRobot.tapFilterButton();
    await paymentSummaryFilterRobot.tapStatusCheckbox(statusFilter);
    paymentSummaryFilterRobot.verifyStatusFilterValue(statusFilter, true);
    await paymentSummaryFilterRobot.tapApplyButton();
    paymentSummaryRobot.verifyFilterApplied(3);
  });

  testWidgets('EZRX-T189 | Verify pull to refresh Feature', (tester) async {
    //navigate to page
    await goToPaymentSummaryPage(tester);

    //verify
    paymentSummaryRobot.verifyPageVisible();
    await paymentSummaryRobot.pullToRefresh();
    paymentSummaryRobot.verifyPaymentSummaryGroupListVisible();
  });

  tearDown(() async {
    locator<ZephyrService>().setNameAndStatus();
    await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  });
}
