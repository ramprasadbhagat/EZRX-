import 'package:ezrxmobile/locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../../core/common.dart';
import '../../../core/infrastructure/infra_core/zephyr_service/zephyr_service.dart';
import '../../../core/infrastructure/zephyr/repository/zephyr_repository.dart';
import '../../../robots/common/common_robot.dart';
import '../../../robots/home/articles_details_robot.dart';
import '../../../robots/home/articles_robot.dart';
import '../../../robots/login_robot.dart';
import '../../../robots/more/more_robot.dart';

void main() {
  late LoginRobot loginRobot;
  late CommonRobot commonRobot;
  late MoreRobot moreRobot;
  late ArticleRobot articleRobot;
  late ArticleDetailsRobot articleDetailsRobot;

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // initialize variables
  const marketMalaysia = 'Malaysia';
  const username = 'myclientuser';
  const password = 'St@ysafe01';
  const shipToCode = '0070149863';
  const invalidSearchKey = 'auto-testtttttttttttt';
  const validSearchKey = 'ezrx';

  void initializeRobot(WidgetTester tester) {
    loginRobot = LoginRobot(tester);
    commonRobot = CommonRobot(tester);
    moreRobot = MoreRobot(tester);
    articleRobot = ArticleRobot(tester);
    articleDetailsRobot = ArticleDetailsRobot(tester);
  }

  Future<void> goToAnnouncementArticlePage() async {
    //Switch delivery address
    await commonRobot.changeDeliveryAddress(shipToCode);

    //Go to Announcement & Article Page
    await commonRobot.goToMoreTab();
    await moreRobot.tapAnnouncementArticleTile();
  }

  Future<void> goToArticlePage() async {
    articleRobot.verifyAnnouncementsArticlePage();
    await articleRobot.switchToArticleTabPage();
  }

  testWidgets('EZRX-T160 | Verify articles page', (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await loginRobot.loginToHomeScreen(username, password, marketMalaysia);
    await goToAnnouncementArticlePage();

    articleRobot.verifyAnnouncementsArticlePage();
    articleRobot.verifyTabBar();
    await goToArticlePage();
    articleRobot.verifySearchBar();
    articleRobot.verifyFilterIcon();
    articleRobot.verifyArticleItemsVisible();
  });

  testWidgets('EZRX-T163 | Verify detail articles', (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToAnnouncementArticlePage();
    await goToArticlePage();
    articleRobot.verifySearchBar();
    await commonRobot.searchWithSearchIcon(validSearchKey);
    await articleRobot.tapArticleItem();
    articleDetailsRobot.verifyArticleDetailsPage();
    await articleDetailsRobot.tapArticleDetailsBackButton();
    articleRobot.verifyAnnouncementsArticlePage();
  });

  testWidgets('EZRX-T165 | Verify search articles invalid data',
      (tester) async {
    initializeRobot(tester);

    await runAppForTesting(tester);
    await goToAnnouncementArticlePage();
    await goToArticlePage();

    await commonRobot.searchWithSearchIcon(invalidSearchKey);
    articleRobot.verifyNotFoundData();

    await commonRobot.tapClearSearch();
    articleRobot.verifyArticleItemsVisible();
  });

  testWidgets(
      'EZRX-T166 | Verify search Article valid data - on done keyboard button',
      (tester) async {
    initializeRobot(tester);

    await runAppForTesting(tester);
    await goToAnnouncementArticlePage();
    await goToArticlePage();

    await commonRobot.searchWithKeyboardAction(validSearchKey);
    articleRobot.verifyArticleItemsVisible();
    articleRobot.verifyArticleItemstitle(searchKey: validSearchKey);
  });

  testWidgets(
      'EZRX-T252 | Verify search Article valid data - on search icon button',
      (tester) async {
    initializeRobot(tester);

    await runAppForTesting(tester);
    await goToAnnouncementArticlePage();
    await goToArticlePage();

    articleRobot.verifyArticleItemsVisible();
    await commonRobot.searchWithSearchIcon(validSearchKey);
    articleRobot.verifyArticleItemsVisible();
    articleRobot.verifyArticleItemstitle(searchKey: validSearchKey);
  });

  testWidgets(
      'EZRX-T171 | Verify search any one item & Tap & Verify Detail page in details',
      (tester) async {
    initializeRobot(tester);

    await runAppForTesting(tester);
    await goToAnnouncementArticlePage();
    await goToArticlePage();

    articleRobot.verifyArticleItemsVisible();
    await commonRobot.searchWithSearchIcon(validSearchKey);
    articleRobot.verifyArticleItemsVisible();
    await articleRobot.tapArticleItem();
    articleDetailsRobot.verifyArticleDetailsPage();
  });

  tearDown(() async {
    locator<ZephyrService>().setNameAndStatus();
    await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  });
}
