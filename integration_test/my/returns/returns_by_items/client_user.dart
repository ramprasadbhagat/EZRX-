import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../../core/common.dart';
import '../../../core/infrastructure/infra_core/zephyr_service/zephyr_service.dart';
import '../../../core/infrastructure/zephyr/repository/zephyr_repository.dart';
import '../../../robots/common/common_robot.dart';
import '../../../robots/home/home_robot.dart';
import '../../../robots/login_robot.dart';
import '../../../robots/more/more_robot.dart';
import '../../../robots/returns/returns_by_items/returns_by_items_detail_robot.dart';
import '../../../robots/returns/returns_root_robot.dart';
import '../../../robots/returns/returns_by_items/returns_by_items_filter_robot.dart';
import '../../../robots/returns/returns_by_items/returns_by_items_robot.dart';
import '../../../robots/returns/returns_by_request/returns_by_request_robot.dart';

void main() {
  late LoginRobot loginRobot;
  late CommonRobot commonRobot;
  late MoreRobot moreRobot;
  late ReturnsRootRobot returnsRootRobot;
  late ReturnsByItemsRobot returnsByItemsRobot;
  late ReturnsByRequestRobot returnsByRequestRobot;
  late ReturnsByItemsFilterRobot returnsByItemsFilterRobot;
  late ReturnsByItemsDetailRobot returnsByItemsDetailRobot;
  late HomeRobot homeRobot;

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // initialize variables
  const marketMalaysia = 'Malaysia';
  const username = 'myclientuser';
  const password = 'St@ysafe01';
  const shipToCode = '0070149863';
  const shipToAddress = 'RSD HOSPITALS SDN BHD (SJMC)';
  const customerCode = '0030082707';
  const currency = 'MYR';
  const invalidSearchKey = 'auto-testtttttttttttt';
  const invalidLengthSearchKey = 'a';
  const validSearchKey = 'EZ';
  final fromDate = DateTime.now().subtract(const Duration(days: 360));
  final toDate = DateTime.now().subtract(const Duration(days: 2));
  const fromAmount = '0.0';
  const toAmount = '100000000.0';

  //Return detail data
  const returnStatus = 'Pending Approval';
  const returnId = 'EZRE-200123001511';
  const returnReference = 'Test Return Reference';
  const specialInstructions = 'Test Special Instruction';
  const materialNumber = '21040129';
  const materialName = "VFENDTAB50MG10'S";
  const materialQty = 1;
  const materialPrice = '$currency 402,80';
  const materialPrincipalName = 'PFIZER (M) SDN BHD  (PCL a/c)';
  const materialPrincipalCode = '0000101296';
  const materialInvoiceNumber = '1100001104';
  const materialReturnReason = 'Damaged Stocks';
  const materialReturnComments = '-';

  void initializeRobot(WidgetTester tester) {
    loginRobot = LoginRobot(tester);
    commonRobot = CommonRobot(tester);
    moreRobot = MoreRobot(tester);
    homeRobot = HomeRobot(tester);
    returnsRootRobot = ReturnsRootRobot(tester);
    returnsByItemsRobot = ReturnsByItemsRobot(tester);
    returnsByRequestRobot = ReturnsByRequestRobot(tester);
    returnsByItemsFilterRobot = ReturnsByItemsFilterRobot(tester);
    returnsByItemsDetailRobot = ReturnsByItemsDetailRobot(tester);
  }

  Future<void> goToReturns({required String deliveryAddress}) async {
    //Switch delivery address
    await commonRobot.changeDeliveryAddress(deliveryAddress);

    //Go returns
    await commonRobot.goToMoreTab();
    await moreRobot.tapReturnsTile();
  }

  testWidgets('EZRX-T134 | Verify display items in Returns', (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await loginRobot.loginToHomeScreen(username, password, marketMalaysia);
    await homeRobot.tapReturnsQuickAccess();

    //verify
    returnsRootRobot.verifyTabBarVisible();
    returnsRootRobot.verifyRootPageVisible();
    returnsRootRobot.verifyViewByItemsPageVisible();
    await returnsRootRobot.switchToViewByRequestPage();
    returnsByRequestRobot.verifyFilterButtonVisible();
    returnsByRequestRobot.verifyNewRequestButtonVisible();
    returnsByRequestRobot.verifySearchBarVisible();
    await returnsRootRobot.switchToViewByItemPage();
    returnsByItemsRobot.verifyFilterButtonVisible();
    returnsByItemsRobot.verifyNewRequestButtonVisible();
    returnsByItemsRobot.verifySearchBarVisible();
  });

  testWidgets(
      'EZRX-T135 | Verify display items in View by items tab with data available',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToReturns(deliveryAddress: shipToCode);

    //verify
    returnsRootRobot.verifyTabBarVisible();
    returnsRootRobot.verifyViewByItemsPageVisible();
    returnsByItemsRobot.verifyFilterButtonVisible();
    returnsByItemsRobot.verifyNewRequestButtonVisible();
    returnsByItemsRobot.verifySearchBarVisible();
    returnsByItemsRobot.verifyFilterApplied(1);
    await returnsByItemsRobot.tapFilterButton();
    returnsByItemsFilterRobot.verifyApplyButtonVisible();
    returnsByItemsFilterRobot.verifyResetButtonVisible();
    returnsByItemsFilterRobot.verifyDefaultFilterApplied();
    await returnsByItemsFilterRobot.tapCloseIcon();
    returnsByItemsRobot.verifyReturnItemsVisible();
    await commonRobot.pullToRefresh();
    returnsByItemsRobot.verifyReturnItemsVisible();
  });

  testWidgets(
      'EZRX-T137 | Verify display items in View by items tab with no data available',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToReturns(deliveryAddress: shipToCode);

    //verify
    returnsRootRobot.verifyViewByItemsPageVisible();
    returnsByItemsRobot.verifyFilterApplied(1);
    await commonRobot.autoSearch(validSearchKey);
    returnsByItemsRobot.verifyReturnItemsVisible();
    await commonRobot.autoSearch(invalidSearchKey);
    returnsByItemsRobot.verifyNoRecordFoundVisible();
    await commonRobot.autoSearch(invalidLengthSearchKey);
    commonRobot.verifyInvalidLengthSearchMessageNotVisible();
    returnsByItemsRobot.verifyNoRecordFoundVisible();
    await commonRobot.autoSearch(validSearchKey);
    returnsByItemsRobot.verifyReturnItemsVisible();
  });

  testWidgets(
      'EZRX-T139 | Verify search Return Item with search icon by inputting keyword contains Product name in View by items tab',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToReturns(deliveryAddress: shipToCode);

    //verify
    returnsRootRobot.verifyViewByItemsPageVisible();
    returnsByItemsRobot.verifyReturnItemsVisible();
    await commonRobot.searchWithSearchIcon(invalidLengthSearchKey);
    commonRobot.verifyInvalidLengthSearchMessageVisible();
    await commonRobot.searchWithSearchIcon(materialName);
    await commonRobot.waitAutoSearchDuration();
    commonRobot.verifyLoadingNotVisible();
    returnsByItemsRobot.verifyReturnsWithProductNameVisible(materialName);
  });

  testWidgets(
      'EZRX-T140 | Verify search my order history by inputting keyword contains Product code in View by items tab',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToReturns(deliveryAddress: shipToCode);

    //verify
    returnsRootRobot.verifyViewByItemsPageVisible();
    returnsByItemsRobot.verifyReturnItemsVisible();
    await returnsByItemsRobot.tapFilterButton();
    await returnsByItemsFilterRobot.tapToDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate,
      toDate: toDate,
    );
    await returnsByItemsFilterRobot.tapApplyButton();
    await commonRobot.searchWithKeyboardAction(invalidLengthSearchKey);
    commonRobot.verifyInvalidLengthSearchMessageVisible();
    await commonRobot.searchWithKeyboardAction(invalidSearchKey);
    returnsByItemsRobot.verifyNoRecordFoundVisible();
    await commonRobot.tapClearSearch();
    returnsByItemsRobot.verifyReturnItemsVisible();
    await commonRobot.searchWithKeyboardAction(materialNumber);
    await commonRobot.waitAutoSearchDuration();
    commonRobot.verifyLoadingNotVisible();
    returnsByItemsRobot.verifyReturnsWithProductCodeVisible(materialNumber);
  });

  testWidgets(
      'EZRX-T141 | Verify search Return Item by inputting keyword contains Return ID in View by items tab',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToReturns(deliveryAddress: shipToCode);

    //verify
    returnsRootRobot.verifyViewByItemsPageVisible();
    returnsByItemsRobot.verifyReturnItemsVisible();
    await returnsByItemsRobot.tapFilterButton();
    await returnsByItemsFilterRobot.tapToDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate,
      toDate: toDate,
    );
    await returnsByItemsFilterRobot.tapApplyButton();
    await commonRobot.searchWithKeyboardAction(returnId);
    returnsByItemsRobot.verifyReturnsWithIdVisible(returnId);
  });

  testWidgets(
      'EZRX-T142 | Verify search Return Item by inputting keyword not contain Product name/code/Return ID in View by items tab',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToReturns(deliveryAddress: shipToCode);

    //verify
    returnsRootRobot.verifyViewByItemsPageVisible();
    returnsByItemsRobot.verifyReturnItemsVisible();
    await commonRobot.searchWithKeyboardAction(invalidSearchKey);
    returnsByItemsRobot.verifyNoRecordFoundVisible();
  });

  testWidgets(
      'EZRX-T145 | Verify Filter by Items date when having result found in View by items tab',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToReturns(deliveryAddress: shipToCode);

    //verify
    returnsRootRobot.verifyViewByItemsPageVisible();
    returnsByItemsRobot.verifyFilterApplied(1);
    await returnsByItemsRobot.tapFilterButton();
    returnsByItemsFilterRobot.verifyDefaultFilterApplied();
    await returnsByItemsFilterRobot.tapFromDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate,
      toDate: toDate,
    );
    await returnsByItemsFilterRobot.tapApplyButton();
    returnsByItemsRobot.verifyFilterApplied(1);
    returnsByItemsRobot.verifyReturnGroupInDateRangeVisible(
      fromDate: fromDate,
      toDate: toDate,
    );
  });

  testWidgets(
      'EZRX-T146 | Verify Filter by Request amount when no having result found in View by items tab',
      (tester) async {
    const fromAmount = '100.123400';
    const toAmount = '200.20';
    const invalidToAmount = '1';
    const formattedFromAmount = '100.1234';
    const formattedToAmount = '200.2';
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToReturns(deliveryAddress: shipToCode);

    //verify
    returnsRootRobot.verifyViewByItemsPageVisible();
    returnsByItemsRobot.verifyFilterApplied(1);
    await returnsByItemsRobot.tapFilterButton();
    returnsByItemsFilterRobot.verifyDefaultFilterApplied();
    await returnsByItemsFilterRobot.enterFromAmount(fromAmount);
    await returnsByItemsFilterRobot.enterToAmount(invalidToAmount);
    await returnsByItemsFilterRobot.tapApplyButton();
    returnsByItemsFilterRobot.verifyInvalidAmountErrorVisible();
    await returnsByItemsFilterRobot.enterToAmount(toAmount);
    await returnsByItemsFilterRobot.tapApplyButton();
    returnsByItemsRobot.verifyFilterApplied(2);
    await commonRobot.searchWithKeyboardAction(invalidSearchKey);
    returnsByItemsRobot.verifyNoRecordFoundVisible();
    await returnsByItemsRobot.tapFilterButton();
    returnsByItemsFilterRobot.verifyAmountRangeFilterApplied(
      fromAmount: formattedFromAmount,
      toAmount: formattedToAmount,
    );
  });

  testWidgets(
      'EZRX-T147 | Verify Filter by Status when selecting 1 checkbox in View by items tab',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToReturns(deliveryAddress: shipToCode);

    //verify
    returnsRootRobot.verifyViewByItemsPageVisible();
    returnsByItemsRobot.verifyFilterApplied(1);
    await returnsByItemsRobot.tapFilterButton();
    returnsByItemsFilterRobot.verifyDefaultFilterApplied();
    await returnsByItemsFilterRobot.tapStatusCheckbox(returnStatus);
    returnsByItemsFilterRobot.verifyStatusFilterValue(returnStatus, true);
    await returnsByItemsFilterRobot.tapStatusCheckbox(returnStatus);
    returnsByItemsFilterRobot.verifyStatusFilterValue(returnStatus, false);
    await returnsByItemsFilterRobot.tapStatusCheckbox(returnStatus);
    await returnsByItemsFilterRobot.tapApplyButton();
    returnsByItemsRobot.verifyFilterApplied(2);
    returnsByItemsRobot.verifyReturnsWithStatusVisible(returnStatus.tr());
  });

  testWidgets(
      'EZRX-T154 | Verify Filter by Request amount when having result found in View by items tab',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToReturns(deliveryAddress: shipToCode);

    //verify
    returnsRootRobot.verifyViewByItemsPageVisible();
    returnsByItemsRobot.verifyFilterApplied(1);
    await returnsByItemsRobot.tapFilterButton();
    returnsByItemsFilterRobot.verifyDefaultFilterApplied();
    await returnsByItemsFilterRobot.tapToDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate,
      toDate: toDate,
    );
    await returnsByItemsFilterRobot.enterFromAmount(fromAmount);
    await returnsByItemsFilterRobot.enterToAmount(toAmount);
    await returnsByItemsFilterRobot.tapStatusCheckbox(returnStatus);
    await returnsByItemsFilterRobot.tapApplyButton();
    returnsByItemsRobot.verifyFilterApplied(3);
    await returnsByItemsRobot.tapFilterButton();
    returnsByItemsFilterRobot.verifyAmountRangeFilterApplied(
      fromAmount: fromAmount,
      toAmount: toAmount,
    );
    returnsByItemsFilterRobot.verifyDateRangeFilterApplied(
      fromDate: fromDate,
      toDate: toDate,
    );
    returnsByItemsFilterRobot.verifyStatusFilterValue(returnStatus, true);
    await returnsByItemsFilterRobot.tapCloseIcon();
    returnsByItemsRobot.verifyReturnsWithStatusVisible(returnStatus.tr());
  });

  testWidgets('EZRX-T219 | Verify click on reset button in filter',
      (tester) async {
    final fromDate = DateTime.now().subtract(const Duration(days: 60));
    final toDate = DateTime.now().subtract(const Duration(days: 59));
    const index = 0;
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToReturns(deliveryAddress: shipToCode);

    //verify
    returnsRootRobot.verifyViewByItemsPageVisible();
    returnsByItemsRobot.verifyReturnItemsVisible();
    final returnId = returnsByItemsRobot.getReturnIdText(index: index);
    returnsByItemsRobot.verifyFilterApplied(1);
    await returnsByItemsRobot.tapFilterButton();
    returnsByItemsFilterRobot.verifyDefaultFilterApplied();
    await returnsByItemsFilterRobot.tapToDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate,
      toDate: toDate,
    );
    await returnsByItemsFilterRobot.enterFromAmount(fromAmount);
    await returnsByItemsFilterRobot.enterToAmount(toAmount);
    await returnsByItemsFilterRobot.tapStatusCheckbox(returnStatus);
    await returnsByItemsFilterRobot.tapApplyButton();
    returnsByItemsRobot.verifyFilterApplied(3);
    returnsByItemsRobot.verifyReturnIdTextNotVisible(returnId, index: index);
    await returnsByItemsRobot.tapFilterButton();
    await returnsByItemsFilterRobot.tapResetButton();
    returnsByItemsRobot.verifyFilterApplied(1);
    returnsByItemsRobot.verifyReturnItemsVisible();
    returnsByItemsRobot.verifyReturnIdTextVisible(returnId, index: index);
    await returnsByItemsRobot.tapFilterButton();
    returnsByItemsFilterRobot.verifyDefaultFilterApplied();
  });

  testWidgets('EZRX-T151 | Verify Return detail via View by items tab',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToReturns(deliveryAddress: shipToCode);

    //verify
    returnsRootRobot.verifyViewByItemsPageVisible();
    await returnsByItemsRobot.tapFilterButton();
    await returnsByItemsFilterRobot.tapFromDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate,
      toDate: toDate,
    );
    await returnsByItemsFilterRobot.tapApplyButton();
    await commonRobot.searchWithKeyboardAction(returnId);
    await returnsByItemsRobot.tapFirstReturn();
    returnsByItemsDetailRobot.verifyReturnIdVisible(returnId);
    returnsByItemsDetailRobot.verifyRequestDateVisible();
    returnsByItemsDetailRobot.verifyReturnReferenceVisible(returnReference);
    returnsByItemsDetailRobot
        .verifySpecialInstructionsVisible(specialInstructions);
    returnsByItemsDetailRobot.verifyStatusTrackerVisible(returnStatus);
    returnsByItemsDetailRobot.verifyDeliveryToVisible(shipToCode);
    returnsByItemsDetailRobot.verifyCustomerCodeVisible(customerCode);
    returnsByItemsDetailRobot.verifyReturnAddressVisible(shipToAddress);
    await returnsByItemsDetailRobot.dragToVerifyItemSectionVisible();
    returnsByItemsDetailRobot.verifyMaterialVisible(
      materialNumber,
      materialQty,
      materialPrice,
    );
    returnsByItemsDetailRobot.verifyMaterialDetailCollapsed(true);
  });

  testWidgets(
      'EZRX-T152 | Verify extend information of Return Item detail via View by items tab',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToReturns(deliveryAddress: shipToCode);

    //verify
    returnsRootRobot.verifyViewByItemsPageVisible();
    await returnsByItemsRobot.tapFilterButton();
    await returnsByItemsFilterRobot.tapFromDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate,
      toDate: toDate,
    );
    await returnsByItemsFilterRobot.tapApplyButton();
    await commonRobot.searchWithKeyboardAction(returnId);
    await returnsByItemsRobot.tapFirstReturn();
    returnsByItemsDetailRobot.verifyCopyTextVisible();
    await returnsByItemsDetailRobot.tapCopyButton();
    returnsByItemsDetailRobot.verifyCopiedTextVisible();
    await returnsByItemsDetailRobot.dragToVerifyItemSectionVisible();
    returnsByItemsDetailRobot.verifyMaterialDetailCollapsed(true);
    await returnsByItemsDetailRobot.tapShowDetailButton();
    returnsByItemsDetailRobot.verifyMaterialDetailCollapsed(false);
    returnsByItemsDetailRobot
        .verifyMaterialPrincipalCode(materialPrincipalCode);
    returnsByItemsDetailRobot
        .verifyMaterialPrincipalName(materialPrincipalName);
    returnsByItemsDetailRobot
        .verifyMaterialInvoiceNumber(materialInvoiceNumber);
    returnsByItemsDetailRobot.verifyMaterialInvoiceDate();
    returnsByItemsDetailRobot.verifyMaterialReturnReason(materialReturnReason);
    returnsByItemsDetailRobot
        .verifyMaterialReturnComments(materialReturnComments);
    await returnsByItemsDetailRobot.tapShowDetailButton();
    returnsByItemsDetailRobot.verifyMaterialDetailCollapsed(true);
  });

  tearDown(() async {
    locator<ZephyrService>().setNameAndStatus();
    await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  });
}
