import 'package:ezrxmobile/locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../../../core/common.dart';
import '../../../../core/infrastructure/infra_core/zephyr_service/zephyr_service.dart';
import '../../../../core/infrastructure/zephyr/repository/zephyr_repository.dart';
import '../../../../robots/common/common_robot.dart';
import '../../../../robots/login_robot.dart';
import '../../../../robots/more/more_robot.dart';
import '../../../../robots/returns/new_return/step1/new_return_robot.dart';
import '../../../../robots/returns/returns_by_items/returns_by_items_robot.dart';

void main() {
  late LoginRobot loginRobot;
  late CommonRobot commonRobot;
  late MoreRobot moreRobot;
  late ReturnsByItemsRobot returnsByItemsRobot;
  late NewReturnRobot newReturnRobot;

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  void initializeRobot(WidgetTester tester) {
    loginRobot = LoginRobot(tester);
    commonRobot = CommonRobot(tester);
    moreRobot = MoreRobot(tester);
    returnsByItemsRobot = ReturnsByItemsRobot(tester);
    newReturnRobot = NewReturnRobot(tester);
  }

  Future<void> goToNewRequest() async {
    //Go returns
    await commonRobot.goToMoreTab();
    await moreRobot.tapReturnsTile();
    await returnsByItemsRobot.tapNewRequestFloatingButton();
  }

  const marketMalaysia = 'Malaysia';
  const username = 'myclientuser';
  const password = 'St@ysafe01';
  const shipToCode = '0070149863';
  const shipToAddress = 'RSD HOSPITALS SDN BHD (SJMC)';
  final fromDate = DateTime.now().subtract(const Duration(days: 360));
  final toDate = DateTime.now().subtract(const Duration(days: 2));
  final fromDateToNext = DateTime(2023, 7, 29);
  final toDateToNext = DateTime(2023, 8, 29);
  const validSearchKey = 'ILIADIN';
  const inValidSearchKey = '1';
  const noResultSearchKey = 'asdasfxzc';

  testWidgets('EZRX-T155 | Verify display new return request screen',
      (tester) async {
    initializeRobot(tester);

    await runAppForTesting(tester);
    await loginRobot.loginToHomeScreen(username, password, marketMalaysia);
    await commonRobot.changeDeliveryAddress(shipToCode);

    await goToNewRequest();
    newReturnRobot.verifySearchItemVisible();
    newReturnRobot.verifyNextButtonVisible();
    newReturnRobot.verifyFilterIconVisible();
    newReturnRobot.verifyListAbleToReturnVisible();
    newReturnRobot.verifyReturnForVisible(shipToAddress);
    newReturnRobot.verifyNextButtonVisible();
  });

  testWidgets(
      'EZRX-T156 | Verify the customer code & deliver to in Order for [Selected address] in New return request page',
      (tester) async {
    initializeRobot(tester);

    await runAppForTesting(tester);
    await goToNewRequest();

    await newReturnRobot.tapReturnFor();
    newReturnRobot.verifyDetailBottomSheetVisible();
    await newReturnRobot.closeBottomSheetDetail();
    newReturnRobot.verifyDetailBottomSheetIsHide();
    await newReturnRobot.pressCloseButtonToolbar();
    returnsByItemsRobot.verifyFilterButtonVisible();
    returnsByItemsRobot.verifyNewRequestButtonVisible();
    returnsByItemsRobot.verifySearchBarVisible();
  });

  testWidgets(
      'EZRX-T157 | Verify New return request page Step 1 : Filter with reset',
      (tester) async {
    initializeRobot(tester);

    await runAppForTesting(tester);
    await goToNewRequest();
    newReturnRobot.collectTheFirstItemTitleWithoutFilter();
    await newReturnRobot.tapFilterIcon();
    await newReturnRobot.tapTheDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate,
      toDate: toDate,
    );
    await newReturnRobot.tapApply();
    await newReturnRobot.verifyTheReturnListBaseOnFilter(
      fromDate: fromDate,
      toDate: toDate,
    );
    await newReturnRobot.tapFilterIcon();
    await newReturnRobot.tapReset();
    newReturnRobot.verifyTheFirstItemAfterReset();
  });

  testWidgets(
      'EZRX-T234 | Verify new return request Step 1 of 3: Text fields - Happy flow - done button',
      (tester) async {
    initializeRobot(tester);

    await runAppForTesting(tester);
    await goToNewRequest();
    newReturnRobot.collectTheFirstItemTitleWithoutFilter();
    await commonRobot.searchWithKeyboardAction(validSearchKey);
    newReturnRobot.verifyTheFirstItemAfterSearch(validSearchKey);
    await commonRobot.tapClearSearch();
    await newReturnRobot.verifyTheFirstItemAfterClearSearch();
  });
  testWidgets(
      'EZRX-T235 | Verify new return request Step 1 of 3: Text fields - Happy flow - search icon button',
      (tester) async {
    initializeRobot(tester);

    await runAppForTesting(tester);
    await goToNewRequest();
    await newReturnRobot.tapFilterIcon();
    await newReturnRobot.tapTheDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDateToNext,
      toDate: toDateToNext,
    );
    await newReturnRobot.tapApply();
    await newReturnRobot.tapFirstItem();
    await newReturnRobot.tapNextButton();
    newReturnRobot.verifyStep2Visible();
  });
  testWidgets(
      'EZRX-T233 | Verify new return request Step 1 of 3: Text fields - UnHappy flow',
      (tester) async {
    initializeRobot(tester);

    await runAppForTesting(tester);
    await goToNewRequest();
    await commonRobot.searchWithSearchIcon('');
    await newReturnRobot.verifySnackbarVisible();
    await commonRobot.dismissSnackbar();
    await commonRobot.searchWithKeyboardAction(inValidSearchKey);
    await newReturnRobot.verifySnackbarVisible();
    await commonRobot.dismissSnackbar();
    await commonRobot.searchWithKeyboardAction(noResultSearchKey);
    newReturnRobot.verifyNoItemFound();
  });
  testWidgets(
      'EZRX-T109 | Verify next step screen Step 1 of 3: select item(s) to return without select item',
      (tester) async {
    initializeRobot(tester);

    await runAppForTesting(tester);
    await goToNewRequest();
    await newReturnRobot.tapNextButton();
    newReturnRobot.verifyCannotMoveToNextScreen();
  });

  tearDown(() async {
    locator<ZephyrService>().setNameAndStatus();
    await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  });
}
