import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../core/common.dart';
import '../../robots/common/common_robot.dart';
import '../../robots/home/customer_search_robot.dart';
import '../../robots/home/home_robot.dart';
import '../../robots/login_robot.dart';
import '../../robots/orders/cart/cart_robot.dart';
import '../../robots/orders/create_order/material_list/material_detail_robot.dart';
import '../../robots/orders/create_order/material_list/material_list_robot.dart';
import '../../core/infrastructure/infra_core/zephyr_service/zephyr_service.dart';
import '../../core/infrastructure/zephyr/repository/zephyr_repository.dart';
import '../../core/test_locator.dart';
import '../../robots/products/product_suggestion_robot.dart';

void main() {
  late LoginRobot loginRobot;
  late HomeRobot homeRobot;
  late CustomerSearchRobot customerSearchRobot;
  late MaterialDetailRobot materialDetailRobot;
  late CartRobot cartRobot;
  late ProductSuggestionRobot productSuggestionRobot;
  late CommonRobot commonRobot;
  late MaterialListRobot materialListRobot;

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
    materialDetailRobot = MaterialDetailRobot(tester);
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
    homeRobot.findBrowseProductIcon();
    await homeRobot.findAnnouncementsIcon();
  });

  testWidgets(
      'EZRX-T18 | Verify select ShipTo in Homepage incase existing items in cart',
      (tester) async {
    //initialize neccessary robots
    homeRobot = HomeRobot(tester);
    materialListRobot = MaterialListRobot(tester);
    customerSearchRobot = CustomerSearchRobot(tester);
    cartRobot = CartRobot(tester);
    commonRobot = CommonRobot(tester);

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
    materialListRobot.verifyMaterialPage();

    // add to cart
    await materialListRobot.tapToProductByIndex(1);
    materialDetailRobot.findAddToCartButton();
    await materialDetailRobot.tapAddToCartButton();
    materialDetailRobot.findCloseMessageIcon();
    await materialDetailRobot.tapOnCloseMessageIcon();
    await materialDetailRobot.goBackToProductTab();

    // select customer code
    await materialDetailRobot.tapOnCloseMessageIcon();
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
    materialListRobot.verifyMaterialPage();
    homeRobot.findMiniCartIcon();
    await homeRobot.tapMiniCartIcon();
    cartRobot.verifyCartIsEmpty();
  });

  testWidgets('EZRX-T19 | Verify select other ShipTo in Homepage',
      (tester) async {
    //initialize neccessary robots
    homeRobot = HomeRobot(tester);
    customerSearchRobot = CustomerSearchRobot(tester);

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
      'EZRX-T27 | Verify Search by inputting valid keyword contains Product name',
      (tester) async {
    //initialize neccessary robots
    homeRobot = HomeRobot(tester);
    customerSearchRobot = CustomerSearchRobot(tester);
    productSuggestionRobot = ProductSuggestionRobot(tester);

    // initialize variables
    const productName = 'bone';
    const invalidProductName = 'aaaaaaa';

    //init app
    await runAppForTesting(tester);

    // select customer code
    await commonRobot.changeDeliveryAddress(customerCode);

    // search for valid products
    homeRobot.findSearchProductField();
    await homeRobot.tapSearchProductField();
    await commonRobot.searchWithKeyboardAction(productName);

    productSuggestionRobot.verifySearchResults(productName);

    // search for invalid products
    await commonRobot.searchWithKeyboardAction(invalidProductName);
    productSuggestionRobot.verifySearchNotFound();
  });

  tearDown(() async {
    locator<ZephyrService>().setNameAndStatus();
    await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  });
}
