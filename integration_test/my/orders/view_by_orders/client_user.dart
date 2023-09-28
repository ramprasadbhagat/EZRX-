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

import '../../../robots/orders/cart_robot.dart';
import '../../../robots/orders/orders_root_robot.dart';
import '../../../robots/orders/view_by_orders/view_by_orders_detail_robot.dart';
import '../../../robots/orders/view_by_orders/view_by_orders_filter_robot.dart';
import '../../../robots/orders/view_by_orders/view_by_orders_robot.dart';

void main() {
  late LoginRobot loginRobot;
  late HomeRobot homeRobot;
  late CommonRobot commonRobot;
  late OrdersRootRobot ordersRobot;
  late ViewByOrdersRobot viewByOrdersRobot;
  late ViewByOrdersFilterRobot viewByOrdersFilterRobot;
  late ViewByOrdersDetailRobot viewByOrdersDetailRobot;
  late CartRobot cartRobot;

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // initialize variables
  const marketMalaysia = 'Malaysia';
  const currency = 'MYR';
  const username = 'myclientuser';
  const password = 'St@ysafe01';
  const shipToCode = '0070149863';
  const shipToAddress = 'RSD HOSPITALS SDN BHD (SJMC)';
  const customerCode = '0030082707';
  final fromDate = DateTime.now().subtract(const Duration(days: 150));
  final toDate = DateTime.now();
  const invalidLengthSearchKey = 'a';
  const invalidSearchKey = 'auto-testttttt';
  const validSearchKey = '12';
  const orderId = '0200269532';
  const materialNumber = '23350925';
  const materialQty = 3;
  final materialPrice = '$currency ${6510.0.priceFormatted}';
  const poReference = 'TestPO';
  const deliveryInstructions = 'Delivery Instructions';
  final orderSubTotal = '$currency ${6510.0.priceFormatted}';
  final orderGrandTotal = '$currency ${6510.0.priceFormatted}';

  void initializeRobot(WidgetTester tester) {
    loginRobot = LoginRobot(tester);
    homeRobot = HomeRobot(tester);
    commonRobot = CommonRobot(tester);
    ordersRobot = OrdersRootRobot(tester);
    viewByOrdersRobot = ViewByOrdersRobot(tester);
    viewByOrdersFilterRobot = ViewByOrdersFilterRobot(tester);
    viewByOrdersDetailRobot = ViewByOrdersDetailRobot(tester);
    cartRobot = CartRobot(tester);
  }

  Future<void> goToOrderTab({
    String? deliveryAddress,
    bool clearCart = false,
  }) async {
    //Switch delivery address
    if (deliveryAddress != null) {
      await commonRobot.changeDeliveryAddress(deliveryAddress);
    }

    if (clearCart) {
      await homeRobot.tapMiniCartIcon();
      await cartRobot.clearCart();
      await cartRobot.tapCloseButton();
    }

    //Go order tab
    await commonRobot.goToOrderTab();
  }

  testWidgets(
      'EZRX-T71 | Verify display items in View by orders tab with data available',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await loginRobot.loginToHomeScreen(username, password, marketMalaysia);
    await goToOrderTab(deliveryAddress: shipToCode);

    //verify
    await ordersRobot.switchToViewByOrders();
    ordersRobot.verifyViewByOrdersPageVisible();
    ordersRobot.verifyFilterApplied(1);
    await ordersRobot.tapFilterButton();
    viewByOrdersFilterRobot.verifyApplyButtonVisible();
    viewByOrdersFilterRobot.verifyResetButtonVisible();
    viewByOrdersFilterRobot.verifyDefaultFilterApplied();
    await viewByOrdersFilterRobot.tapCloseIcon();
    viewByOrdersRobot.verifyOrdersVisible();
    await commonRobot.pullToRefresh();
    viewByOrdersRobot.verifyOrdersVisible();
  });

  testWidgets(
      'EZRX-T74 | Verify display items in View by orders tab with no data available with auto search feature',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToOrderTab(deliveryAddress: shipToCode);

    //verify
    await ordersRobot.switchToViewByOrders();
    ordersRobot.verifyViewByOrdersPageVisible();
    ordersRobot.verifyFilterApplied(1);
    viewByOrdersRobot.verifyOrdersVisible();
    await commonRobot.autoSearch(invalidSearchKey);
    viewByOrdersRobot.verifyNoRecordFoundVisible();
    await commonRobot.autoSearch(invalidLengthSearchKey);
    commonRobot.verifyInvalidLengthSearchMessageNotVisible();
    viewByOrdersRobot.verifyNoRecordFoundVisible();
    await commonRobot.autoSearch(validSearchKey);
    viewByOrdersRobot.verifyOrdersVisible();
  });

  testWidgets(
      'EZRX-T78 | Verify search my order history by inputting keyword contains Order code in View by orders tab',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToOrderTab(deliveryAddress: shipToCode);

    //verify
    await ordersRobot.switchToViewByOrders();
    await ordersRobot.tapFilterButton();
    await viewByOrdersFilterRobot.tapFromDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate,
      toDate: toDate,
    );
    await viewByOrdersFilterRobot.tapApplyButton();
    viewByOrdersRobot.verifyOrdersVisible();
    await commonRobot.searchWithKeyboardAction(invalidSearchKey);
    viewByOrdersRobot.verifyNoRecordFoundVisible();
    await commonRobot.searchWithKeyboardAction(invalidLengthSearchKey);
    commonRobot.verifyInvalidLengthSearchMessageVisible();
    viewByOrdersRobot.verifyNoRecordFoundVisible();
    await commonRobot.searchWithKeyboardAction(orderId);
    viewByOrdersRobot.verifyOrdersWithOrderCodeVisible(orderId);
    await commonRobot.waitAutoSearchDuration();
    commonRobot.verifyLoadingNotVisible();
  });

  testWidgets(
      'EZRX-T80 | Verify search my order history by inputting keyword not contain order code in View by orders tab',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToOrderTab(deliveryAddress: shipToCode);

    //verify
    await ordersRobot.switchToViewByOrders();
    viewByOrdersRobot.verifyOrdersVisible();
    await commonRobot.searchWithSearchIcon(invalidSearchKey);
    viewByOrdersRobot.verifyNoRecordFoundVisible();
    await commonRobot.waitAutoSearchDuration();
    commonRobot.verifyLoadingNotVisible();
    await commonRobot.tapClearSearch();
    viewByOrdersRobot.verifyOrdersVisible();
    await commonRobot.searchWithSearchIcon(invalidLengthSearchKey);
    commonRobot.verifyInvalidLengthSearchMessageVisible();
  });

  testWidgets(
      'EZRX-T83 | Verify Filter by date when no having result found in View by orders tab',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToOrderTab(deliveryAddress: shipToCode);

    //verify
    await ordersRobot.switchToViewByOrders();
    await ordersRobot.tapFilterButton();
    await viewByOrdersFilterRobot.tapFromDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate,
      toDate: toDate,
    );
    await viewByOrdersFilterRobot.tapApplyButton();
    ordersRobot.verifyFilterApplied(1);
    await commonRobot.searchWithKeyboardAction(invalidSearchKey);
    viewByOrdersRobot.verifyNoRecordFoundVisible();
  });

  testWidgets(
      'EZRX-T84 | Verify Filter by date when having result found in View by orders tab',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToOrderTab(deliveryAddress: shipToCode);

    //verify
    await ordersRobot.switchToViewByOrders();
    await ordersRobot.tapFilterButton();
    await viewByOrdersFilterRobot.tapToDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate,
      toDate: toDate,
    );
    await viewByOrdersFilterRobot.tapApplyButton();
    ordersRobot.verifyFilterApplied(1);
    viewByOrdersRobot.verifyOrderGroupInDateRangeVisible(
      fromDate: fromDate,
      toDate: toDate,
    );
  });

  testWidgets('EZRX-T217 | Verify click on reset button in filter',
      (tester) async {
    const index = 0;
    final fromDate = DateTime.now().subtract(const Duration(days: 100));
    final toDate = DateTime.now().subtract(const Duration(days: 99));
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToOrderTab(deliveryAddress: shipToCode);

    //verify
    await ordersRobot.switchToViewByOrders();
    ordersRobot.verifyFilterApplied(1);
    viewByOrdersRobot.verifyOrdersVisible();
    final orderId = viewByOrdersRobot.getOrderIdText(index: index);
    await ordersRobot.tapFilterButton();
    await viewByOrdersFilterRobot.tapToDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate,
      toDate: toDate,
    );
    await viewByOrdersFilterRobot.tapApplyButton();
    viewByOrdersRobot.verifyOrderIdTextNotVisible(orderId, index: index);
    await ordersRobot.tapFilterButton();
    await viewByOrdersFilterRobot.tapResetButton();
    viewByOrdersRobot.verifyOrdersVisible();
    viewByOrdersRobot.verifyOrderIdTextVisible(orderId, index: index);
    await ordersRobot.tapFilterButton();
    viewByOrdersFilterRobot.verifyDefaultFilterApplied();
  });

  testWidgets('EZRX-T88 | Verify Order detail via View by orders tab',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToOrderTab(deliveryAddress: shipToCode);

    //verify
    await ordersRobot.switchToViewByOrders();
    await ordersRobot.tapFilterButton();
    await viewByOrdersFilterRobot.tapToDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate,
      toDate: toDate,
    );
    await viewByOrdersFilterRobot.tapApplyButton();
    await commonRobot.searchWithKeyboardAction(orderId);
    await viewByOrdersRobot.tapFirstOrder();
    viewByOrdersDetailRobot.verifyOrderIdVisible(orderId);
    viewByOrdersDetailRobot.verifyOrderDateVisible();
    viewByOrdersDetailRobot.verifyPoReferenceVisible(poReference);
    viewByOrdersDetailRobot
        .verifyDeliveryInstructionsVisible(deliveryInstructions);
    viewByOrdersDetailRobot.verifyOrderAddressVisible(shipToAddress);
    viewByOrdersDetailRobot.verifyCustomerCodeVisible(customerCode);
    viewByOrdersDetailRobot.verifyDeliveryToVisible(shipToCode);
    await viewByOrdersDetailRobot.dragToVerifySummaryVisible();
    viewByOrdersDetailRobot.verifySubTotalVisible(orderSubTotal);
    viewByOrdersDetailRobot.verifyGrandTotalVisible(orderGrandTotal);
    await viewByOrdersDetailRobot.dragToVerifyItemsSectionVisible();
    viewByOrdersDetailRobot.verifyMaterialVisible(
      materialNumber,
      materialQty,
      materialPrice,
    );
    viewByOrdersDetailRobot.verifyBuyAgainButtonVisible();
  });

  testWidgets('EZRX-T72 | Verify click on Buy again in View by orders tab',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToOrderTab(deliveryAddress: shipToCode, clearCart: true);

    //verify
    await ordersRobot.switchToViewByOrders();
    await ordersRobot.tapFilterButton();
    await viewByOrdersFilterRobot.tapToDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate,
      toDate: toDate,
    );
    await viewByOrdersFilterRobot.tapApplyButton();
    await commonRobot.searchWithKeyboardAction(orderId);
    await viewByOrdersRobot.tapFirstBuyAgainButton();
    cartRobot.verifyPageVisible();
    cartRobot.verifyMaterialFromReorderVisible(
      materialNumber,
      qty: materialQty,
    );
  });

  testWidgets(
      'EZRX-T90 | Verify click on Buy again in Order detail via View by orders tab when having existing items in Cart',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToOrderTab(deliveryAddress: shipToCode, clearCart: true);

    //verify
    await ordersRobot.switchToViewByOrders();
    await ordersRobot.tapFilterButton();
    await viewByOrdersFilterRobot.tapToDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDate,
      toDate: toDate,
    );
    await viewByOrdersFilterRobot.tapApplyButton();
    await commonRobot.searchWithKeyboardAction(orderId);
    await viewByOrdersRobot.tapFirstOrder();
    await viewByOrdersDetailRobot.tapBuyAgainButton();
    cartRobot.verifyPageVisible();
    cartRobot.verifyMaterialFromReorderVisible(
      materialNumber,
      qty: materialQty,
    );
    //TODO: Revist when popup 'Reoder for this delivery address? is added to add new test step
  });

  tearDown(() async {
    locator<ZephyrService>().setNameAndStatus();
    await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  });
}
