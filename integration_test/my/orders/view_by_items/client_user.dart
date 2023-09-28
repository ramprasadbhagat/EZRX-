import 'package:ezrxmobile/locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../../core/common.dart';
import '../../../core/infrastructure/infra_core/zephyr_service/zephyr_service.dart';
import '../../../core/infrastructure/zephyr/repository/zephyr_repository.dart';
import '../../../robots/common/common_robot.dart';
import '../../../robots/login_robot.dart';

import '../../../robots/orders/orders_root_robot.dart';
import '../../../robots/orders/view_by_items/view_by_items_detail_robot.dart';
import '../../../robots/orders/view_by_items/view_by_items_filter_robot.dart';
import '../../../robots/orders/view_by_items/view_by_items_robot.dart';

void main() {
  late LoginRobot loginRobot;
  late CommonRobot commonRobot;
  late OrdersRootRobot ordersRobot;
  late ViewByItemsRobot viewByItemsRobot;
  late ViewByItemsFilterRobot viewByItemsFilterRobot;
  late ViewByItemsDetailRobot orderDetailRobot;

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // initialize variables
  const marketMalaysia = 'Malaysia';
  const username = 'myclientuser';
  const password = 'St@ysafe01';
  const shipToCode = '0070149863';
  const invalidSearchKey = 'auto-test';
  const bonusOrderCode = '0200269435';
  final fromDate = DateTime.now().subtract(const Duration(days: 150));
  final toDate = DateTime.now().subtract(const Duration(days: 2));

  void initializeRobot(WidgetTester tester) {
    loginRobot = LoginRobot(tester);
    commonRobot = CommonRobot(tester);
    ordersRobot = OrdersRootRobot(tester);
    viewByItemsRobot = ViewByItemsRobot(tester);
    viewByItemsFilterRobot = ViewByItemsFilterRobot(tester);
    orderDetailRobot = ViewByItemsDetailRobot(tester);
  }

  Future<void> goToOrderTab({String? deliveryAddress}) async {
    //Switch delivery address
    if (deliveryAddress != null) {
      await commonRobot.changeDeliveryAddress(deliveryAddress);
    }

    //Go order tab
    await commonRobot.goToOrderTab();
  }

  testWidgets('EZRX-T69 | Verify display items in Orders tab', (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await loginRobot.loginToHomeScreen(username, password, marketMalaysia);
    await goToOrderTab();

    //verify
    ordersRobot.verifyTabBarVisible();
    ordersRobot.verifyViewByItemsPageVisible();
    ordersRobot.verifySearchBarVisible();
    ordersRobot.verifyFilterButtonVisible();
    ordersRobot.verifyFilterApplied(1);
    await ordersRobot.switchToViewByOrders();
    ordersRobot.verifyViewByOrdersPageVisible();
    ordersRobot.verifySearchBarVisible();
    ordersRobot.verifyFilterButtonVisible();
    ordersRobot.verifyFilterApplied(1);
    await ordersRobot.switchToViewByItems();
    ordersRobot.verifyViewByItemsPageVisible();
  });

  testWidgets(
      'EZRX-T70 | Verify display items in View by items tab with data available',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToOrderTab(deliveryAddress: shipToCode);

    //verify
    ordersRobot.verifyFilterApplied(1);
    await ordersRobot.tapFilterButton();
    viewByItemsFilterRobot.verifyApplyButtonVisible();
    viewByItemsFilterRobot.verifyResetButtonVisible();
    viewByItemsFilterRobot.verifyDefaultFilterApplied();
    await viewByItemsFilterRobot.tapCloseIcon();
    viewByItemsRobot.verifyOrdersVisible();
    await commonRobot.pullToRefresh();
    viewByItemsRobot.verifyOrdersVisible();
  });

  testWidgets(
      'EZRX-T73 | Verify display items in View by items tab with no data available',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToOrderTab(deliveryAddress: shipToCode);

    //verify
    ordersRobot.verifyFilterApplied(1);
    await ordersRobot.tapFilterButton();
    viewByItemsFilterRobot.verifyApplyButtonVisible();
    viewByItemsFilterRobot.verifyResetButtonVisible();
    viewByItemsFilterRobot.verifyDefaultFilterApplied();
    await viewByItemsFilterRobot.tapCloseIcon();
    await commonRobot.searchWithKeyboardAction(invalidSearchKey);
    viewByItemsRobot.verifyNoRecordFoundVisible();
    await commonRobot.pullToRefresh();
    await commonRobot.searchWithKeyboardAction(invalidSearchKey);
    viewByItemsRobot.verifyNoRecordFoundVisible();
  });

  testWidgets(
      'EZRX-T75 | Verify search Orders by inputting keyword contains material name in View by items tab',
      (tester) async {
    const productName = 'COZAAR TABS';
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToOrderTab(deliveryAddress: shipToCode);

    //verify
    ordersRobot.verifyViewByItemsPageVisible();
    await commonRobot.searchWithKeyboardAction('1');
    commonRobot.verifyInvalidLengthSearchMessageVisible();
    await commonRobot.searchWithKeyboardAction(productName);
    viewByItemsRobot.verifyOrdersWithProductNameVisible(productName);
  });

  testWidgets(
      'EZRX-T76 | Verify search Orders by inputting keyword contains material code in View by items tab',
      (tester) async {
    const materialNumber = '23046003';
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToOrderTab(deliveryAddress: shipToCode);

    //verify
    ordersRobot.verifyViewByItemsPageVisible();
    await commonRobot.searchWithKeyboardAction(materialNumber);
    viewByItemsRobot.verifyOrdersWithProductCodeVisible(materialNumber);
  });

  testWidgets(
      'EZRX-T77 | Verify search my order history by inputting keyword contains Order code in View by items tab',
      (tester) async {
    const orderCode = '0200270171';
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToOrderTab(deliveryAddress: shipToCode);

    //verify
    ordersRobot.verifyViewByItemsPageVisible();
    await ordersRobot.tapFilterButton();
    await viewByItemsFilterRobot.tapToDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate,
      toDate: toDate,
    );
    await viewByItemsFilterRobot.tapApplyButton();
    await commonRobot.searchWithKeyboardAction(orderCode);
    viewByItemsRobot.verifyOrdersWithOrderCodeVisible(orderCode);
  });

  testWidgets(
      'EZRX-T79 | Verify search my order history by inputting keyword not contain material name/code/order code in View by items tab',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToOrderTab(deliveryAddress: shipToCode);

    //verify
    ordersRobot.verifyViewByItemsPageVisible();
    await commonRobot.searchWithKeyboardAction(invalidSearchKey);
    viewByItemsRobot.verifyNoRecordFoundVisible();
    await commonRobot.tapClearSearch();
    viewByItemsRobot.verifyOrdersVisible();
  });

  testWidgets(
      'EZRX-T81 | Verify Filter by date when having result found in View by items tab',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToOrderTab(deliveryAddress: shipToCode);

    //verify
    ordersRobot.verifyViewByItemsPageVisible();
    await ordersRobot.tapFilterButton();
    await viewByItemsFilterRobot.tapFromDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate,
      toDate: toDate,
    );
    await viewByItemsFilterRobot.tapApplyButton();
    ordersRobot.verifyFilterApplied(1);
    viewByItemsRobot.verifyOrderGroupInDateRangeVisible(
      fromDate: fromDate,
      toDate: toDate,
    );
  });

  testWidgets(
      'EZRX-T82 | Verify Filter by date when not having result found in View by items tab',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToOrderTab(deliveryAddress: shipToCode);

    //verify
    ordersRobot.verifyViewByItemsPageVisible();
    await ordersRobot.tapFilterButton();
    await viewByItemsFilterRobot.tapToDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate,
      toDate: toDate,
    );
    await viewByItemsFilterRobot.tapApplyButton();
    ordersRobot.verifyFilterApplied(1);
    await commonRobot.searchWithKeyboardAction(invalidSearchKey);
    viewByItemsRobot.verifyNoRecordFoundVisible();
  });

  testWidgets(
      'EZRX-T85 | Verify Filter by status when selecting 1 checkbox and existing data available',
      (tester) async {
    const statusFilter = 'Order created';

    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToOrderTab(deliveryAddress: shipToCode);

    //verify
    ordersRobot.verifyViewByItemsPageVisible();
    await ordersRobot.tapFilterButton();
    await viewByItemsFilterRobot.tapFromDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate,
      toDate: toDate,
    );
    await viewByItemsFilterRobot.tapStatusCheckbox(statusFilter);
    viewByItemsFilterRobot.verifyStatusFilterValue(statusFilter, true);
    await viewByItemsFilterRobot.tapStatusCheckbox(statusFilter);
    viewByItemsFilterRobot.verifyStatusFilterValue(statusFilter, false);
    await viewByItemsFilterRobot.tapStatusCheckbox(statusFilter);
    viewByItemsFilterRobot.verifyStatusFilterValue(statusFilter, true);
    await viewByItemsFilterRobot.tapApplyButton();
    ordersRobot.verifyFilterApplied(2);
    viewByItemsRobot.verifyOrderGroupInDateRangeVisible(
      fromDate: fromDate,
      toDate: toDate,
    );
    viewByItemsRobot.verifyOrderGroupsVisible();
    viewByItemsRobot.verifyOrderItemsVisible();
  });

  testWidgets(
      'EZRX-T86 | Verify Filter by status when selecting 1 checkbox and data is unavailable in View by items tab',
      (tester) async {
    const statusFilter = 'Failed';

    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToOrderTab(deliveryAddress: shipToCode);

    //verify
    ordersRobot.verifyViewByItemsPageVisible();
    await ordersRobot.tapFilterButton();
    await viewByItemsFilterRobot.tapFromDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate,
      toDate: toDate,
    );
    await viewByItemsFilterRobot.tapStatusCheckbox(statusFilter);
    viewByItemsFilterRobot.verifyStatusFilterValue(statusFilter, true);
    await viewByItemsFilterRobot.tapApplyButton();
    ordersRobot.verifyFilterApplied(2);
    await commonRobot.searchWithKeyboardAction(invalidSearchKey);
    viewByItemsRobot.verifyNoRecordFoundVisible();
    await commonRobot.pullToRefresh();
    ordersRobot.verifyFilterApplied(1);
    viewByItemsRobot.verifyOrderGroupsVisible();
    viewByItemsRobot.verifyOrderItemsVisible();
  });

  testWidgets('EZRX-T87 | Verify Order detail via View by items tab',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToOrderTab(deliveryAddress: shipToCode);

    //verify
    ordersRobot.verifyViewByItemsPageVisible();
    await viewByItemsRobot.tapFirstVisibleOrder();
    await orderDetailRobot.dragToEnsureHeaderVisible();
    await orderDetailRobot.dragToEnsureStatusTrackerVisible();
    await orderDetailRobot.dragToEnsureAddressVisible();
    await orderDetailRobot.dragToEnsureItemsVisible();
  });

  testWidgets(
      'EZRX-T91 | Verify item Bonus in order detail via View by items tab',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToOrderTab(deliveryAddress: shipToCode);

    //verify
    ordersRobot.verifyViewByItemsPageVisible();
    await ordersRobot.tapFilterButton();
    await viewByItemsFilterRobot.tapToDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate,
      toDate: toDate,
    );
    await viewByItemsFilterRobot.tapApplyButton();
    ordersRobot.verifyFilterApplied(1);
    await commonRobot.searchWithKeyboardAction(bonusOrderCode);
    viewByItemsRobot.verifyOrdersWithOrderCodeVisible(bonusOrderCode);
    viewByItemsRobot.verifyBonusLabelVisible();
    await viewByItemsRobot.tapFirstVisibleOrder();
    await orderDetailRobot.dragToEnsureHeaderVisible();
    await orderDetailRobot.dragToEnsureStatusTrackerVisible();
    await orderDetailRobot.dragToEnsureAddressVisible();
    await orderDetailRobot.dragToEnsureItemsVisible();
    orderDetailRobot.verifyBonusLabelVisible();
  });

  //TODO: Cover EZRX-T89 when view by item detail screen have buy again button

  tearDown(() async {
    locator<ZephyrService>().setNameAndStatus();
    await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  });
}
