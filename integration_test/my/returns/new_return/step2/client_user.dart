import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../../../core/common.dart';
import '../../../../core/infrastructure/infra_core/zephyr_service/zephyr_service.dart';
import '../../../../core/infrastructure/zephyr/repository/zephyr_repository.dart';
import '../../../../robots/common/common_robot.dart';
import '../../../../robots/login_robot.dart';
import '../../../../robots/more/more_robot.dart';
import '../../../../robots/returns/new_return/step1/new_return_step1_robot.dart';
import '../../../../robots/returns/new_return/step2/new_return_step2_robot.dart';
import '../../../../robots/returns/new_return/step3/new_return_step3_robot.dart';

void main() {
  late LoginRobot loginRobot;
  late CommonRobot commonRobot;
  late MoreRobot moreRobot;
  late NewReturnStep2Robot newReturnStep2Robot;
  late NewReturnStep1Robot newReturnStep1Robot;
  late NewReturnStep3Robot newReturnStep3Robot;
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  void initializeRobot(WidgetTester tester) {
    loginRobot = LoginRobot(tester);
    commonRobot = CommonRobot(tester);
    moreRobot = MoreRobot(tester);
    newReturnStep1Robot = NewReturnStep1Robot(tester);
    newReturnStep2Robot = NewReturnStep2Robot(tester);
    newReturnStep3Robot = NewReturnStep3Robot(tester);
  }

  Future<void> goToNewRequest() async {
    await commonRobot.goToMoreTab();
    await moreRobot.tapReturnsTile();
    await moreRobot.tapNewRequestFloatingButton();
  }

  const marketMalaysia = 'Malaysia';
  const username = 'myclientuser';
  const password = 'St@ysafe01';
  const shipToCode = '0070149863';
  const shipToAddress = 'RSD HOSPITALS SDN BHD (SJMC)';
  const exceedReturnQuantity = '100';
  const validReturnQuantity = '1';
  final fromDateToNext = DateTime(2023, 7, 29);
  final toDateToNext = DateTime(2023, 8, 29);
  final reason = 'Wrong Bill-To'.tr();
  const materialId = '23348581';
  const materialTitle = '(M)ZPPCT661628 CELLPACK DCL 300A 20L 1S';
  const materialUUID = '1100001234000010';

  Future<void> goToStep2() async {
    await newReturnStep1Robot.tapFilterIcon();
    await newReturnStep1Robot.tapTheDateField();
    await commonRobot.setDateRangePickerValue(
      fromDate: fromDateToNext,
      toDate: toDateToNext,
    );
    await newReturnStep1Robot.tapApply();
    await newReturnStep1Robot.tapFirstItem();
    await newReturnStep1Robot.tapNextButton();
  }

  testWidgets(
      'EZRX-T228 | Verify new return request step 2 of 3: Fill in return details displayed',
      (tester) async {
    initializeRobot(tester);

    await runAppForTesting(tester);
    await loginRobot.loginToHomeScreen(username, password, marketMalaysia);
    await commonRobot.changeDeliveryAddress(shipToCode);
    await goToNewRequest();
    await goToStep2();
    newReturnStep2Robot.verifyReturnDetailDisplayed(materialId, materialTitle);
  });
  testWidgets(
      'EZRX-T232 | Verify new return request step 2 of 3: Fill in return details with quantity out of balance quantity',
      (tester) async {
    initializeRobot(tester);

    await runAppForTesting(tester);
    await goToNewRequest();
    await goToStep2();
    newReturnStep2Robot.verifyReturnDetailDisplayed(materialId, materialTitle);
    await newReturnStep2Robot.enterReturnQuantity(
      exceedReturnQuantity,
      materialUUID,
    );
    await newReturnStep2Robot.tapNextButton();
    newReturnStep2Robot.verifyReturnQuantityCannotExceedBalanceQuantity();
  });
  testWidgets(
      'EZRX-T231 | Verify new return request step 2 of 3: Fill in return details without all fields require',
      (tester) async {
    initializeRobot(tester);

    await runAppForTesting(tester);
    await goToNewRequest();
    await goToStep2();
    newReturnStep2Robot.verifyReturnDetailDisplayed(materialId, materialTitle);
    await newReturnStep2Robot.tapNextButton();
    newReturnStep2Robot.verifyCannotMoveWithoutReturnQuantity();
    newReturnStep2Robot.verifyCannotMoveWithoutReason();
  });
  testWidgets(
      'EZRX-T236 | Verify new return request step 2 of 3: Next button clicked with all valid fields',
      (tester) async {
    initializeRobot(tester);

    await runAppForTesting(tester);
    await goToNewRequest();
    await goToStep2();
    newReturnStep2Robot.verifyReturnDetailDisplayed(materialId, materialTitle);
    await newReturnStep2Robot.enterReturnQuantity(
      validReturnQuantity,
      materialUUID,
    );
    await newReturnStep2Robot.selectReason(reason, materialUUID);
    await newReturnStep2Robot.tapNextButton();
    newReturnStep2Robot.verifyNextToStep3(materialId, materialTitle);
    newReturnStep3Robot.verifyStep3Visible();
  });
  testWidgets(
      'EZRX-T229 | Verify new return request step 2 of 3: review return details - delete item again',
      (tester) async {
    initializeRobot(tester);

    await runAppForTesting(tester);
    await goToNewRequest();
    await goToStep2();
    await newReturnStep2Robot.deleteItem();
    newReturnStep1Robot.verifyNewReturnStep1Display(shipToAddress);
    await goToStep2();
    newReturnStep2Robot.verifyReturnDetailDisplayed(materialId, materialTitle);
  });

  tearDown(() async {
    locator<ZephyrService>().setNameAndStatus();
    await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  });
}
