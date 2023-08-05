import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import '../../core/common.dart';
import '../../robots/account_settings_robot.dart';
import '../../robots/favorite_robot.dart';
import '../../robots/history/order_history_details_robot.dart';
import '../../robots/history/order_history_robot.dart';
import '../../robots/home/customer_search_robot.dart';
import '../../robots/home/home_robot.dart';
import '../../robots/home/ship_to_search_robot.dart';
import '../../robots/login_robot.dart';
import '../../robots/orders/cart_robot.dart';
import '../../robots/orders/create_order/material_list/material_list_robot.dart';
import '../../robots/orders/create_order/material_root_robot.dart';
import '../../robots/orders/create_order/order_confirmation_robot.dart';
import '../../robots/orders/create_order/order_summary_robot.dart';
import '../../robots/orders/create_order/material_list/material_detail_robot.dart';
import '../../robots/orders/order_template/order_template_detail_robot.dart';
import '../../robots/orders/order_template/order_template_list_robot.dart';
import '../../robots/orders/saved_order/saved_order_detail_robot.dart';
import '../../robots/orders/saved_order/saved_order_list_robot.dart';

void main() {
  late LoginRobot loginRobot;
  late HomeRobot homeRobot;
  late AccountSettingsRobot accountSettingsRobot;
  late CustomerSearchRobot customerSearchRobot;
  late ShipToSearchRobot shipToSearchRobot;
  late MaterialRootRobot materialRootRobot;
  late MaterialListRobot materialListRobot;
  late MaterialDetailRobot materialDetailRobot;
  late CartRobot cartRobot;
  late OrderSummaryRobot orderSummaryRobot;
  late OrderConfirmationRobot orderConfirmationRobot;
  late OrderHistoryRobot orderHistoryRobot;
  late OrderHistoryDetailsRobot orderHistoryDetailsRobot;
  late SavedOrderListRobot savedOrderListRobot;
  late SavedOrderDetailRobot savedOrderDetailRobot;
  late FavoriteRobot favoriteRobot;
  late OrderTemplateListRobot orderTemplateListRobot;
  late OrderTemplateDetailRobot orderTemplateDetailRobot;

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('MM External Sales Rep user - end to end - order test',
      (tester) async {
    //initialize neccessary robots
    loginRobot = LoginRobot(tester);
    homeRobot = HomeRobot(tester);
    accountSettingsRobot = AccountSettingsRobot(tester);
    customerSearchRobot = CustomerSearchRobot(tester);
    shipToSearchRobot = ShipToSearchRobot(tester);
    materialListRobot = MaterialListRobot(tester);
    materialDetailRobot = MaterialDetailRobot(tester);
    cartRobot = CartRobot(tester);
    orderSummaryRobot = OrderSummaryRobot(tester);
    orderConfirmationRobot = OrderConfirmationRobot(tester);
    orderHistoryRobot = OrderHistoryRobot(tester);
    orderHistoryDetailsRobot = OrderHistoryDetailsRobot(tester);
    savedOrderListRobot = SavedOrderListRobot(tester);
    savedOrderDetailRobot = SavedOrderDetailRobot(tester);
    favoriteRobot = FavoriteRobot(tester);
    orderTemplateListRobot = OrderTemplateListRobot(tester);
    orderTemplateDetailRobot = OrderTemplateDetailRobot(tester);
    materialRootRobot = MaterialRootRobot(tester);

    //initialize variables
    const username = 'mmexternalsalesrep';
    const password = 'St@ysafe01';
    const salesOrg = '2201';
    const customerCode = '0030337188';
    const newCustomerCode = '0030337324';
    const shipToCode = '0030337188';
    const userRole = 'External Sales Rep';
    const user = 'ExternalSR';
    //country & country currency variable
    const currency = 'MMK';
    const country = 'MM';
    //postal code & phone Number
    const minimumOrderAmount = '0';
    const phoneNumber = '1236789-40';
    const postalCode = '123740';
    //materials
    const materialWithoutPriceAbsolute = '21232282';
    const materialWithoutPrice = '000000000021232282';
    const material = '000000000021232273';
    const materialAbsolute = '21232273';
    const orderTemplateName = 'mmExternalSalesRepTemplate';
    const orderType = 'ZPOR';
    const materialQuantity = 20;
    //Material Price
    const materialListPrice = '1,311';
    const materialUnitPrice = '30'; // deal price applied
    const materialTotalPrice = '600'; //30*20
    const materialSubTotalPrice = materialTotalPrice;
    const materialGrandTotalPrice = materialSubTotalPrice; //0% vat
    const materialPriceNew = '35';
    const principleFullText = 'Besins';
    const principleSearchText = 'Bes';

    //init app
    await runAppForTesting(tester);
    await loginRobot.findAndCloseAnnouncementIcon();
    await loginRobot.login(username, password);

    //select sales org
    homeRobot.findSalesOrgSelector();
    await homeRobot.tapSalesOrgSelector();
    await homeRobot.selectSalesOrg(salesOrg);
    //select customer code
    homeRobot.findCustomerCodeSelector();
    await homeRobot.tapCustomerCodeSelector();
    customerSearchRobot.verify();
    await customerSearchRobot.search(customerCode);
    await customerSearchRobot.tapCustomerCode(customerCode);
    homeRobot.verify();
    //select shipping address
    homeRobot.findShipToSelector();
    await homeRobot.tapShipToSelector();
    shipToSearchRobot.verify();
    await shipToSearchRobot.search(shipToCode);
    await shipToSearchRobot.tapShipToCode(shipToCode: shipToCode);
    homeRobot.verify();
    await homeRobot.findAndCloseAnnouncementIcon();

    await homeRobot.goToCreateOrder();
    materialRootRobot.verify();
    await materialRootRobot.findAndCloseAnnouncementIcon();

    materialRootRobot.findPrincipleSelector();
    await materialRootRobot.tapPrincipleSelector();
    materialRootRobot.verifyMaterialFilterPage();
    await materialRootRobot.enterTextAndSubmit(
      principleSearchText: principleSearchText,
    );
    materialRootRobot.verifySearchResultAppears(
      principleFullText: principleFullText,
    );
    await materialRootRobot.tapOnSearchResult(
      principleFullText: principleFullText,
    );
    materialRootRobot.verifyApplyButton();
    await materialRootRobot.tapApplyButton();
    materialRootRobot.findPrincipleSelector();
    await materialRootRobot.tapPrincipleSelector();
    materialRootRobot.verifyMaterialFilterPage();
    materialRootRobot.findClearFilter();
    await materialRootRobot.tapClearFilter();
    materialRootRobot.verifyApplyButton();
    await materialRootRobot.tapApplyButton();
    materialRootRobot.findBundlesTab();
    //add material
    materialListRobot.verify();
    //Disable Order Type Selection as Enable
    materialListRobot.verifyDisableOrderTypeSelection();
    await materialListRobot.search(materialAbsolute);
    //Enable List Price
    materialListRobot.verifyEnableListPrice(material);
    //Display Currency at material list page
    materialListRobot.verifyCurrencyCheck(currency);
    await materialListRobot.tapMaterial(material);
    materialDetailRobot.verify();
    await materialDetailRobot.findAndCloseAnnouncementIcon();
    materialDetailRobot.verifyTieredPricingMaterial();
    materialDetailRobot.verifyBonusesMaterial();
    materialDetailRobot.findAddToCart();
    await materialDetailRobot.tapAddToCart();
    materialListRobot.findCartButton();
    await materialListRobot.tapCartButton();
    cartRobot.verify();
    cartRobot.findMaterialItem(material, 1);
    //cart page
    //update material quantity
    await cartRobot.tapMaterial(materialAbsolute);
    await materialDetailRobot.changeQuantity(materialQuantity);
    await materialDetailRobot.tapUpdateAddToCart();
    cartRobot.verify();
    cartRobot.findMaterialItem(material, materialQuantity);

    cartRobot.verifyEnablePriceOverride(material);
    await cartRobot.tapPrice(material);
    await cartRobot.changePrice(80);
    await cartRobot.tapPriceOverrideButton();
    cartRobot.verifyUnitPrice(currency, '80');
    await cartRobot.tapPrice(material);
    await cartRobot.changePrice(30);
    await cartRobot.tapPriceOverrideButton();
    cartRobot.verifyUnitPrice(currency, '30');
    ////Price - overriden///
    //Display Expiry Date
    cartRobot.verifyExpiryMaterial(material);

    cartRobot.findOrderSummary();
    await cartRobot.tapOrderSummary();
    //save template
    orderSummaryRobot.findOrderTemplate();
    await orderSummaryRobot.tapOrderTemplate();
    await orderSummaryRobot.enterTemplateName(orderTemplateName);
    orderSummaryRobot.findTemplateSaveButton();
    await orderSummaryRobot.tapTemplateSaveButton();
    await orderSummaryRobot.goBack();
    await cartRobot.goBack();
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await materialListRobot.goBack();
    homeRobot.findOrderTemplate();
    //try to add save template to cart
    await homeRobot.tapOrderTemplate();
    orderTemplateListRobot.findTemplateItem(orderTemplateName);
    await orderTemplateListRobot.tapTemplateItem(orderTemplateName);
    orderTemplateDetailRobot.verifyMaterialNumber(materialAbsolute);
    orderTemplateDetailRobot
        .verifyMaterialQuantity(materialQuantity.toString());
    orderTemplateDetailRobot.findAddToCart();
    await orderTemplateDetailRobot.tapAddToCart();
    cartRobot.verify();
    cartRobot.findOrderSummary();
    await cartRobot.tapOrderSummary();
    orderSummaryRobot.findContinueButton(0);
    await orderSummaryRobot.tapContinueButton(0);
    orderSummaryRobot.findContinueButton(1);
    await orderSummaryRobot.tapContinueButton(1);
    orderSummaryRobot.findContinueButton(2);
    await orderSummaryRobot.tapContinueButton(2);
    orderSummaryRobot.findSpecialInstruction();
    await orderSummaryRobot.enterSpecialInstruction('special instruction');
    await orderSummaryRobot.getKeyboardDown();
    orderSummaryRobot.findCollectiveNumber();
    await orderSummaryRobot.enterCollectiveNumber('Collective Number');
    await orderSummaryRobot.getKeyboardDown();
    orderSummaryRobot.findContinueButton(3);
    await orderSummaryRobot.tapContinueButton(3);
    //save order
    orderSummaryRobot.findSave();
    await orderSummaryRobot.tapSave();
    savedOrderListRobot.verify();
    savedOrderListRobot.findOrder();
    savedOrderListRobot.verifySoldToID(customerCode);
    savedOrderListRobot.verifyShipToID(shipToCode);
    await savedOrderListRobot.tapOrder();
    savedOrderDetailRobot.verify();
    savedOrderDetailRobot.verifyMaterialNumber(materialAbsolute);
    savedOrderDetailRobot.verifyMaterialQuantity(materialQuantity.toString());
    savedOrderDetailRobot.findAddToCart();
    await savedOrderDetailRobot.tapAddToCart();
    cartRobot.verify();
    await tester.pumpAndSettle(const Duration(seconds: 5));
    cartRobot.findOrderSummary();
    await cartRobot.tapOrderSummary();
    orderSummaryRobot.verifySoldToID(customerCode);
    orderSummaryRobot.findContinueButton(0);
    await orderSummaryRobot.tapContinueButton(0);
    orderSummaryRobot.verifySoldToID(customerCode);
    orderSummaryRobot.verifyCountry(country);
    orderSummaryRobot.verifyPhone(phoneNumber);
    orderSummaryRobot.verifyPostalCode(postalCode);
    orderSummaryRobot.findContinueButton(1);
    await orderSummaryRobot.tapContinueButton(1);
    orderSummaryRobot.verifyShipToID(shipToCode);
    orderSummaryRobot.verifyCountry(country);
    orderSummaryRobot.verifyPhone(phoneNumber);
    orderSummaryRobot.verifyPostalCode(postalCode);
    orderSummaryRobot.findContinueButton(2);
    await orderSummaryRobot.tapContinueButton(2);
    //Enable Special Instructions
    orderSummaryRobot.findSpecialInstruction();
    await orderSummaryRobot.enterSpecialInstruction('specialInstruction1');
    await orderSummaryRobot.getKeyboardDown();
    orderSummaryRobot.findCollectiveNumber();
    await orderSummaryRobot.enterCollectiveNumber('CollectiveNumber1');
    await orderSummaryRobot.getKeyboardDown();
    orderSummaryRobot.findContinueButton(3);
    await orderSummaryRobot.tapContinueButton(3);
    //Minimum Order Amount
    orderSummaryRobot.allowMinimumOrderAmount('$currency $minimumOrderAmount');
    orderSummaryRobot.verifySubTotalPrice(currency, materialSubTotalPrice);
    orderSummaryRobot.verifyGrandTotalPrice(currency, materialGrandTotalPrice);
    //verify orders with currency check
    orderSummaryRobot.findMaterialItem(material, materialQuantity);
    orderSummaryRobot.verifyMaterialListPrice(
      true,
      currency,
      materialListPrice,
    );
    orderSummaryRobot.verifyMaterialUnitPrice(
      true,
      currency,
      materialUnitPrice,
    );
    orderSummaryRobot.verifyMaterialTotalPrice(
      true,
      currency,
      materialTotalPrice,
    );
    orderSummaryRobot.findSubmit();
    await orderSummaryRobot.tapSubmit();
    //minimum order amount crosses
    orderConfirmationRobot.verify();
    orderConfirmationRobot.findGoToOrderHistoryButton();
    await orderConfirmationRobot.tapGoToOrderHistoryButton();
    orderHistoryRobot.verify();
    //order history tab
    orderHistoryRobot.findOrderedItem();
    orderHistoryRobot.verifyOrderType(orderType);
    orderHistoryRobot.verifyMaterialID(materialAbsolute);
    orderHistoryRobot.verifyQuantity(materialQuantity.toString());
    await orderHistoryRobot.tapOrderedItem();
    orderHistoryDetailsRobot.verify();
    orderHistoryDetailsRobot.findOrderDetails();
    orderHistoryDetailsRobot.verifyOrderType(orderType);
    orderHistoryDetailsRobot.verifyContactNumber(phoneNumber);
    await orderHistoryDetailsRobot.tapOrderDetails();
    orderHistoryDetailsRobot.findSoldToAddress();
    orderHistoryDetailsRobot.verifySoldToID(customerCode);
    orderHistoryDetailsRobot.verifyPostalCode(postalCode);
    orderHistoryDetailsRobot.verifyCountry(country);
    orderHistoryDetailsRobot.verifyPhone(phoneNumber);
    await orderHistoryDetailsRobot.tapSoldToAddress();
    orderHistoryDetailsRobot.findShipToAddress();
    orderHistoryDetailsRobot.verifyShipToID(shipToCode);
    orderHistoryDetailsRobot.verifyPostalCode(postalCode);
    orderHistoryDetailsRobot.verifyCountry(country);
    orderHistoryDetailsRobot.verifyPhone(phoneNumber);
    await orderHistoryDetailsRobot.tapShipToAddress();
    orderHistoryDetailsRobot.findInvoices();
    orderHistoryDetailsRobot.findOrderSummary();
    orderHistoryDetailsRobot.verifyMaterialType('Comm');
    orderHistoryDetailsRobot.verifyMaterialID(materialAbsolute);
    orderHistoryDetailsRobot.verifyQuantity(materialQuantity.toString());
    //Enable Tax Display
    orderHistoryDetailsRobot.verifyEnableTaxDisplay();
    //Enable Order History Price in history detail page
    orderHistoryDetailsRobot.verifyEnableZPPrice(material);
    orderHistoryDetailsRobot.verifyEnableTotalPrice(material);
    //Display Batch Number and Expiry Date in Order Details
    orderHistoryDetailsRobot.verifyDisplayBatchExpiryDate();
    //Disable Delivery Time (PDD/POD)
    orderHistoryDetailsRobot.verifyDeliveryDateTime(false);
    //re-order
    await orderHistoryDetailsRobot.tapOrderSummary();
    orderHistoryDetailsRobot.findReOrderButton();
    await orderHistoryDetailsRobot.tapReOrderButton();
    cartRobot.verify();
    cartRobot.findMaterialItem(material, materialQuantity);
    await cartRobot.goBack();
    orderHistoryRobot.verify();
    orderHistoryRobot.findOrderHistoryFilter();
    await orderHistoryRobot
        .findOrderHistoryFilterByMaterialNumber(materialAbsolute);
    await orderHistoryRobot.tapOrderHistoryFilterApplyButton();
    orderHistoryRobot.findOrderItemByMaterialNumber(material);
    await homeRobot.tapHomeTab();
    //find and delete template order
    homeRobot.verify();
    homeRobot.findOrderTemplate();
    await homeRobot.tapOrderTemplate();
    orderTemplateListRobot.findTemplateItemDelete();
    await orderTemplateListRobot.tapTemplateItemDelete();
    orderTemplateListRobot.verifyConfirmationDialog();
    orderTemplateListRobot.findConfirmButton();
    await orderTemplateListRobot.tapConfirmButton();
    await orderTemplateListRobot.goBack();
    homeRobot.verify();
    homeRobot.findSavedOrders();
    await homeRobot.tapSavedOrders();
    //find and delete saved order
    savedOrderListRobot.findOrder();
    savedOrderListRobot.findSavedOrderItemDelete();
    await savedOrderListRobot.tapSavedOrderItemDelete();
    savedOrderListRobot.verifyConfirmationDialog();
    savedOrderListRobot.findConfirmButton();
    await savedOrderListRobot.tapConfirmButton();
    await savedOrderListRobot.goBack();
    homeRobot.verify();
    //select customer code
    homeRobot.findCustomerCodeSelector();
    await homeRobot.tapCustomerCodeSelector();
    customerSearchRobot.verify();
    await customerSearchRobot.search(newCustomerCode);
    await customerSearchRobot.tapCustomerCode(newCustomerCode);
    await homeRobot.goToCreateOrder();
    await materialListRobot.clearSearchMaterial();
    await materialListRobot.search(materialWithoutPriceAbsolute);
    materialListRobot.verifyEnableListPrice(materialWithoutPrice);
    //enable materials without price
    await materialListRobot.tapMaterial(materialWithoutPrice);
    materialDetailRobot.verify();
    materialDetailRobot.findAddToCart();
    await materialDetailRobot.tapAddToCart();
    await materialDetailRobot.goBack();
    materialListRobot.findCartButton();
    await materialListRobot.tapCartButton();
    //enable materials without price add to cart check
    cartRobot.verify();
    cartRobot.findMaterialItem(materialWithoutPrice, 1, false);
    await cartRobot.goBack();
    await materialListRobot.goBack();
    homeRobot.verify();
    //select customer code
    homeRobot.findCustomerCodeSelector();
    await homeRobot.tapCustomerCodeSelector();
    customerSearchRobot.verify();
    await customerSearchRobot.search(customerCode);
    await customerSearchRobot.tapCustomerCode(customerCode);
    homeRobot.verify();
    await homeRobot.goToCreateOrder();
    //check favorite material
    await materialListRobot.search(materialAbsolute);
    materialListRobot.findFavoriteIcon(materialAbsolute);
    await materialListRobot.tapFavoriteIcon(materialAbsolute);
    await materialListRobot.goBack();
    homeRobot.verify();
    homeRobot.findFavoriteTab();
    await homeRobot.tapFavoriteTab();
    favoriteRobot.verify();
    favoriteRobot.findFavoriteItem();
    favoriteRobot.verifyMaterialNumber(materialAbsolute);
    favoriteRobot.verifyUnitPrice('$currency $materialPriceNew');
    favoriteRobot.findFavoriteIcon(material);
    await favoriteRobot.tapFavoriteIcon(material);
    homeRobot.findAccountTab();
    await homeRobot.tapAccountTab();
    //account page
    accountSettingsRobot.verify();
    //check login on behalf
    accountSettingsRobot.findNoLoginOnBehalf();
    accountSettingsRobot.findUserFullName('$country $user');
    accountSettingsRobot.findUserRole(userRole);
  });
}
