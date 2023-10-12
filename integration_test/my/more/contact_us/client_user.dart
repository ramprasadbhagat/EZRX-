import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../../core/common.dart';
import '../../../robots/common/common_robot.dart';
import '../../../robots/common/enum.dart';
import '../../../robots/login_robot.dart';
import '../../../robots/more/contact_us_robot.dart';
import '../../../robots/more/more_robot.dart';

import '../../../core/infrastructure/infra_core/zephyr_service/zephyr_service.dart';
import '../../../core/infrastructure/zephyr/repository/zephyr_repository.dart';
import '../../../core/test_locator.dart';

void main() {
  late LoginRobot loginRobot;
  late CommonRobot commonRobot;
  late MoreRobot moreRobot;
  late ContactUsRobot contactUsRobot;

  void initializeRobot(WidgetTester tester) {
    loginRobot = LoginRobot(tester);
    commonRobot = CommonRobot(tester);
    moreRobot = MoreRobot(tester);
    contactUsRobot = ContactUsRobot(tester);
  }

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // initialize variables
  const marketMalaysia = 'Malaysia';
  const username = 'myclientuser';
  const password = 'St@ysafe01';
  const customerCode = '0070149863';
  const phoneNumber = '0981234567';
  const userNameInitValue = 'MYClientUser User91';
  const emailInitValue = 'jhchoo@zuelligpharma.com';
  const emailContact = 'myezrx@zuelligpharma.com';
  const phoneContact = '1800883711';

  testWidgets('EZRX-T201 | Verify page contact us is displayed',
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
    await moreRobot.tapContactUsTile();

    contactUsRobot.verifyContactDetailInfo(
      email: emailContact,
      numberPhone: phoneContact,
    );
    contactUsRobot.verifyTimeSupport();
    contactUsRobot.verifyAllFieldVisible();
    contactUsRobot.verifyInitValueField(
      userName: userNameInitValue,
      email: emailInitValue,
    );
  });

  testWidgets('EZRX-T202 | Verify send message successful', (tester) async {
    //initialize necessary robots
    initializeRobot(tester);
    //init app
    await runAppForTesting(tester);

    await commonRobot.navigateToScreen(NavigationTab.more);
    await moreRobot.tapContactUsTile();

    await contactUsRobot.enterPhoneNumberField(phoneNumber);
    await contactUsRobot.enterMessageField('Integration Test');
    await contactUsRobot.tapToSendMessage();
    contactUsRobot.verifyCustomSnackBar(message: 'Message has been received.');
  });

  testWidgets('EZRX-T203 | Verify send message without Your Name',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);
    //init app
    await runAppForTesting(tester);

    await commonRobot.navigateToScreen(NavigationTab.more);
    await moreRobot.tapContactUsTile();

    await contactUsRobot.enterUserNameField('');
    await contactUsRobot.tapToSendMessage();
    contactUsRobot.verifyUserNameRequireErrorMsg();
  });

  testWidgets('EZRX-T204 | Verify send message without Contact Number',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);
    //init app
    await runAppForTesting(tester);

    await commonRobot.navigateToScreen(NavigationTab.more);
    await moreRobot.tapContactUsTile();

    await contactUsRobot.tapToSendMessage();
    contactUsRobot.verifyPhoneNumberInValidErrorMsg();
  });

  testWidgets('EZRX-T205 | Verify send message without E-mail', (tester) async {
    //initialize necessary robots
    initializeRobot(tester);
    //init app
    await runAppForTesting(tester);

    await commonRobot.navigateToScreen(NavigationTab.more);
    await moreRobot.tapContactUsTile();

    await contactUsRobot.enterEmailField('');
    await contactUsRobot.tapToSendMessage();
    contactUsRobot.verifyEmailRequireErrorMsg();
  });

  testWidgets('EZRX-T206 | Verify send message without Message',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);
    //init app
    await runAppForTesting(tester);

    await commonRobot.navigateToScreen(NavigationTab.more);
    await moreRobot.tapContactUsTile();

    await contactUsRobot.enterMessageField('');
    await contactUsRobot.tapToSendMessage();
    contactUsRobot.verifyMessageFieldRequireErrorMsg();
  });

  testWidgets('EZRX-T207 | Verify send message with email invalid',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);
    //init app
    await runAppForTesting(tester);

    await commonRobot.navigateToScreen(NavigationTab.more);
    await moreRobot.tapContactUsTile();

    await contactUsRobot.enterEmailField('integrationTest@mail');
    await contactUsRobot.tapToSendMessage();
    contactUsRobot.verifyEmailInValidErrorMsg();
  });
  tearDown(() async {
    locator<ZephyrService>().setNameAndStatus();
    await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  });
}
