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
import '../../robots/orders/create_order/bundle_list/bundle_detail_robot.dart';
import '../../robots/orders/create_order/bundle_list/bundle_list_robot.dart';
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
  late BundleListRobot bundleListRobot;
  late BundleDetailRobot bundleDetailRobot;
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

  testWidgets('SG external rep - end to end - order test', (tester) async {
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
    bundleListRobot = BundleListRobot(tester);
    bundleDetailRobot = BundleDetailRobot(tester);

    //initialize variables
    const username = 'sgexternalsalesrep';
    const password = 'St@ysafe01';
    const salesOrg = '2601';
    const ediCustomerCode = '0030032074';
    const ediShipToCode = '0070042484';
    const customerCode = '0030036549';
    const shipToCode = '0070047032';
    //country & country currency variable
    const currency = 'SGD';
    const country = 'SG';
    //postal code & phone Number
    const phoneNumberEdi = '62581234';
    const postalCodeEdi = '308087';
    const minimumOrderAmount = '100';
    const phoneNumber = '63392334';
    const postalCode = '188425';
    //materials
    const bundleCode = '0010276898';
    const bundleMaterial1 = '000000000023007310';
    const materialForEdi = '000000000021022175';
    const materialForEdiAbsolute = '21022175';
    const materialWithoutPriceAbsolute = '21230639';
    const materialWithoutPrice = '000000000021230639';
    const material = '000000000023007310';
    const materialAbsolute = '23007310';
    const orderTemplateName = 'sgExternalSalesRepTemplate';
    const orderType = 'ZPOR';

    //init app
    await runAppForTesting(tester);
    await loginRobot.findAndCloseAnnouncementIcon();
    await loginRobot.login(username, password);
    //select sales org
    await homeRobot.findAndCloseAnnouncementIcon();
    homeRobot.findSalesOrgSelector();
    await homeRobot.tapSalesOrgSelector();
    await homeRobot.selectSalesOrg(salesOrg);
    //select customer code
    homeRobot.findCustomerCodeSelector();
    await homeRobot.tapCustomerCodeSelector();
    customerSearchRobot.verify();
    await customerSearchRobot.search(ediCustomerCode);
    await customerSearchRobot.tapCustomerCode(ediCustomerCode);
    homeRobot.verify();
    //select shipping address
    homeRobot.findShipToSelector();
    await homeRobot.tapShipToSelector();
    shipToSearchRobot.verify();
    await shipToSearchRobot.search(ediShipToCode);
    await shipToSearchRobot.tapShipToCode(shipToCode: ediShipToCode);
    homeRobot.verify();
    //Edi customer check
    homeRobot.verifyEdiCustomer();
    //create order for EDi customer
    await homeRobot.goToCreateOrder();

    materialRootRobot.verify();
    await materialRootRobot.findAndCloseAnnouncementIcon();
    materialRootRobot.findBundlesTab();
    await materialRootRobot.tapBundlesTab();
    //add bundles
    bundleListRobot.verify();
    await bundleListRobot.tapBundle(bundleCode);
    bundleDetailRobot.verify();
    await bundleDetailRobot.changeBundleMaterialQuantity(bundleMaterial1, 8);
    await bundleDetailRobot.tapAddBundleMaterialQuantity(bundleMaterial1);
    await bundleDetailRobot.tapDeductBundleMaterialQuantity(bundleMaterial1);
    await bundleDetailRobot.addBundlesToCart();
    await cartRobot.goBack();
    await bundleDetailRobot.goBack();
    //add material
    await materialRootRobot.tapMaterialTab();
    materialListRobot.verify();
    //Disable Order Type Selection as Enable
    materialListRobot.verifyDisableOrderTypeSelection();
    await materialListRobot.search(materialForEdiAbsolute);
    //Enable List Price
    materialListRobot.verifyEnableListPrice(materialForEdi);
    //Display Currency at material list page
    materialListRobot.verifyCurrencyCheck(currency);
    await materialListRobot.tapMaterial(materialForEdi);
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
    cartRobot.findMaterialItem(materialForEdi, 4);
    //Display Expiry Date
    cartRobot.verifyExpiryMaterial(
      materialForEdi,
    );
    //Enable GST At Total Level Only
    //GST value %
    cartRobot.verifyEnableVatAtTotalLevel(materialForEdi, 8);
    //update material quantity
    await cartRobot.tapMaterial(materialForEdiAbsolute);
    await materialDetailRobot.changeQuantity(20);
    await materialDetailRobot.tapUpdateAddToCart();
    cartRobot.verify();
    cartRobot.findMaterialItem(materialForEdi, 20);
    //Enable Discount override
    cartRobot.verifyEnableDiscountOverrideMaterial();
    await cartRobot.setDiscountOverrideMaterial(15.5);
    cartRobot.verifyDiscountOverridePercentage(15.5);
    //Add remark (Enable Material Remarks)
    cartRobot.findRemarkButton(materialForEdi);
    await cartRobot.addRemark(materialForEdi, 'Good');
    cartRobot.findRemarkText('Good');
    await cartRobot.editRemark(materialForEdi, 'Nice');
    await cartRobot.deleteRemark(materialForEdi);
    //bundle update
    await cartRobot.findBundleItem(bundleCode);
    await cartRobot.changeQuantity(bundleMaterial1, 10);
    await cartRobot.tapDeductQuantity(bundleMaterial1);
    await cartRobot.tapAddQuantity(bundleMaterial1);
    cartRobot.findBundleMaterialItem(bundleMaterial1, 10);
    //Display Expiry Date
    cartRobot.verifyExpiryMaterial(bundleMaterial1);
    cartRobot.findOrderSummary();
    await cartRobot.tapOrderSummary();
    //order summary page
    orderSummaryRobot.verifyEdiCustomer();
    orderSummaryRobot.verifySoldToID(ediCustomerCode);
    orderSummaryRobot.findContinueButton(0);
    await orderSummaryRobot.tapContinueButton(0);
    orderSummaryRobot.verifySoldToID(ediCustomerCode);
    orderSummaryRobot.verifyCountry(country);
    orderSummaryRobot.verifyPhone(phoneNumberEdi);
    orderSummaryRobot.verifyPostalCode(postalCodeEdi);
    orderSummaryRobot.findContinueButton(1);
    await orderSummaryRobot.tapContinueButton(1);
    orderSummaryRobot.verifyShipToID(ediShipToCode);
    orderSummaryRobot.verifyCountry(country);
    orderSummaryRobot.verifyPhone('60000000');
    orderSummaryRobot.verifyPostalCode(postalCodeEdi);
    orderSummaryRobot.findContinueButton(2);
    await orderSummaryRobot.tapContinueButton(2);
    //Enable Special Instructions
    orderSummaryRobot.findSpecialInstruction();
    await orderSummaryRobot
        .enterSpecialInstruction('external special instruction');
    await orderSummaryRobot.getKeyboardDown();
    orderSummaryRobot.findContinueButton(3);
    await orderSummaryRobot.tapContinueButton(3);
    //Minimum Order Amount
    orderSummaryRobot.allowMinimumOrderAmount(minimumOrderAmount);
    //verify orders with currency check
    orderSummaryRobot.findMaterialItem(materialForEdi, 20);
    orderSummaryRobot.verifyMaterialListPrice(true, currency, '469.70');
    orderSummaryRobot.verifyMaterialUnitPrice(true, currency, '396.90');
    orderSummaryRobot.verifyMaterialTotalPrice(true, currency, '7938.00');
    orderSummaryRobot.findBundleItem(bundleCode);
    orderSummaryRobot.findBundleMaterialItem(bundleMaterial1, 10);
    orderSummaryRobot.verifyBundleMaterialListPrice(true, currency, '100.00');
    orderSummaryRobot.verifyBundleMaterialUnitPrice(
        true, '- $currency', '15.00');
    orderSummaryRobot.verifyBundleMaterialTotalDiscount(
        true, '- $currency', '150.00');
    orderSummaryRobot.findSave();
    orderSummaryRobot.findSubmit();
    await orderSummaryRobot.tapSubmit();
    orderSummaryRobot.verify();
    await orderSummaryRobot.goBack();
    await cartRobot.goBack();
    await materialListRobot.goBack();
    //select customer code (non- edi customer)
    homeRobot.findCustomerCodeSelector();
    await homeRobot.tapCustomerCodeSelector();
    customerSearchRobot.verify();
    await customerSearchRobot.search(customerCode);
    await customerSearchRobot.tapCustomerCode(customerCode);
    homeRobot.verify();
    //select default shipping address
    homeRobot.findShipToSelector();
    await homeRobot.tapShipToSelector();
    shipToSearchRobot.verify();
    await shipToSearchRobot.tapShipToCode();
    homeRobot.verify();
    //create order for non-EDi customer
    await homeRobot.goToCreateOrder();
    materialRootRobot.findMaterialTab();
    materialRootRobot.findBundlesTab();
    materialListRobot.verify();
    await materialListRobot.search(materialWithoutPriceAbsolute);
    //enable materials without price
    materialListRobot.verifyMaterialPrice();
    await materialListRobot.tapMaterial(materialWithoutPrice);
    materialDetailRobot.verify();
    materialDetailRobot.findAddToCart();
    await materialDetailRobot.tapAddToCart();
    materialListRobot.findCartButton();
    await materialListRobot.tapCartButton();
    cartRobot.verify();
    //enable materials without price add to cart check
    cartRobot.findMaterialItem(materialWithoutPrice, 1);
    cartRobot.findOrderSummary();
    await cartRobot.tapOrderSummary();
    orderSummaryRobot.findContinueButton(0);
    await orderSummaryRobot.tapContinueButton(0);
    orderSummaryRobot.findContinueButton(1);
    await orderSummaryRobot.tapContinueButton(1);
    orderSummaryRobot.findContinueButton(2);
    await orderSummaryRobot.tapContinueButton(2);
    await orderSummaryRobot.getKeyboardDown();
    orderSummaryRobot.findContinueButton(3);
    await orderSummaryRobot.tapContinueButton(3);
    //Minimum Order Amount
    orderSummaryRobot.allowMinimumOrderAmount(minimumOrderAmount);
    orderSummaryRobot.verifySubTotalPrice(currency, '0.00');
    orderSummaryRobot.verifyGrandTotalPrice(currency, '0.00');
    //verify orders with currency check
    orderSummaryRobot.findMaterialItem(materialWithoutPrice, 1);
    orderSummaryRobot.verifyMaterialListPrice(false, currency, '0.00');
    orderSummaryRobot.verifyMaterialUnitPrice(false, currency, '0.00');
    orderSummaryRobot.verifyMaterialTotalPrice(false, currency, '0.00');
    orderSummaryRobot.findSubmit();
    await orderSummaryRobot.tapSubmit();
    //could not able to place an order as it does not cross
    //the minimum order amount
    orderSummaryRobot.verify();
    await orderSummaryRobot.goBack();
    await cartRobot.deleteMaterial(materialWithoutPrice);
    await cartRobot.goBack();
    //add normal material to cart
    await materialListRobot.clearSearchMaterial();
    await materialListRobot.search(materialAbsolute);
    await materialListRobot.tapMaterial(material);
    materialDetailRobot.verify();
    materialDetailRobot.verifyBonusesMaterial();
    materialDetailRobot.verifyTieredPricingMaterial();
    await materialDetailRobot.changeQuantity(4);
    materialDetailRobot.findAddToCart();
    await materialDetailRobot.tapAddToCart();
    materialListRobot.findCartButton();
    await materialListRobot.tapCartButton();
    cartRobot.verify();
    cartRobot.findMaterialItem(material, 4);
    await cartRobot.tapMaterial(materialAbsolute);
    await materialDetailRobot.changeQuantity(20);
    await materialDetailRobot.tapUpdateAddToCart();
    cartRobot.verify();
    cartRobot.findMaterialItem(material, 20);
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
    orderTemplateDetailRobot.verifyMaterialQuantity('20');
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
    orderSummaryRobot.findContinueButton(3);
    await orderSummaryRobot.tapContinueButton(3);
    //Minimum Order Amount
    orderSummaryRobot.allowMinimumOrderAmount(minimumOrderAmount);
    orderSummaryRobot.verifySubTotalPrice(currency, '1711.00');
    orderSummaryRobot.verifyGrandTotalPrice(currency, '1847.88');
    //verify orders with currency check
    orderSummaryRobot.findMaterialItem(material, 20);
    orderSummaryRobot.verifyMaterialListPrice(true, currency, '100.00');
    orderSummaryRobot.verifyMaterialUnitPrice(true, currency, '85.55');
    orderSummaryRobot.verifyMaterialTotalPrice(true, currency, '1711.00');
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
    orderHistoryRobot.verifyQuantity('20');
    await orderHistoryRobot.tapOrderedItem();
    orderHistoryDetailsRobot.verify();
    orderHistoryDetailsRobot.findOrderDetails();
    orderHistoryDetailsRobot.verifyOrderType(orderType);
    orderHistoryDetailsRobot.verifyContactNumber(phoneNumber);
    await orderHistoryDetailsRobot.tapOrderDetails();
    orderHistoryDetailsRobot.findSoldToAddress();
    orderHistoryDetailsRobot.verifySoldToID(customerCode);
    orderHistoryDetailsRobot.verifyPostalCode(postalCode);
    orderHistoryDetailsRobot.verifyCountry('SG');
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
    orderHistoryDetailsRobot.verifyQuantity('20');
    //Enable Order History Price in history detail page
    orderHistoryDetailsRobot.verifyEnableZPPrice(material);
    orderHistoryDetailsRobot.verifyEnableTotalPrice(material);
    //Display Batch Number and Expiry Date in Order Details
    orderHistoryDetailsRobot.verifyDisplayBatchExpiryDate();
    //Display Discount in Order Details
    orderHistoryDetailsRobot.verifyDisplayDiscount();
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
    favoriteRobot.findFavoriteItem();
    favoriteRobot.verifyMaterialNumber(materialAbsolute);
    favoriteRobot.verifyUnitPrice('$currency 100.00');
    favoriteRobot.findFavoriteIcon(material);
    await favoriteRobot.tapFavoriteIcon(material);
    homeRobot.findAccountTab();
    await homeRobot.tapAccountTab();
    //account page
    accountSettingsRobot.verify();
    //check login on behalf
    accountSettingsRobot.findNoLoginOnBehalf();
    accountSettingsRobot.findUserFullName('SG ExternalSR');
    accountSettingsRobot.findUserRole('External Sales Rep');
  });
}
