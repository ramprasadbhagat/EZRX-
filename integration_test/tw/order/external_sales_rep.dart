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

  testWidgets('TW external rep - end to end - order test', (tester) async {
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
    const username = 'twexternalsalesrep';
    const password = 'St@ysafe01';
    const salesOrg = '2800';
    const customerCode = '0030038539';
    const shipToCode = '0070100095';
    //country & country currency variable
    const currency = 'TWD';
    const country = 'NTW';
    //postal code & phone Number
    const minimumOrderAmount = '0';
    const phoneNumber = '035943248';
    const postalCode = '31010';
    //materials
    const materialWithoutPriceAbsolute = '23154900';
    const materialWithoutPrice = '000000000023154900';
    const material = '000000000023154900';
    const materialAbsolute = '23154900';
    const orderTemplateName = 'twExternalSalesRepTemplate';
    const orderType = 'ZPOR';

    //init app
    await runAppForTesting(tester);
    await loginRobot.findAndCloseAnnouncementIcon();
    await loginRobot.login(username, password);
    await homeRobot.findAndCloseAnnouncementIcon();
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

    //create order for customer
    await homeRobot.goToCreateOrder();
    await materialRootRobot.findAndCloseAnnouncementIcon();
    materialListRobot.verify();
    //Disable Order Type Selection
    materialListRobot.verifyDisableOrderTypeSelection();

    await materialListRobot.search(materialWithoutPriceAbsolute);

    //Enable Government Material Code
    materialListRobot.verifyEnableGMC();
    //Enable List Price
    materialListRobot.verifyEnableListPrice(materialWithoutPrice);
    //Display Currency at material list page
    materialListRobot.verifyCurrencyCheck(currency);

    await materialListRobot.tapMaterial(materialWithoutPrice);
    materialDetailRobot.verify();
    await materialDetailRobot.changeQuantity(4);
    await materialDetailRobot.deductQuantity();
    await materialDetailRobot.addQuantity();
    materialDetailRobot.findAddToCart();
    await materialDetailRobot.tapAddToCart();
    materialListRobot.verify();
    materialListRobot.findCartButton();
    await materialListRobot.tapCartButton();
    //cart page
    cartRobot.verify();
    cartRobot.findMaterialItem(materialWithoutPrice, 4);
    //Disable GST At Total Level Only
    //Disable GST
    //GST value 0%
    cartRobot.verifyVatAtTotalLevel(materialWithoutPrice, 0, false);
    //update material quantity
    await cartRobot.tapMaterial(materialWithoutPriceAbsolute);
    await materialDetailRobot.changeQuantity(20);
    await materialDetailRobot.tapUpdateAddToCart();
    cartRobot.verifyHideStockDisplay();
    cartRobot.verify();
    cartRobot.findMaterialItem(materialWithoutPrice, 20);
    cartRobot.verifyHideStockDisplay();
    cartRobot.findOrderSummary();
    await cartRobot.tapOrderSummary();
    //order summary pageF
    //1. Customer details
    orderSummaryRobot.verifySoldToID(customerCode);
    //2. Sold to Address
    orderSummaryRobot.findContinueButton(0);
    await orderSummaryRobot.tapContinueButton(0);
    orderSummaryRobot.verifySoldToID(customerCode);
    orderSummaryRobot.verifyCountry(country);
    orderSummaryRobot.verifyPhone(phoneNumber);
    orderSummaryRobot.verifyPostalCode(postalCode);

    //3. Ship to Address
    orderSummaryRobot.findContinueButton(1);
    await orderSummaryRobot.tapContinueButton(1);
    orderSummaryRobot.verifySoldToID(customerCode);
    orderSummaryRobot.verifyCountry(country);
    orderSummaryRobot.verifyPhone(phoneNumber);
    orderSummaryRobot.verifyPostalCode(postalCode);

    //4. Additional Information
    orderSummaryRobot.findContinueButton(2);
    await orderSummaryRobot.tapContinueButton(2);
    //Enable Special Instructions
    orderSummaryRobot.findSpecialInstruction();
    await orderSummaryRobot
        .enterSpecialInstruction('external special instruction');
    //Enable Contact Person
    await orderSummaryRobot.enterContactPerson('Contact Person 1');
    await orderSummaryRobot.getKeyboardDown();
    //Enable Payment Terms
    orderSummaryRobot.findSelectPaymentTerm();
    await orderSummaryRobot.tapSelectPaymentTerm();
    await orderSummaryRobot.tapPaymentTerm();

    //4. Cart Details
    orderSummaryRobot.findContinueButton(3);
    await orderSummaryRobot.tapContinueButton(3);
    //Minimum Order Amount
    orderSummaryRobot.allowMinimumOrderAmount(minimumOrderAmount);
    //verify orders with currency check
    orderSummaryRobot.findMaterialItem(materialWithoutPrice, 20);
    orderSummaryRobot.verifyMaterialListPrice(false, currency, '0.00');
    orderSummaryRobot.verifyMaterialUnitPrice(false, currency, '0.00');
    orderSummaryRobot.verifyMaterialTotalPrice(false, currency, '0.00');
    orderSummaryRobot.findSave();
    orderSummaryRobot.findSubmit();
    await orderSummaryRobot.tapSubmit();
    orderConfirmationRobot.verify();
    await orderConfirmationRobot.goBack();

    // Create Order and Save template
    // select customer code
    homeRobot.verify();
    await homeRobot.goToCreateOrder();
    //Disable Bundles
    materialRootRobot.findNoBundleTab();
    //Disable Order Type Selection
    materialListRobot.verify();
    materialListRobot.verifyDisableOrderTypeSelection();
    await materialListRobot.clearSearchMaterial();
    await materialListRobot.search(materialWithoutPriceAbsolute);

    //Enable Government Material Code
    materialListRobot.verifyEnableGMC();
    //Enable List Price
    materialListRobot.verifyEnableListPrice(materialWithoutPrice);

    //Display Currency at material list page
    materialListRobot.verifyCurrencyCheck(currency);

    await materialListRobot.tapMaterial(materialWithoutPrice);
    materialDetailRobot.verify();
    await materialDetailRobot.changeQuantity(4);
    await materialDetailRobot.deductQuantity();
    await materialDetailRobot.addQuantity();
    materialDetailRobot.findAddToCart();
    await materialDetailRobot.tapAddToCart();
    materialListRobot.verify();
    materialListRobot.findCartButton();
    await materialListRobot.tapCartButton();
    //cart page
    cartRobot.verify();
    cartRobot.findMaterialItem(materialWithoutPrice, 4);
    //Disable GST At Total Level Only
    //Disable GST
    //GST value 0%
    cartRobot.verifyVatAtTotalLevel(materialWithoutPrice, 0, false);
    //update material quantity
    await cartRobot.tapMaterial(materialWithoutPriceAbsolute);
    await materialDetailRobot.changeQuantity(20);
    await materialDetailRobot.tapUpdateAddToCart();
    cartRobot.verify();
    cartRobot.findMaterialItem(materialWithoutPrice, 20);

    cartRobot.verifyHideStockDisplay();
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
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await materialListRobot.goBack();
    homeRobot.findOrderTemplate();
    //try to add save template to cart
    await homeRobot.tapOrderTemplate();
    orderTemplateListRobot.findTemplateItem(orderTemplateName);
    await orderTemplateListRobot.tapTemplateItem(orderTemplateName);
    orderTemplateDetailRobot.verifyMaterialNumber(materialAbsolute);
    orderTemplateDetailRobot.verifyMaterialQuantity('20');
    orderTemplateDetailRobot.findAddToCart();
    await orderTemplateDetailRobot.tapAddToCart();
    cartRobot.verifyHideStockDisplay();
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
    //Enable Contact Person
    await orderSummaryRobot.enterContactPerson('Contact Person 2');
    await orderSummaryRobot.getKeyboardDown();
    //Enable Payment Terms
    orderSummaryRobot.findSelectPaymentTerm();
    await orderSummaryRobot.tapSelectPaymentTerm();
    await orderSummaryRobot.tapPaymentTerm();
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
    savedOrderDetailRobot.verifyMaterialQuantity('20');
    savedOrderDetailRobot.findAddToCart();
    await savedOrderDetailRobot.tapAddToCart();
    cartRobot.verifyHideStockDisplay();
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
    //Enable Contact Person
    await orderSummaryRobot.enterContactPerson('Contact Person 3');
    await orderSummaryRobot.getKeyboardDown();
    orderSummaryRobot.findContinueButton(3);
    await orderSummaryRobot.tapContinueButton(3);
    //Minimum Order Amount
    orderSummaryRobot.allowMinimumOrderAmount(minimumOrderAmount);
    orderSummaryRobot.verifySubTotalPrice(currency, '0.00');
    orderSummaryRobot.verifyGrandTotalPrice(currency, '0.00');
    //verify orders with currency check
    orderSummaryRobot.findMaterialItem(material, 20);
    orderSummaryRobot.verifyMaterialListPrice(false, currency, '0.00');
    orderSummaryRobot.verifyMaterialUnitPrice(false, currency, '0.00');
    orderSummaryRobot.verifyMaterialTotalPrice(false, currency, '0.00');
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
    //Disable Processing Status Display
    orderHistoryRobot.verifyOrderProcessingStatus(false);
    orderHistoryRobot.verifyMaterialID(materialAbsolute);
    orderHistoryRobot.verifyQuantity('20');
    await orderHistoryRobot.tapOrderedItem();
    orderHistoryDetailsRobot.verify();
    orderHistoryDetailsRobot.findOrderDetails();
    orderHistoryDetailsRobot.verifyOrderType(orderType);
    orderHistoryDetailsRobot.verifyContactPerson('Contact Person 3');
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
    orderHistoryDetailsRobot.verifyPostalCode('31000');
    orderHistoryDetailsRobot.verifyCountry(country);
    orderHistoryDetailsRobot.verifyPhone(phoneNumber);
    await orderHistoryDetailsRobot.tapShipToAddress();
    orderHistoryDetailsRobot.findInvoices();
    cartRobot.verifyHideStockDisplay();
    orderHistoryDetailsRobot.findOrderSummary();
    orderHistoryDetailsRobot.verifyMaterialType('Comm');
    orderHistoryDetailsRobot.verifyMaterialID(materialAbsolute);
    orderHistoryDetailsRobot.verifyQuantity('20');
    //Enable Order History Price in history detail page
    orderHistoryDetailsRobot.verifyEnableZPPrice(material);
    orderHistoryDetailsRobot.verifyEnableTotalPrice(material);
    //Enable Tax Display
    orderHistoryDetailsRobot.verifyEnableTaxDisplay();
    //Display Discount in Order Details
    orderHistoryDetailsRobot.verifyDiscountRateDisplay();
    //Display Batch Number and Expiry Date in Order Details
    orderHistoryDetailsRobot.verifyDisplayBatchExpiryDate();
    //Disable Delivery Time (PDD/POD)
    orderHistoryDetailsRobot.verifyDeliveryDateTime(false);
    //re-order
    await orderHistoryDetailsRobot.tapOrderSummary();
    orderHistoryDetailsRobot.findReOrderButton();
    await orderHistoryDetailsRobot.tapReOrderButton();
    cartRobot.verify();
    cartRobot.findMaterialItem(material, 20);
    await cartRobot.goBack();
    orderHistoryRobot.verify();
    orderHistoryRobot.findOrderHistoryFilter();
    await orderHistoryRobot
        .findOrderHistoryFilterByMaterialNumber(materialAbsolute);
    await orderHistoryRobot.tapOrderHistoryFilterApplyButton();
    orderHistoryRobot.findOrderItemByMaterialNumber(material);
    await homeRobot.tapHomeTab();
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
    await homeRobot.goToCreateOrder();
    await materialListRobot.clearSearchMaterial();
    //check favorite material
    await materialListRobot.search(materialAbsolute);
    materialListRobot.findFavoriteIcon(materialAbsolute);
    await materialListRobot.tapFavoriteIcon(materialAbsolute);
    await materialListRobot.goBack();
    homeRobot.verify();
    homeRobot.findFavoriteTab();
    await homeRobot.tapFavoriteTab();
    favoriteRobot.verify();
    // favoriteRobot.findFavoriteItem();
    favoriteRobot.verifyMaterialNumber(materialAbsolute);
    favoriteRobot.findFavoriteIcon(material);
    await favoriteRobot.tapFavoriteIcon(material);
    homeRobot.findAccountTab();
    await homeRobot.tapAccountTab();
    //account page
    accountSettingsRobot.verify();
    //check login on behalf
    accountSettingsRobot.findNoLoginOnBehalf();
    accountSettingsRobot.findUserFullName('TW ExternalSR');
    accountSettingsRobot.findUserRole('External Sales Rep');
  });
}
