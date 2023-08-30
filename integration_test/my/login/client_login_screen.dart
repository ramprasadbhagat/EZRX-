import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../core/common.dart';
import '../../robots/home/home_robot.dart';
import '../../robots/login_robot.dart';

void main() {
  late LoginRobot loginRobot;
  late HomeRobot homeRobot;

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // initialize variables
  const marketMalaysia = 'Malaysia';
  const username = 'myclientuser';
  const password = 'St@ysafe01';
  const usernameInCorrect = 'myclientuser001';
  const passwordInCorrect = 'St@ysafe001';
  const emptyString = '';

  group('Login (MY Market)', () {
    testWidgets('Verify UI of Login screen', (tester) async {
      //initialize necessary robots
      loginRobot = LoginRobot(tester);

      //init app
      await runAppForTesting(tester);

      //verify
      loginRobot.findMarketSelector();
      loginRobot.findUsernameField();
      loginRobot.findPasswordField();
      loginRobot.findPasswordField();
      loginRobot.findRememberMeCheckbox();
      loginRobot.findForgotPasswordLink();
      loginRobot.findSignUpLink();
      loginRobot.findLoginWithSSOButton();
    });

    testWidgets('Verify Default value fields (MY Market)', (tester) async {
      //initialize neccessary robots
      loginRobot = LoginRobot(tester);

      //init app
      await runAppForTesting(tester);

      await tester.pump(const Duration(seconds: 2));

      //default value
      loginRobot.verifyDefaultValueSelector(marketMalaysia);
      loginRobot.verifyRememberMeCheckboxUnchecked();
      loginRobot.verifyDefaultUsernameField();
      loginRobot.verifyDefaultPasswordField();
    });

    testWidgets('Verify mandatory fields (MY Market)', (tester) async {
      //initialize neccessary robots
      loginRobot = LoginRobot(tester);

      //init app
      await runAppForTesting(tester);

      //select market
      loginRobot.findMarketSelector();
      await loginRobot.tapToMarketSelector();
      await loginRobot.selectMarket(marketMalaysia);
      loginRobot.verifySelectedMarket(marketMalaysia);

      //login without username and password
      await loginRobot.login(emptyString, emptyString);
      loginRobot.verifyErrorMessageWithoutUserName();
      loginRobot.verifyErrorMessageWithoutPassword();

      //login without username
      await loginRobot.login(emptyString, password);
      loginRobot.verifyErrorMessageWithoutUserName();

      //login without password
      await loginRobot.login(username, emptyString);
      loginRobot.verifyErrorMessageWithoutPassword();
    });

    testWidgets(
        'Verify login unsuccessfully with incorrect Username (MY Market)',
        (tester) async {
      //initialize neccessary robots
      loginRobot = LoginRobot(tester);

      //init app
      await runAppForTesting(tester);

      //select market
      loginRobot.findMarketSelector();
      await loginRobot.tapToMarketSelector();
      await loginRobot.selectMarket(marketMalaysia);
      loginRobot.verifySelectedMarket(marketMalaysia);

      //login with incorrect username
      await loginRobot.login(usernameInCorrect, password);
      loginRobot.verifyErrorMessageWithIncorrectUsernameAndPassword();
    });

    testWidgets(
        'Verify login unsuccessfully with incorrect Password (MY Market)',
        (tester) async {
      //initialize neccessary robots
      loginRobot = LoginRobot(tester);

      //init app
      await runAppForTesting(tester);

      //select market
      loginRobot.findMarketSelector();
      await loginRobot.tapToMarketSelector();
      await loginRobot.selectMarket(marketMalaysia);
      loginRobot.verifySelectedMarket(marketMalaysia);

      //login with incorrect password
      await loginRobot.login(username, passwordInCorrect);
      loginRobot.verifyErrorMessageWithIncorrectUsernameAndPassword();
    });

    testWidgets(
        'Verify login unsuccessfully with incorrect Username/Password (MY Market)',
        (tester) async {
      //initialize neccessary robots
      loginRobot = LoginRobot(tester);

      //init app
      await runAppForTesting(tester);

      //select market
      loginRobot.findMarketSelector();
      await loginRobot.tapToMarketSelector();
      await loginRobot.selectMarket(marketMalaysia);
      loginRobot.verifySelectedMarket(marketMalaysia);

      //login with incorrect username
      await loginRobot.login(usernameInCorrect, passwordInCorrect);
      loginRobot.verifyErrorMessageWithIncorrectUsernameAndPassword();
    });
  });

  group('Forgot password (MY Market)', () {
    testWidgets('Verify Forgot password screen (MY Market)', (tester) async {
      //initialize neccessary robots
      loginRobot = LoginRobot(tester);

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
      await loginRobot.enterTextToUsernameField(usernameInCorrect);
      await loginRobot.tapToNextButton();

      //verify error message
      loginRobot.verifyErrorMessageWithInvalidUsername();
    });

    testWidgets('Verify Forgot password fucntion (MY Market)', (tester) async {
      //initialize neccessary robots
      loginRobot = LoginRobot(tester);

      //init app
      await runAppForTesting(tester);

      //forgot password
      loginRobot.findForgotPasswordLink();
      await loginRobot.tapToForgotPassword();

      //verify send email
      await loginRobot.enterTextToUsernameField(username);
      await loginRobot.tapToNextButton();
      loginRobot.verifyMessageSentEmail();
    });
  });

  group('Login successfully (MY Market)', () {
    testWidgets('Verify login successfully with check :Remember me (MY Market)',
        (tester) async {
      //initialize neccessary robots
      loginRobot = LoginRobot(tester);
      homeRobot = HomeRobot(tester);

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

      await homeRobot.findLogout();
      await homeRobot.tapLogout();
    });

    testWidgets(
        'Verify login successfully with uncheck :Remember me (MY Market)',
        (tester) async {
      //initialize neccessary robots
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
}
