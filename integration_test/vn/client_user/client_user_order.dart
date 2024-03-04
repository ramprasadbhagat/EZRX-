import 'package:ezrxmobile/locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../core/common.dart';
import '../../core/infrastructure/infra_core/zephyr_service/zephyr_service.dart';
import '../../core/infrastructure/zephyr/repository/zephyr_repository.dart';
import '../../robots/announcement_article/announcement_article_root_robot.dart';
import '../../robots/auth/forgot_password_robot.dart';
import '../../robots/common/common_robot.dart';
import '../../robots/common/enum.dart';
import '../../robots/common/extension.dart';
import '../../robots/home/customer_search_robot.dart';
import '../../robots/home/home_robot.dart';
import '../../robots/login_robot.dart';
import '../../robots/more/more_robot.dart';
import '../../robots/notification/notification_robot.dart';
import '../../robots/orders/cart/bonus_sample_robot.dart';
import '../../robots/orders/cart/cart_delivery_address_robot.dart';
import '../../robots/orders/cart/cart_robot.dart';
import '../../robots/orders/cart/oos_pre_order_robot.dart';
import '../../robots/orders/cart/request_counter_offer_robot.dart';
import '../../robots/orders/checkout/checkout_robot.dart';
import '../../robots/orders/checkout/order_price_summary_robot.dart';
import '../../robots/orders/checkout/order_success_robot.dart';
import '../../robots/orders/orders_root_robot.dart';
import '../../robots/orders/view_by_items/view_by_items_detail_robot.dart';
import '../../robots/orders/view_by_items/view_by_items_filter_robot.dart';
import '../../robots/orders/view_by_items/view_by_items_robot.dart';
import '../../robots/orders/view_by_orders/view_by_orders_detail_robot.dart';
import '../../robots/payments/account_summary/account_invoice/account_invoice_detail_robot.dart';
import '../../robots/payments/payment_summary/payment_detail_robot.dart';
import '../../robots/orders/view_by_orders/view_by_orders_filter_robot.dart';
import '../../robots/orders/view_by_orders/view_by_orders_robot.dart';
import '../../robots/payments/payment_home_robot.dart';
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
  late NotificationRobot notificationRobot;
  late MoreRobot moreRobot;

  late ProductRobot productRobot;
  late ProductDetailRobot productDetailRobot;
  late FilterSortProductRobot filterSortProductRobot;
  late ProductSuggestionRobot productSuggestionRobot;
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
  late PaymentSummaryDetailRobot paymentDetailRobot;
  late AccountInvoiceDetailRobot accountInvoiceDetailRobot;
  late AnnouncementArticleRootRobot announcementArticleRootRobot;

  void initializeRobot(WidgetTester tester) {
    commonRobot = CommonRobot(tester);
    loginRobot = LoginRobot(tester);
    forgotPasswordRobot = ForgotPasswordRobot(tester);
    homeRobot = HomeRobot(tester);
    customerSearchRobot = CustomerSearchRobot(tester);
    moreRobot = MoreRobot(tester);
    notificationRobot = NotificationRobot(tester);

    productRobot = ProductRobot(tester);
    productDetailRobot = ProductDetailRobot(tester);
    filterSortProductRobot = FilterSortProductRobot(tester);
    productSuggestionRobot = ProductSuggestionRobot(tester);
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
    paymentDetailRobot = PaymentSummaryDetailRobot(tester);
    accountInvoiceDetailRobot = AccountInvoiceDetailRobot(tester);

    announcementArticleRootRobot = AnnouncementArticleRootRobot(tester);
  }

  const market = 'Vietnam';
  const username = 'auto_client_user';
  const password = 'Pa55word@1234';
  const customerCode = '0000102668';
  const shipToAddress = 'LG VINA COSMETICS CO., LTD';
  const shipToCode = '0071192102';
  const otherShipToCode = '0000003070';

  const billToCustomerCode = '0030277787';
  const billToShipToCode = '0071205149';
  const billToOrderAddress = 'Cong Ty TNHH Xuan Thuy';
  const billToAddress = 'Bach Mai P. Cau Den';
  const billToName = 'Cong Ty TNHH Xuan Thuy   ';
  const billToEmail = 'NA';
  const billToTaxNumber = 'NA';
  const billToPhoneNumber = '01693200644';

  const currency = 'VND';
  const invalidLengthSearchKey = '1';
  const invalidSearchKey = 'auto-test-auto-test';
  const invalidNumberSearchKey = '1231762381236123';
  const minOrderAmount = 1000000.0;
  const tax = 5; // please note it is not vat value, it's material tax

  const materialNumber = '21248715';
  const materialName = 'ALINITY I ANTI-HBC IGM CALIBRATORS';
  const materialPrincipalName = 'Abbott GmbH Co. KG';
  const materialCountryOfOrigin = 'United Kingdom';
  const materialUnitMeasurement = 'EA';
  const materialUnitPrice = 2253100.0;
  const multiImageMaterialNumber = '21248715';
  const otherInfoMaterialNumber = '21128190';
  const suspendedMaterialNumber = '21253250';
  const lowPriceMaterialNumber = '21230973';
  const lowPriceMaterialUnitPrice = 460693.0;
  const oosPreOrderMaterialNumber = '21128190';
  const bonusMaterialNumber = '21230896';
  const bonusMaterialNumberTierQty = 10;
  const bonusMaterialNumberUnitPrice = 2156000;
  const bonusMaterialName = 'ARCHITECT CA 19-9XR RGT 400TEST';

  const poReference = 'Auto-test-po-reference';
  const deliveryInstruction = 'Auto-test-delivery-instruction';
  const dateFormat = 'dd/MM/yyyy';

  var loginRequired = true;

  Future<void> pumpAppWithHomeScreen(
    WidgetTester tester, {
    String shipToCode = shipToCode,
  }) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    if (loginRequired) {
      await loginRobot.loginToHomeScreen(username, password, market);
      await customerSearchRobot.selectCustomerSearch(shipToCode);
      loginRequired = false;
      await commonRobot.dismissSnackbar(dismissAll: true);
      await commonRobot.closeAnnouncementAlertDialog();
    } else {
      await commonRobot.dismissSnackbar(dismissAll: true);
      await commonRobot.changeDeliveryAddress(
        shipToCode,
      );
      await commonRobot.closeAnnouncementAlertDialog();
    }
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

  Future<void> verifyBillToInfo() async {
    await commonRobot.verifyBillToInfoForVn(
      customerCode: billToCustomerCode,
      shipToAddress: billToAddress,
      name: billToName,
      email: billToEmail,
      taxNumber: billToTaxNumber,
      phoneNumber: billToPhoneNumber,
    );
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
      await loginRobot.selectMarket(market);
      await loginRobot.tapToCloseAnnouncementBanner();

      //verify
      await loginRobot.findUsernameField();
      await loginRobot.findPasswordField();
      await loginRobot.findPasswordField();
      await loginRobot.findRememberMeCheckbox();
      await loginRobot.findForgotPasswordLink();
      await loginRobot.verifySelectedMarket(market);
      await loginRobot.findSignUpLink(
        isVisible: false,
      );
      await loginRobot.findLoginWithSSOButton(isVisible: false);
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
      await loginRobot.selectMarket(market);

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
      await loginRobot.selectMarket(market);

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
      await loginRobot.selectMarket(market);

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
      await loginRobot.selectMarket(market);

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
      await loginRobot.selectMarket(market);

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
      await loginRobot.selectMarket(market);

      // check remember me
      await loginRobot.findRememberMeCheckbox();
      await loginRobot.tapToRememberMe();

      await loginRobot.verifySelectedMarket(market);
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
      await notificationRobot.scrollAlertNotification();
      await notificationRobot.verifyNotificationItems();
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
      await notificationRobot.verifyNotificationItems();
      await notificationRobot.pullToRefresh();
      await notificationRobot.verifyNotificationItems();
    });
  });

  group('Home Tab -', () {
    testWidgets('EZRX-T17 | Verify Homepage with default components',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //verify homepage
      homeRobot.verify();
      commonRobot.verifyCustomerCodeSelector();
      customerSearchRobot.verifyCustomerCodeIsSelected(shipToCode);
      homeRobot.findMiniCartIcon();
      homeRobot.findQuickAccessMenu();
      homeRobot.findBannerInHomeScreen();
      await homeRobot.findBrowseProductsIcon();
      // await homeRobot.findAnnouncementsIcon();
    });

    testWidgets(
        'EZRX-T18 | Verify select other ShipTo in Homepage incase existing items in cart',
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
      customerSearchRobot.verifyCustomerCodeIsSelected(otherShipToCode);

      // verify cart empty
      await commonRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyPageVisible();
      productRobot.verifyCartButtonVisible();
      await productRobot.tapCartButton();
      cartRobot.verifyNoRecordFound();
    });

    testWidgets(
        'EZRX-T20 | Verify Search ShipTo with keyword contains valid/invalid Customer name/ShipTo',
        (tester) async {
      // initialize variables
      final subCustomerCode = customerCode.substring(0, 8);
      final subCustomerName = shipToAddress.substring(0, 8);
      final subShipToCode = shipToCode.substring(0, 8);
      final subShipToName = shipToAddress.substring(0, 8);

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

      //invalid code
      await customerSearchRobot.search(invalidNumberSearchKey);
      customerSearchRobot.verifySearchNotFound();

      //invalid name
      await customerSearchRobot.search(invalidSearchKey);
      customerSearchRobot.verifySearchNotFound();
    });

    testWidgets('EZRX-T28 | Verify navigate to search product in Homepage',
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
        'EZRX-T22 | Verify navigate with top navigation menu in Homepage',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //tap on home quick access order
      homeRobot.findQuickAccessOrders();
      await homeRobot.tapOrdersQuickAccess();
      ordersRootRobot.verifyPage();
      await commonRobot.navigateToScreen(NavigationTab.home);

      //tap on home quick access return
      homeRobot.findQuickAccessReturns();
      await homeRobot.tapReturnsQuickAccess();
      returnsRootRobot.verifyRootPageVisible();
      await commonRobot.tapToBackScreen();

      //tap on home quick access payments
      homeRobot.findQuickAccessPayments();
      await homeRobot.tapPaymentQuickAccess();
      paymentHomeRobot.verifyPage();
    });

    testWidgets(
        'EZRX-T44 | Verify display product on offer and navigate in Homepage',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      homeRobot.findProductsOnOffer();
      homeRobot.verifyDisplayProductsWithOfferTag();

      //Navigate to product detail page
      await homeRobot.tapOnFirstProductOnOffer();
      productDetailRobot.verifyPage();
      productDetailRobot.verifyOnOfferLabel();
      await productDetailRobot.tapBackButton();

      //Navigate to product tab
      homeRobot.findProductsOnOffer();
      await homeRobot.tapProductsOnOfferIcon();
      productRobot.verifyPageVisible();
      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyCheckboxCheckedShowProduct(
        'Items with offers',
        true,
      );
    });

    testWidgets('EZRX-T46 | Verify display recently ordered and navigate',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      //Swipe recently ordered
      await homeRobot.slideToNextRecentlyOrdered();
      await homeRobot.slideToPreviousRecentlyOrdered();

      //Navigate to view by item detail
      await homeRobot.findRecentlyOrderIcon();
      await homeRobot.tapOnFirstRecentlyOrdered();
      viewByItemsDetailRobot.verifyPage();
      await viewByItemsDetailRobot.tapToBackScreen();

      //Navigate to order tab
      await homeRobot.findRecentlyOrderIcon();
      await homeRobot.tapRecentlyOrderIcon();
      ordersRootRobot.verifyPage();
    });

    testWidgets(
        'EZRX-T47 | Verify display browse products and navigate in Homepage',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      await homeRobot.findBrowseProductsIcon();

      //Swipe browse product
      final productInfo = homeRobot.getFirstBrowseProductInfo();
      await homeRobot.slideToNextBrowseProducts();
      homeRobot.verifyNotFoundWidgetByText(productInfo);
      await homeRobot.slideToPreviousBrowseProducts();
      homeRobot.verifyFoundWidgetByText(productInfo);

      //Navigate to product tab
      await homeRobot.tapBrowseProductsIcon();
      productRobot.verifyPageVisible();
      await commonRobot.navigateToScreen(NavigationTab.home);

      //Navigate to material page
      await homeRobot.tapOnFirstBrowseProduct();
      productDetailRobot.verifyPage();
    });

    testWidgets('EZRX-T48 | Verify display Announcements in Homepage',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      //tap on browse products
      await homeRobot.findAnnouncementsIcon();
      await homeRobot.tapAnnouncementsIcon();

      //verify go to announcements page
      announcementArticleRootRobot.verifyAnnouncementPage();
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
      productSuggestionRobot.verifyInvalidLengthSearchMessage();
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

      await productSuggestionRobot.tapDeleteSearchHistory();
      productSuggestionRobot.verifyClearHistoryBottomSheet();
      await productSuggestionRobot.tapConfirmClearHistory();
      productSuggestionRobot.verifyClearHistoryBottomSheet(isVisible: false);
      productSuggestionRobot.verifySearchHistory(isVisible: false);
      productSuggestionRobot.verifyNoSearchHistory();
    });
  });

  group('Material detail -', () {
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

    testWidgets('EZRX-T65| Verify available offers in the material detail',
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
      productDetailRobot.verifyButtonCloseDisplayed();
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

    testWidgets('EZRX-T67 | Verify other information in material detail',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot
          .searchWithKeyboardAction(otherInfoMaterialNumber);
      await productSuggestionRobot.tapSearchResult(otherInfoMaterialNumber);
      if (productDetailRobot.isSeeMoreOptionNotVisible) {
        productDetailRobot.verifySeeMoreOption(isVisible: false);
        return;
      }
      productDetailRobot.verifySeeMoreOption();
      await productDetailRobot.tapToSeeMore();
      productDetailRobot.verifyMaterialDosageDisplayed();
      productDetailRobot.verifyMaterialHowToUseDisplayed();
      productDetailRobot.verifyMaterialDeliveryInstructionsDisplayed();
      productDetailRobot.verifyMaterialCompositionDisplayed();
    });

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
  });

  group('Cart -', () {
    testWidgets('EZRX-T98 | Verify material in cart + change material qty',
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
      cartRobot.verifyCartTotalPrice(
        materialUnitPrice.includeTax(tax).priceDisplay(currency),
      );
      cartRobot.verifyCheckoutButton();

      var totalPrice = materialUnitPrice;
      await cartRobot.increaseMaterialQty(materialNumber);
      totalPrice = materialUnitPrice * 2;
      cartRobot.verifyMaterialQty(materialNumber, 2);
      cartRobot.verifyMaterialTotalPrice(
        materialNumber,
        totalPrice.priceDisplay(currency),
      );
      cartRobot.verifyCartTotalPrice(
        totalPrice.includeTax(tax).priceDisplay(currency),
      );

      await cartRobot.changeMaterialQty(materialNumber, 10);
      totalPrice = materialUnitPrice * 10;
      cartRobot.verifyMaterialQty(materialNumber, 10);
      cartRobot.verifyMaterialTotalPrice(
        materialNumber,
        totalPrice.priceDisplay(currency),
      );
      cartRobot.verifyCartTotalPrice(
        totalPrice.includeTax(tax).priceDisplay(currency),
      );

      await cartRobot.decreaseMaterialQty(materialNumber);
      totalPrice = materialUnitPrice * 9;
      cartRobot.verifyMaterialQty(materialNumber, 9);
      cartRobot.verifyMaterialTotalPrice(
        materialNumber,
        totalPrice.priceDisplay(currency),
      );
      cartRobot.verifyCartTotalPrice(
        totalPrice.includeTax(tax).priceDisplay(currency),
      );
    });

    testWidgets('EZRX-T108 | Verify remove item in cart', (tester) async {
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
    });

    testWidgets('EZRX-T113 | Verify clear cart', (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      //verify
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productSuggestionRobot.tapSearchResult(materialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.dismissSnackbar();
      await productDetailRobot.tapCartButton();
      cartRobot.verifyCartQty(1);
      await cartRobot.tapClearCartButton();
      await cartRobot.verifyClearCartSuccessMessage();
      cartRobot.verifyNoRecordFound();
      cartRobot.verifyQtyOnAppBar(0);
      await cartRobot.tapBrowseProductButton();
      productRobot.verifyPageVisible();
    });

    //TODO : need to work in these test case for bonus decending order, Once BE issue resolved
    testWidgets('EZRX-T102 | Verify add bonus/sample item in cart',
        (tester) async {
      const invalidQty = 1000;
      const validQty = 10;
      const materialIndex = 0;

      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      //verify display
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

      //Unhappy case when adding
      await cartRobot.tapMaterialBonusSampleButton(materialNumber);
      await bonusSampleRobot.searchWithKeyboardAction(materialName);
      await bonusSampleRobot.tapSubmitButton(materialIndex);
      bonusSampleRobot.verifyEmptyQtyMessage(isVisible: true);
      await bonusSampleRobot.enterBonusSampleQty(materialIndex, invalidQty);
      await bonusSampleRobot.tapSubmitButton(materialIndex);
      bonusSampleRobot.verifyEmptyQtyMessage(isVisible: false);
      bonusSampleRobot.verifyInvalidQtyMessage();
      await bonusSampleRobot.dismissSnackbar();

      //Happy case when adding
      final bonusSampleMaterialNumber =
          bonusSampleRobot.getBonusSampleMaterialNumber(materialIndex);
      final bonusSampleMaterialDescription =
          bonusSampleRobot.getBonusSampleMaterialDescription(materialIndex);
      await bonusSampleRobot.enterBonusSampleQty(materialIndex, validQty);
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
        validQty,
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

    testWidgets('EZRX-T105 | Verify counter offer price with remark',
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

      await cartRobot.tapMaterialCounterOfferButton(materialNumber);
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
      cartRobot.verifyCartTotalPrice(
        newUnitPrice.includeTax(tax).priceDisplay(currency),
      );
      await cartRobot.tapMaterialCounterOfferButton(materialNumber);
      requestCounterOfferRobot
          .verifyOfferPrice(newUnitPrice.priceDisplay(currency));
      requestCounterOfferRobot.verifyPriceText(newUnitPrice.toString());
      requestCounterOfferRobot.verifyRemarkText(remark);
    });

    testWidgets('EZRX-T114 | Verify address information in cart',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester, shipToCode: billToShipToCode);
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
      cartDeliveryAddressDetailRobot.verifyCustomerCode(billToCustomerCode);
      cartDeliveryAddressDetailRobot.verifyShipToCode(billToShipToCode);
      //Bill to info
      await verifyBillToInfo();
      await cartDeliveryAddressDetailRobot.tapCloseButton();
      cartDeliveryAddressDetailRobot.verifySheet(isVisible: false);
    });

    testWidgets('EZRX-T97 | Verify price summary in cart', (tester) async {
      const qty = 1;
      const totalPrice = materialUnitPrice * qty;
      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productSuggestionRobot.tapSearchResult(materialNumber);
      await productDetailRobot.tapAddToCart();
      productDetailRobot.verifyCartButtonQty(1);
      await productDetailRobot.tapCartButton();

      //verify
      cartRobot.verifyCartTotalPrice(
        totalPrice.includeTax(tax).priceDisplay(currency),
      );
      await cartRobot.tapShowPriceSummary();
      orderPriceSummaryRobot.verifySheet(isVisible: true);
      orderPriceSummaryRobot
          .verifySubTotalLabel(totalPrice.priceDisplay(currency));
      orderPriceSummaryRobot.verifyTaxLabel(
        totalPrice.taxValue(tax).priceDisplay(currency),
        tax,
        isVn: true,
      );
      orderPriceSummaryRobot.verifyGrandTotalLabel(
        totalPrice.includeTax(tax).priceDisplay(currency),
      );
      await orderPriceSummaryRobot.tapCloseButton();
      orderPriceSummaryRobot.verifySheet(isVisible: false);
    });

    testWidgets('EZRX-T110 | Verify cart under minimum order value',
        (tester) async {
      final validQty = (minOrderAmount / lowPriceMaterialUnitPrice).ceil();
      final validTotalPrice = lowPriceMaterialUnitPrice * validQty;
      const lowPriceMaterialTax = 10;

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
        lowPriceMaterialUnitPrice
            .includeTax(lowPriceMaterialTax)
            .priceDisplay(currency),
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
      cartRobot.verifyCartTotalPrice(
        validTotalPrice.includeTax(lowPriceMaterialTax).priceDisplay(currency),
      );
      cartRobot.verifyMOVWarningMessage(
        minOrderAmount.priceDisplay(currency),
        isVisible: false,
      );
    });

    testWidgets('EZRX-T115 | Verify checkout cart when having pre-order items',
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
  });

  group('Checkout -', () {
    testWidgets('EZRX-T116 | Verify display checkout with default components',
        (tester) async {
      const qty = 1000;
      const totalPrice = materialUnitPrice * qty;
      //init app
      await pumpAppWithHomeScreen(tester, shipToCode: billToShipToCode);
      await checkoutWithMaterial(materialNumber, qty);

      //verify
      checkoutRobot.verifyPage();
      checkoutRobot.verifyAddressSection();
      checkoutRobot.verifyCustomerCode(billToCustomerCode);
      checkoutRobot.verifyDeliveryTo(billToShipToCode);
      //Bill to info
      await verifyBillToInfo();
      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      await checkoutRobot.verifyDeliveryDateField(isVisible: false);
      await checkoutRobot.verifyReferenceNoteField(isVisible: false);
      await checkoutRobot.verifyPaymentTermField(isVisible: false);
      await checkoutRobot.verifyContactPersonField(isVisible: false);
      await checkoutRobot.verifyMobileNumberField(isVisible: false);
      await checkoutRobot.verifyDeliveryInstructionField(isVisible: true);
      await checkoutRobot.verifyYoursItemLabel(1);
      await checkoutRobot.verifyMaterial(materialNumber);
      await checkoutRobot
          .verifySubTotalLabel(totalPrice.priceDisplay(currency));
      await checkoutRobot.verifyGrandTotalLabel(
        totalPrice.includeTax(tax).priceDisplay(currency),
      );
      checkoutRobot.verifyStickyTotalQty(1);
      checkoutRobot.verifyStickyGrandTotal(
        totalPrice.includeTax(tax).priceDisplay(currency),
      );
      await checkoutRobot.tapStickyGrandTotal();
      orderPriceSummaryRobot.verifySheet(isVisible: true);
      orderPriceSummaryRobot.verifyTaxLabel(
        totalPrice.taxValue(tax).priceDisplay(currency),
        tax,
        isVn: true,
      );
      orderPriceSummaryRobot.verifySubTotalLabel(
        totalPrice.priceDisplay(currency),
      );
      orderPriceSummaryRobot.verifyGrandTotalLabel(
        totalPrice.includeTax(tax).priceDisplay(currency),
      );
      await orderPriceSummaryRobot.tapCloseButton();
      orderPriceSummaryRobot.verifySheet(isVisible: false);
      checkoutRobot.verifyPlaceOrderButton();
    });

    testWidgets(
        'EZRX-T118 | Validate fields in checkout and go to order submitted',
        (tester) async {
      const emptyPoReference = 'NA';
      const emptyDeliveryInstruction = 'NA';

      //init app
      await pumpAppWithHomeScreen(tester);
      await checkoutWithMaterial(materialNumber, 1000);

      //verify
      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      await checkoutRobot.verifyDeliveryInstructionField(isVisible: true);
      await checkoutRobot.tapDeliveryInformationArrowButton();
      await checkoutRobot.verifyPoReferenceField(isVisible: false);
      await checkoutRobot.verifyDeliveryInstructionField(isVisible: false);
      await checkoutRobot.tapDeliveryInformationArrowButton();
      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      await checkoutRobot.verifyDeliveryInstructionField(isVisible: true);
      await checkoutRobot.tapPlaceOrderButton();
      checkoutRobot.verifyEmptyPoReferenceMessage(isVisible: false);
      orderSuccessRobot.verifyPage();
      orderSuccessRobot.verifyPoReference(emptyPoReference);
      orderSuccessRobot.verifyDeliveryInstruction(emptyDeliveryInstruction);
    });

    testWidgets(
        'EZRX-T119 | Verify display material with/without counter offer applied in checkout',
        (tester) async {
      const qty = 1000;
      const newUnitPrice = materialUnitPrice + 100;
      const newTotalPrice = (newUnitPrice * qty);

      //init app
      await pumpAppWithHomeScreen(tester);
      await checkoutWithMaterial(materialNumber, qty);

      //verify
      await checkoutRobot.verifyMaterialPrincipal(materialPrincipalName);
      await checkoutRobot.verifyMaterial(materialNumber);
      checkoutRobot.verifyMaterialQty(materialNumber, qty);
      checkoutRobot.verifyMaterialDescription(materialNumber, materialName);
      checkoutRobot.verifyMaterialImage(materialNumber);
      checkoutRobot.verifyMaterialUnitPrice(
        materialNumber,
        materialUnitPrice.priceDisplay(currency),
      );
      checkoutRobot.verifyMaterialTotalPrice(
        materialNumber,
        (materialUnitPrice * qty).priceDisplay(currency),
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
        newTotalPrice.priceDisplay(currency),
      );
      checkoutRobot.verifyMaterialCounterOfferLabel(
        materialNumber,
        isVisible: true,
      );
      await checkoutRobot
          .verifySubTotalLabel(newTotalPrice.priceDisplay(currency));
      await checkoutRobot.verifyGrandTotalLabel(
        newTotalPrice.includeTax(tax).priceDisplay(currency),
      );
      checkoutRobot.verifyStickyTotalQty(1);
      checkoutRobot.verifyStickyGrandTotal(
        newTotalPrice.includeTax(tax).priceDisplay(currency),
      );
    });
  });

  group('Order success -', () {
    testWidgets(
        'EZRX-T123 | Verify display order submitted with default components + close page',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester, shipToCode: billToShipToCode);
      await checkoutWithMaterial(materialNumber, 1000);

      //verify
      await checkoutRobot.tapPlaceOrderButton();
      orderSuccessRobot.verifyPage();
      orderSuccessRobot.verifyOrderSubmittedMessage();
      await orderSuccessRobot.dismissSnackbar();
      //Bill to info
      await verifyBillToInfo();
      orderSuccessRobot.verifyOrderId();
      orderSuccessRobot.verifyOrderDate();
      await orderSuccessRobot.verifyOrderSummarySection();

      await orderSuccessRobot.tapCloseButton();
      productRobot.verifyPageVisible();
      await productRobot.tapCartButton();
      cartRobot.verifyPage();
      cartRobot.verifyNoRecordFound();
    });

    testWidgets('EZRX-T125 | Verify display material in order submitted',
        (tester) async {
      const qty = 1000;
      const totalPrice = materialUnitPrice * qty;

      //init app
      await pumpAppWithHomeScreen(tester);
      await checkoutWithMaterial(materialNumber, qty);
      await checkoutRobot.tapPlaceOrderButton();
      await orderSuccessRobot.dismissSnackbar();

      //verify
      await orderSuccessRobot.verifyOrderSummarySection();
      await orderSuccessRobot.verifySubTotal(totalPrice.priceDisplay(currency));
      await orderSuccessRobot
          .verifyGrandTotal(totalPrice.includeTax(tax).priceDisplay(currency));
      await orderSuccessRobot.verifyOrderItemTotalQty(1);
      await orderSuccessRobot.startVerifyMaterial(index: 0);
      orderSuccessRobot.verifyMaterialNumber(materialNumber);
      orderSuccessRobot.verifyMateriaDescription(materialName);
      orderSuccessRobot.verifyItemQty(1);
      orderSuccessRobot
          .verifyMaterialUnitPrice(materialUnitPrice.priceDisplay(currency));
      orderSuccessRobot.verifyMaterialTotalPrice(
        totalPrice.priceDisplay(currency),
      );
    });

    testWidgets(
        'EZRX-T125 | Verify display material on offer with bonus in order submitted',
        (tester) async {
      const qty = 10;
      const bonusQty = qty ~/ bonusMaterialNumberTierQty;
      const totalPrice = bonusMaterialNumberUnitPrice * qty;

      //init app
      await pumpAppWithHomeScreen(tester);
      await checkoutWithMaterial(bonusMaterialNumber, qty);
      await checkoutRobot.tapPlaceOrderButton();
      await orderSuccessRobot.dismissSnackbar();

      //verify
      await orderSuccessRobot.verifyOrderSummarySection();
      await orderSuccessRobot.verifySubTotal(totalPrice.priceDisplay(currency));
      await orderSuccessRobot
          .verifyGrandTotal(totalPrice.includeTax(tax).priceDisplay(currency));
      await orderSuccessRobot.verifyOrderItemTotalQty(2);
      await orderSuccessRobot.startVerifyMaterial(index: 0);
      orderSuccessRobot.verifyMaterialNumber(bonusMaterialNumber);
      orderSuccessRobot.verifyMateriaDescription(bonusMaterialName);
      orderSuccessRobot.verifyItemQty(qty);
      orderSuccessRobot.verifyMaterialOnOfferTag();
      orderSuccessRobot.verifyMaterialUnitPrice(
        bonusMaterialNumberUnitPrice.priceDisplay(currency),
      );
      orderSuccessRobot
          .verifyMaterialTotalPrice(totalPrice.priceDisplay(currency));
      await orderSuccessRobot.startVerifyMaterial(index: 1);
      orderSuccessRobot.verifyMaterialNumber(bonusMaterialNumber);
      orderSuccessRobot.verifyMateriaDescription(bonusMaterialName);
      orderSuccessRobot.verifyItemQty(bonusQty);
      orderSuccessRobot.verifyMaterialBonusTag();
      orderSuccessRobot.verifyMaterialUnitPrice(
        0.priceDisplay(currency),
        isFree: true,
      );
      orderSuccessRobot.verifyMaterialTotalPrice(
        0.priceDisplay(currency),
        isFree: true,
      );
    });
  });

  group('Order Tab -', () {
    final fromDate = DateTime.now().subtract(const Duration(days: 100));
    final toDate = DateTime.now().subtract(const Duration(days: 2));

    group('View by items -', () {
      testWidgets('EZRX-T69 | Verify display list of order (with/without data)',
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

        await ordersRootRobot.tapFilterButton();
        viewByItemsFilterRobot.verifyApplyButton();
        viewByItemsFilterRobot.verifyResetButton();
        viewByItemsFilterRobot.verifyDefaultFilterApplied();
        await viewByItemsFilterRobot.tapCloseIcon();
        viewByItemsRobot.verifyOrders();
        await commonRobot.pullToRefresh();
        viewByItemsRobot.verifyOrders();

        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        viewByItemsRobot.verifyNoRecordFound();
        await commonRobot.pullToRefresh();
        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        viewByItemsRobot.verifyNoRecordFound();
      });

      testWidgets(
          'EZRX-T75 | Verify search by material number/material description/order number',
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
        await commonRobot.pullToRefresh();
        commonRobot.verifySearchBarText('');

        final materialNumber = viewByItemsRobot.getFirstProductId();
        await commonRobot.searchWithSearchIcon(materialNumber);
        viewByItemsRobot.verifyOrdersWithProductCode(materialNumber);
        await commonRobot.pullToRefresh();

        final orderCode = viewByItemsRobot.getFirstOrderId();
        await commonRobot.autoSearch(invalidLengthSearchKey);
        await commonRobot.waitAutoSearchDuration();
        commonRobot.verifyInvalidLengthSearchMessage(isVisible: false);
        await commonRobot.autoSearch(orderCode);
        viewByItemsRobot.verifyOrdersWithOrderCode(orderCode);
        await commonRobot.pullToRefresh();

        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        viewByItemsRobot.verifyNoRecordFound();
        await commonRobot.tapClearSearch();
        commonRobot.verifySearchBarText('');
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
          dateStringFormat: dateFormat,
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
        await viewByItemsFilterRobot.tapCloseIcon();

        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        viewByItemsRobot.verifyNoRecordFound();
        await commonRobot.pullToRefresh();
        ordersRootRobot.verifyFilterApplied(0);
        viewByItemsRobot.verifyOrderItems();
      });

      testWidgets(
          'EZRX-T85 | Verify Filter by status when selecting 1 checkbox and existing data available',
          (tester) async {
        const statusFilter = 'Order Created';

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
          dateStringFormat: dateFormat,
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

        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        viewByItemsRobot.verifyNoRecordFound();
        await commonRobot.pullToRefresh();
        ordersRootRobot.verifyFilterApplied(0);
        viewByItemsRobot.verifyOrderItems();
      });
    });

    group('View by item detail -', () {
      testWidgets(
          'EZRX-T87 | Verify view by item detail with default components',
          (tester) async {
        const orderId = '0200330876';

        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();
        await commonRobot.searchWithKeyboardAction(orderId);
        await viewByItemsRobot.tapFirstOrder();
        viewByItemsDetailRobot.verifyHeader();

        await viewByItemsDetailRobot.tapOrderNumber();
        viewByOrdersDetailRobot.verifyPage();
        viewByOrdersDetailRobot.verifyOrderId(orderId);
        await commonRobot.tapToBackScreen();

        final invoiceNumber = viewByItemsDetailRobot.getInvoiceNumber();
        await viewByItemsDetailRobot.tapInvoiceNumber();
        accountInvoiceDetailRobot.verifyPage();
        accountInvoiceDetailRobot.verifyInvoiceId(invoiceNumber);
        await commonRobot.tapToBackScreen();

        viewByItemsDetailRobot.verifyStatusTracker();
        viewByItemsDetailRobot.verifyAddress();
        await viewByItemsDetailRobot.verifyItemComponent();
      });

      testWidgets('EZRX-T91 | Verify material in view by item detail',
          (tester) async {
        const qty = 1000;

        //init app
        await pumpAppWithHomeScreen(tester, shipToCode: billToShipToCode);
        await checkoutWithMaterial(materialNumber, qty);
        await checkoutRobot.tapPlaceOrderButton();
        await orderSuccessRobot.tapCloseButton();
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();
        await commonRobot.pullToRefresh();
        await viewByItemsRobot.tapFirstOrder();
        viewByItemsDetailRobot.verifyHeader();
        viewByItemsDetailRobot.verifyStatusTracker();
        viewByItemsDetailRobot.verifyAddress();
        //Bill to info
        await verifyBillToInfo();
        await viewByItemsDetailRobot.verifyItemComponent();
        viewByItemsDetailRobot.verifyMaterialNumber(materialNumber);
        viewByItemsDetailRobot.verifyQty(qty);
        await viewByItemsDetailRobot.verifyOtherItemsComponent(
          isVisible: false,
        );
        viewByItemsDetailRobot.verifyExpandButton(isVisible: false);
        await viewByItemsDetailRobot.tapBuyAgainButton();
        cartRobot.verifyPage();
        await cartRobot.verifyMaterial(materialNumber);
        cartRobot.verifyMaterialQty(materialNumber, qty);
      });

      testWidgets(
          'EZRX-T91 | Verify material with offer and collapse other item in view by items detail',
          (tester) async {
        const qty = 10;
        const bonusQty = qty ~/ bonusMaterialNumberTierQty;

        //init app
        await pumpAppWithHomeScreen(tester);
        await checkoutWithMaterial(bonusMaterialNumber, qty);
        await checkoutRobot.tapPlaceOrderButton();
        await orderSuccessRobot.tapCloseButton();
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();
        await commonRobot.pullToRefresh();
        viewByItemsRobot.verifyOfferTag();
        await viewByItemsRobot.tapFirstOfferTag();
        await viewByItemsDetailRobot.verifyItemComponent();
        viewByItemsDetailRobot.verifyOfferTag();
        viewByItemsDetailRobot.verifyMaterialNumber(bonusMaterialNumber);
        viewByItemsDetailRobot.verifyQty(qty);
        await viewByItemsDetailRobot.verifyOtherItemsComponent();
        await viewByItemsDetailRobot.startVerifyOtherItem(0);
        viewByItemsDetailRobot.verifyOtherItemBonusLabel();
        viewByItemsDetailRobot.verifyOtherItemFreePrice();
        viewByItemsDetailRobot.verifyOtherItemQty(bonusQty);
        await viewByItemsDetailRobot.tapToBackScreen();

        viewByItemsRobot.verifyBonusLabel();
        await viewByItemsRobot.tapFirstBonusLabel();
        await viewByItemsDetailRobot.verifyItemComponent();
        viewByItemsDetailRobot.verifyBonusLabel();
        viewByItemsDetailRobot.verifyFreePrice();
        viewByItemsDetailRobot.verifyMaterialNumber(bonusMaterialNumber);
        viewByItemsDetailRobot.verifyQty(bonusQty);
        await viewByItemsDetailRobot.verifyOtherItemsComponent();
        await viewByItemsDetailRobot.startVerifyOtherItem(0);
        viewByItemsDetailRobot.verifyOtherItemOfferTag();
        viewByItemsDetailRobot.verifyOtherItemQty(qty);
        viewByItemsDetailRobot.verifyExpandButton(isVisible: true);
        await viewByItemsDetailRobot.tapExpandButton();
        await viewByItemsDetailRobot.verifyOtherItemsComponent(
          isVisible: false,
        );

        await viewByItemsDetailRobot.tapBuyAgainButton();
        cartRobot.verifyPage();
        await cartRobot.verifyMaterial(bonusMaterialNumber);
        cartRobot.verifyMaterialQty(bonusMaterialNumber, qty);
      });
    });

    group('View by orders -', () {
      testWidgets('EZRX-T71 | Verify display list of order (with/without data)',
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
        await commonRobot.autoSearch(invalidSearchKey);
        viewByOrdersRobot.verifyNoRecordFound();
        await commonRobot.pullToRefresh();
        viewByOrdersRobot.verifyOrders();
      });

      testWidgets('EZRX-T78 | Verify search by order number', (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);
        await ordersRootRobot.switchToViewByOrders();

        //verify
        viewByOrdersRobot.verifyOrders();
        var orderId = viewByOrdersRobot.getOrderIdText(index: 0);
        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        viewByOrdersRobot.verifyNoRecordFound();
        await commonRobot.searchWithKeyboardAction(invalidLengthSearchKey);
        commonRobot.verifyInvalidLengthSearchMessage();
        viewByOrdersRobot.verifyNoRecordFound();
        await commonRobot.searchWithKeyboardAction(orderId);
        viewByOrdersRobot.verifyOrdersWithOrderCode(orderId);
        await commonRobot.waitAutoSearchDuration();
        commonRobot.verifyLoadingImage(isVisible: false);
        await commonRobot.tapClearSearch();

        orderId = viewByOrdersRobot.getOrderIdText(index: 0);
        await commonRobot.autoSearch(invalidSearchKey);
        viewByOrdersRobot.verifyNoRecordFound();
        await commonRobot.autoSearch(invalidLengthSearchKey);
        commonRobot.verifyInvalidLengthSearchMessage(isVisible: false);
        viewByOrdersRobot.verifyNoRecordFound();
        await commonRobot.tapClearSearch();

        await commonRobot.searchWithSearchIcon(invalidSearchKey);
        viewByOrdersRobot.verifyNoRecordFound();
        await commonRobot.waitAutoSearchDuration();
        commonRobot.verifyLoadingImage(isVisible: false);
        await commonRobot.tapClearSearch();
        viewByOrdersRobot.verifyOrders();
        await commonRobot.searchWithSearchIcon(invalidLengthSearchKey);
        commonRobot.verifyInvalidLengthSearchMessage();
      });

      testWidgets('EZRX-T83 | Verify filter by date', (tester) async {
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
          dateStringFormat: dateFormat,
        );
        await viewByOrdersFilterRobot.tapApplyButton();
        ordersRootRobot.verifyFilterApplied(1);
        viewByOrdersRobot.verifyOrderGroupInDateRange(
          fromDate: fromDate,
          toDate: toDate,
        );
        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        viewByOrdersRobot.verifyNoRecordFound();
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
          dateStringFormat: dateFormat,
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

      testWidgets('EZRX-T72 | Verify click on Buy again', (tester) async {
        const qty = 1000;
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
    });

    group('View by order detail -', () {
      testWidgets(
          'EZRX-T88 | Verify view by order detail with default components',
          (tester) async {
        const qty = 1000;
        const totalPrice = materialUnitPrice * qty;

        //init app
        await pumpAppWithHomeScreen(tester, shipToCode: billToShipToCode);
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
        viewByOrdersDetailRobot.verifyOrderId(orderId);
        viewByOrdersDetailRobot.verifyOrderDate();
        viewByOrdersDetailRobot.verifyPoReference(poReference);
        viewByOrdersDetailRobot.verifyDeliveryInstructions(deliveryInstruction);
        viewByOrdersDetailRobot.verifyOrderAddress(billToOrderAddress);
        viewByOrdersDetailRobot.verifyCustomerCode(billToCustomerCode);
        viewByOrdersDetailRobot.verifyDeliveryTo(billToShipToCode);
        //Bill to info
        await verifyBillToInfo();
        await viewByOrdersDetailRobot.dragToVerifySummary();
        viewByOrdersDetailRobot
            .verifySubTotal(totalPrice.priceDisplay(currency));
        viewByOrdersDetailRobot.verifyGrandTotal(
          totalPrice.includeTax(tax).priceDisplay(currency),
        );
        await viewByOrdersDetailRobot.dragToVerifyItemsSection();
        await viewByOrdersDetailRobot.startVerifyMaterial(materialNumber);
        viewByOrdersDetailRobot.verifyQty(qty);
        viewByOrdersDetailRobot
            .verifyMaterialTotalPrice(totalPrice.priceDisplay(currency));
        viewByOrdersDetailRobot.verifyBuyAgainButton();
      });

      testWidgets(
          'EZRX-T90 | Verify click on Buy again in when having existing items in Cart',
          (tester) async {
        const orderQty = 1000;
        const cartQty = 10;
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

      testWidgets(
          'EZRX-T90 | Verify material with offer + navigate to item detail + buy again',
          (tester) async {
        const qty = 10;
        const bonusQty = qty ~/ bonusMaterialNumberTierQty;
        //init app
        await pumpAppWithHomeScreen(tester);

        //setup data
        await checkoutWithMaterial(bonusMaterialNumber, qty);
        await checkoutRobot.tapPlaceOrderButton();
        await orderSuccessRobot.tapCloseButton();
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        await ordersRootRobot.switchToViewByOrders();
        await commonRobot.pullToRefresh();
        await viewByOrdersRobot.tapFirstOrder();
        await viewByOrdersDetailRobot.dragToVerifyItemsSection();
        await viewByOrdersDetailRobot.startVerifyMaterial(bonusMaterialNumber);
        viewByOrdersDetailRobot.verifyQty(qty);
        viewByOrdersDetailRobot.verifyOfferTag();
        await viewByOrdersDetailRobot.tapVerifyingItem();
        viewByItemsDetailRobot.verifyPage();
        await viewByItemsDetailRobot.verifyItemComponent();
        viewByItemsDetailRobot.verifyMaterialNumber(bonusMaterialNumber);
        viewByItemsDetailRobot.verifyQty(qty);
        viewByItemsDetailRobot.verifyOfferTag();
        await viewByItemsDetailRobot.tapToBackScreen();
        await viewByOrdersDetailRobot.startVerifyMaterial(
          bonusMaterialNumber,
          isBonus: true,
        );
        viewByOrdersDetailRobot.verifyQty(bonusQty);
        viewByOrdersDetailRobot.verifyBonusTag();
        viewByOrdersDetailRobot.verifyMaterialTotalPrice(
          0.priceDisplay(currency),
          isFree: true,
        );
        await viewByOrdersDetailRobot.tapVerifyingItem();
        viewByItemsDetailRobot.verifyPage();
        await viewByItemsDetailRobot.verifyItemComponent();
        viewByItemsDetailRobot.verifyMaterialNumber(bonusMaterialNumber);
        viewByItemsDetailRobot.verifyQty(bonusQty);
        viewByItemsDetailRobot.verifyBonusLabel();
        await viewByItemsDetailRobot.tapToBackScreen();
        await viewByOrdersDetailRobot.tapBuyAgainButton();
        cartRobot.verifyPage();
        await cartRobot.verifyMaterial(bonusMaterialNumber);
        cartRobot.verifyMaterialQty(bonusMaterialNumber, qty);
        await cartRobot.verifyBonusMaterial(
          bonusMaterialNumber,
          bonusMaterialNumber,
        );
        await cartRobot.verifyBonusMaterialQty(
          bonusMaterialNumber,
          bonusMaterialNumber,
          bonusQty,
        );
      });
    });
  });

  //TODO : WE NEED TO COVER STRIKE THROUGH PRICE, RIGHT NOW WE DON'T HAVE DATA
  //TODO : WE NEED TO COVER ZDP5 FEATURE LATER, ONCE THE TEST DATA GET READY

  tearDown(() async {
    locator<ZephyrService>().setNameAndStatus();
    await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  });
}
