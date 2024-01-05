import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../core/common.dart';
import '../core/infrastructure/infra_core/zephyr_service/zephyr_service.dart';
import '../core/infrastructure/zephyr/repository/zephyr_repository.dart';
import '../robots/announcement_article/announcement_article_root_robot.dart';
import '../robots/announcement_article/articles/articles_details_robot.dart';
import '../robots/announcement_article/articles/articles_robot.dart';
import '../robots/auth/forgot_password_robot.dart';
import '../robots/common/common_robot.dart';
import '../robots/common/enum.dart';
import '../robots/common/extension.dart';
import '../robots/home/customer_search_robot.dart';
import '../robots/home/home_robot.dart';
import '../robots/login_robot.dart';
import '../robots/more/contact_us_robot.dart';
import '../robots/more/more_robot.dart';
import '../robots/more/profile_robot.dart';
import '../robots/more/security_robot.dart';
import '../robots/notification/notification_robot.dart';
import '../robots/orders/cart/bonus_sample_robot.dart';
import '../robots/orders/cart/cart_delivery_address_robot.dart';
import '../robots/orders/cart/cart_robot.dart';
import '../robots/orders/cart/oos_pre_order_robot.dart';
import '../robots/orders/cart/request_counter_offer_robot.dart';
import '../robots/orders/checkout/checkout_robot.dart';
import '../robots/orders/checkout/order_price_summary_robot.dart';
import '../robots/orders/checkout/order_success_robot.dart';
import '../robots/orders/orders_root_robot.dart';
import '../robots/orders/view_by_items/view_by_items_detail_robot.dart';
import '../robots/orders/view_by_items/view_by_items_filter_robot.dart';
import '../robots/orders/view_by_items/view_by_items_robot.dart';
import '../robots/orders/view_by_orders/view_by_orders_detail_robot.dart';
import '../robots/payments/payment_summary/payment_detail_robot.dart';
import '../robots/orders/view_by_orders/view_by_orders_filter_robot.dart';
import '../robots/orders/view_by_orders/view_by_orders_robot.dart';
import '../robots/payments/payment_home_robot.dart';
import '../robots/products/bundle_detail_robot.dart';
import '../robots/products/filter_sort_product_robot.dart';
import '../robots/products/product_detail_robot.dart';
import '../robots/products/product_robot.dart';
import '../robots/products/product_suggestion_robot.dart';
import '../robots/returns/returns_by_items/returns_by_items_detail_robot.dart';
import '../robots/returns/returns_root_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late CommonRobot commonRobot;
  late LoginRobot loginRobot;
  late ForgotPasswordRobot forgotPasswordRobot;
  late HomeRobot homeRobot;
  late CustomerSearchRobot customerSearchRobot;
  late ContactUsRobot contactUsRobot;
  late ProfileRobot profileRobot;
  late SecurityRobot securityRobot;
  late NotificationRobot notificationRobot;
  late MoreRobot moreRobot;

  late AnnouncementArticleRootRobot announcementArticleRootRobot;
  // late AnnouncementDetailRobot announcementDetailRobot;
  // late AnnouncementRobot announcementRobot;
  late ArticleRobot articleRobot;
  late ArticleDetailsRobot articleDetailsRobot;

  late ProductRobot productRobot;
  late ProductDetailRobot productDetailRobot;
  late FilterSortProductRobot filterSortProductRobot;
  late ProductSuggestionRobot productSuggestionRobot;
  late BundleDetailRobot bundleDetailRobot;
  late CartRobot cartRobot;
  late OOSPreOrderRobot oosPreOrderRobot;
  late CartDeliveryAddressRobot cartDeliveryAddressDetailRobot;
  late RequestCounterOfferRobot requestCounterOfferRobot;
  late BonusSampleRobot bonusSampleRobot;
  late OrderPriceSummaryRobot orderPriceSummaryRobot;
  late CheckoutRobot checkoutRobot;
  late OrderSuccessRobot orderSuccessRobot;

  late OrdersRootRobot ordersRootRobot;
  late ViewByItemsDetailRobot viewByItemsDetailRobot;
  late ViewByItemsRobot viewByItemsRobot;
  late ViewByItemsFilterRobot viewByItemsFilterRobot;
  late ViewByOrdersRobot viewByOrdersRobot;
  late ViewByOrdersFilterRobot viewByOrdersFilterRobot;
  late ViewByOrdersDetailRobot viewByOrdersDetailRobot;

  late ReturnsRootRobot returnsRootRobot;
  late ReturnsByItemsDetailRobot returnsByItemsDetailRobot;

  late PaymentHomeRobot paymentHomeRobot;
  late PaymentDetailRobot paymentDetailRobot;

  void initializeRobot(WidgetTester tester) {
    commonRobot = CommonRobot(tester);
    loginRobot = LoginRobot(tester);
    forgotPasswordRobot = ForgotPasswordRobot(tester);
    homeRobot = HomeRobot(tester);
    customerSearchRobot = CustomerSearchRobot(tester);
    contactUsRobot = ContactUsRobot(tester);
    profileRobot = ProfileRobot(tester);
    securityRobot = SecurityRobot(tester);
    moreRobot = MoreRobot(tester);
    notificationRobot = NotificationRobot(tester);

    announcementArticleRootRobot = AnnouncementArticleRootRobot(tester);
    // announcementDetailRobot = AnnouncementDetailRobot(tester);
    // announcementRobot = AnnouncementRobot(tester);
    articleRobot = ArticleRobot(tester);
    articleDetailsRobot = ArticleDetailsRobot(tester);

    productRobot = ProductRobot(tester);
    productDetailRobot = ProductDetailRobot(tester);
    filterSortProductRobot = FilterSortProductRobot(tester);
    productSuggestionRobot = ProductSuggestionRobot(tester);
    bundleDetailRobot = BundleDetailRobot(tester);
    cartRobot = CartRobot(tester);
    oosPreOrderRobot = OOSPreOrderRobot(tester);
    cartDeliveryAddressDetailRobot = CartDeliveryAddressRobot(tester);
    requestCounterOfferRobot = RequestCounterOfferRobot(tester);
    bonusSampleRobot = BonusSampleRobot(tester);
    orderPriceSummaryRobot = OrderPriceSummaryRobot(tester);
    checkoutRobot = CheckoutRobot(tester);
    orderSuccessRobot = OrderSuccessRobot(tester);

    ordersRootRobot = OrdersRootRobot(tester);
    viewByItemsDetailRobot = ViewByItemsDetailRobot(tester);
    viewByItemsRobot = ViewByItemsRobot(tester);
    viewByItemsFilterRobot = ViewByItemsFilterRobot(tester);
    viewByOrdersRobot = ViewByOrdersRobot(tester);
    viewByOrdersFilterRobot = ViewByOrdersFilterRobot(tester);
    viewByOrdersDetailRobot = ViewByOrdersDetailRobot(tester);

    returnsRootRobot = ReturnsRootRobot(tester);
    returnsByItemsDetailRobot = ReturnsByItemsDetailRobot(tester);

    paymentHomeRobot = PaymentHomeRobot(tester);
    paymentDetailRobot = PaymentDetailRobot(tester);
  }

  const marketMalaysia = 'Malaysia';
  const username = 'myclientuser';
  const password = 'St@ysafe01';
  const customerCode = '0030082707';
  const shipToCode = '0070149863';
  const shipToAddress = 'RSD HOSPITALS SDN BHD (SJMC)';
  const otherShipToCode = '0000002012';
  const currency = 'MYR';
  const invalidLengthSearchKey = '1';
  const invalidSearchKey = 'auto-test-auto-test';
  const invalidNumberSearchKey = '1231762381236123';
  const minOrderAmount = 300.0;
  const materialNumber = '21037004';
  const materialName = 'AMO AC51L 0011011.0D';
  const materialPrincipalName = 'ABBOTT MEDICAL OPTICS';
  const materialCountryOfOrigin = 'USA';
  const materialUnitMeasurement = 'EA';
  const materialBatch = '+180036983';
  const materialUnitPrice = 1000.0;
  const multiImageMaterialNumber = '21041738';
  const otherInfoMaterialNumber = '21041738';
  const lowPriceMaterialNumber = '21247735';
  const lowPriceMaterialUnitPrice = 20.3;
  const bonusMaterialNumber = '21041777';
  const bonusMaterialNumberTierQty = 8;
  const bonusMaterialName = "190 PANADOL ACTIFAST(NP)CAP 500MG16'S/BX";
  const oosPreOrderMaterialNumber = '21041761';
  const bundleShortNumber = '8896469';
  const bundleNumber = '0008896469';
  const bundleName = 'UAT ALM 9060';
  const bundleTier1Qty = 5;
  const bundleTier1UnitPrice = 100.0;
  const bundleTier1UnitPriceDisplay = '$currency $bundleTier1UnitPrice';
  const bundleTier2Qty = 10;
  const bundleTier2UnitPrice = 90.0;
  const bundleTier2UnitPriceDisplay = '$currency $bundleTier2UnitPrice';
  const bundleMaterialNumber1 = '23046003';
  const bundleMaterialName1 = "COZAAR TABS 100MG 30'S";
  const bundleMaterialPrincipalName1 = 'MERCK SHARP & DOHME (I.A)';
  const bundleMaterialNumber2 = '23046018';
  const bundleMaterialName2 = "FOSAMAXTABS10MG30'S";
  const bundleMaterialPrincipalName2 = 'MERCK SHARP & DOHME (I.A)';
  const poReference = 'Auto-test-po-reference';
  const deliveryInstruction = 'Auto-test-delivery-instruction';

  var loginRequired = true;

  Future<void> pumpAppWithHomeScreen(WidgetTester tester) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    if (loginRequired) {
      await loginRobot.loginToHomeScreen(username, password, marketMalaysia);
      loginRequired = false;
    }
    await commonRobot.dismissSnackbar(dismissAll: true);
    await commonRobot.changeDeliveryAddress(shipToCode);
  }

  Future<void> browseProductFromEmptyCart() async {
    await homeRobot.tapMiniCartIcon();
    await cartRobot.clearCart();
    await cartRobot.tapBrowseProductButton();
    await productRobot.openSearchProductScreen();
  }

  Future<void> checkoutWithMaterial(
    String materialNumber,
    int qty, {
    bool isPreOrder = false,
  }) async {
    await browseProductFromEmptyCart();
    await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
    await productSuggestionRobot.tapSearchResult(materialNumber);
    await productDetailRobot.tapAddToCart();
    await productDetailRobot.tapCartButton();
    await cartRobot.changeMaterialQty(materialNumber, qty);
    await cartRobot.tapCheckoutButton();
    if (isPreOrder) {
      await oosPreOrderRobot.tapContinueButton();
    }
  }

  group('Authentication - ', () {
    const usernameInCorrect = 'myclientuser001';
    const passwordInCorrect = 'St@ysafe001';

    Future<void> pumpAppInitialState(WidgetTester tester) async {
      initializeRobot(tester);
      await runAppForTesting(tester);
    }

    testWidgets('EZRX-T6 | Verify GUI of Login screen', (tester) async {
      await pumpAppInitialState(tester);

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

    testWidgets('EZRX-T7 | Verify Default value fields', (tester) async {
      //init app
      await pumpAppInitialState(tester);

      //default value
      loginRobot.verifyDefaultValueSelector(marketMalaysia);
      loginRobot.verifyRememberMeCheckboxUnchecked();
      loginRobot.verifyDefaultUsernameField();
      loginRobot.verifyDefaultPasswordField();
    });

    testWidgets('EZRX-T8 | Verify mandatory fields', (tester) async {
      const emptyString = '';
      //init app
      await pumpAppInitialState(tester);

      //select market
      loginRobot.findMarketSelector();
      await loginRobot.tapToMarketSelector();
      await loginRobot.selectMarket(marketMalaysia);
      loginRobot.verifySelectedMarket(marketMalaysia);

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
      loginRobot.findMarketSelector();
      await loginRobot.tapToMarketSelector();
      await loginRobot.selectMarket(marketMalaysia);
      loginRobot.verifySelectedMarket(marketMalaysia);

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
      loginRobot.findMarketSelector();
      await loginRobot.tapToMarketSelector();
      await loginRobot.selectMarket(marketMalaysia);
      loginRobot.verifySelectedMarket(marketMalaysia);

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
      loginRobot.findMarketSelector();
      await loginRobot.tapToMarketSelector();
      await loginRobot.selectMarket(marketMalaysia);
      loginRobot.verifySelectedMarket(marketMalaysia);

      //login with incorrect username
      await loginRobot.login(usernameInCorrect, passwordInCorrect);
      loginRobot.verifyErrorMessageWithInvalidUsernameOrPassword();
    });

    testWidgets('EZRX-T14 | Verify Forgot password screen', (tester) async {
      //init app
      await pumpAppInitialState(tester);

      //forgot password
      loginRobot.findForgotPasswordLink();
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
      loginRobot.findForgotPasswordLink();
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
      loginRobot.findSkipIntroButton();
      await loginRobot.tapSkipIntroButton();

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
      loginRequired = false;
    });
  });

  group('Notification Tab - ', () {
    const orderNotificationKeyword = 'Order';
    const returnNotificationKeyword = 'Return request';
    const paymentNotificationKeyword = 'Payment';
    const notificationIndex = 0;

    testWidgets('EZRX-T95 | Verify Notification Tab with Default Values',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await commonRobot.navigateToScreen(NavigationTab.notifications);

      //verify
      notificationRobot.verifyPage();
      notificationRobot.verifyScrollList();
      notificationRobot.verifyDeleteButton();
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
      notificationRobot.verifyNotificationItems();
      final itemDescription =
          notificationRobot.getNotificationDescription(notificationIndex);
      await notificationRobot.tapNotificationItem(notificationIndex);
      if (itemDescription.startsWith(orderNotificationKeyword.tr())) {
        viewByOrdersDetailRobot.verifyPage();
      } else if (itemDescription.startsWith(returnNotificationKeyword.tr())) {
        returnsByItemsDetailRobot.verifyPage();
      } else if (itemDescription.startsWith(paymentNotificationKeyword.tr())) {
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
      final itemDescription =
          notificationRobot.getNotificationDescription(notificationIndex);
      await notificationRobot.pullToRefresh();
      notificationRobot.verifyNotificationItems();
      notificationRobot.verifyNotificationWithDescription(
        notificationIndex,
        itemDescription,
      );
    });
  });

  group('Home Tab - ', () {
    testWidgets(
        'EZRX-T17 | Access Homepage after logging in and having existing ShipTo',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //verify homepage
      homeRobot.verify();
      homeRobot.findCustomerCodeSelector();
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
      homeRobot.findCustomerCodeSelector();
      await homeRobot.tapCustomerCodeSelector();
      customerSearchRobot.verify();
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
      const subCustomerCode = '007014';
      const subCustomerName = 'RSD';
      const subShipToCode = '475';
      const subShipToName = 'petaling';

      //init app
      await pumpAppWithHomeScreen(tester);

      // select customer code
      homeRobot.findCustomerCodeSelector();
      await homeRobot.tapCustomerCodeSelector();
      customerSearchRobot.verify();

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
      homeRobot.findCustomerCodeSelector();
      await homeRobot.tapCustomerCodeSelector();
      customerSearchRobot.verify();

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

    testWidgets('EZRX-T45 | Verify display Bundles in Homepage',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //tap on bundle
      homeRobot.findBundles();
      await homeRobot.tapBundlesIcon();

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

      //move to Bundles
      homeRobot.findProductsOnOffer();

      //tap on first product
      await homeRobot.tapOnFirstProductOnOffer();

      //verify navigation to Material Detail Page
      productDetailRobot.verifyPage();
    });

    testWidgets(
        'EZRX-T52 | Verify display Product detail in Bundles in Homepage',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      // Move to bundle
      homeRobot.findBundles();

      //verify bundles details
      homeRobot.verifyDisplayBundlesTag();
      homeRobot.verifyDisplayBundlesManufactured();
      homeRobot.verifyDisplayBundlesDescription();
      await homeRobot.verifyDisplayBundlesNumber();

      //Swipe bundle to right
      await homeRobot.slideBundle();

      //Swipe bundle to left
      await homeRobot.slideBundle(reversed: true);
    });

    testWidgets('EZRX-T53 | Verify click on Bundle in Bundle deals',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //move to products on offer
      homeRobot.findBundles();

      //tap on first product
      await homeRobot.tapOnFirstBundle();
      bundleDetailRobot.verifyBundleDetailPage();
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
  });

  group('Product Tab - ', () {
    const sortByZToA = 'Z-A';

    testWidgets('EZRX-T30 | Verify default and display items in Product list',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyPageVisible();
      productRobot.verifyMaterialCartVisible();
      productRobot.verifyCartButtonVisible();
      productRobot.verifyLabelFilterFavoritesVisible();

      productRobot.verifyCustomerCodeSelectorVisible();
      productRobot.verifyAppTabBarVisible();
      productRobot.verifySearchBarVisible();
      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyDefaultFilterProduct();
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

    testWidgets(
        'EZRX-T31 | Verify Search Product by inputting keyword contains product name',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifySearchBarVisible();
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(materialName);
      productSuggestionRobot.verifySuggestProductsSearch(materialName);
      await productSuggestionRobot.autoSearch(materialName);
      productSuggestionRobot.verifySuggestProductsSearch(materialName);
    });

    testWidgets(
        'EZRX-T32 | Verify Search Product by inputting keyword contains Product code',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifySearchBarVisible();
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot
          .searchWithKeyboardAction(invalidLengthSearchKey);
      productSuggestionRobot.verifyInvalidLengthSearchMessage();
      productSuggestionRobot.verifyNoSuggestedProduct();
      await productSuggestionRobot.dismissSnackbar();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      productSuggestionRobot.verifySuggestProductsSearch(materialName);
    });

    testWidgets(
        'EZRX-T33 | Verify Search Product by inputting keyword not contain Product name/code',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifySearchBarVisible();
      await productRobot.openSearchProductScreen();

      await productSuggestionRobot.autoSearch(materialName);
      productSuggestionRobot.verifySuggestProductsSearch(materialName);
      await productSuggestionRobot.autoSearch(invalidSearchKey);
      productSuggestionRobot.verifyNoSuggestedProduct();
      productSuggestionRobot.verifyNoRecordFound();
      await productSuggestionRobot.tapClearSearch();
      productSuggestionRobot.verifyNoRecordFound(isVisible: false);
    });

    testWidgets('EZRX-T34 | Verify Favorite list', (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyMaterialCartVisible();
      await productRobot.openDetailFirstProduct();
      await productDetailRobot.setProductToFavoriteList(true);
      final nameProduct =
          productDetailRobot.getMaterialDetailsMaterialDescription();
      await productDetailRobot.tapBackButton();
      await productRobot.filterFavoritesInProductsScreen();
      productRobot.verifyProductFilterMatched(nameProduct);
      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyCheckboxCheckedShowProduct(
        'Favourites',
        true,
      );
    });

    testWidgets('EZRX-T35 | Verify display by Sort by Z-A', (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyMaterialCartVisible();
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

    testWidgets('EZRX-T38 | Verify Filter by Manufacturer', (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyMaterialCartVisible();

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

    testWidgets('EZRX-T39 | Verify Filter by Country of origin',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyMaterialCartVisible();

      await productRobot.openFilterProductScreen();
      await filterSortProductRobot.openFilterCountryOfOriginScreen();
      final country = filterSortProductRobot.getFirstSuggestedCountry();
      await filterSortProductRobot.searchWithKeyboardAction(country);
      filterSortProductRobot.verifyListCountryOfOriginMatched(country);
      await filterSortProductRobot.tapFirstSuggestedCountry();
      await commonRobot.tapToBackIcon();
      filterSortProductRobot.verifyCountryListSelectedVisible(1);
      await filterSortProductRobot.tapFilterApplyButton();

      await productRobot.openDetailFirstProduct();
      await productDetailRobot.openMaterialInformation();
      productDetailRobot.verifyCountryOfOriginDisplayed(country);
    });

    testWidgets('EZRX-T40 | Verify combine filter with Sort conditions',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyMaterialCartVisible();
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
      productRobot.verifyMaterialCartVisible();
      productRobot
          .verifyManufacturerMaterialFilterMatched(materialPrincipalName);
      productRobot.verifyProductSortChanged(firstProduct);
    });

    testWidgets('EZRX-T61 | Verify action click Cart icon in Product tab',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.tapCartButton();
      cartRobot.verifyPage();
    });
  });

  group('Product Detail - ', () {
    testWidgets('EZRX-T62 | Verify Product detail via Product tab',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openDetailFirstProduct();
      productDetailRobot.verifyProductImageDisplayed();
      productDetailRobot.verifyProductFavoriteIconDisplayed();
      productDetailRobot.verifyProductNameDisplayed();
      productDetailRobot.verifyProductPriceDisplayed();
      productDetailRobot.verifyMaterialDetailsInfoTileDisplayed();
      productDetailRobot.verifyProductDetailsQuantityInputPriceDisplayed();
      productDetailRobot.verifyCartButtonDisplayed();
      productDetailRobot.verifyAddToCartCartButtonDisplayed();
    });

    testWidgets('EZRX-T42 | Verify Product detail via Home screen',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await homeRobot.findBrowseProductsIcon();
      await homeRobot.tapOnFirstBrowseProduct();
      productDetailRobot.verifyProductImageDisplayed();
      productDetailRobot.verifyProductFavoriteIconDisplayed();
      productDetailRobot.verifyProductNameDisplayed();
      productDetailRobot.verifyProductPriceDisplayed();
      productDetailRobot.verifyMaterialDetailsInfoTileDisplayed();
      productDetailRobot.verifyProductDetailsQuantityInputPriceDisplayed();
      productDetailRobot.verifyCartButtonDisplayed();
      productDetailRobot.verifyAddToCartCartButtonDisplayed();
    });

    testWidgets(
        'EZRX-T63 | Verify material information in the product detail page',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productSuggestionRobot.tapSearchResult(materialNumber);
      await productDetailRobot.openMaterialInformation();
      productDetailRobot.verifyMateriaNumberDisplayed(materialNumber);
      productDetailRobot.verifyManufacturerDisplayed(materialPrincipalName);
      productDetailRobot
          .verifyUnitOfMeasurementLabelDisplayed(materialUnitMeasurement);
      productDetailRobot
          .verifyCountryOfOriginLabelDisplayed(materialCountryOfOrigin);
      productDetailRobot.verifyBatchLabelDisplayed(materialBatch);
      productDetailRobot.verifyExpiryLabelDisplayed();
    });

    testWidgets(
        'EZRX-T64 | Verify display image when Product has multiple images',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productRobot.searchWithKeyboardAction(multiImageMaterialNumber);
      await productSuggestionRobot.tapSearchResult(multiImageMaterialNumber);
      productDetailRobot.verifyMultipleImageMaterialDisplayed();
      productDetailRobot.verifyImageMaterialSelected(0, true);
      productDetailRobot.verifyImageMaterialSelected(1, false);
      await productDetailRobot.tapToImageMaterial(1, false);
      productDetailRobot.verifyImageMaterialSelected(1, true);
    });

    testWidgets('EZRX-T65| Verify Available offers in the product detail page',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productRobot.searchWithKeyboardAction(bonusMaterialNumber);
      await productSuggestionRobot.tapSearchResult(bonusMaterialNumber);
      final productName =
          productDetailRobot.getMaterialDetailsMaterialDescription();
      await productDetailRobot.openAvailableOffers();
      productDetailRobot.verifyNameProductOffer(productName);
      productDetailRobot.verifyCodeProductOffer(bonusMaterialNumber);
      productDetailRobot.verifyQuantityProductDisplayed();
      productDetailRobot.verifyButtonCloseDisplayed();
    });

    testWidgets('EZRX-T66 | Verify Related products in the product detail page',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productSuggestionRobot.tapSearchResult(materialNumber);
      productDetailRobot.verifyRelateProductDisplayed();
    });

    testWidgets('EZRX-T67 | Verify other information in Product detail',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot
          .searchWithKeyboardAction(otherInfoMaterialNumber);
      await productSuggestionRobot.tapSearchResult(otherInfoMaterialNumber);
      await productDetailRobot.tapToSeeMore();
      productDetailRobot.verifyMaterialDosageDisplayed();
      productDetailRobot.verifyMaterialHowToUseDisplayed();
      productDetailRobot.verifyMaterialDeliveryInstructionsDisplayed();
      productDetailRobot.verifyMaterialCompositionDisplayed();
    });

    testWidgets('EZRX-T68 | Verify action click Cart icon in Product detail',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productSuggestionRobot.tapSearchResult(materialNumber);
      await productDetailRobot.tapCartButton();
      cartRobot.verifyPage();
    });

    testWidgets('EZRX-T212 | Verify bundles detail page', (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(bundleShortNumber);
      await productSuggestionRobot.tapSearchResult(bundleShortNumber);
      bundleDetailRobot.verifyAllInformationBundleOfferDisplayed();
    });

    testWidgets('EZRX-T215 | Verify add favorite product in product detail',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyMaterialCartVisible();
      await productRobot.openDetailFirstProduct();
      await productDetailRobot.setProductToFavoriteList(true);
      final nameProduct =
          productDetailRobot.getMaterialDetailsMaterialDescription();
      await productDetailRobot.tapBackButton();
      await productRobot.filterFavoritesInProductsScreen();
      productRobot.verifyProductFilterMatched(nameProduct);
    });

    testWidgets('EZRX-T216 | Verify remove favorite product in product detail',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyMaterialCartVisible();
      await productRobot.openDetailFirstProduct();
      final nameProduct =
          productDetailRobot.getMaterialDetailsMaterialDescription();
      await productDetailRobot.setProductToFavoriteList(false);
      await productDetailRobot.tapBackButton();
      await productRobot.filterFavoritesInProductsScreen();
      productRobot.verifyNotProductFilterMatched(nameProduct);
    });
  });

  group('Cart - ', () {
    testWidgets('EZRX-T97 | Verify Cart when NO product is added to cart',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await homeRobot.tapMiniCartIcon();

      //verify
      cartRobot.verifyPage();
      await cartRobot.clearCart();
      cartRobot.verifyNoRecordFound();
      cartRobot.verifyQtyOnAppBar(0);
      await cartRobot.tapBrowseProductButton();
      productRobot.verifyPageVisible();
    });

    testWidgets('EZRX-T98 | Verify Cart when products are added to the cart',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productSuggestionRobot.tapSearchResult(materialNumber);
      await productDetailRobot.tapAddToCart();
      productDetailRobot.verifyCartButtonQty(1);
      await productDetailRobot.tapCartButton();

      //verify
      cartRobot.verifyClearCartButton();
      await cartRobot.verifyMaterial(materialNumber);
      cartRobot.verifyManufacturerName(materialPrincipalName);
      cartRobot.verifyMaterialNumber(materialNumber);
      cartRobot.verifyMaterialImage(materialNumber);
      cartRobot.verifyMaterialQty(materialNumber, 1);
      cartRobot.verifyMaterialDescription(materialNumber, materialName);
      cartRobot.verifyMaterialUnitPrice(
        materialNumber,
        materialUnitPrice.priceDisplay(currency),
      );
      cartRobot.verifyMaterialTotalPrice(
        materialNumber,
        materialUnitPrice.priceDisplay(currency),
      );
      cartRobot.verifyCartQty(1);
      cartRobot.verifyQtyOnAppBar(1);
      cartRobot.verifyCartShipToAddress(shipToAddress);
      cartRobot.verifyCartTotalPrice(materialUnitPrice.priceDisplay(currency));
      cartRobot.verifyCheckoutButton();
    });

    testWidgets('EZRX-T113 | Verify delete all items in cart', (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      //verify
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productSuggestionRobot.tapSearchResult(materialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar();
      await productDetailRobot.tapBackButton();
      await productSuggestionRobot
          .searchWithKeyboardAction(lowPriceMaterialNumber);
      await productSuggestionRobot.tapSearchResult(lowPriceMaterialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.tapCartButton();
      cartRobot.verifyCartQty(2);
      await cartRobot.tapClearCartButton();
      await cartRobot.verifyClearCartSuccessMessage();
      cartRobot.verifyNoRecordFound();
      cartRobot.verifyQtyOnAppBar(0);
    });

    testWidgets('EZRX-T99 | Verify Cart when bundles are added to the cart',
        (tester) async {
      const materialQty1 = 3;
      const materialQty2 = 2;
      const totalQty = materialQty1 + materialQty2;
      final totalPrice =
          (totalQty * bundleTier1UnitPrice).priceDisplay(currency);

      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      //verify
      await productSuggestionRobot.searchWithKeyboardAction(bundleShortNumber);
      await productSuggestionRobot.tapSearchResult(bundleShortNumber);
      await bundleDetailRobot.tapAddToCartButton();
      await bundleDetailRobot.enterMaterialQty(
        bundleMaterialNumber1,
        materialQty1,
      );
      await bundleDetailRobot.enterMaterialQty(
        bundleMaterialNumber2,
        materialQty2,
      );
      await bundleDetailRobot.tapSheetAddToCartButton();
      bundleDetailRobot.verifyCartButtonQty(2);
      await bundleDetailRobot.tapCartButton();
      cartRobot.verifyPage();
      await cartRobot.verifyBundle(bundleNumber);
      cartRobot.verifyBundleNumber(bundleNumber);
      cartRobot.verifyBundleName(bundleNumber, bundleName);
      cartRobot.verifyBundleQty(bundleNumber, totalQty);
      cartRobot.verifyBundleRate(
        bundleNumber,
        bundleTier1Qty,
        bundleTier1UnitPriceDisplay,
      );
      await cartRobot.verifyBundleItem(
        bundleNumber,
        bundleMaterialNumber1,
      );
      cartRobot.verifyBundleItemMaterialNumber(
        bundleNumber,
        bundleMaterialNumber1,
      );
      cartRobot.verifyBundleItemMaterialDescription(
        bundleNumber,
        bundleMaterialNumber1,
        bundleMaterialName1,
      );
      cartRobot.verifyBundleItemPrincipalName(
        bundleNumber,
        bundleMaterialNumber1,
        bundleMaterialPrincipalName1,
      );
      cartRobot.verifyBundleItemQty(
        bundleNumber,
        bundleMaterialNumber1,
        materialQty1,
      );
      cartRobot.verifyBundleItemDeleteButton(
        bundleNumber,
        bundleMaterialNumber1,
      );
      await cartRobot.verifyBundleItem(
        bundleNumber,
        bundleMaterialNumber2,
      );
      cartRobot.verifyBundleItemMaterialNumber(
        bundleNumber,
        bundleMaterialNumber2,
      );
      cartRobot.verifyBundleItemMaterialDescription(
        bundleNumber,
        bundleMaterialNumber2,
        bundleMaterialName2,
      );
      cartRobot.verifyBundleItemPrincipalName(
        bundleNumber,
        bundleMaterialNumber2,
        bundleMaterialPrincipalName2,
      );
      cartRobot.verifyBundleItemQty(
        bundleNumber,
        bundleMaterialNumber2,
        materialQty2,
      );
      cartRobot.verifyBundleItemDeleteButton(
        bundleNumber,
        bundleMaterialNumber2,
      );
      cartRobot.verifyBundleTotalPrice(bundleNumber, totalPrice);
      cartRobot.verifyCartQty(2);
      cartRobot.verifyCartShipToAddress(shipToAddress);
      cartRobot.verifyCartTotalPrice(totalPrice);
      cartRobot.verifyCheckoutButton();
    });

    testWidgets(
        'EZRX-T100 | Verify Cart when bundles and products are added to the cart',
        (tester) async {
      const materialQty = 1;
      const bundleMaterialQty1 = 9;
      const bundleMaterialQty2 = 2;
      const bundleTotalQty = bundleMaterialQty2 + bundleMaterialQty1;
      const bundleTotalPrice = bundleTotalQty * bundleTier2UnitPrice;
      const totalPrice = materialQty * materialUnitPrice + bundleTotalPrice;

      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      //verify
      await productSuggestionRobot.searchWithKeyboardAction(bundleShortNumber);
      await productSuggestionRobot.tapSearchResult(bundleShortNumber);
      await bundleDetailRobot.tapAddToCartButton();
      await bundleDetailRobot.enterMaterialQty(
        bundleMaterialNumber1,
        bundleMaterialQty1,
      );
      await bundleDetailRobot.enterMaterialQty(
        bundleMaterialNumber2,
        bundleMaterialQty2,
      );
      await bundleDetailRobot.tapSheetAddToCartButton();
      await bundleDetailRobot.dismissSnackbar();
      bundleDetailRobot.verifyCartButtonQty(2);
      await bundleDetailRobot.tapBackButton();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productSuggestionRobot.tapSearchResult(materialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar();
      productDetailRobot.verifyCartButtonQty(3);
      await productDetailRobot.tapCartButton();
      cartRobot.verifyPage();
      await cartRobot.verifyMaterial(materialNumber);
      cartRobot.verifyMaterialQty(materialNumber, materialQty);
      cartRobot.verifyMaterialUnitPrice(
        materialNumber,
        materialUnitPrice.priceDisplay(currency),
      );
      cartRobot.verifyMaterialTotalPrice(
        materialNumber,
        materialUnitPrice.priceDisplay(currency),
      );
      await cartRobot.verifyBundle(bundleNumber);
      cartRobot.verifyBundleQty(bundleNumber, bundleTotalQty);
      cartRobot.verifyBundleRate(
        bundleNumber,
        bundleTier2Qty,
        bundleTier2UnitPriceDisplay,
      );
      await cartRobot.verifyBundleItem(
        bundleNumber,
        bundleMaterialNumber1,
      );
      cartRobot.verifyBundleItemQty(
        bundleNumber,
        bundleMaterialNumber1,
        bundleMaterialQty1,
      );
      await cartRobot.verifyBundleItem(
        bundleNumber,
        bundleMaterialNumber2,
      );
      cartRobot.verifyBundleItemQty(
        bundleNumber,
        bundleMaterialNumber2,
        bundleMaterialQty2,
      );
      cartRobot.verifyBundleTotalPrice(
        bundleNumber,
        bundleTotalPrice.priceDisplay(currency),
      );
      cartRobot.verifyCartQty(3);
      cartRobot.verifyQtyOnAppBar(3);
      cartRobot.verifyCartShipToAddress(shipToAddress);
      cartRobot.verifyCartTotalPrice(totalPrice.priceDisplay(currency));
      cartRobot.verifyCheckoutButton();
    });

    testWidgets('EZRX-T108 | Verify remove Product in the Cart',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      //verify
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productSuggestionRobot.tapSearchResult(materialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar();
      await productDetailRobot.tapCartButton();
      await cartRobot.verifyMaterial(materialNumber);
      await cartRobot.swipeMaterialToDelete(materialNumber);
      await cartRobot.verifyClearCartSuccessMessage();
      cartRobot.verifyNoRecordFound();
      await cartRobot.tapBrowseProductButton();
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(bundleShortNumber);
      await productSuggestionRobot.tapSearchResult(bundleShortNumber);
      await bundleDetailRobot.tapAddToCartButton();
      await bundleDetailRobot.enterMaterialQty(
        bundleMaterialNumber1,
        bundleTier1Qty,
      );
      await bundleDetailRobot.tapSheetAddToCartButton();
      await bundleDetailRobot.dismissSnackbar();
      await bundleDetailRobot.tapCartButton();
      await cartRobot.verifyBundle(bundleNumber);
      await cartRobot.swipeBundleToDelete(bundleNumber);
      cartRobot.verifyNoRecordFound();
      await cartRobot.verifyClearCartSuccessMessage();
    });

    testWidgets(
        'EZRX-T114 | Verify the customer code & deliver to in Order for [Selected address] in Cart detail',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      //verify
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productSuggestionRobot.tapSearchResult(materialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar();
      await productDetailRobot.tapCartButton();
      await cartRobot.verifyMaterial(materialNumber);
      cartRobot.verifyCartQty(1);
      await cartRobot.tapShowShipToAddressDetail();
      cartDeliveryAddressDetailRobot.verifySheet(isVisible: true);
      cartDeliveryAddressDetailRobot.verifyCustomerCode(customerCode);
      cartDeliveryAddressDetailRobot.verifyShipToCode(shipToCode);
      await cartDeliveryAddressDetailRobot.tapCloseButton();
      cartDeliveryAddressDetailRobot.verifySheet(isVisible: false);
    });

    testWidgets(
        'EZRX-T110 | Verify notification if Cart is under the minimum order value',
        (tester) async {
      final validQty = (minOrderAmount / lowPriceMaterialUnitPrice).ceil();
      final validTotalPrice = lowPriceMaterialUnitPrice * validQty;

      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      //verify
      await productSuggestionRobot
          .searchWithKeyboardAction(lowPriceMaterialNumber);
      await productSuggestionRobot.tapSearchResult(lowPriceMaterialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.tapCartButton();
      await cartRobot.verifyMaterial(lowPriceMaterialNumber);
      cartRobot.verifyMaterialQty(lowPriceMaterialNumber, 1);
      cartRobot.verifyMaterialUnitPrice(
        lowPriceMaterialNumber,
        lowPriceMaterialUnitPrice.priceDisplay(currency),
      );
      cartRobot.verifyMaterialTotalPrice(
        lowPriceMaterialNumber,
        lowPriceMaterialUnitPrice.priceDisplay(currency),
      );
      cartRobot.verifyCartTotalPrice(
        lowPriceMaterialUnitPrice.priceDisplay(currency),
      );
      await cartRobot.tapCheckoutButton();
      cartRobot.verifyMOVWarningMessage(
        minOrderAmount.priceDisplay(currency),
        isVisible: true,
      );
      await cartRobot.changeMaterialQty(lowPriceMaterialNumber, validQty);
      cartRobot.verifyMaterialQty(lowPriceMaterialNumber, validQty);
      cartRobot.verifyMaterialTotalPrice(
        lowPriceMaterialNumber,
        validTotalPrice.priceDisplay(currency),
      );
      cartRobot.verifyCartTotalPrice(validTotalPrice.priceDisplay(currency));
      cartRobot.verifyMOVWarningMessage(
        minOrderAmount.priceDisplay(currency),
        isVisible: false,
      );
    });

    testWidgets(
        'EZRX-T107 | Verify update Cart when increasing/decreasing the quantity of the selected product from the cart details page',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      //verify
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productSuggestionRobot.tapSearchResult(materialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.tapCartButton();

      var totalPrice = materialUnitPrice;
      await cartRobot.verifyMaterial(materialNumber);
      cartRobot.verifyMaterialQty(materialNumber, 1);
      cartRobot.verifyMaterialTotalPrice(
        materialNumber,
        totalPrice.priceDisplay(currency),
      );
      cartRobot.verifyCartTotalPrice(totalPrice.priceDisplay(currency));

      await cartRobot.increaseMaterialQty(materialNumber);
      totalPrice = materialUnitPrice * 2;
      cartRobot.verifyMaterialQty(materialNumber, 2);
      cartRobot.verifyMaterialTotalPrice(
        materialNumber,
        totalPrice.priceDisplay(currency),
      );
      cartRobot.verifyCartTotalPrice(totalPrice.priceDisplay(currency));

      await cartRobot.changeMaterialQty(materialNumber, 10);
      totalPrice = materialUnitPrice * 10;
      cartRobot.verifyMaterialQty(materialNumber, 10);
      cartRobot.verifyMaterialTotalPrice(
        materialNumber,
        totalPrice.priceDisplay(currency),
      );
      cartRobot.verifyCartTotalPrice(totalPrice.priceDisplay(currency));

      await cartRobot.decreaseMaterialQty(materialNumber);
      totalPrice = materialUnitPrice * 9;
      cartRobot.verifyMaterialQty(materialNumber, 9);
      cartRobot.verifyMaterialTotalPrice(
        materialNumber,
        totalPrice.priceDisplay(currency),
      );
      cartRobot.verifyCartTotalPrice(totalPrice.priceDisplay(currency));
    });

    testWidgets(
        'EZRX-T227 | Verify update Cart when increasing/decreasing the quantity of the selected bundle from the cart details page',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      //verify
      await productSuggestionRobot.searchWithKeyboardAction(bundleShortNumber);
      await productSuggestionRobot.tapSearchResult(bundleShortNumber);
      await bundleDetailRobot.tapAddToCartButton();
      await bundleDetailRobot.enterMaterialQty(bundleMaterialNumber1, 8);
      await bundleDetailRobot.enterMaterialQty(bundleMaterialNumber2, 2);
      await bundleDetailRobot.tapSheetAddToCartButton();
      await bundleDetailRobot.tapCartButton();

      var totalPrice = bundleTier2UnitPrice * 10;
      await cartRobot.verifyBundle(bundleNumber);
      cartRobot.verifyBundleQty(bundleNumber, 10);
      cartRobot.verifyBundleRate(
        bundleNumber,
        bundleTier2Qty,
        bundleTier2UnitPriceDisplay,
      );
      await cartRobot.verifyBundleItem(bundleNumber, bundleMaterialNumber1);
      cartRobot.verifyBundleItemQty(bundleNumber, bundleMaterialNumber1, 8);
      await cartRobot.verifyBundleItem(bundleNumber, bundleMaterialNumber2);
      cartRobot.verifyBundleItemQty(bundleNumber, bundleMaterialNumber2, 2);
      cartRobot.verifyBundleTotalPrice(
        bundleNumber,
        totalPrice.priceDisplay(currency),
      );
      cartRobot.verifyCartTotalPrice(totalPrice.priceDisplay(currency));

      await cartRobot.decreaseBundleItemQty(
        bundleNumber,
        bundleMaterialNumber1,
      );
      totalPrice = bundleTier1UnitPrice * 9;
      cartRobot.verifyBundleQty(bundleNumber, 9);
      cartRobot.verifyBundleRate(
        bundleNumber,
        bundleTier1Qty,
        bundleTier1UnitPriceDisplay,
      );
      cartRobot.verifyBundleItemQty(bundleNumber, bundleMaterialNumber1, 7);
      cartRobot.verifyBundleItemQty(bundleNumber, bundleMaterialNumber2, 2);
      cartRobot.verifyBundleTotalPrice(
        bundleNumber,
        totalPrice.priceDisplay(currency),
      );
      cartRobot.verifyCartTotalPrice(totalPrice.priceDisplay(currency));

      await cartRobot.increaseBundleItemQty(
        bundleNumber,
        bundleMaterialNumber2,
      );
      totalPrice = bundleTier2UnitPrice * 10;
      cartRobot.verifyBundleQty(bundleNumber, 10);
      cartRobot.verifyBundleRate(
        bundleNumber,
        bundleTier2Qty,
        bundleTier2UnitPriceDisplay,
      );
      cartRobot.verifyBundleItemQty(bundleNumber, bundleMaterialNumber1, 7);
      cartRobot.verifyBundleItemQty(bundleNumber, bundleMaterialNumber2, 3);
      cartRobot.verifyBundleTotalPrice(
        bundleNumber,
        totalPrice.priceDisplay(currency),
      );
      cartRobot.verifyCartTotalPrice(totalPrice.priceDisplay(currency));

      await cartRobot.changeBundleItemQty(
        bundleNumber,
        bundleMaterialNumber1,
        8,
      );
      cartRobot.verifyBundleQty(bundleNumber, 11);
      totalPrice = bundleTier2UnitPrice * 11;
      cartRobot.verifyBundleRate(
        bundleNumber,
        bundleTier2Qty,
        bundleTier2UnitPriceDisplay,
      );
      cartRobot.verifyBundleItemQty(bundleNumber, bundleMaterialNumber1, 8);
      cartRobot.verifyBundleItemQty(bundleNumber, bundleMaterialNumber2, 3);
      cartRobot.verifyBundleTotalPrice(
        bundleNumber,
        totalPrice.priceDisplay(currency),
      );
      cartRobot.verifyCartTotalPrice(totalPrice.priceDisplay(currency));
    });

    testWidgets(
        'EZRX-T115 | Verify cart when list of Product included Item in the order in Cart detail',
        (tester) async {
      const qty = 100;

      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      //verify
      await productSuggestionRobot
          .searchWithKeyboardAction(oosPreOrderMaterialNumber);
      await productSuggestionRobot.tapSearchResult(oosPreOrderMaterialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar();
      await productDetailRobot.tapCartButton();
      await cartRobot.verifyMaterial(oosPreOrderMaterialNumber);
      cartRobot.verifyMaterialOOSPreOrderStatus(oosPreOrderMaterialNumber);
      await cartRobot.changeMaterialQty(oosPreOrderMaterialNumber, qty);
      await cartRobot.tapCheckoutButton();
      oosPreOrderRobot.verifySheet(isVisible: true);
      oosPreOrderRobot.verifyCancelButton();
      oosPreOrderRobot.verifyContinueButton();
      oosPreOrderRobot.verifyWarningMessage();
      oosPreOrderRobot.verifyMaterial(oosPreOrderMaterialNumber, qty);
      await oosPreOrderRobot.tapCancelButton();
      cartRobot.verifyPage();
      oosPreOrderRobot.verifySheet(isVisible: false);
      await cartRobot.tapCheckoutButton();
      oosPreOrderRobot.verifyMaterial(oosPreOrderMaterialNumber, qty);
      await oosPreOrderRobot.tapContinueButton();
      checkoutRobot.verifyPage();
    });

    testWidgets(
        'EZRX-T101 | Verify Cart when having bonus product add to the cart',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      //verify
      await productSuggestionRobot
          .searchWithKeyboardAction(bonusMaterialNumber);
      await productSuggestionRobot.tapSearchResult(bonusMaterialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar();
      await productDetailRobot.tapCartButton();
      await cartRobot.verifyMaterial(bonusMaterialNumber);
      cartRobot.verifyMaterialQty(bonusMaterialNumber, 1);
      cartRobot.verifyMaterialOfferTag(bonusMaterialNumber);
      await cartRobot.changeMaterialQty(
        bonusMaterialNumber,
        bonusMaterialNumberTierQty,
      );
      await cartRobot.verifyBonusMaterial(
        bonusMaterialNumber,
        bonusMaterialNumber,
      );
      await cartRobot.verifyBonusMaterialQty(
        bonusMaterialNumber,
        bonusMaterialNumber,
        1,
      );
      cartRobot.verifyBonusMaterialFreeLabel(
        bonusMaterialNumber,
        bonusMaterialNumber,
      );
      cartRobot.verifyBonusMaterialTag(
        bonusMaterialNumber,
        bonusMaterialNumber,
      );
      cartRobot.verifyBonusMaterialDescription(
        bonusMaterialNumber,
        bonusMaterialNumber,
        bonusMaterialName,
      );
      cartRobot.verifyBonusMaterialImage(
        bonusMaterialNumber,
        bonusMaterialNumber,
      );
      var newBonusQty = 2;
      await cartRobot.changeMaterialQty(
        bonusMaterialNumber,
        bonusMaterialNumberTierQty * newBonusQty,
      );
      await cartRobot.verifyBonusMaterialQty(
        bonusMaterialNumber,
        bonusMaterialNumber,
        newBonusQty,
      );
      await cartRobot.decreaseBonusMaterialQty(
        bonusMaterialNumber,
        bonusMaterialNumber,
      );
      newBonusQty--;
      await cartRobot.verifyBonusMaterialQty(
        bonusMaterialNumber,
        bonusMaterialNumber,
        newBonusQty,
      );
      await cartRobot.increaseBonusMaterialQty(
        bonusMaterialNumber,
        bonusMaterialNumber,
      );
      newBonusQty++;
      await cartRobot.verifyBonusMaterialQty(
        bonusMaterialNumber,
        bonusMaterialNumber,
        newBonusQty,
      );
    });

    testWidgets(
        'EZRX-T105 | Verify display request counter offer for the product added to cart',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      //verify
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productSuggestionRobot.tapSearchResult(materialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.tapCartButton();
      await cartRobot.verifyMaterial(materialNumber);
      cartRobot.verifyMaterialUnitPrice(
        materialNumber,
        materialUnitPrice.priceDisplay(currency),
      );
      cartRobot.verifyMaterialCounterOfferButton(materialNumber);
      await cartRobot.tapMaterialCounterOfferButton(materialNumber);
      requestCounterOfferRobot.verifySheet(isVisible: true);
      requestCounterOfferRobot.verifyListPrice(
        materialUnitPrice.priceDisplay(currency),
        isVisible: false,
      );
      requestCounterOfferRobot.verifyOfferPrice(
        materialUnitPrice.priceDisplay(currency),
      );
      requestCounterOfferRobot.verifyPriceTextField();
      requestCounterOfferRobot.verifyPriceText('');
      requestCounterOfferRobot.verifyRemarkTextField();
      requestCounterOfferRobot.verifyRemarkText('');
      requestCounterOfferRobot.verifyRemarkMaximumLengthMessage();
      requestCounterOfferRobot.verifyConfirmButton();
      requestCounterOfferRobot.verifyCancelButton();
      await requestCounterOfferRobot.tapCancelButton();
      requestCounterOfferRobot.verifySheet(isVisible: false);
      cartRobot.verifyMaterialUnitPrice(
        materialNumber,
        materialUnitPrice.priceDisplay(currency),
      );
    });

    testWidgets(
        'EZRX-T106 | Verify request counter offer for the product added to cart',
        (tester) async {
      const newUnitPrice = materialUnitPrice + 100;
      const remark = 'AUTO-TEST';

      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      //verify
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productSuggestionRobot.tapSearchResult(materialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar();
      await productDetailRobot.tapCartButton();
      await cartRobot.verifyMaterial(materialNumber);
      cartRobot.verifyMaterialUnitPrice(
        materialNumber,
        materialUnitPrice.priceDisplay(currency),
      );
      cartRobot.verifyMaterialQty(materialNumber, 1);
      cartRobot.verifyMaterialCounterOfferButton(materialNumber);
      await cartRobot.tapMaterialCounterOfferButton(materialNumber);
      requestCounterOfferRobot.verifyListPrice(
        materialUnitPrice.priceDisplay(currency),
        isVisible: false,
      );
      requestCounterOfferRobot.verifyOfferPrice(
        materialUnitPrice.priceDisplay(currency),
      );
      await requestCounterOfferRobot.tapConfirmButton();
      requestCounterOfferRobot.verifyPriceTextEmptyMessage();
      await requestCounterOfferRobot.enterPrice(newUnitPrice.toString());
      await requestCounterOfferRobot.enterRemark(remark);
      await requestCounterOfferRobot.tapConfirmButton();
      requestCounterOfferRobot.verifySheet(isVisible: false);
      cartRobot.verifyMaterialUnitPrice(
        materialNumber,
        newUnitPrice.priceDisplay(currency),
      );
      await cartRobot.tapMaterialCounterOfferButton(materialNumber);
      requestCounterOfferRobot.verifyListPrice(
        materialUnitPrice.priceDisplay(currency),
        isVisible: false,
      );
      requestCounterOfferRobot
          .verifyOfferPrice(newUnitPrice.priceDisplay(currency));
      requestCounterOfferRobot.verifyPriceText(newUnitPrice.toStringAsFixed(1));
      requestCounterOfferRobot.verifyRemarkText(remark);
    });

    testWidgets('EZRX-T102 | Verify display bonus/sample item to the cart',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      //verify
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productSuggestionRobot.tapSearchResult(materialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.tapCartButton();
      await cartRobot.verifyMaterial(materialNumber);
      cartRobot.verifyMaterialBonusSampleButton(materialNumber);
      await cartRobot.tapMaterialBonusSampleButton(materialNumber);
      bonusSampleRobot.verifySheet(isVisible: true);
      bonusSampleRobot.verifySearchBar();
      await bonusSampleRobot.searchWithKeyboardAction(materialName);
      bonusSampleRobot.verifyBonusSampleItems();
      bonusSampleRobot.verifyCloseButton();
      await bonusSampleRobot.tapCloseButton();
      bonusSampleRobot.verifySheet(isVisible: false);
    });

    testWidgets(
        'EZRX-T104 | Verify add bonus/sample item to the cart with invalid quantity',
        (tester) async {
      const invalidQty = 1000;
      const materialIndex = 0;

      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      //verify
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productSuggestionRobot.tapSearchResult(materialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.tapCartButton();
      await cartRobot.verifyMaterial(materialNumber);
      cartRobot.verifyMaterialBonusSampleButton(materialNumber);
      await cartRobot.tapMaterialBonusSampleButton(materialNumber);
      await bonusSampleRobot.searchWithKeyboardAction(materialName);
      await bonusSampleRobot.tapSubmitButton(materialIndex);
      bonusSampleRobot.verifyEmptyQtyMessage(isVisible: true);
      await bonusSampleRobot.enterBonusSampleQty(materialIndex, invalidQty);
      await bonusSampleRobot.tapSubmitButton(materialIndex);
      bonusSampleRobot.verifyEmptyQtyMessage(isVisible: false);
      bonusSampleRobot.verifyInvalidQtyMessage();
    });

    testWidgets(
        'EZRX-T103 | Verify add bonus/sample item to the cart with valid quantity',
        (tester) async {
      const materialIndex = 0;
      const bonusSampleQty = 10;

      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      //verify
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productSuggestionRobot.tapSearchResult(materialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.tapCartButton();
      await cartRobot.verifyMaterial(materialNumber);
      cartRobot.verifyMaterialBonusSampleButton(materialNumber);
      await cartRobot.tapMaterialBonusSampleButton(materialNumber);
      await bonusSampleRobot.searchWithKeyboardAction(materialName);
      final bonusSampleMaterialNumber =
          bonusSampleRobot.getBonusSampleMaterialNumber(materialIndex);
      final bonusSampleMaterialDescription =
          bonusSampleRobot.getBonusSampleMaterialDescription(materialIndex);
      await bonusSampleRobot.enterBonusSampleQty(materialIndex, bonusSampleQty);
      await bonusSampleRobot.tapSubmitButton(materialIndex);
      bonusSampleRobot.verifyAddToCartSuccessMessage();
      await bonusSampleRobot.dismissSnackbar();
      await bonusSampleRobot.tapCloseButton();
      bonusSampleRobot.verifySheet(isVisible: false);
      await cartRobot.verifyBonusMaterial(
        materialNumber,
        bonusSampleMaterialNumber,
      );
      await cartRobot.verifyBonusMaterialQty(
        materialNumber,
        bonusSampleMaterialNumber,
        bonusSampleQty,
      );
      cartRobot.verifyBonusMaterialDescription(
        materialNumber,
        bonusSampleMaterialNumber,
        bonusSampleMaterialDescription,
      );
      cartRobot.verifyBonusMaterialFreeLabel(
        materialNumber,
        bonusSampleMaterialNumber,
      );
      cartRobot.verifyBonusMaterialTag(
        materialNumber,
        bonusSampleMaterialNumber,
      );
      cartRobot.verifyBonusMaterialImage(
        materialNumber,
        bonusSampleMaterialNumber,
      );
    });
  });

  group('Checkout - ', () {
    testWidgets('EZRX-T116 | Verify display Checkout screen', (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await checkoutWithMaterial(materialNumber, 1);

      //verify
      checkoutRobot.verifyPage();
      checkoutRobot.verifyAddressSection();
      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      await checkoutRobot.verifyDeliveryDateField(isVisible: false);
      await checkoutRobot.verifyReferenceNoteField(isVisible: false);
      await checkoutRobot.verifyPaymentTermField(isVisible: false);
      await checkoutRobot.verifyContactPersonField(isVisible: false);
      await checkoutRobot.verifyMobileNumberField(isVisible: false);
      await checkoutRobot.verifyDeliveryInstructionField(isVisible: true);
      await checkoutRobot.verifyPoAttachmentSection(isVisible: false);
      await checkoutRobot.verifyYoursItemLabel(1);
      await checkoutRobot.verifyMaterial(materialNumber);
      await checkoutRobot
          .verifySubTotalLabel(materialUnitPrice.priceDisplay(currency));
      await checkoutRobot
          .verifyGrandTotalLabel(materialUnitPrice.priceDisplay(currency));
      checkoutRobot.verifyStickyTotalQty(1);
      checkoutRobot
          .verifyStickyGrandTotal(materialUnitPrice.priceDisplay(currency));
      checkoutRobot.verifyPlaceOrderButton();
    });

    testWidgets(
        'EZRX-T117 | Verify the customer code & deliver to in Order for [Selected address] in Checkout page',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await checkoutWithMaterial(materialNumber, 1);

      //verify
      checkoutRobot.verifyAddressSection();
      checkoutRobot.verifyCustomerCode(customerCode);
      checkoutRobot.verifyDeliveryTo(shipToCode);
    });

    testWidgets('EZRX-T118 | Validate textbox fields in Checkout page',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await checkoutWithMaterial(materialNumber, 1);

      //verify
      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      await checkoutRobot.verifyDeliveryInstructionField(isVisible: true);
      await checkoutRobot.tapDeliveryInformationArrowButton();
      await checkoutRobot.verifyPoReferenceField(isVisible: false);
      await checkoutRobot.verifyDeliveryInstructionField(isVisible: false);
      await checkoutRobot.tapDeliveryInformationArrowButton();
      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      await checkoutRobot.enterPoReference(poReference);
      await checkoutRobot.verifyDeliveryInstructionField(isVisible: true);
      await checkoutRobot.enterDeliveryInstruction(deliveryInstruction);
      await checkoutRobot.tapPlaceOrderButton();
      orderSuccessRobot.verifyPage();
      orderSuccessRobot.verifyPoReference(poReference);
      orderSuccessRobot.verifyDeliveryInstruction(deliveryInstruction);
    });

    testWidgets(
        'EZRX-T121 | Verify click on Place order without inputting any textbox field',
        (tester) async {
      const emptyPoReference = 'NA';
      const emptyDeliveryInstruction = 'NA';

      //init app
      await pumpAppWithHomeScreen(tester);
      await checkoutWithMaterial(materialNumber, 1);

      //verify
      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      await checkoutRobot.tapPlaceOrderButton();
      checkoutRobot.verifyEmptyPoReferenceMessage(isVisible: false);
      orderSuccessRobot.verifyPage();
      orderSuccessRobot.verifyPoReference(emptyPoReference);
      orderSuccessRobot.verifyDeliveryInstruction(emptyDeliveryInstruction);
    });

    testWidgets(
        'EZRX-T122 | Verify show Order Summary when click on Grand Total price',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await checkoutWithMaterial(materialNumber, 1);

      //verify
      await checkoutRobot.tapStickyGrandTotal();
      orderPriceSummaryRobot.verifySheet(isVisible: true);
      orderPriceSummaryRobot
          .verifySubTotalLabel(materialUnitPrice.priceDisplay(currency));
      orderPriceSummaryRobot
          .verifyGrandTotalLabel(materialUnitPrice.priceDisplay(currency));
      await orderPriceSummaryRobot.tapCloseButton();
      orderPriceSummaryRobot.verifySheet(isVisible: false);
    });

    testWidgets('EZRX-T126 | Verify Close Order submmitted! page',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await checkoutWithMaterial(materialNumber, 1);

      //verify
      await checkoutRobot.tapPlaceOrderButton();
      await orderSuccessRobot.dismissSnackbar();
      await orderSuccessRobot.tapCloseButton();
      productRobot.verifyPageVisible();
      await productRobot.tapCartButton();
      cartRobot.verifyPage();
      cartRobot.verifyNoRecordFound();
    });

    testWidgets(
        'EZRX-T124 | Verify the customer code & deliver to in Order for [Selected address] in Order submmitted! page',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await checkoutWithMaterial(materialNumber, 1);

      //verify
      await checkoutRobot.tapPlaceOrderButton();
      orderSuccessRobot.verifyCustomerCode(customerCode);
      orderSuccessRobot.verifyDeliveryTo(shipToCode);
      orderSuccessRobot.verifyOrderAddress(shipToAddress);
    });

    testWidgets('EZRX-T119 | Verify display Product in Checkout page',
        (tester) async {
      const newUnitPrice = materialUnitPrice + 100;

      //init app
      await pumpAppWithHomeScreen(tester);
      await checkoutWithMaterial(materialNumber, 1);

      //verify
      await checkoutRobot.verifyMaterialPrincipal(materialPrincipalName);
      await checkoutRobot.verifyMaterial(materialNumber);
      checkoutRobot.verifyMaterialQty(materialNumber, 1);
      checkoutRobot.verifyMaterialDescription(materialNumber, materialName);
      checkoutRobot.verifyMaterialImage(materialNumber);
      checkoutRobot.verifyMaterialUnitPrice(
        materialNumber,
        materialUnitPrice.priceDisplay(currency),
      );
      checkoutRobot.verifyMaterialTotalPrice(
        materialNumber,
        materialUnitPrice.priceDisplay(currency),
      );
      checkoutRobot.verifyMaterialCounterOfferLabel(
        materialNumber,
        isVisible: false,
      );
      await checkoutRobot.tapCloseButton();
      await cartRobot.tapMaterialCounterOfferButton(materialNumber);
      await requestCounterOfferRobot.enterPrice(newUnitPrice.toString());
      await requestCounterOfferRobot.tapConfirmButton();
      await cartRobot.tapCheckoutButton();
      await checkoutRobot.verifyMaterial(materialNumber);
      checkoutRobot.verifyMaterialUnitPrice(
        materialNumber,
        newUnitPrice.priceDisplay(currency),
      );
      checkoutRobot.verifyMaterialTotalPrice(
        materialNumber,
        newUnitPrice.priceDisplay(currency),
      );
      checkoutRobot.verifyMaterialCounterOfferLabel(
        materialNumber,
        isVisible: true,
      );
      await checkoutRobot
          .verifySubTotalLabel(newUnitPrice.priceDisplay(currency));
      await checkoutRobot
          .verifyGrandTotalLabel(newUnitPrice.priceDisplay(currency));
      checkoutRobot.verifyStickyTotalQty(1);
      checkoutRobot.verifyStickyGrandTotal(newUnitPrice.priceDisplay(currency));
    });

    testWidgets('EZRX-T120 | Verify display Bundle in Checkout page',
        (tester) async {
      const bundleMaterialQty1 = 3;
      const bundleMaterialQty2 = 2;
      const bundleTotalQty = bundleMaterialQty1 + bundleMaterialQty2;
      const bundleTotalPrice = bundleTotalQty * bundleTier1UnitPrice;

      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();
      await productSuggestionRobot.searchWithKeyboardAction(bundleShortNumber);
      await productSuggestionRobot.tapSearchResult(bundleShortNumber);
      await bundleDetailRobot.tapAddToCartButton();
      await bundleDetailRobot.enterMaterialQty(
        bundleMaterialNumber1,
        bundleMaterialQty1,
      );
      await bundleDetailRobot.enterMaterialQty(
        bundleMaterialNumber2,
        bundleMaterialQty2,
      );
      await bundleDetailRobot.tapSheetAddToCartButton();
      await bundleDetailRobot.tapCartButton();
      await cartRobot.tapCheckoutButton();
      await oosPreOrderRobot.tapContinueButton();

      //verify
      await checkoutRobot.verifyBundle(bundleNumber);
      checkoutRobot.verifyBundleName(bundleNumber, bundleName);
      checkoutRobot.verifyBundleRate(
        bundleNumber,
        bundleTier1Qty,
        bundleTier1UnitPriceDisplay,
      );
      await checkoutRobot.verifyBundleItem(bundleNumber, bundleMaterialNumber1);
      checkoutRobot.verifyBundleItemImage(bundleNumber, bundleMaterialNumber1);
      checkoutRobot.verifyBundleItemDescription(
        bundleNumber,
        bundleMaterialNumber1,
        bundleMaterialName1,
      );
      checkoutRobot.verifyBundleItemPrincipal(
        bundleNumber,
        bundleMaterialNumber1,
        bundleMaterialPrincipalName1,
      );
      checkoutRobot.verifyBundleItemQty(
        bundleNumber,
        bundleMaterialNumber1,
        bundleMaterialQty1,
      );
      await checkoutRobot.verifyBundleItem(bundleNumber, bundleMaterialNumber2);
      checkoutRobot.verifyBundleItemImage(bundleNumber, bundleMaterialNumber2);
      checkoutRobot.verifyBundleItemDescription(
        bundleNumber,
        bundleMaterialNumber2,
        bundleMaterialName2,
      );
      checkoutRobot.verifyBundleItemPrincipal(
        bundleNumber,
        bundleMaterialNumber2,
        bundleMaterialPrincipalName2,
      );
      checkoutRobot.verifyBundleItemQty(
        bundleNumber,
        bundleMaterialNumber2,
        bundleMaterialQty2,
      );
      checkoutRobot.verifyBundleTotalQty(
        bundleNumber,
        bundleTotalQty,
      );
      await checkoutRobot
          .verifySubTotalLabel(bundleTotalPrice.priceDisplay(currency));
      await checkoutRobot
          .verifyGrandTotalLabel(bundleTotalPrice.priceDisplay(currency));
      checkoutRobot.verifyBundleTotalPrice(
        bundleNumber,
        bundleTotalPrice.priceDisplay(currency),
      );
      checkoutRobot.verifyStickyTotalQty(2);
      checkoutRobot
          .verifyStickyGrandTotal(bundleTotalPrice.priceDisplay(currency));
    });

    testWidgets('EZRX-T123 | Verify display Order Summited page',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await checkoutWithMaterial(materialNumber, 1);

      //verify
      await checkoutRobot.tapPlaceOrderButton();
      orderSuccessRobot.verifyPage();
      orderSuccessRobot.verifyOrderSubmittedMessage();
      await orderSuccessRobot.dismissSnackbar();
      orderSuccessRobot.verifyOrderId();
      orderSuccessRobot.verifyOrderDate();
      await orderSuccessRobot.verifyOrderSummarySection();
      await orderSuccessRobot.verifyOrderItemsSection();
    });

    testWidgets('EZRX-T125 | Verify display Product in Order submmitted! page',
        (tester) async {
      const materialIndex = 0;

      //init app
      await pumpAppWithHomeScreen(tester);
      await checkoutWithMaterial(materialNumber, 1);

      //verify
      await checkoutRobot
          .verifySubTotalLabel(materialUnitPrice.priceDisplay(currency));
      await checkoutRobot
          .verifyGrandTotalLabel(materialUnitPrice.priceDisplay(currency));
      checkoutRobot.verifyStickyTotalQty(1);
      checkoutRobot
          .verifyStickyGrandTotal(materialUnitPrice.priceDisplay(currency));
      await checkoutRobot.tapPlaceOrderButton();
      await orderSuccessRobot.dismissSnackbar();
      await orderSuccessRobot.verifyOrderSummarySection();
      await orderSuccessRobot
          .verifySubTotal(materialUnitPrice.priceDisplay(currency));
      await orderSuccessRobot
          .verifyGrandTotal(materialUnitPrice.priceDisplay(currency));
      await orderSuccessRobot.verifyOrderItemsSection();
      await orderSuccessRobot.verifyOrderItemTotalQty(1);
      await orderSuccessRobot.verifyItem(materialIndex);
      orderSuccessRobot.verifyItemMaterialNumber(materialIndex, materialNumber);
      orderSuccessRobot.verifyItemMateriaDescription(
        materialIndex,
        materialName,
      );
      orderSuccessRobot.verifyItemQty(materialIndex, 1);
      orderSuccessRobot.verifyItemUnitPrice(
        materialIndex,
        materialUnitPrice.priceDisplay(currency),
      );
      orderSuccessRobot.verifyItemTotalPrice(
        materialIndex,
        materialUnitPrice.priceDisplay(currency),
      );
    });
  });

  group('Order Tab -', () {
    final fromDate = DateTime.now().subtract(const Duration(days: 150));
    final toDate = DateTime.now().subtract(const Duration(days: 2));

    group('View by items -', () {
      const statusFilter = 'Order Created';

      testWidgets('EZRX-T69 | Verify display items in Orders tab',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyTabBar();
        ordersRootRobot.verifyViewByItemsPage();
        ordersRootRobot.verifySearchBar();
        ordersRootRobot.verifyFilterButton();
        ordersRootRobot.verifyFilterApplied(0);
        await ordersRootRobot.switchToViewByOrders();
        ordersRootRobot.verifyViewByOrdersPage();
        ordersRootRobot.verifySearchBar();
        ordersRootRobot.verifyFilterButton();
        ordersRootRobot.verifyFilterApplied(0);
        await ordersRootRobot.switchToViewByItems();
        ordersRootRobot.verifyViewByItemsPage();
      });

      testWidgets(
          'EZRX-T70 | Verify display items in View by items tab with data available',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyFilterApplied(0);
        await ordersRootRobot.tapFilterButton();
        viewByItemsFilterRobot.verifyApplyButton();
        viewByItemsFilterRobot.verifyResetButton();
        viewByItemsFilterRobot.verifyDefaultFilterApplied();
        await viewByItemsFilterRobot.tapCloseIcon();
        viewByItemsRobot.verifyOrders();
        await commonRobot.pullToRefresh();
        viewByItemsRobot.verifyOrders();
      });

      testWidgets(
          'EZRX-T73 | Verify display items in View by items tab with no data available',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyFilterApplied(0);
        await ordersRootRobot.tapFilterButton();
        viewByItemsFilterRobot.verifyApplyButton();
        viewByItemsFilterRobot.verifyResetButton();
        viewByItemsFilterRobot.verifyDefaultFilterApplied();
        await viewByItemsFilterRobot.tapCloseIcon();
        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        viewByItemsRobot.verifyNoRecordFound();
        await commonRobot.pullToRefresh();
        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        viewByItemsRobot.verifyNoRecordFound();
      });

      testWidgets(
          'EZRX-T75 | Verify search Orders by inputting keyword contains material name in View by items tab',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();
        await commonRobot.searchWithKeyboardAction(invalidLengthSearchKey);
        commonRobot.verifyInvalidLengthSearchMessage();
        final productName = viewByItemsRobot.getFirstProductName();
        await commonRobot.searchWithKeyboardAction(productName);
        viewByItemsRobot.verifyOrdersWithProductName(productName);
      });

      testWidgets(
          'EZRX-T76 | Verify search Orders by inputting keyword contains material code in View by items tab',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();
        final materialNumber = viewByItemsRobot.getFirstProductId();
        await commonRobot.searchWithKeyboardAction(materialNumber);
        viewByItemsRobot.verifyOrdersWithProductCode(materialNumber);
      });

      testWidgets(
          'EZRX-T77 | Verify search my order history by inputting keyword contains Order code in View by items tab',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();
        final orderCode = viewByItemsRobot.getFirstOrderId();
        await commonRobot.searchWithKeyboardAction(orderCode);
        viewByItemsRobot.verifyOrdersWithOrderCode(orderCode);
      });

      testWidgets(
          'EZRX-T79 | Verify search my order history by inputting keyword not contain material name/code/order code in View by items tab',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();
        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        viewByItemsRobot.verifyNoRecordFound();
        await commonRobot.tapClearSearch();
        viewByItemsRobot.verifyOrders();
      });

      testWidgets(
          'EZRX-T81 | Verify Filter by date when having result found in View by items tab',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();
        await ordersRootRobot.tapFilterButton();
        await viewByItemsFilterRobot.tapFromDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
        );
        await viewByItemsFilterRobot.tapApplyButton();
        ordersRootRobot.verifyFilterApplied(1);
        viewByItemsRobot.verifyOrderGroupInDateRange(
          fromDate: fromDate,
          toDate: toDate,
        );
        await ordersRootRobot.tapFilterButton();
        viewByItemsFilterRobot.verifyDateRangeFilterApplied(
          fromDate.displayDate,
          toDate.displayDate,
        );
      });

      testWidgets(
          'EZRX-T82 | Verify Filter by date when not having result found in View by items tab',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();
        await ordersRootRobot.tapFilterButton();
        await viewByItemsFilterRobot.tapToDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
        );
        await viewByItemsFilterRobot.tapApplyButton();
        ordersRootRobot.verifyFilterApplied(1);
        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        viewByItemsRobot.verifyNoRecordFound();
      });

      testWidgets(
          'EZRX-T85 | Verify Filter by status when selecting 1 checkbox and existing data available',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();
        await ordersRootRobot.tapFilterButton();
        await viewByItemsFilterRobot.tapFromDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
        );
        await viewByItemsFilterRobot.tapStatusCheckbox(statusFilter);
        viewByItemsFilterRobot.verifyStatusFilterValue(statusFilter, true);
        await viewByItemsFilterRobot.tapStatusCheckbox(statusFilter);
        viewByItemsFilterRobot.verifyStatusFilterValue(statusFilter, false);
        await viewByItemsFilterRobot.tapStatusCheckbox(statusFilter);
        viewByItemsFilterRobot.verifyStatusFilterValue(statusFilter, true);
        await viewByItemsFilterRobot.tapApplyButton();
        ordersRootRobot.verifyFilterApplied(2);
        viewByItemsRobot.verifyOrderGroupInDateRange(
          fromDate: fromDate,
          toDate: toDate,
        );
        viewByItemsRobot.verifyOrderGroups();
        viewByItemsRobot.verifyOrderItems();
      });

      testWidgets(
          'EZRX-T86 | Verify Filter by status when selecting 1 checkbox and data is unavailable in View by items tab',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();
        await ordersRootRobot.tapFilterButton();
        await viewByItemsFilterRobot.tapFromDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
        );
        await viewByItemsFilterRobot.tapStatusCheckbox(statusFilter);
        viewByItemsFilterRobot.verifyStatusFilterValue(statusFilter, true);
        await viewByItemsFilterRobot.tapApplyButton();
        ordersRootRobot.verifyFilterApplied(2);
        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        viewByItemsRobot.verifyNoRecordFound();
        await commonRobot.pullToRefresh();
        ordersRootRobot.verifyFilterApplied(0);
        viewByItemsRobot.verifyOrderGroups();
        viewByItemsRobot.verifyOrderItems();
      });

      testWidgets('EZRX-T87 | Verify Order detail via View by items tab',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();
        await viewByItemsRobot.tapFirstOrder();
        viewByItemsDetailRobot.verifyHeader();
        viewByItemsDetailRobot.verifyStatusTracker();
        viewByItemsDetailRobot.verifyAddress();
        await viewByItemsDetailRobot.dragToEnsureItemsVisible();
      });

      testWidgets(
          'EZRX-T91 | Verify item Bonus in order detail via View by items tab',
          (tester) async {
        const validMOVQty = bonusMaterialNumberTierQty * 10;

        //init app
        await pumpAppWithHomeScreen(tester);
        await homeRobot.tapMiniCartIcon();
        await cartRobot.clearCart();
        await cartRobot.tapBrowseProductButton();
        await productRobot.openSearchProductScreen();
        await productSuggestionRobot
            .searchWithKeyboardAction(bonusMaterialNumber);
        await productSuggestionRobot.tapSearchResult(bonusMaterialNumber);
        await productDetailRobot.tapAddToCart();
        await productDetailRobot.tapCartButton();
        await cartRobot.changeMaterialQty(bonusMaterialNumber, validMOVQty);
        await cartRobot.tapCheckoutButton();
        await oosPreOrderRobot.tapContinueButton();
        await checkoutRobot.tapPlaceOrderButton();
        await orderSuccessRobot.tapCloseButton();
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();
        await commonRobot.pullToRefresh();
        viewByItemsRobot.verifyBonusLabel();
        await viewByItemsRobot.tapFirstBonusLabel();
        viewByItemsDetailRobot.verifyHeader();
        viewByItemsDetailRobot.verifyStatusTracker();
        viewByItemsDetailRobot.verifyAddress();
        await viewByItemsDetailRobot.dragToEnsureItemsVisible();
        viewByItemsDetailRobot.verifyBonusLabelVisible();
      });
    });

    group('View by orders - ', () {
      testWidgets(
          'EZRX-T71 | Verify display items in View by orders tab with data available',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);
        await ordersRootRobot.switchToViewByOrders();

        //verify
        ordersRootRobot.verifyViewByOrdersPage();
        ordersRootRobot.verifyFilterApplied(0);
        await ordersRootRobot.tapFilterButton();
        viewByOrdersFilterRobot.verifyApplyButtonVisible();
        viewByOrdersFilterRobot.verifyResetButtonVisible();
        viewByOrdersFilterRobot.verifyDefaultFilterApplied();
        await viewByOrdersFilterRobot.tapCloseIcon();
        viewByOrdersRobot.verifyOrders();
        await commonRobot.pullToRefresh();
        viewByOrdersRobot.verifyOrders();
      });

      testWidgets(
          'EZRX-T74 | Verify display items in View by orders tab with no data available with auto search feature',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);
        await ordersRootRobot.switchToViewByOrders();

        //verify
        ordersRootRobot.verifyViewByOrdersPage();
        ordersRootRobot.verifyFilterApplied(0);
        viewByOrdersRobot.verifyOrders();
        final orderId = viewByOrdersRobot.getOrderIdText(index: 0);
        await commonRobot.autoSearch(invalidSearchKey);
        viewByOrdersRobot.verifyNoRecordFound();
        await commonRobot.autoSearch(invalidLengthSearchKey);
        commonRobot.verifyInvalidLengthSearchMessage(isVisible: false);
        viewByOrdersRobot.verifyNoRecordFound();
        await commonRobot.autoSearch(orderId);
        viewByOrdersRobot.verifyOrders();
      });

      testWidgets(
          'EZRX-T78 | Verify search my order history by inputting keyword contains Order code in View by orders tab',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);
        await ordersRootRobot.switchToViewByOrders();

        //verify
        final orderId = viewByOrdersRobot.getOrderIdText(index: 0);
        viewByOrdersRobot.verifyOrders();
        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        viewByOrdersRobot.verifyNoRecordFound();
        await commonRobot.searchWithKeyboardAction(invalidLengthSearchKey);
        commonRobot.verifyInvalidLengthSearchMessage();
        viewByOrdersRobot.verifyNoRecordFound();
        await commonRobot.searchWithKeyboardAction(orderId);
        viewByOrdersRobot.verifyOrdersWithOrderCode(orderId);
        await commonRobot.waitAutoSearchDuration();
        commonRobot.verifyLoadingImage(isVisible: false);
      });

      testWidgets(
          'EZRX-T80 | Verify search my order history by inputting keyword not contain order code in View by orders tab',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);
        await ordersRootRobot.switchToViewByOrders();

        //verify
        viewByOrdersRobot.verifyOrders();
        await commonRobot.searchWithSearchIcon(invalidSearchKey);
        viewByOrdersRobot.verifyNoRecordFound();
        await commonRobot.waitAutoSearchDuration();
        commonRobot.verifyLoadingImage(isVisible: false);
        await commonRobot.tapClearSearch();
        viewByOrdersRobot.verifyOrders();
        await commonRobot.searchWithSearchIcon(invalidLengthSearchKey);
        commonRobot.verifyInvalidLengthSearchMessage();
      });

      testWidgets(
          'EZRX-T83 | Verify Filter by date when no having result found in View by orders tab',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);
        await ordersRootRobot.switchToViewByOrders();

        //verify
        await ordersRootRobot.tapFilterButton();
        await viewByOrdersFilterRobot.tapFromDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
        );
        await viewByOrdersFilterRobot.tapApplyButton();
        ordersRootRobot.verifyFilterApplied(1);
        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        viewByOrdersRobot.verifyNoRecordFound();
      });

      testWidgets(
          'EZRX-T84 | Verify Filter by date when having result found in View by orders tab',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);
        await ordersRootRobot.switchToViewByOrders();

        //verify
        await ordersRootRobot.tapFilterButton();
        await viewByOrdersFilterRobot.tapToDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
        );
        await viewByOrdersFilterRobot.tapApplyButton();
        ordersRootRobot.verifyFilterApplied(1);
        viewByOrdersRobot.verifyOrderGroupInDateRange(
          fromDate: fromDate,
          toDate: toDate,
        );
      });

      testWidgets('EZRX-T217 | Verify click on reset button in filter',
          (tester) async {
        const index = 0;
        final fromDate = DateTime.now().subtract(const Duration(days: 100));
        final toDate = DateTime.now().subtract(const Duration(days: 99));

        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);
        await ordersRootRobot.switchToViewByOrders();

        //verify
        ordersRootRobot.verifyFilterApplied(0);
        viewByOrdersRobot.verifyOrders();
        final orderId = viewByOrdersRobot.getOrderIdText(index: index);
        await ordersRootRobot.tapFilterButton();
        await viewByOrdersFilterRobot.tapToDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
        );
        await viewByOrdersFilterRobot.tapApplyButton();
        viewByOrdersRobot.verifyOrderIdText(
          orderId,
          index: index,
          isVisible: false,
        );
        await ordersRootRobot.tapFilterButton();
        await viewByOrdersFilterRobot.tapResetButton();
        viewByOrdersRobot.verifyOrders();
        viewByOrdersRobot.verifyOrderIdText(
          orderId,
          index: index,
          isVisible: true,
        );
        await ordersRootRobot.tapFilterButton();
        viewByOrdersFilterRobot.verifyDefaultFilterApplied();
      });

      testWidgets('EZRX-T88 | Verify Order detail via View by orders tab',
          (tester) async {
        const qty = 2;
        final price = (materialUnitPrice * qty).priceDisplay(currency);

        //init app
        await pumpAppWithHomeScreen(tester);
        await checkoutWithMaterial(materialNumber, qty);
        await checkoutRobot.verifyPoReferenceField(isVisible: true);
        await checkoutRobot.enterPoReference(poReference);
        await checkoutRobot.verifyDeliveryInstructionField(isVisible: true);
        await checkoutRobot.enterDeliveryInstruction(deliveryInstruction);
        await checkoutRobot.tapPlaceOrderButton();
        await orderSuccessRobot.tapCloseButton();
        await commonRobot.navigateToScreen(NavigationTab.orders);
        await ordersRootRobot.switchToViewByOrders();

        //verify
        await commonRobot.pullToRefresh();
        final orderId = viewByOrdersRobot.getOrderIdText(index: 0);
        await viewByOrdersRobot.tapFirstOrder();
        viewByOrdersDetailRobot.verifyOrderIdVisible(orderId);
        viewByOrdersDetailRobot.verifyOrderDateVisible();
        viewByOrdersDetailRobot.verifyPoReferenceVisible(poReference);
        viewByOrdersDetailRobot
            .verifyDeliveryInstructionsVisible(deliveryInstruction);
        viewByOrdersDetailRobot.verifyOrderAddressVisible(shipToAddress);
        viewByOrdersDetailRobot.verifyCustomerCodeVisible(customerCode);
        viewByOrdersDetailRobot.verifyDeliveryToVisible(shipToCode);
        await viewByOrdersDetailRobot.dragToVerifySummaryVisible();
        viewByOrdersDetailRobot.verifySubTotalVisible(price);
        viewByOrdersDetailRobot.verifyGrandTotalVisible(price);
        await viewByOrdersDetailRobot.dragToVerifyItemsSectionVisible();
        await viewByOrdersDetailRobot.verifyMaterialVisible(
          materialNumber,
          qty,
          price,
        );
        viewByOrdersDetailRobot.verifyBuyAgainButtonVisible();
      });

      testWidgets('EZRX-T72 | Verify click on Buy again in View by orders tab',
          (tester) async {
        const qty = 2;
        //init app
        await pumpAppWithHomeScreen(tester);
        await checkoutWithMaterial(materialNumber, qty);
        await checkoutRobot.tapPlaceOrderButton();
        await orderSuccessRobot.tapCloseButton();
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        await ordersRootRobot.switchToViewByOrders();
        await commonRobot.pullToRefresh();
        await viewByOrdersRobot.tapFirstBuyAgainButton();
        cartRobot.verifyPage();
        await cartRobot.verifyMaterial(materialNumber);
        cartRobot.verifyMaterialQty(materialNumber, qty);
      });

      testWidgets(
          'EZRX-T90 | Verify click on Buy again in Order detail via View by orders tab when having existing items in Cart',
          (tester) async {
        const orderQty = 2;
        const cartQty = 3;
        //init app
        await pumpAppWithHomeScreen(tester);

        //setup data
        await checkoutWithMaterial(materialNumber, orderQty);
        await checkoutRobot.tapPlaceOrderButton();
        await orderSuccessRobot.tapCloseButton();
        await commonRobot.navigateToScreen(NavigationTab.products);
        await productRobot.openSearchProductScreen();
        await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
        await productSuggestionRobot.tapSearchResult(materialNumber);
        await productDetailRobot.tapAddToCart();
        await productDetailRobot.dismissSnackbar();
        await productDetailRobot.tapCartButton();
        await cartRobot.changeMaterialQty(materialNumber, cartQty);
        await cartRobot.tapCloseButton();
        await productDetailRobot.tapBackButton();
        await productSuggestionRobot.tapToBackScreen();
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        await ordersRootRobot.switchToViewByOrders();
        await commonRobot.pullToRefresh();
        await viewByOrdersRobot.tapFirstOrder();
        await viewByOrdersDetailRobot.tapBuyAgainButton();
        cartRobot.verifyPage();
        await cartRobot.verifyMaterial(materialNumber);
        cartRobot.verifyMaterialQty(materialNumber, orderQty + cartQty);
        // TODO: Revist when popup 'Reoder for this delivery address? is added to add new test step
      });
    });
  });

  group('Profile -', () {
    void verifyAllComponentsVisible() {
      profileRobot.verifyAccountAndBusinessDetailsVisible(
        firstName: 'MYClientUser',
        lastName: 'User91',
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
    const userNameInitValue = 'MYClientUser User91';
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

  tearDown(() async {
    locator<ZephyrService>().setNameAndStatus();
    await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  });
}
