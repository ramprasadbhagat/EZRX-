import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../../../core/common.dart';
import '../../../../core/infrastructure/infra_core/zephyr_service/zephyr_service.dart';
import '../../../../robots/common/common_robot.dart';
import '../../../../robots/common/extension.dart';
import '../../../../robots/home/home_robot.dart';
import '../../../../robots/login_robot.dart';
import '../../../../robots/payments/account_summary/account_credits/account_credits_detail_robot.dart';
import '../../../../robots/payments/account_summary/account_credits/account_credits_filter_robot.dart';
import '../../../../robots/payments/account_summary/account_credits/account_credits_robot.dart';
import '../../../../robots/payments/account_summary/account_summary_root_robot.dart';
import '../../../../robots/payments/new_payment/new_payment_robot.dart';
import '../../../../robots/payments/payment_home_robot.dart';

void main() {
  late LoginRobot loginRobot;
  late CommonRobot commonRobot;
  late HomeRobot homeRobot;
  late PaymentHomeRobot paymentHomeRobot;
  late AccountSummaryRootRobot accountSummaryRootRobot;
  late AccountCreditsRobot accountCreditsRobot;
  late AccountCreditDetailsRobot accountCreditDetailsRobot;
  late AccountCreditsFilterRobot accountCreditsFilterRobot;
  late NewPaymentRobot newPaymentRobot;

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // initialize variables
  const marketMalaysia = 'Malaysia';
  const username = 'myclientuser';
  const password = 'St@ysafe01';
  const shipToCode = '0070149863';
  const shipToAddress = 'RSD HOSPITALS SDN BHD (SJMC)';
  const customerCode = '0030082707';
  //material info
  const creditId = '4040002409';
  const creditStatus = 'Cleared';
  const currency = 'MYR';
  const creditPrice = '$currency 1,160.00';

  const inValidCreditId = '1232136712';

  //date
  final currentDate = DateTime.now();
  final pastTenYearsDate = currentDate.subtract(const Duration(days: 3600));

  void initializeRobot(WidgetTester tester) {
    loginRobot = LoginRobot(tester);
    commonRobot = CommonRobot(tester);
    homeRobot = HomeRobot(tester);
    paymentHomeRobot = PaymentHomeRobot(tester);
    accountSummaryRootRobot = AccountSummaryRootRobot(tester);
    accountCreditsRobot = AccountCreditsRobot(tester);
    accountCreditsFilterRobot = AccountCreditsFilterRobot(tester);
    newPaymentRobot = NewPaymentRobot(tester);
    accountCreditDetailsRobot = AccountCreditDetailsRobot(tester);
  }

  Future<void> goToAccountSummaryCreditPage({String? shipToCode}) async {
    if (shipToCode != null) {
      await commonRobot.changeDeliveryAddress(shipToCode);
    }

    await homeRobot.tapPaymentQuickAccess();
    paymentHomeRobot.verifyPage();
    await paymentHomeRobot.tapAccountSummaryMenu();
    accountSummaryRootRobot.verifyRootPage();
    accountSummaryRootRobot.verifyTabBar();
    accountSummaryRootRobot.verifyInvoicesPage();
    await accountSummaryRootRobot.switchToCreditPage();
    accountSummaryRootRobot.verifyCreditsPage();
    accountCreditsRobot.verify();
  }

  Future<void> applyFilterDateToGetData({
    DateTime? fromDate,
    DateTime? toDate,
  }) async {
    accountCreditsRobot.verifyFilterTuneIcon();
    accountCreditsRobot.verifyFilterAppliedCount(0);
    await accountCreditsRobot.tapFilterTuneIcon();
    accountCreditsFilterRobot.verifyCreditsFilter();
    await accountCreditsFilterRobot.tapFromDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate ?? pastTenYearsDate,
      toDate: toDate ?? currentDate,
    );
    accountCreditsFilterRobot.verifyDateRangeFilterApplied(
      fromDate: fromDate?.displayDate ?? pastTenYearsDate.displayDate,
      toDate: toDate?.displayDate ?? currentDate.displayDate,
    );
    await accountCreditsFilterRobot.tapApplyButton();

    //verify at least one credit item
    accountCreditsRobot.verifyCreditItemsList();
    //verify filter count
    accountCreditsRobot.verifyFilterAppliedCount(1);
  }

  testWidgets('EZRX-T264 | verify Credit Page - all initial Fields',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);

    //redirect to Account summary Credit Page
    await loginRobot.loginToHomeScreen(username, password, marketMalaysia);
    await goToAccountSummaryCreditPage(shipToCode: shipToCode);

    //search bar
    accountCreditsRobot.verifyCreditSearchBar();
    //filter
    accountCreditsRobot.verifyFilterTuneIcon();
    accountCreditsRobot.verifyFilterAppliedCount(0);
    await accountCreditsRobot.tapFilterTuneIcon();
    accountCreditsFilterRobot.verifyCreditsFilter();
    accountCreditsFilterRobot.verifyDefaultFilterApplied();
    await accountCreditsFilterRobot.tapCloseButton();
    accountCreditsFilterRobot.verifyCreditsFilter(isVisible: false);
    //download button
    accountCreditsRobot.verifyFileDownloadButton();
    //new payment button
    accountCreditsRobot.verifyNewPaymentButton();
  });

  testWidgets(
      'EZRX-T158 | Verify search credits by inputting invalid keyword on Credits Tab - Unhappy Flow',
      (tester) async {
    const inValidShortText = '1';
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);

    //redirect to Account summary Credit Page
    await goToAccountSummaryCreditPage();

    //search bar
    accountCreditsRobot.verifyCreditSearchBar();
    await commonRobot.autoSearch(inValidShortText);
    commonRobot.verifyInvalidLengthSearchMessage(isVisible: false);
    await commonRobot.searchWithKeyboardAction(inValidShortText);
    commonRobot.verifyInvalidLengthSearchMessage();

    //No credit found - keyboard done
    await commonRobot.searchWithKeyboardAction(inValidCreditId);
    accountCreditsRobot.verifyNoCreditFound();
    await commonRobot.tapClearSearch();

    //No credit found - auto search
    await commonRobot.autoSearch(inValidCreditId);
    accountCreditsRobot.verifyNoCreditFound();
    await commonRobot.tapClearSearch();

    //No credit found - search icon
    await commonRobot.searchWithSearchIcon(inValidCreditId);
    accountCreditsRobot.verifyNoCreditFound();
    await commonRobot.tapClearSearch();
  });

  testWidgets(
      'EZRX-T266 | Verify search credit by inputting valid keyword on Credits Tab - on keyboard done',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);

    //redirect to Account summary Credit Page
    await goToAccountSummaryCreditPage();

    //filter applied
    await applyFilterDateToGetData();

    //search bar - valid input with on done keyboard button
    await commonRobot.searchWithKeyboardAction(creditId);
    accountCreditsRobot.verifyCreditItem(creditId, creditStatus, creditPrice);
  });

  testWidgets(
      'EZRX-T159 | Verify search credit by inputting valid keyword on Credits Tab - Happy flow - Every feature',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);

    //redirect to Account summary Credit Page
    await goToAccountSummaryCreditPage();

    //filter applied
    await applyFilterDateToGetData();

    //search bar - valid input with on done keyboard button
    await commonRobot.searchWithKeyboardAction(creditId);
    accountCreditsRobot.verifyCreditItem(creditId, creditStatus, creditPrice);
    await commonRobot.tapClearSearch();

    //search bar -  valid input with on auto search
    await commonRobot.autoSearch(creditId);
    accountCreditsRobot.verifyCreditItem(creditId, creditStatus, creditPrice);
    await commonRobot.tapClearSearch();

    //search bar -  valid input with on search icon
    await commonRobot.searchWithSearchIcon(creditId);
    accountCreditsRobot.verifyCreditItem(creditId, creditStatus, creditPrice);
    await commonRobot.tapClearSearch();

    //search bar - combine keyboard done & auto search
    await commonRobot.searchWithKeyboardAction(creditId);
    accountCreditsRobot.verifyCreditItem(creditId, creditStatus, creditPrice);
    await commonRobot.waitAutoSearchDuration();
    commonRobot.verifyLoadingImage(isVisible: false);
    await commonRobot.tapClearSearch();

    //search bar - combine search icon & auto search
    await commonRobot.searchWithSearchIcon(creditId);
    accountCreditsRobot.verifyCreditItem(creditId, creditStatus, creditPrice);
    await commonRobot.waitAutoSearchDuration();
    commonRobot.verifyLoadingImage(isVisible: false);
    await commonRobot.tapClearSearch();
  });

  testWidgets('EZRX-T162 | verify pull to refresh', (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);

    //redirect to Account summary Credit Page
    await goToAccountSummaryCreditPage();

    //filter applied
    await applyFilterDateToGetData();

    //search bar - valid input with on done keyboard button
    await commonRobot.searchWithKeyboardAction(inValidCreditId);
    accountCreditsRobot.verifyNoCreditFound();
    await commonRobot.pullToRefresh();
    accountCreditsRobot.verifyCreditItemsList();
    await accountCreditsRobot.tapFilterTuneIcon();
    await accountCreditsRobot.tapFilterTuneIcon();
    accountCreditsFilterRobot.verifyCreditsFilter();
    accountCreditsFilterRobot.verifyDefaultFilterApplied();
    await accountCreditsFilterRobot.tapCloseButton();
  });

  testWidgets(
      'EZRX-T164 | Verify new Payment Button Feature - Create new payment',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);

    //redirect to Account summary Credit Page
    await goToAccountSummaryCreditPage();

    //Tap on new payment button
    await accountCreditsRobot.tapPaymentButton();

    //verify new payment page
    newPaymentRobot.verifyPage();

    //close
    await newPaymentRobot.tapCloseButton();

    //verify credit page
    accountCreditsRobot.verify();
  });

  testWidgets('EZRX-T169 | verify Credits Detail Page', (tester) async {
    //variables
    const documentType = 'Credit memo';
    const referenceNumber = '1100001268';
    const documentDate = '25 Aug 2023';
    const returnMaterialNumber1 = '23348057';
    const returnMaterialNumber2 = returnMaterialNumber1;
    const returnQuantity1 = 8;
    const returnQuantity2 = 1;
    const returnUnitPrice1 = '$currency 145.00';
    const returnUnitPrice2 = '$currency .00';
    const returnMaterialTotalPrice1 = '$currency 1,160.00';
    const returnMaterialTotalPrice2 = '$currency .00';
    const totalReturnQuantity = returnQuantity1 + returnQuantity2;

    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);

    //redirect to Account summary Credit Page
    await goToAccountSummaryCreditPage();

    //filter applied
    await applyFilterDateToGetData();

    //search bar - valid input with on done keyboard button
    await commonRobot.searchWithKeyboardAction(creditId);

    //verify item
    accountCreditsRobot.verifyCreditItem(creditId, creditStatus, creditPrice);

    //Tap on first item after search
    await accountCreditsRobot.tapFirstCreditItem();

    //verify Details page
    accountCreditDetailsRobot.verify();
    accountCreditDetailsRobot.verifyCreditDetailId(creditId);
    accountCreditDetailsRobot.verifyCreditDetailStatus(creditStatus);
    accountCreditDetailsRobot.verifyCreditDetailDocumentDate(documentDate);
    accountCreditDetailsRobot.verifyCreditDetailDocumentType(documentType);
    accountCreditDetailsRobot
        .verifyCreditDetailReferenceNumber(referenceNumber);
    accountCreditDetailsRobot.verifyCreditDetails(documentType);
    //verify address
    accountCreditDetailsRobot.verifyCustomerCode(customerCode);
    accountCreditDetailsRobot.verifyOrderAddress(shipToAddress);
    accountCreditDetailsRobot.verifyDeliveryTo(shipToCode);
    //credit summary
    accountCreditDetailsRobot.verifyCreditItemTotalPrice(creditPrice);
    //return items
    accountCreditDetailsRobot.verifyReturnItems(totalReturnQuantity);
    accountCreditDetailsRobot.verifyReturnMaterial(
      returnMaterialNumber1,
      returnQuantity1,
      returnUnitPrice1,
      returnMaterialTotalPrice1,
    );
    accountCreditDetailsRobot.verifyReturnMaterial(
      returnMaterialNumber2,
      returnQuantity2,
      returnUnitPrice2,
      returnMaterialTotalPrice2,
    );
  });

  testWidgets('EZRX-T268 | Verify filter tune icon - Filter by document date',
      (tester) async {
    //variables - last 5 year data
    final fromDate = DateTime.now().subtract(const Duration(days: 1800));
    final toDate = DateTime.now();

    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);

    //redirect to Account summary Credit Page
    await goToAccountSummaryCreditPage();

    //filter applied
    await applyFilterDateToGetData(fromDate: fromDate, toDate: toDate);

    //verify Document Date in range
    accountCreditsRobot.verifyCreditsCreatedGroupInDateRange(
      fromDate: fromDate,
      toDate: toDate,
    );
  });

  testWidgets('EZRX-T270 | Verify filter tune icon - Filter by status',
      (tester) async {
    //variables
    const clearedStatus = 'Cleared';

    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);

    //redirect to Account summary Credit Page
    await goToAccountSummaryCreditPage();

    //filter applied
    await applyFilterDateToGetData();

    //verify filter count & tap on filter icon
    accountCreditsRobot.verifyFilterAppliedCount(1);
    await accountCreditsRobot.tapFilterTuneIcon();

    //Apply status - Cleared
    accountCreditsFilterRobot.verifyStatusFilter(clearedStatus, false);
    await accountCreditsFilterRobot.tapToChangeStatusCheckbox(clearedStatus);
    accountCreditsFilterRobot.verifyStatusFilter(clearedStatus, true);
    await accountCreditsFilterRobot.tapApplyButton();
    //verify status filter applied
    accountCreditsRobot.verifyFilterAppliedCount(2);
    accountCreditsRobot.verifyCreditsItemListWithStatus(clearedStatus);
  });

  testWidgets('EZRX-T269 | Verify filter tune icon - Filter by Amount value',
      (tester) async {
    const fromAmount = '1000.0';
    const toAmount = '1200.0';

    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    //redirect to Account summary Credit Page
    await goToAccountSummaryCreditPage();
    //filter applied
    await applyFilterDateToGetData();
    //Tap on filter icon
    await accountCreditsRobot.tapFilterTuneIcon();

    //Apply status - Amount
    await accountCreditsFilterRobot.enterFromAmount(fromAmount.toString());
    await accountCreditsFilterRobot.enterToAmount(toAmount.toString());
    accountCreditsFilterRobot.verifyAmountRangeFilterApplied(
      fromAmount: fromAmount,
      toAmount: toAmount,
    );
    await accountCreditsFilterRobot.tapApplyButton();
    accountCreditsRobot.verifyFilterAppliedCount(2);
    //verify amount credit filter list
    accountCreditsRobot.verifyCreditsInAmountRange(
      fromAmount: double.parse(fromAmount),
      toAmount: double.parse(toAmount),
      currency: currency,
    );
  });

  testWidgets('EZRX-T178 | Verify filter tune icon - all features happy flow',
      (tester) async {
    //variable
    final fromDate = DateTime(2015, 10, 10);
    final toDate = DateTime(2023, 10, 10);
    const clearedStatus = 'Cleared';
    const openStatus = 'Open';
    const fromAmount = '1000.0';
    const toAmount = '1200.0';

    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);

    //redirect to Account summary Credit Page
    await goToAccountSummaryCreditPage();

    //Apply status - Document Date
    await applyFilterDateToGetData(fromDate: fromDate, toDate: toDate);
    //verify filter count & tap on filter icon
    accountCreditsRobot.verifyFilterAppliedCount(1);
    //verify document date & status filter applied
    accountCreditsRobot.verifyCreditsCreatedGroupInDateRange(
      fromDate: fromDate,
      toDate: toDate,
    );
    //Tap on filter icon
    await accountCreditsRobot.tapFilterTuneIcon();

    //Apply status - Amount
    await accountCreditsFilterRobot.enterFromAmount(fromAmount.toString());
    await accountCreditsFilterRobot.enterToAmount(toAmount.toString());
    accountCreditsFilterRobot.verifyAmountRangeFilterApplied(
      fromAmount: fromAmount,
      toAmount: toAmount,
    );
    await accountCreditsFilterRobot.tapApplyButton();
    accountCreditsRobot.verifyFilterAppliedCount(2);
    //verify amount credit filter list
    accountCreditsRobot.verifyCreditsInAmountRange(
      fromAmount: double.parse(fromAmount),
      toAmount: double.parse(toAmount),
      currency: currency,
    );
    //verify document date credit filter list
    accountCreditsRobot.verifyCreditsCreatedGroupInDateRange(
      fromDate: fromDate,
      toDate: toDate,
    );

    //Tap on filter icon
    await accountCreditsRobot.tapFilterTuneIcon();
    //Apply status - cleared
    accountCreditsFilterRobot.verifyStatusFilter(clearedStatus, false);
    await accountCreditsFilterRobot.tapToChangeStatusCheckbox(clearedStatus);
    accountCreditsFilterRobot.verifyStatusFilter(clearedStatus, true);
    await accountCreditsFilterRobot.tapApplyButton();
    //verify clear status credit filter list
    accountCreditsRobot.verifyCreditsItemListWithStatus(clearedStatus);
    //Tap on filter icon
    await accountCreditsRobot.tapFilterTuneIcon();
    //Apply status - open
    accountCreditsFilterRobot.verifyStatusFilter(openStatus, false);
    await accountCreditsFilterRobot.tapToChangeStatusCheckbox(openStatus);
    accountCreditsFilterRobot.verifyStatusFilter(openStatus, true);
    await accountCreditsFilterRobot.tapApplyButton();
    accountCreditsRobot.verifyFilterAppliedCount(3);

    //verify document date credit filter list
    accountCreditsRobot.verifyCreditsCreatedGroupInDateRange(
      fromDate: fromDate,
      toDate: toDate,
    );
    //Again verify amount credit filter list
    accountCreditsRobot.verifyCreditsInAmountRange(
      fromAmount: double.parse(fromAmount),
      toAmount: double.parse(toAmount),
      currency: currency,
    );

    //verify reset feature
    await accountCreditsRobot.tapFilterTuneIcon();
    await accountCreditsFilterRobot.tapResetButton();
    //verify credit item list
    accountCreditsRobot.verifyCreditItemsList();
    //verify filter
    accountCreditsRobot.verifyFilterAppliedCount(0);
    await accountCreditsRobot.tapFilterTuneIcon();
    accountCreditsFilterRobot.verifyDefaultFilterApplied();
    await accountCreditsFilterRobot.tapCloseButton();
  });

  testWidgets('EZRX-T271 | Verify filter tune icon - all features unhappy flow',
      (tester) async {
    //variable
    final fromDate = DateTime(2023, 10, 5);
    final toDate = DateTime(2023, 10, 12);
    const clearedStatus = 'Cleared';
    const fromAmount = '100.0';
    const toAmount = '90.0';

    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);

    //redirect to Account summary Credit Page
    await goToAccountSummaryCreditPage();
    //filter applied
    await applyFilterDateToGetData(fromDate: fromDate, toDate: toDate);
    //Tap on filter icon
    await accountCreditsRobot.tapFilterTuneIcon();

    //Apply status - cleared
    accountCreditsFilterRobot.verifyStatusFilter(clearedStatus, false);
    await accountCreditsFilterRobot.tapToChangeStatusCheckbox(clearedStatus);
    accountCreditsFilterRobot.verifyStatusFilter(clearedStatus, true);
    await accountCreditsFilterRobot.tapApplyButton();
    //verify clear status credit filter list
    accountCreditsRobot.verifyCreditsItemListWithStatus(
      clearedStatus,
      isVisible: false,
    );
    accountCreditsRobot.verifyFilterAppliedCount(2);

    //Tap on filter icon
    await accountCreditsRobot.tapFilterTuneIcon();
    accountCreditsFilterRobot.verifyCreditsFilter();
    await accountCreditsFilterRobot.enterFromAmount(fromAmount.toString());
    await accountCreditsFilterRobot.enterToAmount(toAmount.toString());
    accountCreditsFilterRobot.verifyAmountRangeFilterApplied(
      fromAmount: fromAmount,
      toAmount: toAmount,
    );
    await accountCreditsFilterRobot.tapApplyButton();
    accountCreditsFilterRobot.verifyInvalidAmountError();

    //invalid document date filter applied - fromDate > toDate
    await accountCreditsFilterRobot.tapFromDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: toDate,
      toDate: fromDate,
    );
    accountCreditsFilterRobot.verifyInvalidDateRangeError();
  });

  tearDown(() async => await updateTestCaseOnZephyr(CycleKeyId.myClient));
}
