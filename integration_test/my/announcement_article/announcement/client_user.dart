import 'package:ezrxmobile/locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../../core/common.dart';
import '../../../core/infrastructure/infra_core/zephyr_service/zephyr_service.dart';
import '../../../core/infrastructure/zephyr/repository/zephyr_repository.dart';
import '../../../robots/announcement_article/announcement/announcement_detail_robot.dart';
import '../../../robots/announcement_article/announcement/announcement_robot.dart';
import '../../../robots/announcement_article/announcement_article_root_robot.dart';
import '../../../robots/common/common_robot.dart';
import '../../../robots/login_robot.dart';
import '../../../robots/more/more_robot.dart';

void main() {
  late LoginRobot loginRobot;
  late CommonRobot commonRobot;
  late MoreRobot moreRobot;
  late AnnouncementRobot announcementRobot;
  late AnnouncementArticleRootRobot announcementArticleRootRobot;
  late AnnouncementDetailRobot announcementDetailRobot;

  const marketMalaysia = 'Malaysia';
  const username = 'myclientuser';
  const password = 'St@ysafe01';
  const invalidSearchKey = 'auto-testtttttttttttt';
  const invalidLengthSearchKey = 'a';
  const validSearchKey = 'new';

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  void initializeRobot(WidgetTester tester) {
    loginRobot = LoginRobot(tester);
    commonRobot = CommonRobot(tester);
    moreRobot = MoreRobot(tester);
    announcementArticleRootRobot = AnnouncementArticleRootRobot(tester);
    announcementRobot = AnnouncementRobot(tester);
    announcementDetailRobot = AnnouncementDetailRobot(tester);
  }

  Future<void> goToAnnouncementPage() async {
    await commonRobot.dismissSnackbar();
    await commonRobot.goToMoreTab();
    await moreRobot.verifyAnnouncementArticleTile();
    await moreRobot.tapAnnouncementArticleTile();
  }

  testWidgets('EZRX-T170 | Verify announcements page', (tester) async {
    initializeRobot(tester);

    await runAppForTesting(tester);
    await loginRobot.loginToHomeScreen(username, password, marketMalaysia);
    await goToAnnouncementPage();

    announcementArticleRootRobot.verifyTabBar();
    announcementArticleRootRobot.verifyAnnouncementPage();
    // announcementRobot.verifyFilterButton();
    announcementRobot.verifySearchBar();
    announcementRobot.verifySearchBarText('');
  });

  testWidgets('EZRX-T168 | Verify detail announcements', (tester) async {
    initializeRobot(tester);

    await runAppForTesting(tester);
    await goToAnnouncementPage();

    await announcementRobot.searchWithKeyboardAction(validSearchKey);
    announcementRobot.verifyItemsWithKeyword(validSearchKey);
    await announcementRobot.tapFirstItem();
    announcementDetailRobot.verifyPage();
    announcementDetailRobot.verifyBackButton();
    announcementDetailRobot.verifyAnnouncementImage();
    announcementDetailRobot.verifyAnnouncementDate();
    announcementDetailRobot.verifyOtherAnnouncementSection();
  });

  testWidgets('EZRX-T172 | Verify search announcements invalid data',
      (tester) async {
    initializeRobot(tester);

    await runAppForTesting(tester);
    await goToAnnouncementPage();

    announcementRobot.verifyItems();
    await announcementRobot.autoSearch(invalidLengthSearchKey);
    announcementRobot.verifyInvalidLengthSearchMessage(isVisible: false);
    announcementRobot.verifyLoadingImage(isVisible: false);
    await announcementRobot.searchWithSearchIcon(invalidLengthSearchKey);
    announcementRobot.verifyInvalidLengthSearchMessage(isVisible: true);
    await announcementRobot.dismissSnackbar();
    await announcementRobot.autoSearch(invalidSearchKey);
    announcementRobot.verifyNoRecordFound();
    await announcementRobot.tapClearSearch();
    announcementRobot.verifyItems();
  });

  testWidgets(
      'EZRX-T173 | Verify search announcements valid data - on done keyboard button',
      (tester) async {
    initializeRobot(tester);

    await runAppForTesting(tester);
    await goToAnnouncementPage();

    await announcementRobot.searchWithKeyboardAction(validSearchKey);
    await announcementRobot.waitAutoSearchDuration();
    announcementRobot.verifyLoadingImage(isVisible: false);
    announcementRobot.verifyItemsWithKeyword(validSearchKey);
    await announcementRobot.pullToRefresh();
    announcementRobot.verifySearchBarText('');
  });

  testWidgets('EZRX-T174 | Verify Filter Announcements', (tester) async {
    //TODO: Revisit to implement test cases after the filter feature is implemented
  });

  testWidgets(
      'EZRX-T175 | Verify search any one item & Tap & Verify Detail page in details',
      (tester) async {
    initializeRobot(tester);

    await runAppForTesting(tester);
    await goToAnnouncementPage();

    await announcementRobot.searchWithKeyboardAction(validSearchKey);
    announcementRobot.verifyItemsWithKeyword(validSearchKey);
    await announcementRobot.tapFirstItem();
    announcementArticleRootRobot.verifyAnnouncementPage(isVisible: false);
    announcementDetailRobot.verifyPage(isVisible: true);
    await announcementDetailRobot.tapBackButton();
    announcementDetailRobot.verifyPage(isVisible: false);
    announcementArticleRootRobot.verifyAnnouncementPage(isVisible: true);
  });

  testWidgets(
      'EZRX-T251 | Verify search announcements valid data - on search button',
      (tester) async {
    initializeRobot(tester);

    await runAppForTesting(tester);
    await goToAnnouncementPage();

    await announcementRobot.searchWithKeyboardAction(validSearchKey);
    await announcementRobot.waitAutoSearchDuration();
    announcementRobot.verifyLoadingImage(isVisible: false);
    announcementRobot.verifyItemsWithKeyword(validSearchKey);
    await announcementRobot.pullToRefresh();
    announcementRobot.verifySearchBarText('');
  });

  tearDown(() async {
    locator<ZephyrService>().setNameAndStatus();
    await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  });
}
