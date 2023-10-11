import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../../core/common.dart';
import '../../../robots/common/common_robot.dart';
import '../../../robots/common/enum.dart';
import '../../../robots/login_robot.dart';
import '../../../robots/more/more_robot.dart';
import '../../../robots/more/security_robot.dart';
import '../../../core/infrastructure/infra_core/zephyr_service/zephyr_service.dart';
import '../../../core/infrastructure/zephyr/repository/zephyr_repository.dart';
import '../../../core/test_locator.dart';

void main() {
  late LoginRobot loginRobot;
  late CommonRobot commonRobot;
  late MoreRobot moreRobot;
  late SecurityRobot securityRobot;

  void initializeRobot(WidgetTester tester) {
    loginRobot = LoginRobot(tester);
    commonRobot = CommonRobot(tester);
    moreRobot = MoreRobot(tester);
    securityRobot = SecurityRobot(tester);
  }

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // initialize variables
  const marketMalaysia = 'Malaysia';
  const username = 'myclientuser';
  const password = 'St@ysafe01';
  const customerCode = '0070149863';

  testWidgets(
      'EZRX-T240 | Verify Security(Change Password) page - all initial fields',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);
    //init app
    await runAppForTesting(tester);

    //select market
    loginRobot.findMarketSelector();
    await loginRobot.tapToMarketSelector();
    await loginRobot.selectMarket(marketMalaysia);
    loginRobot.verifySelectedMarket(marketMalaysia);
    //login without username and password
    await loginRobot.login(username, password);

    await loginRobot.tapGetStartedButton();
    await commonRobot.changeDeliveryAddress(customerCode);

    await commonRobot.navigateToScreen(NavigationTab.more);
    await moreRobot.tapSecurityTile();

    securityRobot.verifyAllItemVisible();
    securityRobot.verifyAllFieldEmpty();
    securityRobot.verifyObscureTextCurrentPassword(true);
    securityRobot.verifyObscureTextNewPassword(true);
    securityRobot.verifyObscureTextConfirmPassword(true);

    await securityRobot.tapToBackToMoreScreen();
    moreRobot.verifyMoreScreenVisible();
  });

  testWidgets(
      'EZRX-T241 | Verify Security(Change Password) page - current password validation',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);
    //init app
    await runAppForTesting(tester);

    await commonRobot.changeDeliveryAddress(customerCode);

    await commonRobot.navigateToScreen(NavigationTab.more);
    await moreRobot.tapSecurityTile();

    await securityRobot.tapToSaveButton();
    securityRobot.verifyRequireErrorMsgCurrentPassword(true);
    securityRobot.verifyErrorMessageAllFieldRequire();

    await securityRobot.fillToCurrentPasswordField(password);
    securityRobot.verifyObscureTextCurrentPassword(true);
    securityRobot.verifyRequireErrorMsgCurrentPassword(false);

    await securityRobot.tapToObscureIconInCurrentPasswordField(false);
    securityRobot.verifyObscureTextCurrentPassword(false);
    securityRobot.verifyValueCurrentPasswordField(password);

    await securityRobot.tapToObscureIconInCurrentPasswordField(true);
    securityRobot.verifyObscureTextCurrentPassword(true);
  });

  testWidgets(
      'EZRX-T242 | Verify Security(Change Password) page - new password validation',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);
    //init app
    await runAppForTesting(tester);
    //select market

    await commonRobot.navigateToScreen(NavigationTab.more);
    await moreRobot.tapSecurityTile();

    await securityRobot.tapToObscureIconInNewPasswordField(false);
    securityRobot.verifyObscureTextNewPassword(false);

    await securityRobot.tapToSaveButton();
    securityRobot.verifyRequireErrorMsgNewPassword(true);
    securityRobot.verifyErrorMessageAllFieldRequire();

    securityRobot.verifyConditionValidationPasswordMinimumLength(false);
    securityRobot.verifyConditionValidationPasswordContainUppercase(false);
    securityRobot.verifyConditionValidationPasswordContainLowercase(false);
    securityRobot.verifyConditionValidationPasswordContainNumeric(false);
    securityRobot.verifyConditionValidationPasswordContainSpecialCharacter(
      false,
    );
    securityRobot
        .verifyConditionValidationPasswordNotContain2ConsecutiveCharactersUsername(
      false,
    );

    await securityRobot.fillToNewPasswordField('S');
    securityRobot.verifyRequireErrorMsgNewPassword(false);

    securityRobot.verifyConditionValidationPasswordMinimumLength(false);
    securityRobot.verifyConditionValidationPasswordContainUppercase(true);
    securityRobot.verifyConditionValidationPasswordContainLowercase(false);
    securityRobot.verifyConditionValidationPasswordContainNumeric(false);
    securityRobot.verifyConditionValidationPasswordContainSpecialCharacter(
      false,
    );
    securityRobot
        .verifyConditionValidationPasswordNotContain2ConsecutiveCharactersUsername(
      true,
    );

    await securityRobot.tapToConfirmPasswordField();
    await securityRobot.fillToNewPasswordField('St');
    securityRobot.verifyRequireErrorMsgNewPassword(false);

    securityRobot.verifyConditionValidationPasswordMinimumLength(false);
    securityRobot.verifyConditionValidationPasswordContainUppercase(true);
    securityRobot.verifyConditionValidationPasswordContainLowercase(true);
    securityRobot.verifyConditionValidationPasswordContainNumeric(false);
    securityRobot.verifyConditionValidationPasswordContainSpecialCharacter(
      false,
    );
    securityRobot
        .verifyConditionValidationPasswordNotContain2ConsecutiveCharactersUsername(
      true,
    );

    await securityRobot.tapToConfirmPasswordField();
    await securityRobot.fillToNewPasswordField('St@');

    securityRobot.verifyRequireErrorMsgNewPassword(false);

    securityRobot.verifyConditionValidationPasswordMinimumLength(false);
    securityRobot.verifyConditionValidationPasswordContainUppercase(true);
    securityRobot.verifyConditionValidationPasswordContainLowercase(true);
    securityRobot.verifyConditionValidationPasswordContainNumeric(false);
    securityRobot.verifyConditionValidationPasswordContainSpecialCharacter(
      true,
    );
    securityRobot
        .verifyConditionValidationPasswordNotContain2ConsecutiveCharactersUsername(
      true,
    );

    await securityRobot.tapToConfirmPasswordField();
    await securityRobot.fillToNewPasswordField('St@use');
    securityRobot.verifyRequireErrorMsgNewPassword(false);

    securityRobot.verifyConditionValidationPasswordMinimumLength(false);
    securityRobot.verifyConditionValidationPasswordContainUppercase(true);
    securityRobot.verifyConditionValidationPasswordContainLowercase(true);
    securityRobot.verifyConditionValidationPasswordContainNumeric(false);
    securityRobot.verifyConditionValidationPasswordContainSpecialCharacter(
      true,
    );
    securityRobot
        .verifyConditionValidationPasswordNotContain2ConsecutiveCharactersUsername(
      false,
    );

    await securityRobot.tapToConfirmPasswordField();
    await securityRobot.fillToNewPasswordField('St@ysafe0');
    securityRobot.verifyRequireErrorMsgNewPassword(false);

    securityRobot.verifyConditionValidationPasswordMinimumLength(false);
    securityRobot.verifyConditionValidationPasswordContainUppercase(true);
    securityRobot.verifyConditionValidationPasswordContainLowercase(true);
    securityRobot.verifyConditionValidationPasswordContainNumeric(true);
    securityRobot.verifyConditionValidationPasswordContainSpecialCharacter(
      true,
    );
    securityRobot
        .verifyConditionValidationPasswordNotContain2ConsecutiveCharactersUsername(
      true,
    );

    await securityRobot.tapToConfirmPasswordField();
    await securityRobot.fillToNewPasswordField('St@ysafe01');
    securityRobot.verifyRequireErrorMsgNewPassword(false);

    securityRobot.verifyConditionValidationPasswordMinimumLength(true);
    securityRobot.verifyConditionValidationPasswordContainUppercase(true);
    securityRobot.verifyConditionValidationPasswordContainLowercase(true);
    securityRobot.verifyConditionValidationPasswordContainNumeric(true);
    securityRobot.verifyConditionValidationPasswordContainSpecialCharacter(
      true,
    );
    securityRobot
        .verifyConditionValidationPasswordNotContain2ConsecutiveCharactersUsername(
      true,
    );

    await securityRobot.tapToObscureIconInNewPasswordField(true);
    securityRobot.verifyObscureTextNewPassword(true);
  });

  testWidgets(
      'EZRX-T243 | Verify Security(Change Password) page - new password again validation',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);
    //init app
    await runAppForTesting(tester);

    await commonRobot.navigateToScreen(NavigationTab.more);
    await moreRobot.tapSecurityTile();

    await securityRobot.tapToSaveButton();
    securityRobot.verifyRequireErrorMsgConfirmPassword(true);
    securityRobot.verifyErrorMessageAllFieldRequire();

    await securityRobot.fillToConfirmPasswordField(password);
    securityRobot.verifyObscureTextConfirmPassword(true);
    securityRobot.verifyPasswordMismatchErrorMsg();

    await securityRobot.tapToObscureIconInConfirmPasswordField(false);
    securityRobot.verifyObscureTextConfirmPassword(false);
    securityRobot.verifyValueConfirmPasswordField(password);

    await securityRobot.tapToObscureIconInConfirmPasswordField(true);
    securityRobot.verifyObscureTextConfirmPassword(true);
  });

  testWidgets(
      'EZRX-T244 | Verify Security(Change Password) page - current, new password & new password again validation',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);
    //init app
    await runAppForTesting(tester);

    await commonRobot.navigateToScreen(NavigationTab.more);
    await moreRobot.tapSecurityTile();

    await securityRobot.tapToObscureIconInCurrentPasswordField(false);
    await securityRobot.tapToObscureIconInNewPasswordField(false);
    await securityRobot.tapToObscureIconInConfirmPasswordField(false);
    securityRobot.verifyObscureTextCurrentPassword(false);
    securityRobot.verifyObscureTextNewPassword(false);
    securityRobot.verifyObscureTextConfirmPassword(false);

    await securityRobot.tapToSaveButton();
    securityRobot.verifyRequireErrorMsgCurrentPassword(true);
    securityRobot.verifyRequireErrorMsgNewPassword(true);
    securityRobot.verifyRequireErrorMsgConfirmPassword(true);
    securityRobot.verifyErrorMessageAllFieldRequire();

    securityRobot.verifyConditionValidationPasswordMinimumLength(false);
    securityRobot.verifyConditionValidationPasswordContainUppercase(false);
    securityRobot.verifyConditionValidationPasswordContainLowercase(false);
    securityRobot.verifyConditionValidationPasswordContainNumeric(false);
    securityRobot.verifyConditionValidationPasswordContainSpecialCharacter(
      false,
    );
    securityRobot
        .verifyConditionValidationPasswordNotContain2ConsecutiveCharactersUsername(
      false,
    );

    await securityRobot.fillToCurrentPasswordField(password);
    await securityRobot.fillToNewPasswordField(password);
    securityRobot.verifyRequireErrorMsgCurrentPassword(false);
    securityRobot.verifyRequireErrorMsgNewPassword(false);
    securityRobot.verifySameOldPasswordErrorMsg(true);

    await securityRobot.fillToCurrentPasswordField(password);
    await securityRobot.tapToConfirmPasswordField();
    await securityRobot.fillToNewPasswordField('St@ysafe012');
    securityRobot.verifyRequireErrorMsgCurrentPassword(false);
    securityRobot.verifySameOldPasswordErrorMsg(false);

    await securityRobot.fillToCurrentPasswordField(password);
    await securityRobot.tapToConfirmPasswordField();
    await securityRobot.fillToNewPasswordField('St@ysafe012');
    await securityRobot.fillToConfirmPasswordField('St@ysafe011');
    securityRobot.verifyPasswordMismatchErrorMsg();

    await securityRobot.tapToClearChangeButton();
    securityRobot.verifyAllFieldEmpty();
  });

  tearDown(() async {
    locator<ZephyrService>().setNameAndStatus();
    await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  });
}
