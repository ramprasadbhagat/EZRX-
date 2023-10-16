import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../core/common.dart';
import '../../robots/announcements/announcement_detail_robot.dart';
import '../../robots/announcements/announcements_robot.dart';
import '../../robots/common/common_robot.dart';
import '../../robots/home/customer_search_robot.dart';
import '../../robots/home/home_robot.dart';
import '../../robots/login_robot.dart';
import '../../core/infrastructure/infra_core/zephyr_service/zephyr_service.dart';
import '../../core/infrastructure/zephyr/repository/zephyr_repository.dart';
import '../../core/test_locator.dart';
import '../../robots/orders/cart/cart_robot.dart';
import '../../robots/orders/orders_root_robot.dart';
import '../../robots/orders/view_by_items/view_by_items_detail_robot.dart';
import '../../robots/payments/payment_home_robot.dart';
import '../../robots/products/bundle_detail_robot.dart';
import '../../robots/products/product_detail_robot.dart';
import '../../robots/products/product_robot.dart';
import '../../robots/products/product_suggestion_robot.dart';
import '../../robots/returns/returns_root_robot.dart';

void main() {
  late LoginRobot loginRobot;
  late HomeRobot homeRobot;
  late CustomerSearchRobot customerSearchRobot;
  late CartRobot cartRobot;
  late ProductSuggestionRobot productSuggestionRobot;
  late CommonRobot commonRobot;
  late ProductRobot productRobot;
  late BundleDetailRobot bundleDetailRobot;
  late ReturnsRootRobot returnsRootRobot;
  late PaymentHomeRobot paymentHomeRobot;
  late AnnouncementsRobot announcementsRobot;
  late AnnouncementDetailRobot announcementDetailRobot;
  late OrdersRootRobot ordersRootRobot;
  late ProductDetailRobot productDetailRobot;
  late ViewByItemsDetailRobot viewByItemsDetailRobot;

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // initialize variables
  const marketMalaysia = 'Malaysia';
  const username = 'myclientuser';
  const password = 'St@ysafe01';
  const customerCode = '0070149863';

  testWidgets(
      'EZRX-T17 | Access Homepage after logging in and having existing ShipTo',
      (tester) async {
    //initialize neccessary robots
    loginRobot = LoginRobot(tester);
    homeRobot = HomeRobot(tester);
    customerSearchRobot = CustomerSearchRobot(tester);

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

    //verify homepage
    homeRobot.findCustomerSelector();
    homeRobot.findMiniCart();
    homeRobot.findQuickAccessMenu();
    homeRobot.findBannerInHomeScreen();
    await homeRobot.findBrowseProductIcon();
    await homeRobot.findAnnouncementsIcon();
  });

  testWidgets(
      'EZRX-T18 | Verify select ShipTo in Homepage incase existing items in cart',
      (tester) async {
    //initialize neccessary robots
    homeRobot = HomeRobot(tester);
    productRobot = ProductRobot(tester);
    customerSearchRobot = CustomerSearchRobot(tester);
    cartRobot = CartRobot(tester);
    commonRobot = CommonRobot(tester);
    productDetailRobot = ProductDetailRobot(tester);

    // initialize variables
    const customerCode_2 = '0000002012';

    //init app
    await runAppForTesting(tester);

    //home page
    homeRobot.findHomeTab();
    await homeRobot.tapHomeTab();
    homeRobot.verify();

    // select customer code
    await commonRobot.changeDeliveryAddress(customerCode);

    homeRobot.findProductsTab();
    await homeRobot.tapProductsTab();
    productRobot.verifyPageVisible();

    // add to cart
    await productRobot.tapToProductByIndex(1);
    productDetailRobot.verifyAddToCartCartButtonDisplayed();
    await productDetailRobot.tapAddToCart();
    await productDetailRobot.dismissSnackbar();
    await productDetailRobot.tapBackButton();

    // select customer code
    await productDetailRobot.dismissSnackbar();
    homeRobot.findCustomerCodeSelector();
    await homeRobot.tapCustomerCodeSelector();
    customerSearchRobot.verify();
    customerSearchRobot.findCustomerCodeSearchField();
    await customerSearchRobot.search(customerCode_2);

    // change address
    customerSearchRobot.findCustomerCode(customerCode_2);
    await customerSearchRobot.tapOnCustomerCode(customerCode_2);
    // cancel change address
    customerSearchRobot.findCancelChangeAddressButton();
    await customerSearchRobot.tapOnCancelChangeAddressButton();
    // confirm change address
    customerSearchRobot.findCustomerCode(customerCode_2);
    await customerSearchRobot.tapOnCustomerCode(customerCode_2);
    customerSearchRobot.findConfirmChangeAddressButton();
    await customerSearchRobot.tapOnConfirmChangeAddressButton();

    // verify cart empty
    homeRobot.findProductsTab();
    await homeRobot.tapProductsTab();
    productRobot.verifyPageVisible();
    homeRobot.findMiniCartIcon();
    await homeRobot.tapMiniCartIcon();
    cartRobot.verifyNoRecordFound();
  });

  testWidgets('EZRX-T19 | Verify select other ShipTo in Homepage',
      (tester) async {
    //initialize neccessary robots
    homeRobot = HomeRobot(tester);
    customerSearchRobot = CustomerSearchRobot(tester);
    commonRobot = CommonRobot(tester);

    //init app
    await runAppForTesting(tester);

    // select customer code
    await commonRobot.changeDeliveryAddress(customerCode);
    customerSearchRobot.verifyCustomerCodeIsSelected(customerCode);
  });

  testWidgets(
      'EZRX-T20 | Verify Search ShipTo with keyword contains Customer name/ShipTo name in Homepage',
      (tester) async {
    //initialize neccessary robots
    homeRobot = HomeRobot(tester);
    customerSearchRobot = CustomerSearchRobot(tester);

    // initialize variables
    const subCustomerCode = '007014';
    const subCustomerName = 'RSD';
    const subShipToCode = '475';
    const subShipToName = 'petaling';

    //init app
    await runAppForTesting(tester);

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
    //initialize neccessary robots
    homeRobot = HomeRobot(tester);
    customerSearchRobot = CustomerSearchRobot(tester);

    // initialize variables
    const invalidCode = '88888888';
    const invalidName = 'aaaaaaaa';

    //init app
    await runAppForTesting(tester);

    // select customer code
    homeRobot.findCustomerCodeSelector();
    await homeRobot.tapCustomerCodeSelector();
    customerSearchRobot.verify();

    // verify search results: invalid code
    await customerSearchRobot.search(invalidCode);
    customerSearchRobot.verifySearchNotFound();

    // verify search results: invalid name
    await customerSearchRobot.search(invalidName);
    customerSearchRobot.verifySearchNotFound();
  });

  testWidgets(
      'EZRX-T28 | Verify Search by inputting valid keyword contains Product name',
      (tester) async {
    //initialize neccessary robots
    homeRobot = HomeRobot(tester);
    customerSearchRobot = CustomerSearchRobot(tester);
    productSuggestionRobot = ProductSuggestionRobot(tester);
    commonRobot = CommonRobot(tester);

    // initialize variables
    const productName = 'bone';
    const invalidProductName = 'aaaaaaa';

    //init app
    await runAppForTesting(tester);

    // select customer code
    await commonRobot.changeDeliveryAddress(customerCode);
    await commonRobot.dismissSnackbar();

    // search for valid products
    homeRobot.findSearchProductField();
    await homeRobot.tapSearchProductField();
    await commonRobot.searchWithKeyboardAction(productName);

    productSuggestionRobot.verifySearchResults(productName);

    // search for invalid products
    await commonRobot.searchWithKeyboardAction(invalidProductName);
    productSuggestionRobot.verifySearchNotFound();
  });

  testWidgets('EZRX-T26 | Verify Tap & slide Banner in Homepage',
      (tester) async {
    //initialize neccessary robots
    homeRobot = HomeRobot(tester);

    //init app
    await runAppForTesting(tester);

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
    //initialize neccessary robots
    homeRobot = HomeRobot(tester);

    //init app
    await runAppForTesting(tester);

    //Product information
    homeRobot.findProductImage();
    homeRobot.findProductStockLabel();
    homeRobot.findProductDescription();
    homeRobot.findProductManufactured();
    homeRobot.findProductPrice();
    homeRobot.findProductFavouriteIcon();
    homeRobot.verifyProductNumber();
  });

  testWidgets(
      'EZRX-T49 | Verify Search ShipTo with keyword contains Customer code/ShipTo code in Homepage',
      (tester) async {
    //initialize neccessary robots
    homeRobot = HomeRobot(tester);
    customerSearchRobot = CustomerSearchRobot(tester);
    commonRobot = CommonRobot(tester);

    //init app
    await runAppForTesting(tester);

    //change address
    await commonRobot.changeDeliveryAddress(customerCode);
    customerSearchRobot.verifyCustomerCodeIsSelected(customerCode);
  });

  testWidgets('EZRX-T22 | Verify click on Orders action in Top navigation menu',
      (tester) async {
    //initialize neccessary robots
    homeRobot = HomeRobot(tester);
    ordersRootRobot = OrdersRootRobot(tester);

    //init app
    await runAppForTesting(tester);

    //tap on home quick access order
    homeRobot.findHomeQuickAccessOrdersMenu();
    await homeRobot.tapHomeQuickAccessOrdersMenu();

    //verify go to order page
    ordersRootRobot.verifyPage();
  });

  testWidgets(
      'EZRX-T23 | Verify click on Returns action in Top navigation menu',
      (tester) async {
    //initialize neccessary robots
    homeRobot = HomeRobot(tester);
    returnsRootRobot = ReturnsRootRobot(tester);

    //init app
    await runAppForTesting(tester);

    //tap on home quick access return
    homeRobot.findHomeQuickAccessReturnsMenu();
    await homeRobot.tapHomeQuickAccessReturnsMenu();

    //verify go to returns page
    returnsRootRobot.verifyRootPageVisible();
  });

  testWidgets(
      'EZRX-T24 | Verify click on Payments action in Top navigation menu',
      (tester) async {
    //initialize neccessary robots
    homeRobot = HomeRobot(tester);
    paymentHomeRobot = PaymentHomeRobot(tester);

    //init app
    await runAppForTesting(tester);

    //tap on home quick access payments
    homeRobot.findHomeQuickAccessPaymentsMenu();
    await homeRobot.tapHomeQuickAccessPaymentsMenu();

    //verify go to payments page
    paymentHomeRobot.verifyPaymentPage();
  });

  testWidgets('EZRX-T44 | Verify display Product on offer in Homepage',
      (tester) async {
    //initialize neccessary robots
    homeRobot = HomeRobot(tester);
    productRobot = ProductRobot(tester);

    //init app
    await runAppForTesting(tester);

    //tap on products on offer
    homeRobot.findProductsOnOffer();
    await homeRobot.tapProductsOnOfferIcon();

    //navigate to material page
    productRobot.verifyPageVisible();
  });

  testWidgets('EZRX-T45 | Verify display Bundles in Homepage', (tester) async {
    //initialize neccessary robots
    homeRobot = HomeRobot(tester);
    productRobot = ProductRobot(tester);

    //init app
    await runAppForTesting(tester);

    //tap on bundle
    homeRobot.findBundles();
    await homeRobot.tapBundlesIcon();

    //navigate to material page
    productRobot.verifyPageVisible();
  });

  testWidgets('EZRX-T47 | Verify display Browse products in Homepage',
      (tester) async {
    //initialize neccessary robots
    homeRobot = HomeRobot(tester);
    productRobot = ProductRobot(tester);

    //init app
    await runAppForTesting(tester);

    //tap on browse products
    await homeRobot.findBrowseProductsIcon();
    await homeRobot.tapBrowseProductsIcon();

    //navigate to material page
    productRobot.verifyPageVisible();
  });

  testWidgets('EZRX-T48 | Verify display Announcements in Homepage',
      (tester) async {
    //initialize neccessary robots
    homeRobot = HomeRobot(tester);
    announcementsRobot = AnnouncementsRobot(tester);

    //init app
    await runAppForTesting(tester);

    //tap on browse products
    await homeRobot.findAnnouncementsIcon();
    await homeRobot.tapAnnouncementsIcon();

    //verify go to announcements page
    announcementsRobot.verifyGoToAnnouncementsPage();
  });

  testWidgets('EZRX-T46 | Verify display Recently ordered in Homepage',
      (tester) async {
    //initialize neccessary robots
    homeRobot = HomeRobot(tester);
    customerSearchRobot = CustomerSearchRobot(tester);
    ordersRootRobot = OrdersRootRobot(tester);

    await runAppForTesting(tester);

    //tap on recently ordered
    await homeRobot.findRecentlyOrderIcon();
    await homeRobot.tapRecentlyOrderIcon();

    //verify go to order page
    ordersRootRobot.verifyPage();
  });

  testWidgets(
      'EZRX-T50 | Verify display Product detail in Product on offer in Homepage',
      (tester) async {
    //initialize neccessary robots
    homeRobot = HomeRobot(tester);

    //init app
    await runAppForTesting(tester);

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
    //initialize neccessary robots
    homeRobot = HomeRobot(tester);
    productDetailRobot = ProductDetailRobot(tester);

    //init app
    await runAppForTesting(tester);

    //move to Bundles
    homeRobot.findProductsOnOffer();

    //tap on first product
    await homeRobot.tapOnFirstProductOnOffer();

    //verify navigation to Material Detail Page
    productDetailRobot.verifyPage();
  });

  testWidgets('EZRX-T52 | Verify display Product detail in Bundles in Homepage',
      (tester) async {
    //initialize neccessary robots
    homeRobot = HomeRobot(tester);
    productRobot = ProductRobot(tester);

    //init app
    await runAppForTesting(tester);

    //change address
    await commonRobot.changeDeliveryAddress(customerCode);

    // Move to bundle
    homeRobot.findBundles();

    //verify bundles details
    homeRobot.verifyDisplayBundlesTag();
    homeRobot.verifyDisplayBundlesManufactured();
    homeRobot.verifyDisplayBundlesDescription();
    await homeRobot.verifyDisplayBundlesNumber();

    //Swipe bundle to right
    await homeRobot.slideToNextBundle();

    //Swipe bundle to left
    await homeRobot.slideToPreviousBundle();
  });

  testWidgets('EZRX-T53 | Verify click on Bundle in Bundle deals',
      (tester) async {
    //initialize neccessary robots
    homeRobot = HomeRobot(tester);
    bundleDetailRobot = BundleDetailRobot(tester);

    //init app
    await runAppForTesting(tester);

    //move to products on offer
    homeRobot.findBundles();

    //tap on first product
    await homeRobot.tapOnFirstBundle();
    bundleDetailRobot.verifyBundleDetailPage();
  });

  testWidgets('EZRX-T54 | Verify slide Item in Recently Ordered in Homepage',
      (tester) async {
    //initialize neccessary robots
    homeRobot = HomeRobot(tester);

    //init app
    await runAppForTesting(tester);

    //move to recently ordered
    await homeRobot.findRecentlyOrderIcon();

    //Swipe recently ordered to right
    await homeRobot.slideToNextRecentlyOrdered();

    //Swipe recently ordered to left
    await homeRobot.slideToPreviousRecentlyOrdered();
  });

  testWidgets('EZRX-T55 | Verify click on Item in Recently Ordered',
      (tester) async {
    //initialize neccessary robots
    homeRobot = HomeRobot(tester);
    productDetailRobot = ProductDetailRobot(tester);
    viewByItemsDetailRobot = ViewByItemsDetailRobot(tester);

    //init app
    await runAppForTesting(tester);

    //move to recently ordered
    await homeRobot.findRecentlyOrderIcon();

    //tap on first product
    await homeRobot.tapOnFirstRecentlyOrdered();

    //verify navigate to material detail
    viewByItemsDetailRobot.verifyPage();
  });

  testWidgets('EZRX-T56 | Verify slide Product in Browse Product in Homepage',
      (tester) async {
    //initialize neccessary robots
    homeRobot = HomeRobot(tester);
    productRobot = ProductRobot(tester);

    //init app
    await runAppForTesting(tester);

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
    //initialize neccessary robots
    homeRobot = HomeRobot(tester);
    productDetailRobot = ProductDetailRobot(tester);
    //init app
    await runAppForTesting(tester);

    //move to browse product
    await homeRobot.findBrowseProductsIcon();

    //tap on first product
    await homeRobot.tapOnFirstBrowseProduct();

    //verify navigate to material page
    productDetailRobot.verifyPage();
  });

  testWidgets(
      'EZRX-T58 | Verify slide Announcement in Announcements in Homepage',
      (tester) async {
    //initialize neccessary robots
    homeRobot = HomeRobot(tester);

    //init app
    await runAppForTesting(tester);

    //move to Announcements
    await homeRobot.findAnnouncementsIcon();

    //Swipe announcement to right
    final announcementInfo = homeRobot.getFirstAnnouncementInfo();
    await homeRobot.slideToNextAnnouncements();
    homeRobot.verifyNotFoundWidgetByText(announcementInfo!);

    //Swipe announcement to left
    await homeRobot.slideToPreviousAnnouncements();
    homeRobot.verifyFoundWidgetByText(announcementInfo);
  });

  testWidgets('EZRX-T59 | Verify click on Announcement in Announcements',
      (tester) async {
    //initialize neccessary robots
    homeRobot = HomeRobot(tester);
    announcementDetailRobot = AnnouncementDetailRobot(tester);

    //init app
    await runAppForTesting(tester);

    //move to Announcements
    await homeRobot.findAnnouncementsIcon();

    //tap on first product
    await homeRobot.tapOnFirstAnnouncement();

    //verify announcement detail page
    announcementDetailRobot.verifyPageVisible();
  });

  tearDown(() async {
    locator<ZephyrService>().setNameAndStatus();
    await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  });
}
