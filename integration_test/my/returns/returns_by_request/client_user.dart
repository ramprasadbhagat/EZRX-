import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../../core/common.dart';
import '../../../core/infrastructure/infra_core/zephyr_service/zephyr_service.dart';
import '../../../core/infrastructure/zephyr/repository/zephyr_repository.dart';
import '../../../robots/common/common_robot.dart';
import '../../../robots/common/extension.dart';
import '../../../robots/home/home_robot.dart';
import '../../../robots/login_robot.dart';
import '../../../robots/more/more_robot.dart';
import '../../../robots/returns/returns_by_request/returns_by_request_detail_robot.dart';
import '../../../robots/returns/returns_by_request/returns_by_request_filter_robot.dart';
import '../../../robots/returns/returns_root_robot.dart';
import '../../../robots/returns/returns_by_request/returns_by_request_robot.dart';

void main() {
  late LoginRobot loginRobot;
  late CommonRobot commonRobot;
  late MoreRobot moreRobot;
  late ReturnsRootRobot returnsRootRobot;
  late ReturnsByRequestRobot returnsByRequestRobot;
  late ReturnsByRequestFilterRobot returnsByRequestFilterRobot;
  late ReturnsByRequestDetailRobot returnsByRequestDetailRobot;
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
  const returnStatus = 'Pending Review';
  const returnId = 'EZRE-200123001511';
  const returnReference = 'Test Return Reference';
  const specialInstructions = 'Test Special Instruction';
  final returnSubTotal = '$currency ${402.8.priceFormatted}';
  final returnGrandTotal = '$currency ${402.8.priceFormatted}';

  //Material data
  const materialIndex = 0;
  const materialNumber = '21040129';

  void initializeRobot(WidgetTester tester) {
    loginRobot = LoginRobot(tester);
    commonRobot = CommonRobot(tester);
    moreRobot = MoreRobot(tester);
    homeRobot = HomeRobot(tester);
    returnsRootRobot = ReturnsRootRobot(tester);
    returnsByRequestRobot = ReturnsByRequestRobot(tester);
    returnsByRequestFilterRobot = ReturnsByRequestFilterRobot(tester);
    returnsByRequestDetailRobot = ReturnsByRequestDetailRobot(tester);
  }

  testWidgets(
      'EZRX-T136 | Verify display items in View by return requests tab with data available',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await loginRobot.loginToHomeScreen(username, password, marketMalaysia);
    await commonRobot.changeDeliveryAddress(shipToCode);
    await commonRobot.goToMoreTab();
    await moreRobot.tapReturnsTile();

    //verify
    returnsRootRobot.verifyTabBarVisible();
    returnsRootRobot.verifyViewByItemsPageVisible();
    await returnsRootRobot.switchToViewByRequestPage();
    returnsRootRobot.verifyViewByRequestPageVisible();
    returnsByRequestRobot.verifyFilterApplied(1);
    await returnsByRequestRobot.tapFilterButton();
    returnsByRequestFilterRobot.verifyDefaultFilterApplied();
    returnsByRequestFilterRobot.verifyResetButtonVisible();
    returnsByRequestFilterRobot.verifyApplyButtonVisible();
    await returnsByRequestFilterRobot.tapCloseIcon();
    returnsByRequestRobot.verifyReturnRequestVisible();
  });

  testWidgets(
      'EZRX-T138 | Verify display items in View by return requests tab with no data available with auto search',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await commonRobot.changeDeliveryAddress(shipToCode);
    await homeRobot.tapReturnsQuickAccess();

    //verify
    returnsRootRobot.verifyTabBarVisible();
    await returnsRootRobot.switchToViewByRequestPage();
    returnsRootRobot.verifyViewByRequestPageVisible();
    returnsByRequestRobot.verifyFilterApplied(1);
    await commonRobot.autoSearch(validSearchKey);
    returnsByRequestRobot.verifyReturnRequestVisible();
    await commonRobot.autoSearch(invalidSearchKey);
    returnsByRequestRobot.verifyNoRecordFoundVisible();
    await commonRobot.autoSearch(invalidLengthSearchKey);
    commonRobot.verifyInvalidLengthSearchMessage(isVisible: false);
    returnsByRequestRobot.verifyNoRecordFoundVisible();
    await commonRobot.autoSearch(validSearchKey);
    returnsByRequestRobot.verifyReturnRequestVisible();
  });

  testWidgets(
      'EZRX-T143 | Verify search Return Request by inputting keyword contains Return ID in View by return requests tab with search icon',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await commonRobot.changeDeliveryAddress(shipToCode);
    await homeRobot.tapReturnsQuickAccess();

    //verify
    returnsRootRobot.verifyTabBarVisible();
    await returnsRootRobot.switchToViewByRequestPage();
    returnsRootRobot.verifyViewByRequestPageVisible();
    returnsByRequestRobot.verifyFilterApplied(1);
    await commonRobot.searchWithSearchIcon(invalidLengthSearchKey);
    commonRobot.verifyInvalidLengthSearchMessage();
    await returnsByRequestRobot.tapFilterButton();
    await returnsByRequestFilterRobot.tapFromDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate,
      toDate: toDate,
    );
    await returnsByRequestFilterRobot.tapApplyButton();
    await commonRobot.searchWithSearchIcon(returnId);
    await commonRobot.waitAutoSearchDuration();
    commonRobot.verifyLoadingImage(isVisible: false);
    returnsByRequestRobot.verifyReturnsWithIdVisible(returnId);
  });

  testWidgets(
      'EZRX-T144 | Verify search Return Request by inputting keyword not contain Return ID in View by return requests tab',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await commonRobot.changeDeliveryAddress(shipToCode);
    await homeRobot.tapReturnsQuickAccess();

    //verify
    returnsRootRobot.verifyTabBarVisible();
    await returnsRootRobot.switchToViewByRequestPage();
    returnsRootRobot.verifyViewByRequestPageVisible();
    returnsByRequestRobot.verifyFilterApplied(1);
    await commonRobot.searchWithKeyboardAction(invalidLengthSearchKey);
    commonRobot.verifyInvalidLengthSearchMessage();
    await commonRobot.searchWithKeyboardAction(invalidSearchKey);
    returnsByRequestRobot.verifyNoRecordFoundVisible();
    await commonRobot.tapClearSearch();
    returnsByRequestRobot.verifyReturnRequestVisible();
    await commonRobot.searchWithKeyboardAction(invalidSearchKey);
    returnsByRequestRobot.verifyNoRecordFoundVisible();
    await commonRobot.pullToRefresh();
    returnsByRequestRobot.verifyReturnRequestVisible();
  });

  testWidgets(
      'EZRX-T148 | Verify Filter by Request date when having result found in View by return requests tab',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await commonRobot.changeDeliveryAddress(shipToCode);
    await homeRobot.tapReturnsQuickAccess();

    //verify
    returnsRootRobot.verifyTabBarVisible();
    await returnsRootRobot.switchToViewByRequestPage();
    await returnsByRequestRobot.tapFilterButton();
    await returnsByRequestFilterRobot.tapToDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate,
      toDate: toDate,
    );
    await returnsByRequestFilterRobot.tapApplyButton();
    returnsByRequestRobot.verifyReturnGroupInDateRangeVisible(
      fromDate: fromDate,
      toDate: toDate,
    );
    await returnsByRequestRobot.tapFilterButton();
    returnsByRequestFilterRobot.verifyDateRangeFilterApplied(
      fromDate: fromDate,
      toDate: toDate,
    );
  });

  testWidgets(
      'EZRX-T149 | Verify Filter by Request amount when having result found in View by return requests tab',
      (tester) async {
    const fromAmount = '100.123400';
    const toAmount = '500.20';
    const invalidToAmount = '1';
    const formattedFromAmount = '100.1234';
    const formattedToAmount = '500.2';
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await commonRobot.changeDeliveryAddress(shipToCode);
    await homeRobot.tapReturnsQuickAccess();

    //verify
    returnsRootRobot.verifyTabBarVisible();
    await returnsRootRobot.switchToViewByRequestPage();
    await returnsByRequestRobot.tapFilterButton();
    await returnsByRequestFilterRobot.tapToDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate,
      toDate: toDate,
    );
    await returnsByRequestFilterRobot.enterFromAmount(fromAmount);
    await returnsByRequestFilterRobot.enterToAmount(invalidToAmount);
    await returnsByRequestFilterRobot.tapApplyButton();
    returnsByRequestFilterRobot.verifyInvalidAmountErrorVisible();
    await returnsByRequestFilterRobot.enterToAmount(toAmount);
    await returnsByRequestFilterRobot.tapApplyButton();
    returnsByRequestRobot.verifyFilterApplied(2);
    returnsByRequestRobot.verifyReturnGroupInAmountRangeVisible(
      currency: currency,
      fromAmount: double.parse(fromAmount),
      toAmount: double.parse(toAmount),
    );
    await returnsByRequestRobot.tapFilterButton();
    returnsByRequestFilterRobot.verifyAmountRangeFilterApplied(
      fromAmount: formattedFromAmount,
      toAmount: formattedToAmount,
    );
  });

  testWidgets(
      'EZRX-T150 | Verify Filter by Status when selecting 2 checkboxes in View by return requests tab',
      (tester) async {
    const filterStatus1 = 'Pending Review';
    const filterStatus2 = 'Reviewed';
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await commonRobot.changeDeliveryAddress(shipToCode);
    await homeRobot.tapReturnsQuickAccess();

    //verify
    returnsRootRobot.verifyTabBarVisible();
    await returnsRootRobot.switchToViewByRequestPage();
    returnsByRequestRobot.verifyFilterApplied(1);
    await returnsByRequestRobot.tapFilterButton();
    await returnsByRequestFilterRobot.tapStatusCheckbox(filterStatus1);
    returnsByRequestFilterRobot.verifyStatusFilterValue(filterStatus1, true);
    await returnsByRequestFilterRobot.tapStatusCheckbox(filterStatus2);
    returnsByRequestFilterRobot.verifyStatusFilterValue(filterStatus2, true);
    await returnsByRequestFilterRobot.tapStatusCheckbox(filterStatus2);
    returnsByRequestFilterRobot.verifyStatusFilterValue(filterStatus2, false);
    await returnsByRequestFilterRobot.tapStatusCheckbox(filterStatus2);
    await returnsByRequestFilterRobot.tapApplyButton();
    returnsByRequestRobot.verifyFilterApplied(2);
    returnsByRequestRobot.verifyReturnsWithStatusVisible([
      filterStatus1.tr(),
      filterStatus2.tr(),
    ]);
    await returnsByRequestRobot.tapFilterButton();
    returnsByRequestFilterRobot.verifyStatusFilterValue(filterStatus1, true);
    returnsByRequestFilterRobot.verifyStatusFilterValue(filterStatus2, true);
    await returnsByRequestFilterRobot.tapCloseIcon();
    await commonRobot.pullToRefresh();
    returnsByRequestRobot.verifyFilterApplied(1);
    await returnsByRequestRobot.tapFilterButton();
    returnsByRequestFilterRobot.verifyDefaultFilterApplied();
  });

  testWidgets('EZRX-T220 | Verify click on reset button in filter',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await commonRobot.changeDeliveryAddress(shipToCode);
    await homeRobot.tapReturnsQuickAccess();

    //verify
    returnsRootRobot.verifyTabBarVisible();
    await returnsRootRobot.switchToViewByRequestPage();
    returnsByRequestRobot.verifyFilterApplied(1);
    await returnsByRequestRobot.tapFilterButton();
    await returnsByRequestFilterRobot.tapFromDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate,
      toDate: toDate,
    );
    await returnsByRequestFilterRobot.tapStatusCheckbox(returnStatus);
    await returnsByRequestFilterRobot.enterFromAmount(fromAmount);
    await returnsByRequestFilterRobot.enterToAmount(toAmount);
    await returnsByRequestFilterRobot.tapApplyButton();
    returnsByRequestRobot.verifyFilterApplied(3);
    await returnsByRequestRobot.tapFilterButton();
    returnsByRequestFilterRobot.verifyDateRangeFilterApplied(
      fromDate: fromDate,
      toDate: toDate,
    );
    returnsByRequestFilterRobot.verifyAmountRangeFilterApplied(
      fromAmount: fromAmount,
      toAmount: toAmount,
    );
    returnsByRequestFilterRobot.verifyStatusFilterValue(returnStatus, true);
    await returnsByRequestFilterRobot.tapResetButton();
    returnsByRequestRobot.verifyFilterApplied(1);
    await returnsByRequestRobot.tapFilterButton();
    returnsByRequestFilterRobot.verifyDefaultFilterApplied();
  });

  testWidgets(
      'EZRX-T153 | Verify Return detail via View by return requests tab',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await commonRobot.changeDeliveryAddress(shipToCode);
    await homeRobot.tapReturnsQuickAccess();

    //verify
    returnsRootRobot.verifyTabBarVisible();
    await returnsRootRobot.switchToViewByRequestPage();
    await returnsByRequestRobot.tapFilterButton();
    await returnsByRequestFilterRobot.tapToDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate,
      toDate: toDate,
    );
    await returnsByRequestFilterRobot.tapApplyButton();
    await commonRobot.searchWithKeyboardAction(returnId);
    await returnsByRequestRobot.tapFirstReturnVisible();
    returnsByRequestDetailRobot.verifyReturnIdVisible(returnId, returnStatus);
    returnsByRequestDetailRobot.verifyRequestDateVisible();
    returnsByRequestDetailRobot.verifyReturnReferenceVisible(returnReference);
    returnsByRequestDetailRobot
        .verifySpecialInstructionsVisible(specialInstructions);
    returnsByRequestDetailRobot.verifyStatusTrackerVisible(returnStatus);
    returnsByRequestDetailRobot.verifyReturnAddressVisible(shipToAddress);
    returnsByRequestDetailRobot.verifyCustomerCodeVisible(customerCode);
    returnsByRequestDetailRobot.verifyDeliveryToVisible(shipToCode);
    returnsByRequestDetailRobot.verifySubTotalVisible(returnSubTotal);
    returnsByRequestDetailRobot.verifyGrandTotalVisible(returnGrandTotal);
    await returnsByRequestDetailRobot.verifyMaterialVisible(
      index: materialIndex,
      materialNumber: materialNumber,
    );
    await returnsByRequestDetailRobot.verifyMaterialDetailCollapsed(
      materialIndex,
      true,
    );
    await returnsByRequestDetailRobot.tapShowDetailButton(materialIndex);
    await returnsByRequestDetailRobot.verifyMaterialDetailCollapsed(
      materialIndex,
      false,
    );
  });

  tearDown(() async {
    locator<ZephyrService>().setNameAndStatus();
    await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  });
}
