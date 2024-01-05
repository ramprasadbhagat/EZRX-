import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ezrxmobile/locator.dart';
import '../../../../core/common.dart';
import '../../../../core/infrastructure/infra_core/zephyr_service/zephyr_service.dart';
import '../../../../core/infrastructure/zephyr/repository/zephyr_repository.dart';
import '../../../../robots/common/common_robot.dart';
import '../../../../robots/common/enum.dart';
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

  const marketMalaysia = 'Malaysia';
  const username = 'myclientuser';
  const password = 'St@ysafe01';
  const shipToCode = '0070149863';
  const shipToAddress = 'RSD HOSPITALS SDN BHD (SJMC)';
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

  Future<void> fillStep2() async {
    await commonRobot.changeDeliveryAddress(shipToCode);
    await commonRobot.navigateToScreen(NavigationTab.more);
    await moreRobot.tapReturnsTile();
    await moreRobot.tapNewRequestFloatingButton();
    await goToStep2();
    newReturnStep2Robot.verifyReturnDetailDisplayed(materialId, materialTitle);
    await newReturnStep2Robot.enterReturnQuantity(
      validReturnQuantity,
      materialUUID,
    );
    await newReturnStep2Robot.selectReason(reason, materialUUID);
    await newReturnStep2Robot.tapNextButton();
  }

  testWidgets(
      'EZRX-T237 | Verify new return request Step 3 of 3: all initial fields',
      (tester) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    await loginRobot.loginToHomeScreen(username, password, marketMalaysia);
    await fillStep2();
    await newReturnStep1Robot.tapReturnFor();
    newReturnStep1Robot.verifyDetailBottomSheetVisible();
    await newReturnStep1Robot.closeBottomSheetDetail();
    newReturnStep1Robot.verifyDetailBottomSheetIsHide();
    newReturnStep3Robot.verifyStep3Visible();
  });

  testWidgets(
      'EZRX-T230 | Verify new return request step 3 : submit successful',
      (tester) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    await fillStep2();
    newReturnStep3Robot.verifyStep3Visible();
    await newReturnStep1Robot.tapReturnFor();
    newReturnStep1Robot.verifyDetailBottomSheetVisible();
    await newReturnStep1Robot.closeBottomSheetDetail();
    newReturnStep1Robot.verifyDetailBottomSheetIsHide();
    newReturnStep3Robot.collectInfoBeforeSubmit();
    await newReturnStep3Robot.tapSubmit();
    newReturnStep3Robot.verifySubmitSuccessFully(shipToAddress);
  });

  tearDown(() async {
    locator<ZephyrService>().setNameAndStatus();
    await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  });
}
