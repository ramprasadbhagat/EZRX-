import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../core/common.dart';
import '../../core/infrastructure/infra_core/zephyr_service/zephyr_service.dart';
import '../../core/infrastructure/zephyr/repository/zephyr_repository.dart';
import '../../core/test_locator.dart';
import '../../robots/home/home_robot.dart';
import '../../robots/login_robot.dart';
import '../../robots/more/more_robot.dart';

void main() {
  late LoginRobot loginRobot;
  late HomeRobot homeRobot;
  late MoreRobot moreRobot;

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // initialize variables
  const marketMalaysia = 'Malaysia';
  const username = 'myexternalsalesrep';
  const password = 'St@ysafe01';

  group('Login successfully (MY Market)', () {
    testWidgets(
        'EZRX-T12 | Verify login successfully with check :Remember me (MY Market)',
        (tester) async {
      //initialize necessary robots
      loginRobot = LoginRobot(tester);
      homeRobot = HomeRobot(tester);
      moreRobot = MoreRobot(tester);

      //init app
      await runAppForTesting(tester);

      //select market
      loginRobot.findMarketSelector();
      await loginRobot.tapToMarketSelector();
      await loginRobot.selectMarket(marketMalaysia);
      loginRobot.verifySelectedMarket(marketMalaysia);

      // check remember me
      loginRobot.findRememberMeCheckbox();
      await loginRobot.tapToRememberMe();

      //login with
      await loginRobot.login(username, password);

      //intro page
      loginRobot.findGetStartedButton();
      await loginRobot.tapGetStartedButton();

      //home page
      homeRobot.verify();

      //logout
      homeRobot.findMoreTab();
      await homeRobot.tapMoreTab();

      await moreRobot.findLogout();
      await moreRobot.tapLogout();
    });

    testWidgets(
        'EZRX-T13 | Verify login successfully with uncheck :Remember me (MY Market)',
        (tester) async {
      //initialize necessary robots
      loginRobot = LoginRobot(tester);

      //init app
      await runAppForTesting(tester);

      //select market
      loginRobot.findMarketSelector();
      await loginRobot.tapToMarketSelector();
      await loginRobot.selectMarket(marketMalaysia);
      loginRobot.verifySelectedMarket(marketMalaysia);

      // check remember me
      loginRobot.findRememberMeCheckbox();
      await loginRobot.tapToRememberMe();

      //login with
      await loginRobot.login(username, password);

      //home page
      homeRobot.verify();
    });
  });

  tearDown(() => locator<ZephyrService>().setNameAndStatus());
  tearDownAll(
    () async =>
        await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient),
  );
}
