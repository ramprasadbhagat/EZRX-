import 'package:ezrxmobile/locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../../core/common.dart';
import '../../../core/infrastructure/infra_core/zephyr_service/zephyr_service.dart';
import '../../../core/infrastructure/zephyr/repository/zephyr_repository.dart';
import '../../../robots/account/profile/profile_robot.dart';
import '../../../robots/common/common_robot.dart';
import '../../../robots/login_robot.dart';
import '../../../robots/more/more_robot.dart';

void main() {
  late LoginRobot loginRobot;
  late CommonRobot commonRobot;
  late MoreRobot moreRobot;
  late ProfileRobot profileRobot;

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // initialize variables
  const marketMalaysia = 'Malaysia';
  const username = 'myclientuser';
  const password = 'St@ysafe01';
  const shipToCode = '0070149863';

  void initializeRobot(WidgetTester tester) {
    loginRobot = LoginRobot(tester);
    commonRobot = CommonRobot(tester);
    moreRobot = MoreRobot(tester);
    profileRobot = ProfileRobot(tester);
  }

  Future goToProfilePage(
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

    //Go Profile page
    await commonRobot.goToMoreTab();
    await moreRobot.tapProfileTile();
  }

  void verifyAllCommponentsVisible() {
    profileRobot.verifyAccountAndBussinessDetailsVisible(
      firstName: 'MYClientUser',
      lastName: 'User91',
      email: 'jhchoo@zuelligpharma.com',
      username: 'myclientuser',
      mobilePhone: 'NA',
      language: 'English',
    );
    profileRobot.verifyLicenseListVisible();
    profileRobot.verifyButtonsDisabled();
  }

  testWidgets('EZRX-T176 | Verify Profile Page', (tester) async {
    //navigate to page
    await goToProfilePage(tester, loginNeeded: true);

    //verify
    profileRobot.verifyPageVisible();
    verifyAllCommponentsVisible();
  });

  testWidgets('EZRX-T177 | Verify Refresh Profile Page', (tester) async {
    //navigate to page
    await goToProfilePage(tester);

    //verify
    profileRobot.verifyPageVisible();
    verifyAllCommponentsVisible();
    await profileRobot.pullToRefresh();
    verifyAllCommponentsVisible();
  });

  testWidgets('EZRX-T179 | Verify change language suscess', (tester) async {
    //Cannot change Language because MY market has only English language.
    //Skip this test cases
  });

  testWidgets('EZRX-T180 | Verify update profile after clear changes',
      (tester) async {
    //Cannot change Language because MY market has only English language,
    //So that cannot verify update profile after clear changes,
    //Skip this test cases
  });

  tearDown(() async {
    locator<ZephyrService>().setNameAndStatus();
    await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  });
}
