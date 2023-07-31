import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../core/common.dart';
import '../../robots/login_robot.dart';

void main() {
  late LoginRobot loginRobot;

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Forgot Password (MY Market)', (tester) async {
    //initialize neccessary robots
    loginRobot = LoginRobot(tester);

    //initialize variables
    const username = 'myclientuser';

    //init app
    await runAppForTesting(tester);

    //forgot password
    loginRobot.findForgotPasswordLink();
    await loginRobot.tapToForgotPassword();

    //back to login
    loginRobot.findBackToLoginButton();
    await loginRobot.tapToBackToLogin();

    await loginRobot.tapToForgotPassword();

    //verify error message
    loginRobot.findNextButton();
    await loginRobot.tapToNextButton();
    loginRobot.verifyErrorMessageWithoutUsername();

    //enter invalid user
    loginRobot.findForgotUsernameField();
    await loginRobot.enterTextToUsernameField('a');
    await loginRobot.tapToNextButton();

    //verify error message
    loginRobot.verifyErrorMessageWithInvalidUsername();

    //verify send email
    await loginRobot.enterTextToUsernameField('');
    await loginRobot.enterTextToUsernameField(username);
    await loginRobot.tapToNextButton();
    loginRobot.verifyMessageSentEmail();
  });
}
