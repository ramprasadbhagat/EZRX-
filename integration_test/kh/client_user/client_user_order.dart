import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../core/common.dart';
import '../../core/infrastructure/infra_core/zephyr_service/zephyr_service.dart';
import '../../core/infrastructure/zephyr/repository/zephyr_repository.dart';
import '../../robots/announcement_article/announcement_article_root_robot.dart';
import '../../robots/announcement_article/articles/articles_details_robot.dart';
import '../../robots/announcement_article/articles/articles_robot.dart';
import '../../robots/auth/forgot_password_robot.dart';
import '../../robots/common/common_robot.dart';
import '../../robots/common/enum.dart';
import '../../robots/home/customer_search_robot.dart';
import '../../robots/home/home_robot.dart';
import '../../robots/login_robot.dart';
import '../../robots/more/contact_us_robot.dart';
import '../../robots/more/more_robot.dart';
import '../../robots/more/profile_robot.dart';
import '../../robots/more/security_robot.dart';
import '../../robots/notification/notification_robot.dart';
import '../../robots/orders/cart/cart_robot.dart';
import '../../robots/orders/orders_root_robot.dart';
import '../../robots/orders/view_by_items/view_by_items_detail_robot.dart';
import '../../robots/orders/view_by_orders/view_by_orders_detail_robot.dart';
import '../../robots/payments/payment_home_robot.dart';
import '../../robots/payments/payment_summary/payment_detail_robot.dart';
import '../../robots/products/combo_detail_robot.dart';
import '../../robots/products/filter_sort_product_robot.dart';
import '../../robots/products/product_detail_robot.dart';
import '../../robots/products/product_robot.dart';
import '../../robots/products/product_suggestion_robot.dart';
import '../../robots/returns/returns_by_items/returns_by_items_detail_robot.dart';
import '../../robots/returns/returns_root_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late CommonRobot commonRobot;
  late LoginRobot loginRobot;
  late ForgotPasswordRobot forgotPasswordRobot;
  late HomeRobot homeRobot;
  late CustomerSearchRobot customerSearchRobot;
  late ProfileRobot profileRobot;
  late ContactUsRobot contactUsRobot;
  late SecurityRobot securityRobot;

  late NotificationRobot notificationRobot;
  late MoreRobot moreRobot;

  late AnnouncementArticleRootRobot announcementArticleRootRobot;
  late ArticleRobot articleRobot;
  late ArticleDetailsRobot articleDetailsRobot;

  late ProductRobot productRobot;
  late ProductDetailRobot productDetailRobot;
  late FilterSortProductRobot filterSortProductRobot;
  late ProductSuggestionRobot productSuggestionRobot;
  late CartRobot cartRobot;

  late OrdersRootRobot ordersRootRobot;
  late ViewByItemsDetailRobot viewByItemsDetailRobot;
  late ViewByOrdersDetailRobot viewByOrdersDetailRobot;

  late ReturnsRootRobot returnsRootRobot;
  late ReturnsByItemsDetailRobot returnsByItemsDetailRobot;
  late PaymentSummaryDetailRobot paymentDetailRobot;
  late PaymentHomeRobot paymentHomeRobot;
  late ComboDetailRobot comboDetailRobot;

  void initializeRobot(WidgetTester tester) {
    commonRobot = CommonRobot(tester);
    loginRobot = LoginRobot(tester);
    forgotPasswordRobot = ForgotPasswordRobot(tester);
    homeRobot = HomeRobot(tester);
    customerSearchRobot = CustomerSearchRobot(tester);
    profileRobot = ProfileRobot(tester);
    contactUsRobot = ContactUsRobot(tester);
    securityRobot = SecurityRobot(tester);
    moreRobot = MoreRobot(tester);
    notificationRobot = NotificationRobot(tester);

    announcementArticleRootRobot = AnnouncementArticleRootRobot(tester);
    articleRobot = ArticleRobot(tester);
    articleDetailsRobot = ArticleDetailsRobot(tester);

    productRobot = ProductRobot(tester);
    productDetailRobot = ProductDetailRobot(tester);
    filterSortProductRobot = FilterSortProductRobot(tester);
    productSuggestionRobot = ProductSuggestionRobot(tester);
    cartRobot = CartRobot(tester);
    ordersRootRobot = OrdersRootRobot(tester);
    viewByItemsDetailRobot = ViewByItemsDetailRobot(tester);
    viewByOrdersDetailRobot = ViewByOrdersDetailRobot(tester);

    returnsRootRobot = ReturnsRootRobot(tester);
    returnsByItemsDetailRobot = ReturnsByItemsDetailRobot(tester);
    paymentDetailRobot = PaymentSummaryDetailRobot(tester);
    paymentHomeRobot = PaymentHomeRobot(tester);
    comboDetailRobot = ComboDetailRobot(tester);
  }

  const marketCambodia = 'Cambodia';
  const username = 'khclientuser';
  const password = 'St@ysafe01';
  const shipToCode = '0071264617';
  const otherShipToCode = '0071262814';
  const invalidLengthSearchKey = '1';
  const invalidSearchKey = 'auto-test-auto-test';
  const invalidNumberSearchKey = '1231762381236123';

  const materialNumber = '23340071';
  const materialName = 'ALLERGYL CP 25MG BT 10 x 10';
  const materialPrincipalName = 'PharmaProduct Manufacturing';
  const materialExpiryDate = 'NA';
  const materialUnitMeasurement = 'EA';
  const materialCountryOfOrigin = 'Cambodia';
  const searchKeywordMaterialName = 'rhinoril';
  const searchKeywordMaterialCode = '2334';
  const searchKeywordMaterialCodeNotValid = '19029';

  const multiImageMaterialNumber = '21223395';
  const suspendedMaterialNumber = '23340070';
  const bonusMaterialNumber = '23340072';

  var loginRequired = true;

  Future<void> pumpAppWithHomeScreen(
    WidgetTester tester, {
    String shipToCode = shipToCode,
  }) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    if (loginRequired) {
      await loginRobot.loginToHomeScreen(username, password, marketCambodia);
      await customerSearchRobot.selectCustomerSearch(shipToCode);
      loginRequired = false;
      await commonRobot.dismissSnackbar(dismissAll: true);
      await commonRobot.closeAnnouncementAlertDialog();
    } else {
      await commonRobot.dismissSnackbar(dismissAll: true);
      await commonRobot.changeDeliveryAddress(
        shipToCode,
      );
    }
  }

  Future<void> browseProductFromEmptyCart() async {
    await homeRobot.tapMiniCartIcon();
    await cartRobot.clearCart();
    await cartRobot.tapBrowseProductButton();
    await productRobot.openSearchProductScreen();
  }

  group('Authentication -', () {
    const usernameInCorrect = 'myclientuser001';
    const passwordInCorrect = 'St@ysafe001';

    Future<void> pumpAppInitialState(WidgetTester tester) async {
      initializeRobot(tester);
      await runAppForTesting(tester);
      await loginRobot.tapToCloseAnnouncementBanner();
    }

    testWidgets('EZRX-T6 | Verify GUI of Login screen', (tester) async {
      await pumpAppInitialState(tester);

      //select market
      await loginRobot.findMarketSelector();
      await loginRobot.tapToMarketSelector();
      await loginRobot.selectMarket(marketCambodia);
      await loginRobot.tapToCloseAnnouncementBanner();

      //verify
      await loginRobot.findUsernameField();
      await loginRobot.findPasswordField();
      await loginRobot.findPasswordField();
      await loginRobot.findRememberMeCheckbox();
      await loginRobot.findForgotPasswordLink();
      await loginRobot.verifySelectedMarket(marketCambodia);
      await loginRobot.findSignUpLink();
      await loginRobot.findLoginWithSSOButton();
    });

    testWidgets('EZRX-T7 | Verify Default value fields', (tester) async {
      //init app
      await pumpAppInitialState(tester);

      //default value
      await loginRobot.verifyRememberMeCheckboxUnchecked();
      await loginRobot.verifyDefaultUsernameField();
      await loginRobot.verifyDefaultPasswordField();
    });

    testWidgets('EZRX-T8 | Verify mandatory fields', (tester) async {
      const emptyString = '';
      //init app
      await pumpAppInitialState(tester);

      //select market
      await loginRobot.findMarketSelector();
      await loginRobot.tapToMarketSelector();
      await loginRobot.selectMarket(marketCambodia);

      //login without username and password
      await loginRobot.login(emptyString, emptyString);

      loginRobot.verifyErrorMessageWithoutUsername();
      loginRobot.verifyErrorMessageWithoutPassword();

      //login without username
      await loginRobot.login(emptyString, password);
      loginRobot.verifyErrorMessageWithoutUsername();

      //login without password
      await loginRobot.login(username, emptyString);
      loginRobot.verifyErrorMessageWithoutPassword();
    });

    testWidgets('EZRX-T9 | Verify login unsuccessfully with incorrect Username',
        (tester) async {
      //init app
      await pumpAppInitialState(tester);

      //select market
      await loginRobot.findMarketSelector();
      await loginRobot.tapToMarketSelector();
      await loginRobot.selectMarket(marketCambodia);

      //login with incorrect username
      await loginRobot.login(usernameInCorrect, password);
      loginRobot.verifyErrorMessageWithInvalidUsernameOrPassword();
    });

    testWidgets(
        'EZRX-T10 | Verify login unsuccessfully with incorrect Password',
        (tester) async {
      //init app
      await pumpAppInitialState(tester);

      //select market
      await loginRobot.findMarketSelector();
      await loginRobot.tapToMarketSelector();
      await loginRobot.selectMarket(marketCambodia);

      //login with incorrect password
      await loginRobot.login(username, passwordInCorrect);
      loginRobot.verifyErrorMessageWithInvalidUsernameOrPassword();
    });

    testWidgets(
        'EZRX-T11 | Verify login unsuccessfully with incorrect Username/Password',
        (tester) async {
      //init app
      await pumpAppInitialState(tester);

      //select market
      await loginRobot.findMarketSelector();
      await loginRobot.tapToMarketSelector();
      await loginRobot.selectMarket(marketCambodia);

      //login with incorrect username
      await loginRobot.login(usernameInCorrect, passwordInCorrect);
      loginRobot.verifyErrorMessageWithInvalidUsernameOrPassword();
    });

    testWidgets('EZRX-T14 | Verify Forgot password screen', (tester) async {
      //init app
      await pumpAppInitialState(tester);

      //forgot password
      await loginRobot.findForgotPasswordLink();
      await loginRobot.tapToForgotPassword();

      //back to login
      forgotPasswordRobot.verifyBackToLoginButton();
      await forgotPasswordRobot.tapToBackToLogin();
      await loginRobot.tapToForgotPassword();

      //verify error message
      forgotPasswordRobot.verifyNextButton();
      await forgotPasswordRobot.tapToNextButton();
      loginRobot.verifyErrorMessageWithoutUsername();

      //enter invalid user
      forgotPasswordRobot.verifyForgotUsernameField();
      await forgotPasswordRobot.enterTextToUsernameField(usernameInCorrect);
      await forgotPasswordRobot.tapToNextButton();

      //verify error message
      forgotPasswordRobot.verifyErrorMessageWithInvalidUsername();
    });

    testWidgets('EZRX-T15 | Verify Forgot password function', (tester) async {
      //init app
      await pumpAppInitialState(tester);

      //forgot password
      await loginRobot.findForgotPasswordLink();
      await loginRobot.tapToForgotPassword();

      //verify send email
      await forgotPasswordRobot.enterTextToUsernameField(username);
      await forgotPasswordRobot.tapToNextButton();
      forgotPasswordRobot.verifyMessageSentEmail();
    });

    testWidgets('EZRX-T12 | Verify login successfully with check :Remember me',
        (tester) async {
      //init app
      await pumpAppInitialState(tester);

      //select market
      await loginRobot.findMarketSelector();
      await loginRobot.tapToMarketSelector();
      await loginRobot.selectMarket(marketCambodia);

      // check remember me
      await loginRobot.findRememberMeCheckbox();
      await loginRobot.tapToRememberMe();

      //login with
      await loginRobot.login(username, password);

      //intro page
      loginRobot.findSkipIntroButton();
      await loginRobot.tapSkipIntroButton();
      await tester.pumpAndSettle(const Duration(seconds: 2));

      //customer search
      customerSearchRobot.verifyPage();

      // verify customer search show successfully
      customerSearchRobot.findCustomerCodeSearchField();
      await customerSearchRobot.search(shipToCode);
      customerSearchRobot.findCustomerCode(shipToCode);
    });

    testWidgets(
        'EZRX-T12 | Verify login successfully with customer page still saved',
        (tester) async {
      await pumpAppInitialState(tester);

      //customer search
      customerSearchRobot.verifyPage();

      // change address
      await customerSearchRobot.selectCustomerSearch(shipToCode);
      await commonRobot.closeAnnouncementAlertDialog();

      //home page
      homeRobot.verify();

      //logout
      await commonRobot.navigateToScreen(NavigationTab.more);
      await moreRobot.findLogout();
      await moreRobot.tapLogout();
    });

    testWidgets(
        'EZRX-T13 | Verify login successfully with uncheck :Remember me',
        (tester) async {
      //init app
      await pumpAppInitialState(tester);

      //select market
      await loginRobot.findMarketSelector();
      await loginRobot.tapToMarketSelector();
      await loginRobot.selectMarket(marketCambodia);

      // check remember me
      await loginRobot.findRememberMeCheckbox();
      await loginRobot.tapToRememberMe();

      await loginRobot.verifySelectedMarket(marketCambodia);
      //login with
      await loginRobot.login(username, password);

      //customer search
      customerSearchRobot.verifyPage();

      // change address
      await customerSearchRobot.selectCustomerSearch(shipToCode);

      //home page
      homeRobot.verify();
      loginRequired = false;
    });
  });

  group('Notification Tab -', () {
    testWidgets('EZRX-T95 | Verify Notification Tab with Default Values',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await commonRobot.navigateToScreen(NavigationTab.notifications);

      //verify
      notificationRobot.verifyPage();
      notificationRobot.verifyScrollList();
      if (notificationRobot.getFirstBasicNotificationTitle().isNotEmpty) {
        notificationRobot.verifyDeleteButton();
      }
    });

    testWidgets(
        'EZRX-T96 | Verify at least one notification item if list not empty',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await commonRobot.navigateToScreen(NavigationTab.notifications);

      //verify
      if (notificationRobot.checkIfNotificationListEmpty()) {
        notificationRobot.verifyNoRecordFound();
        return;
      }
      await notificationRobot.scrollAlertNotification();
      notificationRobot.verifyNotificationItems();
      if (notificationRobot.getFirstBasicNotificationTitle().isEmpty) {
        return;
      }
      final itemTitle = notificationRobot.getFirstBasicNotificationTitle();
      await notificationRobot.tapFirstBasicNotificationItem(itemTitle);
      if (viewByOrdersDetailRobot.isOrderDetailPage) {
        viewByOrdersDetailRobot.verifyPage();
      } else if (returnsByItemsDetailRobot.isReturnDetailPage) {
        returnsByItemsDetailRobot.verifyPage();
      } else if (paymentDetailRobot.isPaymentDetailPage) {
        paymentDetailRobot.verifyPage();
      } else {
        notificationRobot.verifyRedirectNotAvailableMessage();
      }
    });

    testWidgets('EZRX-T128 | Pull to Refresh Feature - verify item visible',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await commonRobot.navigateToScreen(NavigationTab.notifications);

      //verify
      if (notificationRobot.checkIfNotificationListEmpty()) {
        notificationRobot.verifyNoRecordFound();

        return;
      }
      notificationRobot.verifyNotificationItems();
      await notificationRobot.pullToRefresh();
      notificationRobot.verifyNotificationItems();
    });
  });

  group('Home Tab -', () {
    testWidgets(
        'EZRX-T17 | Access Homepage after logging in and having existing ShipTo',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //verify homepage
      homeRobot.verify();
      commonRobot.verifyCustomerCodeSelector();
      homeRobot.findMiniCartIcon();
      homeRobot.findQuickAccessMenu();
      homeRobot.findBannerInHomeScreen();
      await homeRobot.findBrowseProductsIcon();
      // await homeRobot.findAnnouncementsIcon();
    });

    testWidgets(
        'EZRX-T18 | Verify select ShipTo in Homepage incase existing items in cart',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //home page
      homeRobot.verify();

      // add to cart
      await commonRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyPageVisible();
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productSuggestionRobot.tapSearchResult(materialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar();
      await productDetailRobot.tapBackButton();
      await productSuggestionRobot.tapToBackScreen();
      await commonRobot.navigateToScreen(NavigationTab.home);

      // select customer code
      commonRobot.verifyCustomerCodeSelector();
      await commonRobot.tapCustomerCodeSelector();
      customerSearchRobot.verifyPage();
      customerSearchRobot.findCustomerCodeSearchField();
      await customerSearchRobot.search(otherShipToCode);

      // change address
      customerSearchRobot.findCustomerCode(otherShipToCode);
      await customerSearchRobot.tapOnCustomerCode(otherShipToCode);
      // cancel change address
      customerSearchRobot.findCancelChangeAddressButton();
      await customerSearchRobot.tapOnCancelChangeAddressButton();
      // confirm change address
      customerSearchRobot.findCustomerCode(otherShipToCode);
      await customerSearchRobot.tapOnCustomerCode(otherShipToCode);
      customerSearchRobot.findConfirmChangeAddressButton();
      await customerSearchRobot.tapOnConfirmChangeAddressButton();

      // verify cart empty
      await commonRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyPageVisible();
      productRobot.verifyCartButtonVisible();
      await productRobot.tapCartButton();
      cartRobot.verifyNoRecordFound();
    });

    testWidgets('EZRX-T19 | Verify select other ShipTo in Homepage',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      // select customer code
      await commonRobot.changeDeliveryAddress(otherShipToCode);
      customerSearchRobot.verifyCustomerCodeIsSelected(otherShipToCode);
    });

    testWidgets(
        'EZRX-T20 | Verify Search ShipTo with keyword contains Customer name/ShipTo name in Homepage',
        (tester) async {
      // initialize variables
      const subCustomerCode = '0030333';
      const subCustomerName = 'Bopha';
      const subShipToCode = '617';
      const subShipToName = 'Dy Bopha';

      //init app
      await pumpAppWithHomeScreen(tester);

      // select customer code
      commonRobot.verifyCustomerCodeSelector();
      await commonRobot.tapCustomerCodeSelector();
      customerSearchRobot.verifyPage();

      // contain customer code
      await customerSearchRobot.search(subCustomerCode);
      customerSearchRobot.verifySearchResults(subCustomerCode);

      // contain customer name
      await customerSearchRobot.search(subCustomerName);
      customerSearchRobot.verifySearchResults(subCustomerName);

      // contain ship to code
      await customerSearchRobot.search(subShipToCode);
      customerSearchRobot.verifySearchResults(subShipToCode);

      // contain ship to name
      await customerSearchRobot.search(subShipToName);
      customerSearchRobot.verifySearchResults(subShipToName);
    });

    testWidgets(
        'EZRX-T21 | Verify Search ShipTo with invalid keyword in Homepage',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      // select customer code
      commonRobot.verifyCustomerCodeSelector();
      await commonRobot.tapCustomerCodeSelector();
      customerSearchRobot.verifyPage();

      // verify search results: invalid code
      await customerSearchRobot.search(invalidNumberSearchKey);
      customerSearchRobot.verifySearchNotFound();

      // verify search results: invalid name
      await customerSearchRobot.search(invalidSearchKey);
      customerSearchRobot.verifySearchNotFound();
    });

    testWidgets(
        'EZRX-T28 | Verify Search by inputting valid keyword contains Product name',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      // search for valid products
      homeRobot.findSearchProductField();
      await homeRobot.tapSearchProductField();
      await commonRobot.searchWithKeyboardAction(materialName);

      productSuggestionRobot.verifySearchResults(materialName);
    });

    testWidgets('EZRX-T26 | Verify Tap & slide Banner in Homepage',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      if (homeRobot.isBannerEmpty) {
        homeRobot.verifyHomeBanner(isVisible: false);
        return;
      }

      homeRobot.verifyHomeBanner();
      homeRobot.verifyFirstBannerIsDisplay();
      //tap on next banner
      homeRobot.findNextBanner();
      await homeRobot.tapNextBanner();

      //slide to right
      await homeRobot.slidePreviousBanner();

      //slide banner to left
      await homeRobot.slideNextBanner();

      //tap on previous banner
      homeRobot.findPreviousBanner();
      await homeRobot.tapPreviousBanner();
    });

    testWidgets('EZRX-T43 | Verify display Product detail in Homepage',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //Product information
      homeRobot.findProductImage();
      homeRobot.findProductDescription();
      homeRobot.findProductManufactured();
      homeRobot.findProductPrice();
      homeRobot.findProductFavouriteIcon();
      homeRobot.verifyProductNumber();
    });

    testWidgets(
        'EZRX-T49 | Verify Search ShipTo with keyword contains Customer code/ShipTo code in Homepage',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //change address
      await commonRobot.changeDeliveryAddress(shipToCode);
      customerSearchRobot.verifyCustomerCodeIsSelected(shipToCode);
    });

    testWidgets(
        'EZRX-T22 | Verify click on Orders action in Top navigation menu',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //tap on home quick access order
      homeRobot.findQuickAccessOrders();
      await homeRobot.tapOrdersQuickAccess();

      //verify go to order page
      ordersRootRobot.verifyPage();
    });

    testWidgets(
        'EZRX-T23 | Verify click on Returns action in Top navigation menu',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //tap on home quick access return
      homeRobot.findQuickAccessReturns();
      await homeRobot.tapReturnsQuickAccess();

      //verify go to returns page
      returnsRootRobot.verifyRootPageVisible();
    });

    testWidgets(
        'EZRX-T24 | Verify click on Payments action in Top navigation menu',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //tap on home quick access payments
      homeRobot.findQuickAccessPayments();
      await homeRobot.tapPaymentQuickAccess();

      //verify go to payments page
      paymentHomeRobot.verifyPage();
    });

    testWidgets('EZRX-T44 | Verify display Product on offer in Homepage',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //tap on products on offer
      homeRobot.findProductsOnOffer();
      await homeRobot.tapProductsOnOfferIcon();

      //navigate to material page
      productRobot.verifyPageVisible();
    });

    testWidgets('EZRX-T47 | Verify display Browse products in Homepage',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //tap on browse products
      await homeRobot.findBrowseProductsIcon();
      await homeRobot.tapBrowseProductsIcon();

      //navigate to material page
      productRobot.verifyPageVisible();
    });

    // testWidgets('EZRX-T48 | Verify display Announcements in Homepage',
    //     (tester) async {
    //   //init app
    //   await pumpAppWithHomeScreen(tester);

    //   //tap on browse products
    //   await homeRobot.findAnnouncementsIcon();
    //   await homeRobot.tapAnnouncementsIcon();

    //   //verify go to announcements page
    //   announcementArticleRootRobot.verifyAnnouncementPage();
    // });

    testWidgets('EZRX-T46 | Verify display Recently ordered in Homepage',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      //tap on recently ordered
      await homeRobot.findRecentlyOrderIcon();
      await homeRobot.tapRecentlyOrderIcon();

      //verify go to order page
      ordersRootRobot.verifyPage();
    });

    testWidgets(
        'EZRX-T50 | Verify display Product detail in Product on offer in Homepage',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //move to products on offer
      homeRobot.findProductsOnOffer();
      homeRobot.verifyDisplayProductsWithOfferTag();

      //swipe products to right
      await homeRobot.slideToNextProductsOnOffer();

      //swipe products to left
      await homeRobot.slideToPreviousProductsOnOffer();
    });

    testWidgets('EZRX-T51 | Verify click on Product in Product on offer',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      homeRobot.findProductsOnOffer();

      //tap on first product
      await homeRobot.tapOnFirstProductOnOffer();

      //verify navigation to Material Detail Page
      productDetailRobot.verifyPage();
    });

    testWidgets('EZRX-T54 | Verify slide Item in Recently Ordered in Homepage',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //move to recently ordered
      await homeRobot.findRecentlyOrderIcon();

      //Swipe recently ordered to right
      await homeRobot.slideToNextRecentlyOrdered();

      //Swipe recently ordered to left
      await homeRobot.slideToPreviousRecentlyOrdered();
    });

    testWidgets('EZRX-T55 | Verify click on Item in Recently Ordered',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //move to recently ordered
      await homeRobot.findRecentlyOrderIcon();

      //tap on first product
      await homeRobot.tapOnFirstRecentlyOrdered();

      //verify navigate to material detail
      viewByItemsDetailRobot.verifyPage();
    });

    testWidgets('EZRX-T56 | Verify slide Product in Browse Product in Homepage',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //move to browse product
      await homeRobot.findBrowseProductsIcon();

      //Swipe browse product to right
      final productInfo = homeRobot.getFirstBrowseProductInfo();
      await homeRobot.slideToNextBrowseProducts();
      homeRobot.verifyNotFoundWidgetByText(productInfo);

      //Swipe browse product to left
      await homeRobot.slideToPreviousBrowseProducts();
      homeRobot.verifyFoundWidgetByText(productInfo);
    });

    testWidgets('EZRX-T57 | Verify click on Product in Browse Product',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //move to browse product
      await homeRobot.findBrowseProductsIcon();

      //tap on first product
      await homeRobot.tapOnFirstBrowseProduct();

      //verify navigate to material page
      productDetailRobot.verifyPage();
    });

    // testWidgets('EZRX-T59 | Verify click on Announcement in Announcements',
    //     (tester) async {
    //   //init app
    //   await pumpAppWithHomeScreen(tester);

    //   //move to Announcements
    //   await homeRobot.findAnnouncementsIcon();

    //   //tap on first product
    //   await homeRobot.tapOnFirstAnnouncement();

    //   //verify announcement detail page
    //   announcementDetailRobot.verifyPage();
    // });

    testWidgets('EZRX-T1254 | Verify display Combo offer in Homepage',
        (tester) async {
      const comboOfferCheckbox = 'Combo offers';

      //init app
      await pumpAppWithHomeScreen(tester);

      //move to Combos
      homeRobot.findComboOffer();

      //tap on explore combo deal
      await homeRobot.tapExploreComboDeal();

      //navigate to material page
      productRobot.verifyPageVisible();

      productRobot.verifyComboOfferLabel();
      productDetailRobot.verifyPage();
      productDetailRobot.verifyComboOfferLabel();
      await productDetailRobot.tapBackButton();

      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyCheckboxCheckedShowProduct(
        comboOfferCheckbox,
        true,
      );
    });

    testWidgets('EZRX-T1266 | Verify click on Product with Combo offer',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //move to Combos
      homeRobot.findComboOffer();

      //tap on explore combo deal
      await homeRobot.tapExploreComboDeal();

      //navigate to material page
      productRobot.verifyPageVisible();

      //tap on first product
      await productRobot.tapFirstMaterial();

      //verify navigate to material page
      productDetailRobot.verifyPage();
    });
  });

  group('Product Tab -', () {
    const sortByZToA = 'Z-A';

    testWidgets('EZRX-T30 | Verify product tab with default components',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyPageVisible();
      productRobot.verifyMaterial();
      productRobot.verifyCartButtonVisible();
      productRobot.verifyFilterFavoritesChip();
      productRobot.verifyCustomerCodeSelector();
      productRobot.verifyAppTabBarVisible();
      productRobot.verifySearchBarVisible();

      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifySheet();
      filterSortProductRobot.verifyDefaultFilterProduct();
      await filterSortProductRobot.tapToBackIcon();
      filterSortProductRobot.verifySheet(isVisible: false);

      await productRobot.tapCartButton();
      cartRobot.verifyPage();
      await cartRobot.tapCloseButton();

      await productRobot.openSearchProductScreen();
      productSuggestionRobot.verifyPage();
      await productSuggestionRobot.tapToBackScreen();

      await productRobot.tapCustomerCodeSelector();
      customerSearchRobot.verifyPage();
    });

    testWidgets('EZRX-38 | Verify Filter by product on offer', (tester) async {
      const offerCheckbox = 'Items with offers';

      await pumpAppWithHomeScreen(tester);
      await productRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openFilterProductScreen();

      await filterSortProductRobot.tapProductTypeCheckbox(offerCheckbox);
      await filterSortProductRobot.tapFilterApplyButton();
      productRobot.verifyOnOfferLabel();
      await productRobot.tapFirstMaterial();
      productDetailRobot.verifyPage();
      productDetailRobot.verifyOnOfferLabel();
      await productDetailRobot.tapBackButton();

      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyCheckboxCheckedShowProduct(
        offerCheckbox,
        true,
      );
      await filterSortProductRobot.tapProductTypeCheckbox(offerCheckbox);
      filterSortProductRobot.verifyCheckboxCheckedShowProduct(
        offerCheckbox,
        false,
      );
    });

    testWidgets('EZRX-T39 | Verify Filter by Country of origin',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyMaterial();

      await productRobot.openFilterProductScreen();
      await filterSortProductRobot.openFilterCountryOfOriginScreen();
      final country = filterSortProductRobot.getFirstSuggestedCountry();
      await filterSortProductRobot.searchWithKeyboardAction(country);
      filterSortProductRobot.verifyListCountryOfOriginMatched(country);
      await filterSortProductRobot.tapFirstSuggestedCountry();
      await commonRobot.tapToBackIcon();
      await Future.delayed(const Duration(seconds: 3));
      filterSortProductRobot.verifyCountryListSelectedVisible(1);
      await filterSortProductRobot.tapFilterApplyButton();

      await productRobot.tapFirstMaterial();
      await productDetailRobot.openMaterialInformation();
      productDetailRobot.verifyCountryOfOriginDisplayed(country);
    });

    testWidgets('EZRX-T38 | Verify Filter by Manufacturer', (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyMaterial();

      await productRobot.openFilterProductScreen();
      await filterSortProductRobot.openFilterManufacturerScreen();
      await filterSortProductRobot
          .searchWithKeyboardAction(materialPrincipalName);
      filterSortProductRobot
          .verifyListManufacturerMatched(materialPrincipalName);
      await filterSortProductRobot.tapFirstSuggestedManufacturer();
      filterSortProductRobot.verifyManufacturerSelected(materialPrincipalName);
      await filterSortProductRobot.tapToBackIcon();
      filterSortProductRobot.verifyManufactureListSelectedVisible(1);
      await filterSortProductRobot.tapFilterApplyButton();

      productRobot
          .verifyManufacturerMaterialFilterMatched(materialPrincipalName);
    });

    testWidgets('EZRX-T35 | Verify display by Sort by Z-A', (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyMaterial();
      final firstProduct = productRobot.getFistMaterialName();
      await productRobot.openFilterProductScreen();
      await filterSortProductRobot.chooseSortProductsBy(sortByZToA);
      filterSortProductRobot.verifyRadioSort(
        sortByZToA,
        true,
      );
      await filterSortProductRobot.tapFilterApplyButton();
      productRobot.verifyProductSortChanged(firstProduct);
      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyRadioSort(
        sortByZToA,
        true,
      );
    });

    testWidgets('EZRX-T40 | Verify combine filter with Sort conditions',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyMaterial();
      final firstProduct = productRobot.getFistMaterialName();
      await productRobot.openFilterProductScreen();
      await filterSortProductRobot.chooseSortProductsBy(sortByZToA);
      filterSortProductRobot.verifyRadioSort(
        sortByZToA,
        true,
      );
      await filterSortProductRobot.openFilterManufacturerScreen();
      await filterSortProductRobot
          .searchWithKeyboardAction(materialPrincipalName);
      await filterSortProductRobot.tapFirstSuggestedManufacturer();
      filterSortProductRobot.verifyManufacturerSelected(materialPrincipalName);
      await commonRobot.tapToBackIcon();
      await filterSortProductRobot.tapFilterApplyButton();
      productRobot.verifyMaterial();
      productRobot
          .verifyManufacturerMaterialFilterMatched(materialPrincipalName);
      productRobot.verifyProductSortChanged(firstProduct);
    });

    testWidgets('EZRX-T218 | Verify reset button in Product filter',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);

      final firstNameProduct = productRobot.getFistMaterialName();
      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyDefaultFilterProduct();
      await filterSortProductRobot.chooseSortProductsBy(sortByZToA);
      filterSortProductRobot.verifyRadioSort(
        sortByZToA,
        true,
      );
      await filterSortProductRobot.tapFilterApplyButton();
      productRobot.verifyProductSortChanged(firstNameProduct);
      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyRadioSort(
        sortByZToA,
        true,
      );
      await filterSortProductRobot.tapFilterResetButton();
      productRobot.verifyFirstNameProduct(firstNameProduct);
      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyDefaultFilterProduct();
    });

    testWidgets('EZRX-T34 | Verify filter by favorite', (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyMaterial();
      await productRobot.tapFirstMaterial();
      await productDetailRobot.setProductToFavoriteList(true);
      final nameProduct =
          productDetailRobot.getMaterialDetailsMaterialDescription();
      await productDetailRobot.tapBackButton();
      await productRobot.filterFavoritesInProductsScreen();
      productRobot.verifyProductFilter(nameProduct, matched: true);
      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyCheckboxCheckedShowProduct(
        'Favourites',
        true,
      );
    });

    testWidgets('EZRX-T61 | Verify favorite and unfavorite material',
        (tester) async {
      const index = 0;
      await pumpAppWithHomeScreen(tester);
      await productRobot.navigateToScreen(NavigationTab.products);

      await productRobot.setProductFavoriteStatus(index, true);
      await productRobot.tapFirstMaterial();
      productDetailRobot.verifyFavorite(true);
      await productDetailRobot.tapBackButton();
      await productRobot.setProductFavoriteStatus(index, false);
      await productRobot.tapFirstMaterial();
      productDetailRobot.verifyFavorite(false);
    });

    testWidgets('EZRX-T1266 | Verify click on Product with Combo offer',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //move to Combos
      homeRobot.findComboOffer();

      //tap on explore combo deal
      await homeRobot.tapExploreComboDeal();

      //navigate to material page
      productRobot.verifyPageVisible();

      //tap on first product
      await productRobot.tapFirstMaterial();
      await productDetailRobot.setProductToFavoriteList(true);
      final nameProduct =
          productDetailRobot.getMaterialDetailsMaterialDescription();
      await productDetailRobot.tapBackButton();
      await productRobot.filterFavoritesInProductsScreen();
      productRobot.verifyProductFilter(nameProduct, matched: true);
      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyCheckboxCheckedShowProduct(
        'Favourites',
        true,
      );
    });

    //TODO: will revisist later, once implementation work done

    // group('Announcement -', () {
    //   const validSearchKey = 'new';

    //   testWidgets('EZRX-T170 | Verify announcements page', (tester) async {
    //     await pumpAppWithHomeScreen(tester);
    //     await goToAnnouncementArticlePage();

    //     announcementArticleRootRobot.verifyTabBar();
    //     announcementArticleRootRobot.verifyAnnouncementPage();
    //     // announcementRobot.verifyFilterButton();
    //     announcementRobot.verifySearchBar();
    //     announcementRobot.verifySearchBarText('');
    //   });

    //   testWidgets('EZRX-T168 | Verify detail announcements', (tester) async {
    //     await pumpAppWithHomeScreen(tester);
    //     await goToAnnouncementArticlePage();

    //     await announcementRobot.searchWithKeyboardAction(validSearchKey);
    //     announcementRobot.verifyItemsWithKeyword(validSearchKey);
    //     await announcementRobot.tapFirstItem();
    //     announcementDetailRobot.verifyPage();
    //     announcementDetailRobot.verifyBackButton();
    //     announcementDetailRobot.verifyAnnouncementImage();
    //     announcementDetailRobot.verifyAnnouncementDate();
    //     announcementDetailRobot.verifyOtherAnnouncementSection();
    //   });

    //   testWidgets('EZRX-T172 | Verify search announcements invalid data',
    //       (tester) async {
    //     await pumpAppWithHomeScreen(tester);
    //     await goToAnnouncementArticlePage();

    //     announcementRobot.verifyItems();
    //     await announcementRobot.autoSearch(invalidLengthSearchKey);
    //     announcementRobot.verifyInvalidLengthSearchMessage(isVisible: false);
    //     announcementRobot.verifyLoadingImage(isVisible: false);
    //     await announcementRobot.searchWithSearchIcon(invalidLengthSearchKey);
    //     announcementRobot.verifyInvalidLengthSearchMessage(isVisible: true);
    //     await announcementRobot.dismissSnackbar();
    //     await announcementRobot.autoSearch(invalidSearchKey);
    //     announcementRobot.verifyNoRecordFound();
    //     await announcementRobot.tapClearSearch();
    //     announcementRobot.verifyItems();
    //   });

    //   testWidgets(
    //       'EZRX-T173 | Verify search announcements valid data - on done keyboard button',
    //       (tester) async {
    //     await pumpAppWithHomeScreen(tester);
    //     await goToAnnouncementArticlePage();

    //     await announcementRobot.searchWithKeyboardAction(validSearchKey);
    //     await announcementRobot.waitAutoSearchDuration();
    //     announcementRobot.verifyLoadingImage(isVisible: false);
    //     announcementRobot.verifyItemsWithKeyword(validSearchKey);
    //     await announcementRobot.pullToRefresh();
    //     announcementRobot.verifySearchBarText('');
    //   });

    //   testWidgets('EZRX-T174 | Verify Filter Announcements', (tester) async {
    //     //TODO: Revisit to implement test cases after the filter feature is implemented
    //   });

    //   testWidgets(
    //       'EZRX-T175 | Verify search any one item & Tap & Verify Detail page in details',
    //       (tester) async {
    //     await pumpAppWithHomeScreen(tester);
    //     await goToAnnouncementArticlePage();

    //     await announcementRobot.searchWithKeyboardAction(validSearchKey);
    //     announcementRobot.verifyItemsWithKeyword(validSearchKey);
    //     await announcementRobot.tapFirstItem();
    //     announcementArticleRootRobot.verifyAnnouncementPage(isVisible: false);
    //     announcementDetailRobot.verifyPage(isVisible: true);
    //     await announcementDetailRobot.tapBackButton();
    //     announcementDetailRobot.verifyPage(isVisible: false);
    //     announcementArticleRootRobot.verifyAnnouncementPage(isVisible: true);
    //   });

    //   testWidgets(
    //       'EZRX-T251 | Verify search announcements valid data - on search button',
    //       (tester) async {
    //     await pumpAppWithHomeScreen(tester);
    //     await goToAnnouncementArticlePage();

    //     await announcementRobot.searchWithKeyboardAction(validSearchKey);
    //     await announcementRobot.waitAutoSearchDuration();
    //     announcementRobot.verifyLoadingImage(isVisible: false);
    //     announcementRobot.verifyItemsWithKeyword(validSearchKey);
    //     await announcementRobot.pullToRefresh();
    //     announcementRobot.verifySearchBarText('');
    //   });
    // });
  });

  group('Product search -', () {
    testWidgets(
        'EZRX-T31 | Verify search by material number/material description (happy/unhappy case)',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifySearchBarVisible();
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(materialName);
      productSuggestionRobot.verifySuggestProductsSearch(materialName);
      await productSuggestionRobot.autoSearch(materialName);
      productSuggestionRobot.verifySuggestProductsSearch(materialName);

      await productSuggestionRobot
          .searchWithKeyboardAction(invalidLengthSearchKey);
      await productSuggestionRobot
          .verifyAndDismissInvalidLengthSearchMessageSnackbar();
      await productSuggestionRobot.dismissSnackbar();
      await productSuggestionRobot.searchWithKeyboardAction(invalidSearchKey);
      productSuggestionRobot.verifyNoSuggestedProduct();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      productSuggestionRobot.verifySuggestProductsSearch(materialName);

      await productSuggestionRobot.autoSearch(materialName);
      productSuggestionRobot.verifySuggestProductsSearch(materialName);
      await productSuggestionRobot.autoSearch(invalidSearchKey);
      productSuggestionRobot.verifyNoSuggestedProduct();
      productSuggestionRobot.verifyNoRecordFound();
      await productSuggestionRobot.tapClearSearch();
      productSuggestionRobot.verifyNoRecordFound(isVisible: false);
    });

    testWidgets('EZRX-T32 | Verify search and navigate to material detail',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifySearchBarVisible();
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productSuggestionRobot.tapSearchResult(materialNumber);
      productDetailRobot.verifyPage();
    });

    testWidgets('EZRX-T34 | Verify Save search history + clear search history',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifySearchBarVisible();
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productSuggestionRobot.tapToBackScreen();
      await productRobot.openSearchProductScreen();
      productSuggestionRobot.verifySearchHistory();
      productSuggestionRobot.verifySearchHistoryItem(materialNumber);

      await productSuggestionRobot.tapSearchHistoryItem(materialNumber);
      productSuggestionRobot.verifySearchBarText(materialNumber);
      productSuggestionRobot.verifySearchHistory(isVisible: false);
      await productSuggestionRobot.tapClearSearch();
      productSuggestionRobot.verifySearchHistory();
      productSuggestionRobot.verifySearchHistoryItem(materialNumber);

      await productSuggestionRobot.tapDeleteSearchHistory();
      productSuggestionRobot.verifyClearHistoryBottomSheet();
      await productSuggestionRobot.tapConfirmClearHistory();
      productSuggestionRobot.verifyClearHistoryBottomSheet(isVisible: false);
      productSuggestionRobot.verifySearchHistory(isVisible: false);
      productSuggestionRobot.verifyNoSearchHistory();
    });
  });

  group('Material detail -', () {
    const comboMaterialNumber = '23340296';

    testWidgets('EZRX-T62 | Verify material detail with basic information',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productSuggestionRobot.tapSearchResult(materialNumber);
      productDetailRobot.verifyProductImageDisplayed();
      productDetailRobot.verifyProductFavoriteIconDisplayed();
      productDetailRobot.verifyProductNameDisplayed();
      productDetailRobot.verifyExpiryDate(
        materialExpiryDate,
      );
      await productDetailRobot.tapExpiryDateInfoIcon();
      await commonRobot.verifyExpiryDateBottomSheetAndTapClose();
      productDetailRobot.verifyProductPriceDisplayed();
      productDetailRobot.verifyMaterialDetailsInfoTileDisplayed();
      productDetailRobot.verifyProductDetailsQuantityInputPriceDisplayed();
      productDetailRobot.verifyCartButtonDisplayed();
      productDetailRobot.verifyAddToCartCartButtonDisplayed();
      await productDetailRobot.openMaterialInformation();
      productDetailRobot.verifyMateriaNumberDisplayed(materialNumber);
      productDetailRobot.verifyManufacturerDisplayed(materialPrincipalName);
      productDetailRobot
          .verifyUnitOfMeasurementLabelDisplayed(materialUnitMeasurement);
      productDetailRobot
          .verifyCountryOfOriginLabelDisplayed(materialCountryOfOrigin);
      productDetailRobot.verifyBatchDisplayed(
        isVisible: false,
      );
      productDetailRobot.verifyExpiryDateLabelDisplayed(
        value: materialExpiryDate,
      );
    });

    testWidgets('EZRX-T64 | Verify display image when having multiple images',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productRobot.searchWithKeyboardAction(multiImageMaterialNumber);
      await productSuggestionRobot.tapSearchResult(multiImageMaterialNumber);
      final havingMultipleImage =
          await productDetailRobot.verifyMultipleImages();
      if (havingMultipleImage) {
        productDetailRobot.verifyImageMaterialSelected(0, true);
        productDetailRobot.verifyImageMaterialSelected(1, false);
        await productDetailRobot.tapToImageMaterial(1, false);
        productDetailRobot.verifyImageMaterialSelected(1, true);
      }
    });

    testWidgets('EZRX-T65 | Verify available offers in the material detail',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productRobot.searchWithKeyboardAction(bonusMaterialNumber);
      await productSuggestionRobot.tapSearchResult(bonusMaterialNumber);
      final productName =
          productDetailRobot.getMaterialDetailsMaterialDescription();
      productDetailRobot.verifyOnOfferLabel();
      await productDetailRobot.openAvailableOffers();
      productDetailRobot.verifyNameProductOffer(productName);
      productDetailRobot.verifyCodeProductOffer(bonusMaterialNumber);
      productDetailRobot.verifyQuantityProductDisplayed();
      productDetailRobot.verifyOfferBottomSheetCloseButton();
    });

    testWidgets('EZRX-T66 | Verify Related products in the material detail',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productSuggestionRobot.tapSearchResult(materialNumber);
      await productDetailRobot.verifyRelateProductDisplayed();
      await productDetailRobot.tapFirstRelateProduct();
      productDetailRobot.verifyPage();
      await productDetailRobot.tapBackButton();
      productDetailRobot.verifyPage();
    });

    //TODO(Hob): Find data for this test case later on KH

    // testWidgets('EZRX-T67 | Verify other information in material detail',
    //     (tester) async {
    //   await pumpAppWithHomeScreen(tester);

    //   await productRobot.navigateToScreen(NavigationTab.products);
    //   await productRobot.openSearchProductScreen();
    //   await productSuggestionRobot
    //       .searchWithKeyboardAction(otherInfoMaterialNumber);
    //   await productSuggestionRobot.tapSearchResult(otherInfoMaterialNumber);
    //   await productDetailRobot.tapToSeeMore();
    //   productDetailRobot.verifyMaterialDosageDisplayed();
    //   productDetailRobot.verifyMaterialHowToUseDisplayed();
    //   productDetailRobot.verifyMaterialDeliveryInstructionsDisplayed();
    //   productDetailRobot.verifyMaterialCompositionDisplayed();
    // });

    testWidgets('EZRX-T68 | Verify add and navigate to cart in material detail',
        (tester) async {
      const maximumQty = 99999;
      await pumpAppWithHomeScreen(tester);

      await browseProductFromEmptyCart();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productSuggestionRobot.tapSearchResult(materialNumber);
      await productDetailRobot.tapAddToCart();
      productDetailRobot.verifyCartButtonQty(1);
      productDetailRobot.verifyAddToCartSuccessMessage();
      await productDetailRobot.dismissSnackbar();
      await productDetailRobot.tapCartButton();
      cartRobot.verifyPage();
      await cartRobot.tapCloseButton();
      await productDetailRobot.changeQty(maximumQty);
      await productDetailRobot.tapAddToCart();
      productDetailRobot.verifyAddToCartFailureMessage();
    });

    testWidgets('EZRX-T68 | Verify suspended banner ', (tester) async {
      await pumpAppWithHomeScreen(tester);

      await browseProductFromEmptyCart();
      await productSuggestionRobot
          .searchWithKeyboardAction(suspendedMaterialNumber);
      await productSuggestionRobot.tapSearchResult(suspendedMaterialNumber);
      productDetailRobot.verifySuspendedBanner();
      await productDetailRobot.tapAddToCart();
      productDetailRobot.verifyAddToCartSuccessMessage(isVisible: false);
      productDetailRobot.verifyCartButtonQty(0);
      await productDetailRobot.tapCartButton();
      cartRobot.verifyPage();
      cartRobot.verifyNoRecordFound();
    });

    testWidgets('EZRX-T215 | Verify favorite in material detail',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyMaterial();
      await productRobot.tapFirstMaterial();
      var materialName =
          productDetailRobot.getMaterialDetailsMaterialDescription();
      await productDetailRobot.setProductToFavoriteList(true);
      await productDetailRobot.tapBackButton();
      await productRobot.filterFavoritesInProductsScreen();
      productRobot.verifyProductFilter(materialName, matched: true);

      await productRobot.filterFavoritesInProductsScreen();
      await productRobot.tapFirstMaterial();
      materialName = productDetailRobot.getMaterialDetailsMaterialDescription();
      await productDetailRobot.setProductToFavoriteList(false);
      await productDetailRobot.tapBackButton();
      await productRobot.filterFavoritesInProductsScreen();
      productRobot.verifyProductFilter(materialName, matched: false);
    });

    testWidgets('EZRX-T1287 | Verify Combo offers in the product detail page',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productRobot.searchWithKeyboardAction(comboMaterialNumber);
      await productSuggestionRobot.tapSearchResult(comboMaterialNumber);
      productDetailRobot.verifyComboOfferLabel();
      await productDetailRobot.verifyAndTapGetComboDeal();
      comboDetailRobot.verifyPage();
    });
  });

  group('Profile -', () {
    void verifyAllComponentsVisible() {
      profileRobot.verifyAccountAndBusinessDetailsVisible(
        firstName: 'KHClientUser',
        lastName: 'User67',
        email: 'jhchoo@zuelligpharma.com',
        username: username,
        mobilePhone: 'NA',
        language: 'English',
      );
      profileRobot.verifyLicenseListVisible();
      profileRobot.verifyButtonsDisabled();
    }

    testWidgets('EZRX-T176 | Verify Profile Page', (tester) async {
      //navigate to page
      await pumpAppWithHomeScreen(tester);
      await commonRobot.navigateToScreen(NavigationTab.more);
      await moreRobot.tapProfileTile();

      //verify
      profileRobot.verifyPageVisible();
      verifyAllComponentsVisible();
    });

    testWidgets('EZRX-T177 | Verify Refresh Profile Page', (tester) async {
      //navigate to page
      await pumpAppWithHomeScreen(tester);
      await commonRobot.navigateToScreen(NavigationTab.more);
      await moreRobot.tapProfileTile();

      //verify
      profileRobot.verifyPageVisible();
      verifyAllComponentsVisible();
      await commonRobot.pullToRefresh();
      verifyAllComponentsVisible();
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
  });

  group('Contact us -', () {
    const phoneNumber = '0981234567';
    const userNameInitValue = 'KHClientUser User67';
    const emailInitValue = 'jhchoo@zuelligpharma.com';

    Future<void> goToContactUs() async {
      await commonRobot.navigateToScreen(NavigationTab.more);
      await moreRobot.tapContactUsTile();
    }

    testWidgets('EZRX-T201 | Verify page contact us is displayed',
        (tester) async {
      await pumpAppWithHomeScreen(tester);
      await goToContactUs();

      contactUsRobot.verifyContactDetailHtml();
      contactUsRobot.verifyAllFieldVisible();
      contactUsRobot.verifyInitValueField(
        userName: userNameInitValue,
        email: emailInitValue,
      );
    });

    testWidgets('EZRX-T202 | Verify send message successful', (tester) async {
      await pumpAppWithHomeScreen(tester);
      await goToContactUs();

      await contactUsRobot.enterPhoneNumberField(phoneNumber);
      await contactUsRobot.enterMessageField(phoneNumber);
      await contactUsRobot.tapToSendMessage();
      contactUsRobot.verifyContactUsSuccessMessage();
    });

    testWidgets('EZRX-T203 | Verify send message without Your Name',
        (tester) async {
      await pumpAppWithHomeScreen(tester);
      await goToContactUs();

      await contactUsRobot.enterUserNameField('');
      await contactUsRobot.tapToSendMessage();
      contactUsRobot.verifyUserNameRequireErrorMsg();
    });

    testWidgets('EZRX-T204 | Verify send message without Contact Number',
        (tester) async {
      await pumpAppWithHomeScreen(tester);
      await goToContactUs();

      await contactUsRobot.tapToSendMessage();
      contactUsRobot.verifyPhoneNumberInValidErrorMsg();
    });

    testWidgets('EZRX-T205 | Verify send message without E-mail',
        (tester) async {
      await pumpAppWithHomeScreen(tester);
      await goToContactUs();

      await contactUsRobot.enterEmailField('');
      await contactUsRobot.tapToSendMessage();
      contactUsRobot.verifyEmailRequireErrorMsg();
    });

    testWidgets('EZRX-T206 | Verify send message without Message',
        (tester) async {
      await pumpAppWithHomeScreen(tester);
      await goToContactUs();

      await contactUsRobot.enterMessageField('');
      await contactUsRobot.tapToSendMessage();
      contactUsRobot.verifyMessageFieldRequireErrorMsg();
    });

    testWidgets('EZRX-T207 | Verify send message with email invalid',
        (tester) async {
      await pumpAppWithHomeScreen(tester);
      await goToContactUs();

      await contactUsRobot.enterEmailField('integrationTest@mail');
      await contactUsRobot.tapToSendMessage();
      contactUsRobot.verifyEmailInValidErrorMsg();
    });
  });

  group('Security -', () {
    Future<void> goToSecurityPage() async {
      await commonRobot.navigateToScreen(NavigationTab.more);
      await moreRobot.tapSecurityTile();
    }

    testWidgets(
        'EZRX-T240 | Verify Security(Change Password) page - all initial fields',
        (tester) async {
      await pumpAppWithHomeScreen(tester);
      await goToSecurityPage();

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
      await pumpAppWithHomeScreen(tester);
      await goToSecurityPage();

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
      await pumpAppWithHomeScreen(tester);
      await goToSecurityPage();

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
      await pumpAppWithHomeScreen(tester);
      await goToSecurityPage();

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
      await pumpAppWithHomeScreen(tester);
      await goToSecurityPage();

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
  });

  group('Announcement & Article -', () {
    Future<void> goToAnnouncementArticlePage() async {
      await commonRobot.navigateToScreen(NavigationTab.more);
      await moreRobot.tapAnnouncementArticleTile();
    }

    group('Article -', () {
      Future<void> goToArticlePage() async {
        announcementArticleRootRobot.verifyAnnouncementPage();
        await announcementArticleRootRobot.switchToArticleTab();
      }

      testWidgets('EZRX-T160 | Verify articles page', (tester) async {
        await pumpAppWithHomeScreen(tester);
        await goToAnnouncementArticlePage();

        announcementArticleRootRobot.verifyAnnouncementPage();
        announcementArticleRootRobot.verifyTabBar();
        await goToArticlePage();
        articleRobot.verifySearchBar();
        articleRobot.verifyFilterIcon();
        articleRobot.verifyArticleItemsVisible();
      });

      testWidgets('EZRX-T163 | Verify detail articles', (tester) async {
        await pumpAppWithHomeScreen(tester);
        await goToAnnouncementArticlePage();
        await goToArticlePage();

        articleRobot.verifySearchBar();
        await commonRobot.searchWithSearchIcon(articleRobot.getFirstTitle());
        await articleRobot.tapArticleItem();
        articleDetailsRobot.verifyArticleDetailsPage();
        await articleDetailsRobot.tapArticleDetailsBackButton();
        announcementArticleRootRobot.verifyArticlesPage();
      });

      testWidgets('EZRX-T165 | Verify search articles invalid data',
          (tester) async {
        await pumpAppWithHomeScreen(tester);
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
        await pumpAppWithHomeScreen(tester);
        await goToAnnouncementArticlePage();
        await goToArticlePage();

        final validSearchKey = articleRobot.getFirstTitle();
        await commonRobot.searchWithKeyboardAction(validSearchKey);
        articleRobot.verifyArticleItemsVisible();
        articleRobot.verifyArticleItemWithSearchKey(searchKey: validSearchKey);
      });

      testWidgets(
          'EZRX-T252 | Verify search Article valid data - on search icon button',
          (tester) async {
        await pumpAppWithHomeScreen(tester);
        await goToAnnouncementArticlePage();
        await goToArticlePage();

        final validSearchKey = articleRobot.getFirstTitle();
        articleRobot.verifyArticleItemsVisible();
        await commonRobot.searchWithSearchIcon(validSearchKey);
        articleRobot.verifyArticleItemsVisible();
        articleRobot.verifyArticleItemWithSearchKey(searchKey: validSearchKey);
      });

      testWidgets(
          'EZRX-T171 | Verify search any one item & Tap & Verify Detail page in details',
          (tester) async {
        await pumpAppWithHomeScreen(tester);
        await goToAnnouncementArticlePage();
        await goToArticlePage();

        articleRobot.verifyArticleItemsVisible();
        await commonRobot.searchWithSearchIcon(articleRobot.getFirstTitle());
        articleRobot.verifyArticleItemsVisible();
        await articleRobot.tapArticleItem();
        articleDetailsRobot.verifyArticleDetailsPage();
      });
    });

    //TODO: will revisist later, once implementation work done

    // group('Announcement -', () {
    //   const validSearchKey = 'new';

    //   testWidgets('EZRX-T170 | Verify announcements page', (tester) async {
    //     await pumpAppWithHomeScreen(tester);
    //     await goToAnnouncementArticlePage();

    //     announcementArticleRootRobot.verifyTabBar();
    //     announcementArticleRootRobot.verifyAnnouncementPage();
    //     // announcementRobot.verifyFilterButton();
    //     announcementRobot.verifySearchBar();
    //     announcementRobot.verifySearchBarText('');
    //   });

    //   testWidgets('EZRX-T168 | Verify detail announcements', (tester) async {
    //     await pumpAppWithHomeScreen(tester);
    //     await goToAnnouncementArticlePage();

    //     await announcementRobot.searchWithKeyboardAction(validSearchKey);
    //     announcementRobot.verifyItemsWithKeyword(validSearchKey);
    //     await announcementRobot.tapFirstItem();
    //     announcementDetailRobot.verifyPage();
    //     announcementDetailRobot.verifyBackButton();
    //     announcementDetailRobot.verifyAnnouncementImage();
    //     announcementDetailRobot.verifyAnnouncementDate();
    //     announcementDetailRobot.verifyOtherAnnouncementSection();
    //   });

    //   testWidgets('EZRX-T172 | Verify search announcements invalid data',
    //       (tester) async {
    //     await pumpAppWithHomeScreen(tester);
    //     await goToAnnouncementArticlePage();

    //     announcementRobot.verifyItems();
    //     await announcementRobot.autoSearch(invalidLengthSearchKey);
    //     announcementRobot.verifyInvalidLengthSearchMessage(isVisible: false);
    //     announcementRobot.verifyLoadingImage(isVisible: false);
    //     await announcementRobot.searchWithSearchIcon(invalidLengthSearchKey);
    //     announcementRobot.verifyInvalidLengthSearchMessage(isVisible: true);
    //     await announcementRobot.dismissSnackbar();
    //     await announcementRobot.autoSearch(invalidSearchKey);
    //     announcementRobot.verifyNoRecordFound();
    //     await announcementRobot.tapClearSearch();
    //     announcementRobot.verifyItems();
    //   });

    //   testWidgets(
    //       'EZRX-T173 | Verify search announcements valid data - on done keyboard button',
    //       (tester) async {
    //     await pumpAppWithHomeScreen(tester);
    //     await goToAnnouncementArticlePage();

    //     await announcementRobot.searchWithKeyboardAction(validSearchKey);
    //     await announcementRobot.waitAutoSearchDuration();
    //     announcementRobot.verifyLoadingImage(isVisible: false);
    //     announcementRobot.verifyItemsWithKeyword(validSearchKey);
    //     await announcementRobot.pullToRefresh();
    //     announcementRobot.verifySearchBarText('');
    //   });

    //   testWidgets('EZRX-T174 | Verify Filter Announcements', (tester) async {
    //     //TODO: Revisit to implement test cases after the filter feature is implemented
    //   });

    //   testWidgets(
    //       'EZRX-T175 | Verify search any one item & Tap & Verify Detail page in details',
    //       (tester) async {
    //     await pumpAppWithHomeScreen(tester);
    //     await goToAnnouncementArticlePage();

    //     await announcementRobot.searchWithKeyboardAction(validSearchKey);
    //     announcementRobot.verifyItemsWithKeyword(validSearchKey);
    //     await announcementRobot.tapFirstItem();
    //     announcementArticleRootRobot.verifyAnnouncementPage(isVisible: false);
    //     announcementDetailRobot.verifyPage(isVisible: true);
    //     await announcementDetailRobot.tapBackButton();
    //     announcementDetailRobot.verifyPage(isVisible: false);
    //     announcementArticleRootRobot.verifyAnnouncementPage(isVisible: true);
    //   });

    //   testWidgets(
    //       'EZRX-T251 | Verify search announcements valid data - on search button',
    //       (tester) async {
    //     await pumpAppWithHomeScreen(tester);
    //     await goToAnnouncementArticlePage();

    //     await announcementRobot.searchWithKeyboardAction(validSearchKey);
    //     await announcementRobot.waitAutoSearchDuration();
    //     announcementRobot.verifyLoadingImage(isVisible: false);
    //     announcementRobot.verifyItemsWithKeyword(validSearchKey);
    //     await announcementRobot.pullToRefresh();
    //     announcementRobot.verifySearchBarText('');
    //   });
    // });
  });

  group('Combo detail -', () {
    const comboMaterialNumber = '21223399';

    Future<void> openAndVerifyComboDetail(
      WidgetTester tester, {
      required String materialNumber,
      String? otherShipToCode,
    }) async {
      await pumpAppWithHomeScreen(
        tester,
        shipToCode: otherShipToCode ?? shipToCode,
      );

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productRobot.searchWithKeyboardAction(materialNumber);
      await productSuggestionRobot.tapSearchResult(materialNumber);
      productDetailRobot.verifyComboOfferLabel();
      await productDetailRobot.verifyAndTapGetComboDeal();
      comboDetailRobot.verifyPage();

      comboDetailRobot.verifyComboDetailInformation();
      comboDetailRobot.verifySearchBar();
    }

    testWidgets(
        'EZRX-T1395 | Verify Search Product by inputting keyword contains Product name Combo Detail',
        (tester) async {
      await openAndVerifyComboDetail(
        tester,
        materialNumber: comboMaterialNumber,
      );

      await comboDetailRobot
          .searchWithKeyboardAction(searchKeywordMaterialName);
      comboDetailRobot
          .verifySuggestProductsSearchByName(searchKeywordMaterialName);
    });

    testWidgets(
        'EZRX-T1396 | Verify Search Product by inputting keyword contains Product code Combo Detail',
        (tester) async {
      await openAndVerifyComboDetail(
        tester,
        materialNumber: comboMaterialNumber,
      );

      await comboDetailRobot
          .searchWithKeyboardAction(searchKeywordMaterialCode);
      comboDetailRobot
          .verifySuggestProductsSearchByCode(searchKeywordMaterialCode);
    });

    testWidgets(
        'EZRX-T1397 | Verify Search Product by inputting keyword not contain Product name/code Combo Detail',
        (tester) async {
      await openAndVerifyComboDetail(
        tester,
        materialNumber: comboMaterialNumber,
      );

      await comboDetailRobot
          .searchWithKeyboardAction(searchKeywordMaterialCodeNotValid);
      comboDetailRobot
          .verifySuggestProductsSearchByCode(searchKeywordMaterialCodeNotValid);
    });

    testWidgets(
        'EZRX-T1676 | Verify action click on decrease quantity cannot smaller than min quantity',
        (tester) async {
      await openAndVerifyComboDetail(
        tester,
        materialNumber: comboMaterialNumber,
      );

      await comboDetailRobot.decreaseMaterialQuantity(
        materialNumber: comboMaterialNumber,
        currentQuantity: 5,
        enableDecreaseButton: false,
      );

      await comboDetailRobot.increaseMaterialQuantity(
        materialNumber: comboMaterialNumber,
        currentQuantity: 5,
      );

      await comboDetailRobot.decreaseMaterialQuantity(
        materialNumber: comboMaterialNumber,
        currentQuantity: 6,
      );

      await comboDetailRobot.decreaseMaterialQuantity(
        materialNumber: comboMaterialNumber,
        currentQuantity: 5,
        enableDecreaseButton: false,
      );
    });

    group('K1', () {
      // K1
      const comboK1MaterialNumber = '21223399';
      const comboK1MaterialExpiryDate = '01 May 2030';
      const comboK1FixedMaterialName = 'DALACIN T SOL. 1% solu 1% 10ml 10X1';
      const comboK1FixedMaterialPrincipalName = 'Pfizer Global Trading (VC)';

      testWidgets('EZRX-T1289 | Verify Combo K1 via Product detail',
          (tester) async {
        await openAndVerifyComboDetail(
          tester,
          materialNumber: comboK1MaterialNumber,
        );

        await comboDetailRobot.verifyComboMaterialInformation(
          materialNumberMatNo: comboK1MaterialNumber,
          expiryDate: comboK1MaterialExpiryDate,
          materialName: comboK1FixedMaterialName,
          materialManufacturer: comboK1FixedMaterialPrincipalName,
        );

        comboDetailRobot.verifyComboK1Displayed();
      });

      testWidgets('EZRX-T1391 | Verify Combo Deal Eligible on Combo K1',
          (tester) async {
        await openAndVerifyComboDetail(
          tester,
          materialNumber: comboK1MaterialNumber,
        );

        await comboDetailRobot
            .verifyOnSelectK1ComboMaterial(comboK1MaterialNumber);
        comboDetailRobot.verifyAddToCartButtonEnableDisplayed();
      });
    });

    group('K2.1', () {
      // K2.1
      const comboK21FixedMaterialNumber = '21223394';
      const comboK21FixedMaterialName = "ALDACTONE 25MG 10x10 10x10' 25mg 10";
      const comboK21FixedMaterialPrincipalName = 'Pfizer Global Trading (VC)';
      const comboK21FixedMaterialExpiryDate = '28 Jun 2030';

      const comboK21OptionalMaterialNumber = '21223409';
      const comboK21OptionalMaterialName =
          'NEURONTIN CAP 300 MG Capsul 300mg 3';
      const comboK21OptionalMaterialPrincipalName =
          'Pfizer Global Trading (VC)';
      const comboK21OptionalMaterialExpiryDate = '31 Oct 2030';

      testWidgets('EZRX-T1380 | Verify Combo K2.1 via Product detail',
          (tester) async {
        await openAndVerifyComboDetail(
          tester,
          materialNumber: comboK21FixedMaterialNumber,
        );

        comboDetailRobot.verifyCartButtonDisplayed();

        await comboDetailRobot.verifyComboMaterialInformation(
          materialNumberMatNo: comboK21FixedMaterialNumber,
          expiryDate: comboK21FixedMaterialExpiryDate,
          materialName: comboK21FixedMaterialName,
          materialManufacturer: comboK21FixedMaterialPrincipalName,
        );
        comboDetailRobot.verifyComboK21Displayed();

        await comboDetailRobot.verifyComboMaterialInformation(
          materialNumberMatNo: comboK21OptionalMaterialNumber,
          expiryDate: comboK21OptionalMaterialExpiryDate,
          materialName: comboK21OptionalMaterialName,
          materialManufacturer: comboK21OptionalMaterialPrincipalName,
        );
      });

      testWidgets('EZRX-T1393 | Verify Combo Deal Eligible on Combo K2.1',
          (tester) async {
        await openAndVerifyComboDetail(
          tester,
          materialNumber: comboK21FixedMaterialNumber,
        );

        await comboDetailRobot
            .verifyOnSelectFixedComboMaterial(comboK21FixedMaterialNumber);
        await comboDetailRobot.verifyOnSelectOptionalComboMaterial(
          comboK21OptionalMaterialNumber,
        );
        comboDetailRobot.verifyAddToCartButtonEnableDisplayed();
      });
    });

    group('K2.2', () {
      // K2.2
      const comboK22MaterialNumber = '23340300';
      const comboK22MaterialName = 'SAFORELLE SA   250ml';
      const comboK22MaterialPrincipalName = 'DEPOMEX CO.,LTD';
      const comboK22MaterialExpiryDate = '22 Aug 2026';
      const minQty = 2;

      testWidgets('EZRX-T1715 | Verify Combo K2.2 via Product detail',
          (tester) async {
        await openAndVerifyComboDetail(
          tester,
          materialNumber: comboK22MaterialNumber,
        );

        comboDetailRobot.verifyCartButtonDisplayed();

        await comboDetailRobot.verifyComboMaterialInformation(
          materialNumberMatNo: comboK22MaterialNumber,
          expiryDate: comboK22MaterialExpiryDate,
          materialName: comboK22MaterialName,
          materialManufacturer: comboK22MaterialPrincipalName,
        );
        comboDetailRobot.verifyComboK22Displayed(minQty: minQty.toString());
      });

      testWidgets('EZRX-T1716 | Verify Combo Best Deal Eligible on Combo K2.2',
          (tester) async {
        await openAndVerifyComboDetail(
          tester,
          materialNumber: comboK22MaterialNumber,
        );

        await comboDetailRobot
            .verifyOnSelectOptionalComboMaterial(comboK22MaterialNumber);
        comboDetailRobot.verifyAddToCartButtonDisableDisplayed();

        await comboDetailRobot.changeMaterialQuantity(
          materialNumber: comboK22MaterialNumber,
          quantity: minQty,
        );
        comboDetailRobot.verifyAddToCartButtonEnableDisplayed();
        comboDetailRobot.verifyBestDealDisplay();
      });
    });

    group('K3', () {
      // K3
      const comboK3MaterialNumberFirstItem = '23340227';
      const comboK3MaterialName = 'KINAL GEL 500MG/50MG BT 10x10';
      const comboK3MaterialPrincipalName = 'PharmaProduct Manufacturing';
      const comboK3MaterialExpiryDate = '24 May 2030';

      const comboK3MaterialNumberSecondItem = '23340216';
      const comboK3MaterialNumberThirdItem = '23340114';
      const comboK3MaterialNumberFourItem = '23340187';

      const nextDealDiscount = '13';
      const nextDealUnit = '1';

      testWidgets('EZRX-T1381 | Verify Combo K3 via Product detail',
          (tester) async {
        await openAndVerifyComboDetail(
          tester,
          materialNumber: comboK3MaterialNumberFirstItem,
        );

        comboDetailRobot.verifyCartButtonDisplayed();

        await comboDetailRobot.verifyComboMaterialInformation(
          materialNumberMatNo: comboK3MaterialNumberFirstItem,
          expiryDate: comboK3MaterialExpiryDate,
          materialName: comboK3MaterialName,
          materialManufacturer: comboK3MaterialPrincipalName,
        );
        comboDetailRobot.verifyComboK3Displayed();
      });

      testWidgets('EZRX-T1394 | Verify Combo Next Deal Eligible on Combo K3',
          (tester) async {
        await openAndVerifyComboDetail(
          tester,
          materialNumber: comboK3MaterialNumberFirstItem,
        );

        await comboDetailRobot.verifyOnSelectOptionalComboMaterial(
          comboK3MaterialNumberFirstItem,
        );
        comboDetailRobot.verifyAddToCartButtonDisableDisplayed();
        await comboDetailRobot.verifyOnSelectOptionalComboMaterial(
          comboK3MaterialNumberSecondItem,
        );
        comboDetailRobot.verifyAddToCartButtonEnableDisplayed();
        comboDetailRobot.verifyNextDealDisplay(
          scheme: ComboDealScheme.k3,
          unit: nextDealUnit,
          discount: nextDealDiscount,
        );
      });

      testWidgets('EZRX-T1394 | Verify Combo Best Deal Eligible on Combo K3',
          (tester) async {
        await openAndVerifyComboDetail(
          tester,
          materialNumber: comboK3MaterialNumberFirstItem,
        );

        await comboDetailRobot.verifyOnSelectOptionalComboMaterial(
          comboK3MaterialNumberFirstItem,
        );
        comboDetailRobot.verifyAddToCartButtonDisableDisplayed();
        await comboDetailRobot.verifyOnSelectOptionalComboMaterial(
          comboK3MaterialNumberSecondItem,
        );
        comboDetailRobot.verifyNextDealDisplay(
          scheme: ComboDealScheme.k3,
          unit: nextDealUnit,
          discount: nextDealDiscount,
        );

        comboDetailRobot.verifyAddToCartButtonEnableDisplayed();
        await comboDetailRobot.verifyOnSelectOptionalComboMaterial(
          comboK3MaterialNumberThirdItem,
        );
        await comboDetailRobot.verifyOnSelectOptionalComboMaterial(
          comboK3MaterialNumberFourItem,
        );
        comboDetailRobot.verifyBestDealDisplay();
      });
    });

    group('K4.1', () {
      // K4.1
      const comboK41MaterialNumber = '21130719';
      const comboK41MaterialName = 'DUPHASTON TAB';
      const comboK41MaterialPrincipalName = 'Abbott Products Operations A.G';
      const comboK41MaterialExpiryDate = '27 Apr 2050';
      const minQty = 5;
      const bestDealQuantity = 20;

      const nextDealUnit = bestDealQuantity - minQty;

      const nextDealDiscount = '10';

      testWidgets('EZRX-T1718 | Verify Combo K4.1 via Product detail',
          (tester) async {
        await openAndVerifyComboDetail(
          tester,
          materialNumber: comboK41MaterialNumber,
        );

        comboDetailRobot.verifyCartButtonDisplayed();

        await comboDetailRobot.verifyComboMaterialInformation(
          materialNumberMatNo: comboK41MaterialNumber,
          expiryDate: comboK41MaterialExpiryDate,
          materialName: comboK41MaterialName,
          materialManufacturer: comboK41MaterialPrincipalName,
        );
        comboDetailRobot.verifyComboK41Displayed(minQty: minQty.toString());
      });

      testWidgets('EZRX-T1750 | Verify Combo Next Deal Eligible on Combo K4.1',
          (tester) async {
        await openAndVerifyComboDetail(
          tester,
          materialNumber: comboK41MaterialNumber,
        );

        await comboDetailRobot
            .verifyOnSelectOptionalComboMaterial(comboK41MaterialNumber);
        await comboDetailRobot.changeMaterialQuantity(
          materialNumber: comboK41MaterialNumber,
          quantity: 2,
        );
        comboDetailRobot.verifyAddToCartButtonDisableDisplayed();
        await comboDetailRobot.changeMaterialQuantity(
          materialNumber: comboK41MaterialNumber,
          quantity: minQty,
        );
        comboDetailRobot.verifyAddToCartButtonEnableDisplayed();
        comboDetailRobot.verifyNextDealDisplay(
          scheme: ComboDealScheme.k4,
          unit: nextDealUnit.toString(),
          discount: nextDealDiscount,
        );
      });

      testWidgets('EZRX-T1719 | Verify Combo Best Deal Eligible on Combo K4.1',
          (tester) async {
        await openAndVerifyComboDetail(
          tester,
          materialNumber: comboK41MaterialNumber,
        );

        await comboDetailRobot
            .verifyOnSelectOptionalComboMaterial(comboK41MaterialNumber);
        await comboDetailRobot.changeMaterialQuantity(
          materialNumber: comboK41MaterialNumber,
          quantity: 2,
        );
        comboDetailRobot.verifyAddToCartButtonDisableDisplayed();
        await comboDetailRobot.changeMaterialQuantity(
          materialNumber: comboK41MaterialNumber,
          quantity: minQty,
        );
        comboDetailRobot.verifyAddToCartButtonEnableDisplayed();
        comboDetailRobot.verifyNextDealDisplay(
          scheme: ComboDealScheme.k4,
          unit: nextDealUnit.toString(),
          discount: nextDealDiscount,
        );
        await comboDetailRobot.changeMaterialQuantity(
          materialNumber: comboK41MaterialNumber,
          quantity: bestDealQuantity,
        );
        comboDetailRobot.verifyBestDealDisplay();
      });
    });

    group('K4.2', () {
      // K4.2
      const comboK42MaterialNumber = '21223395';
      const comboK42MaterialName = "CARDURA 2MG 10X10'S Tablet 2mg 10X1";
      const comboK42MaterialPrincipalName = 'Pfizer Global Trading (VC)';
      const comboK42MaterialExpiryDate = 'NA';

      const nextDealMinQty = 50;
      const bestDealMinQty = 100;

      //TODO: Remove this shipto code when test data provided for K4.2 and K5
      const otherShipToCode = '0071262518';

      testWidgets('EZRX-T1386 | Verify Combo K4.2 via Product detail',
          (tester) async {
        await openAndVerifyComboDetail(
          tester,
          materialNumber: comboK42MaterialNumber,
          otherShipToCode: otherShipToCode,
        );

        comboDetailRobot.verifyCartButtonDisplayed();

        await comboDetailRobot.verifyComboMaterialInformation(
          materialNumberMatNo: comboK42MaterialNumber,
          expiryDate: comboK42MaterialExpiryDate,
          materialName: comboK42MaterialName,
          materialManufacturer: comboK42MaterialPrincipalName,
        );
        comboDetailRobot.verifyComboK42Displayed();
      });

      testWidgets('EZRX-T1398 | Verify Combo Next Deal Eligible on Combo K4.2',
          (tester) async {
        await openAndVerifyComboDetail(
          tester,
          materialNumber: comboK42MaterialNumber,
          otherShipToCode: otherShipToCode,
        );

        await comboDetailRobot
            .verifyOnSelectOptionalComboMaterial(comboK42MaterialNumber);
        await comboDetailRobot.changeMaterialQuantity(
          materialNumber: comboK42MaterialNumber,
          quantity: 2,
        );
        comboDetailRobot.verifyAddToCartButtonDisableDisplayed();
        await comboDetailRobot.changeMaterialQuantity(
          materialNumber: comboK42MaterialNumber,
          quantity: nextDealMinQty,
        );
        comboDetailRobot.verifyAddToCartButtonEnableDisplayed();
        comboDetailRobot.verifyNextDealDisplay(
          scheme: ComboDealScheme.k42,
          unit: nextDealMinQty.toString(),
          discount: '',
        );
      });

      testWidgets('EZRX-T1775 | Verify Combo Best Deal Eligible on Combo K4.2',
          (tester) async {
        await openAndVerifyComboDetail(
          tester,
          materialNumber: comboK42MaterialNumber,
          otherShipToCode: otherShipToCode,
        );

        await comboDetailRobot
            .verifyOnSelectOptionalComboMaterial(comboK42MaterialNumber);
        await comboDetailRobot.changeMaterialQuantity(
          materialNumber: comboK42MaterialNumber,
          quantity: 2,
        );
        comboDetailRobot.verifyAddToCartButtonDisableDisplayed();
        await comboDetailRobot.changeMaterialQuantity(
          materialNumber: comboK42MaterialNumber,
          quantity: nextDealMinQty,
        );
        comboDetailRobot.verifyAddToCartButtonEnableDisplayed();
        comboDetailRobot.verifyNextDealDisplay(
          scheme: ComboDealScheme.k42,
          unit: nextDealMinQty.toString(),
          discount: '',
        );
        await comboDetailRobot.changeMaterialQuantity(
          materialNumber: comboK42MaterialNumber,
          quantity: bestDealMinQty,
        );
        comboDetailRobot.verifyBestDealDisplay();
      });
    });

    group('K5', () {
      // K5
      const comboK5MaterialNumber = '21222875';
      const comboK5MaterialName = 'ZPKH Batch Managed Mat';
      const comboK5MaterialPrincipalName = 'Abbott Products Operations A.G';
      const comboK5MaterialExpiryDate = '30 Apr 2050';

      const materialPrice = 20;
      const nextDealMinQty = 3;
      const bestDealMinQty = 5;

      const nextDealDiscount = 9;

      const bestDealMinAmount = 100;
      //TODO: Remove this shipto code when test data provided for K4.2 and K5
      const otherShipToCode = '0071262518';

      testWidgets('EZRX-T1387 | Verify Combo K5 via Product detail',
          (tester) async {
        await openAndVerifyComboDetail(
          tester,
          materialNumber: comboK5MaterialNumber,
          otherShipToCode: otherShipToCode,
        );
        comboDetailRobot.verifyCartButtonDisplayed();

        await comboDetailRobot.verifyComboMaterialInformation(
          materialNumberMatNo: comboK5MaterialNumber,
          expiryDate: comboK5MaterialExpiryDate,
          materialName: comboK5MaterialName,
          materialManufacturer: comboK5MaterialPrincipalName,
        );
        comboDetailRobot.verifyComboK5Displayed();
      });

      testWidgets('EZRX-T1399 | Verify Combo Next Deal Eligible on Combo K5',
          (tester) async {
        await openAndVerifyComboDetail(
          tester,
          materialNumber: comboK5MaterialNumber,
          otherShipToCode: otherShipToCode,
        );

        await comboDetailRobot
            .verifyOnSelectOptionalComboMaterial(comboK5MaterialNumber);
        comboDetailRobot.verifyAddToCartButtonDisableDisplayed();
        await comboDetailRobot.changeMaterialQuantity(
          materialNumber: comboK5MaterialNumber,
          quantity: nextDealMinQty,
        );
        comboDetailRobot.verifyAddToCartButtonEnableDisplayed();
        const nextDealAmountNeedMore =
            (bestDealMinAmount - (nextDealMinQty * materialPrice));
        comboDetailRobot.verifyNextDealDisplay(
          scheme: ComboDealScheme.k5,
          unit: nextDealAmountNeedMore.toDouble().toString(),
          discount: nextDealDiscount.toString(),
        );
      });

      testWidgets('EZRX-T1776 | Verify Combo Best Deal Eligible on Combo K5',
          (tester) async {
        await openAndVerifyComboDetail(
          tester,
          materialNumber: comboK5MaterialNumber,
          otherShipToCode: otherShipToCode,
        );

        await comboDetailRobot
            .verifyOnSelectOptionalComboMaterial(comboK5MaterialNumber);
        comboDetailRobot.verifyAddToCartButtonDisableDisplayed();
        await comboDetailRobot.changeMaterialQuantity(
          materialNumber: comboK5MaterialNumber,
          quantity: nextDealMinQty,
        );
        comboDetailRobot.verifyAddToCartButtonEnableDisplayed();
        const nextDealAmountNeedMore =
            bestDealMinAmount - (nextDealMinQty * materialPrice);
        comboDetailRobot.verifyNextDealDisplay(
          scheme: ComboDealScheme.k5,
          unit: nextDealAmountNeedMore.toDouble().toString(),
          discount: nextDealDiscount.toString(),
        );

        await comboDetailRobot.changeMaterialQuantity(
          materialNumber: comboK5MaterialNumber,
          quantity: bestDealMinQty,
        );
        comboDetailRobot.verifyBestDealDisplay();
      });
    });
  });

  tearDown(() async {
    locator<ZephyrService>().setNameAndStatus();
    await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.khClient);
  });
}
