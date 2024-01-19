import 'package:ezrxmobile/locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../../../core/infrastructure/infra_core/zephyr_service/zephyr_service.dart';
import '../../../../core/infrastructure/zephyr/repository/zephyr_repository.dart';
import '../../../../core/common.dart';
import '../../../../robots/common/common_robot.dart';
import '../../../../robots/common/enum.dart';
import '../../../../robots/common/extension.dart';
import '../../../../robots/login_robot.dart';
import '../../../../robots/more/more_robot.dart';
import '../../../../robots/payments/account_summary/account_invoice/account_invoice_detail_robot.dart';
import '../../../../robots/payments/account_summary/account_invoice/account_invoice_filter_robot.dart';
import '../../../../robots/payments/account_summary/account_invoice/account_invoice_robot.dart';
import '../../../../robots/payments/account_summary/account_summary_root_robot.dart';
import '../../../../robots/payments/new_payment/new_payment_robot.dart';
import '../../../../robots/payments/payment_home_robot.dart';

void main() {
  late LoginRobot loginRobot;
  late CommonRobot commonRobot;
  late MoreRobot moreRobot;
  late PaymentHomeRobot paymentHomeRobot;
  late NewPaymentRobot newPaymentRobot;
  late AccountSummaryRootRobot rootRobot;
  late AccountInvoiceRobot invoiceRobot;
  late AccountInvoiceFilterRobot filterRobot;
  late AccountInvoiceDetailRobot detailRobot;

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // initialize variables
  const marketMalaysia = 'Malaysia';
  const username = 'myclientuser';
  const password = 'St@ysafe01';
  const shipToCode = '0070149863';
  const shipToAddress = 'RSD HOSPITALS SDN BHD (SJMC)';
  const customerCode = '0030082707';
  const currency = 'MYR';

  final documentDateFrom = DateTime(2023, 7, 10);
  final documentDateTo = DateTime(2023, 7, 20);
  final dueDateFrom = DateTime(2023, 7, 10);
  final dueDateTo = DateTime(2023, 8, 29);
  const amountFrom = 400.0;
  const amountTo = 2000.0;
  const validStatuses = ['Overdue', 'Open'];
  const invalidStatus = 'Cleared';
  const invalidLengthSearchKey = '1';
  const invalidSearchKey = '1234567890';

  const invoiceId = '1100001199';
  const invoiceStatus = 'Overdue';
  final invoiceSubtotal = '$currency ${500.0.priceFormatted}';
  final invoiceGrandTotal = '$currency ${500.0.priceFormatted}';

  const materialGroupIndex = 0;
  const material1Index = 0;
  const materialNumber1 = '23046018';
  const materialQty1 = 2;
  final materialUnitPrice1 = '$currency ${500.0.priceFormatted}';
  final materialTotalPrice1 = '$currency ${500.0.priceFormatted}';
  const material2Index = 1;
  const materialNumber2 = '23046018';
  const materialQty2 = 1;
  final materialUnitPrice2 = '$currency ${0.0.priceFormatted}';
  final materialTotalPrice2 = '$currency ${0.0.priceFormatted}';

  void initializeRobot(WidgetTester tester) {
    loginRobot = LoginRobot(tester);
    commonRobot = CommonRobot(tester);
    moreRobot = MoreRobot(tester);
    paymentHomeRobot = PaymentHomeRobot(tester);
    newPaymentRobot = NewPaymentRobot(tester);
    rootRobot = AccountSummaryRootRobot(tester);
    invoiceRobot = AccountInvoiceRobot(tester);
    filterRobot = AccountInvoiceFilterRobot(tester);
    detailRobot = AccountInvoiceDetailRobot(tester);
  }

  Future<void> goToInvoice() async {
    await commonRobot.changeDeliveryAddress(shipToCode);
    await commonRobot.dismissSnackbar();
    await commonRobot.navigateToScreen(NavigationTab.more);
    await moreRobot.tapPaymentTile();
    await paymentHomeRobot.tapAccountSummaryMenu();
  }

  testWidgets('EZRX-T265 | Verify Invoice Page - all initial Fields',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await loginRobot.loginToHomeScreen(username, password, marketMalaysia);
    await goToInvoice();

    //verify
    rootRobot.verifyRootPage();
    rootRobot.verifyTabBar();
    rootRobot.verifyInvoicesPage();
    invoiceRobot.verifyFilterButton();
    invoiceRobot.verifySearchBar();
    invoiceRobot.verifyDownloadButton();
    invoiceRobot.verifyFilterApplied(0);
    invoiceRobot.verifyNewPaymentButton();
  });

  testWidgets('EZRX-T133 | Verify new Payment Feature', (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToInvoice();

    //verify
    invoiceRobot.verifyNewPaymentButton();
    await invoiceRobot.tapNewRequestButton();
    newPaymentRobot.verifyPage();
  });

  testWidgets('EZRX-T131 | Verify filter tune icon - all features',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToInvoice();

    //verify
    invoiceRobot.verifyFilterApplied(0);
    await invoiceRobot.tapFilterButton();
    filterRobot.verifyDefaultFilterApplied();
    await filterRobot.tapDocumentDateField();
    await filterRobot.setDateRangePickerValue(
      fromDate: documentDateFrom,
      toDate: documentDateTo,
    );
    await filterRobot.tapApplyButton();
    invoiceRobot.verifyFilterApplied(1);
    invoiceRobot.verifyItemsInDocumentDateRange(
      fromDate: documentDateFrom,
      toDate: documentDateTo,
    );
    await invoiceRobot.tapFilterButton();
    await filterRobot.enterFromAmount(amountFrom.toString());
    await filterRobot.enterToAmount(amountTo.toString());
    await filterRobot.tapApplyButton();
    invoiceRobot.verifyFilterApplied(2);
    invoiceRobot.verifyItemsInAmountRange(
      fromAmount: amountFrom,
      toAmount: amountTo,
      currency: currency,
    );
    await invoiceRobot.tapFilterButton();
    for (final status in validStatuses) {
      await filterRobot.tapStatusCheckbox(status);
    }
    await filterRobot.tapApplyButton();
    invoiceRobot.verifyFilterApplied(3);
    invoiceRobot.verifyItemsWithStatus(validStatuses);
    await invoiceRobot.tapFilterButton();
    await filterRobot.tapDueDateField();
    await filterRobot.setDateRangePickerValue(
      fromDate: dueDateFrom,
      toDate: dueDateTo,
    );
    await filterRobot.tapApplyButton();
    invoiceRobot.verifyFilterApplied(4);
    invoiceRobot.verifyItems();
    await invoiceRobot.tapFilterButton();
    for (final status in validStatuses) {
      await filterRobot.tapStatusCheckbox(status);
      filterRobot.verifyStatusFilterValue(status, false);
    }
    await filterRobot.tapStatusCheckbox(invalidStatus);
    filterRobot.verifyStatusFilterValue(invalidStatus, true);
    await filterRobot.tapApplyButton();
    invoiceRobot.verifyNoRecordFound();
    await invoiceRobot.tapFilterButton();
    await filterRobot.tapResetButton();
    invoiceRobot.verifyItems();
    invoiceRobot.verifyFilterApplied(0);
    await invoiceRobot.tapFilterButton();
    filterRobot.verifyDefaultFilterApplied();
    await filterRobot.tapCloseIcon();
    invoiceRobot.verifyItems();
  });

  testWidgets('EZRX-T161 | Verify pull to refresh', (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToInvoice();

    //verify
    invoiceRobot.verifyItems();
    await invoiceRobot.tapFilterButton();
    await filterRobot.tapDocumentDateField();
    await filterRobot.setDateRangePickerValue(
      fromDate: documentDateFrom,
      toDate: documentDateTo,
    );
    await filterRobot.tapDueDateField();
    await filterRobot.setDateRangePickerValue(
      fromDate: dueDateFrom,
      toDate: dueDateTo,
    );
    await filterRobot.enterFromAmount(amountFrom.toString());
    await filterRobot.enterToAmount(amountTo.toString());
    await filterRobot.tapStatusCheckbox(invalidStatus);
    await filterRobot.tapApplyButton();
    invoiceRobot.verifyFilterApplied(4);
    invoiceRobot.verifyNoRecordFound();
    await invoiceRobot.searchWithKeyboardAction(invoiceId);
    invoiceRobot.verifySearchBarText(invoiceId);
    await invoiceRobot.pullToRefresh();
    invoiceRobot.verifyItems();
    invoiceRobot.verifySearchBarText('');
    invoiceRobot.verifyFilterApplied(0);
    await invoiceRobot.tapFilterButton();
    filterRobot.verifyDefaultFilterApplied();
  });

  testWidgets(
      'EZRX-T129 | Verify search invoice by inputting invalid keyword on Invoices Tab - Unhappy Flow',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToInvoice();

    //verify
    invoiceRobot.verifyItems();
    await invoiceRobot.searchWithSearchIcon(invalidLengthSearchKey);
    invoiceRobot.verifyInvalidLengthSearchMessage();
    await invoiceRobot.dismissSnackbar();
    await invoiceRobot.searchWithKeyboardAction(invalidLengthSearchKey);
    invoiceRobot.verifyInvalidLengthSearchMessage();
    await invoiceRobot.dismissSnackbar();
    await invoiceRobot.autoSearch(invalidLengthSearchKey);
    invoiceRobot.verifyInvalidLengthSearchMessage(isVisible: false);
    await invoiceRobot.tapFilterButton();
    await filterRobot.tapDocumentDateField();
    await filterRobot.setDateRangePickerValue(
      fromDate: documentDateFrom,
      toDate: documentDateTo,
    );
    await filterRobot.tapApplyButton();
    invoiceRobot.verifyItems();

    await invoiceRobot.searchWithKeyboardAction(invalidSearchKey);
    await invoiceRobot.waitAutoSearchDuration();
    invoiceRobot.verifyLoadingImage(isVisible: false);
    invoiceRobot.verifyNoRecordFound();
  });

  testWidgets(
      'EZRX-T130 | Verify search invoice by inputting valid keyword on Invoices Tab - happy Flow',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToInvoice();

    //verify
    invoiceRobot.verifyItems();
    await invoiceRobot.tapFilterButton();
    await filterRobot.tapDocumentDateField();
    await filterRobot.setDateRangePickerValue(
      fromDate: documentDateFrom,
      toDate: documentDateTo,
    );
    await filterRobot.tapApplyButton();

    await invoiceRobot.searchWithSearchIcon(invoiceId);
    await invoiceRobot.waitAutoSearchDuration();
    invoiceRobot.verifyLoadingImage(isVisible: false);
    invoiceRobot.verifyItemsWithSearchKey(invoiceId);

    await invoiceRobot.searchWithKeyboardAction(invoiceId);
    await invoiceRobot.waitAutoSearchDuration();
    invoiceRobot.verifyLoadingImage(isVisible: false);
    invoiceRobot.verifyItemsWithSearchKey(invoiceId);

    await invoiceRobot.autoSearch(invoiceId);
    invoiceRobot.verifyItemsWithSearchKey(invoiceId);

    await invoiceRobot.searchWithKeyboardAction(invalidSearchKey);
    invoiceRobot.verifyNoRecordFound();
    await invoiceRobot.tapClearSearch();
    invoiceRobot.verifyItems();
  });

  testWidgets(
      'EZRX-T267 | Verify search invoice by inputting valid keyword on Invoice Tab - on keyboard done',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToInvoice();

    //verify
    invoiceRobot.verifyItems();

    await invoiceRobot.searchWithKeyboardAction(invoiceId);
    invoiceRobot.verifySearchBarText(invoiceId);
    invoiceRobot.verifyItemsWithSearchKey(invoiceId);
  });

  testWidgets('EZRX-T281 | Verify filter tune icon - Filter by status',
      (tester) async {
    const status = 'Cleared';
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToInvoice();

    //verify
    invoiceRobot.verifyItems();
    invoiceRobot.verifyFilterApplied(0);
    await invoiceRobot.tapFilterButton();
    await filterRobot.tapStatusCheckbox(status);
    await filterRobot.tapApplyButton();
    invoiceRobot.verifyFilterApplied(1);
    invoiceRobot.verifyItemsWithStatus([status]);
    await invoiceRobot.tapFilterButton();
    filterRobot.verifyStatusFilterValue(status, true);
  });

  testWidgets('EZRX-T280 | Verify filter tune icon - Filter by Amount value',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToInvoice();

    //verify
    invoiceRobot.verifyItems();
    invoiceRobot.verifyFilterApplied(0);
    await invoiceRobot.tapFilterButton();
    await filterRobot.enterFromAmount(amountFrom.toString());
    await filterRobot.enterToAmount(amountTo.toString());
    await filterRobot.tapApplyButton();
    invoiceRobot.verifyFilterApplied(1);
    invoiceRobot.verifyItemsInAmountRange(
      fromAmount: amountFrom,
      toAmount: amountTo,
      currency: currency,
    );
    await invoiceRobot.tapFilterButton();
    filterRobot.verifyAmountRangeApplied(
      amountFrom.toString(),
      amountTo.toString(),
    );
  });

  testWidgets('EZRX-T278 | Verify filter tune icon - Filter by document date',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToInvoice();

    //verify
    invoiceRobot.verifyItems();
    invoiceRobot.verifyFilterApplied(0);
    await invoiceRobot.tapFilterButton();
    await filterRobot.tapDocumentDateField();
    await filterRobot.setDateRangePickerValue(
      fromDate: documentDateFrom,
      toDate: documentDateTo,
    );
    await filterRobot.tapApplyButton();
    invoiceRobot.verifyFilterApplied(1);
    invoiceRobot.verifyItemsInDocumentDateRange(
      fromDate: documentDateFrom,
      toDate: documentDateTo,
    );
    await invoiceRobot.tapFilterButton();
    filterRobot.verifyDocumentDateRangeApplied(
      documentDateFrom.displayDate,
      documentDateTo.displayDate,
    );
  });

  testWidgets('EZRX-T279 | Verify filter tune icon - Filter by due date',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToInvoice();

    //verify
    invoiceRobot.verifyItems();
    invoiceRobot.verifyFilterApplied(0);
    await invoiceRobot.tapFilterButton();
    await filterRobot.tapDueDateField();
    await filterRobot.setDateRangePickerValue(
      fromDate: dueDateFrom,
      toDate: dueDateTo,
    );
    await filterRobot.tapApplyButton();
    invoiceRobot.verifyFilterApplied(1);
    invoiceRobot.verifyItems();
    await invoiceRobot.tapFilterButton();
    filterRobot.verifyDueDateRangeApplied(
      dueDateFrom.displayDate,
      dueDateTo.displayDate,
    );
  });

  testWidgets('EZRX-T277 | Verify filter tune icon - all features unhappy flow',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToInvoice();

    //verify
    invoiceRobot.verifyItems();
    await invoiceRobot.tapFilterButton();
    await filterRobot.enterFromAmount(amountTo.toString());
    await filterRobot.enterToAmount(amountFrom.toString());
    await filterRobot.tapApplyButton();
    filterRobot.verifyInvalidAmountErrorVisible();
    await filterRobot.tapDocumentDateField();
    await filterRobot.setDateRangePickerValue(
      fromDate: documentDateTo,
      toDate: documentDateFrom,
    );
    filterRobot.verifyInvalidDateRangeError();
    await filterRobot.setDateRangePickerValue(
      fromDate: documentDateTo,
      toDate: documentDateFrom,
    );
    await filterRobot.tapDueDateField();
    await filterRobot.setDateRangePickerValue(
      fromDate: documentDateTo,
      toDate: documentDateFrom,
    );
    filterRobot.verifyInvalidDateRangeError();
    await filterRobot.setDateRangePickerValue(
      fromDate: documentDateTo,
      toDate: documentDateFrom,
    );
  });

  testWidgets('EZRX-T132 | Verify Invoice Detail Page', (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToInvoice();

    //verify
    invoiceRobot.verifyItems();
    await invoiceRobot.searchWithKeyboardAction(invoiceId);
    await invoiceRobot.tapFirstItem();
    detailRobot.verifyPage();
    detailRobot.verifyInvoiceIdAndStatus(invoiceId, invoiceStatus);
    detailRobot.verifyCustomerCode(customerCode);
    detailRobot.verifyDeliveryTo(shipToCode);
    detailRobot.verifyOrderAddress(shipToAddress);
    detailRobot.verifySubTotal(invoiceSubtotal);
    detailRobot.verifyGrandTotal(invoiceGrandTotal);
    await detailRobot.verifyMaterial(materialGroupIndex, material1Index);
    detailRobot.verifyMaterialNumber(materialNumber1);
    detailRobot.verifyMaterialQty(materialQty1);
    detailRobot.verifyMaterialUnitPrice(materialUnitPrice1);
    detailRobot.verifyMaterialTotalPrice(materialTotalPrice1);
    await detailRobot.verifyMaterial(materialGroupIndex, material2Index);
    detailRobot.verifyMaterialNumber(materialNumber2);
    detailRobot.verifyMaterialQty(materialQty2);
    detailRobot.verifyMaterialUnitPrice(materialUnitPrice2);
    detailRobot.verifyMaterialTotalPrice(materialTotalPrice2);
    detailRobot.verifyDownloadEInvoiceButton();
  });

  tearDown(() async {
    locator<ZephyrService>().setNameAndStatus();
    await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  });
}
