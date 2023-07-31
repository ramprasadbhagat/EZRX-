import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../core/common.dart';
import '../../robots/login_robot.dart';

void main() {
  late LoginRobot loginRobot;

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Login (MY Market)', (tester) async {
    //initialize neccessary robots
    loginRobot = LoginRobot(tester);

    //initialize variables
    const username = 'myclientuser';
    const password = 'St@ysafe01';
    const marketMalaysia = 'Malaysia';
    const passwordIncorrect = 'St@ysafe0111';
    const usernameInCorrect = 'myclientuser';

    //init app
    await runAppForTesting(tester);

    //select market
    loginRobot.findMarketSelector();
    await loginRobot.tapToMarketSelector();
    await loginRobot.selectMarket(marketMalaysia);

    //login without username
    await loginRobot.login('', password);
    loginRobot.verifyErrorMessageWithoutUserName();

    //login without password
    await loginRobot.login(username, '');
    loginRobot.verifyErrorMessageWithoutPassword();

    //login with incorrect username or password
    loginRobot.findRememberMeCheckbox();
    await loginRobot.tapToRememberMe();
    await loginRobot.login(usernameInCorrect, passwordIncorrect);
    loginRobot.verifyErrorMessageWithIncorrectUsernameAndPassword();
  });
}
