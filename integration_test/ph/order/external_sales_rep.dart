import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import '../../core/common.dart';
import '../../robots/account_settings_robot.dart';
import '../../robots/favorite_robot.dart';
import '../../robots/history/order_history_details_robot.dart';
import '../../robots/history/order_history_robot.dart';
import '../../robots/orders/cart_robot.dart';
import '../../robots/home/customer_search_robot.dart';
import '../../robots/home/home_robot.dart';
import '../../robots/login_robot.dart';
import '../../robots/orders/create_order/covid_list/covid_detail_robot.dart';
import '../../robots/orders/create_order/covid_list/covid_list_robot.dart';
import '../../robots/orders/create_order/material_list/material_detail_robot.dart';
import '../../robots/orders/create_order/material_list/material_list_robot.dart';
import '../../robots/orders/create_order/material_root_robot.dart';
import '../../robots/orders/create_order/order_confirmation_robot.dart';
import '../../robots/orders/order_template/order_template_detail_robot.dart';
import '../../robots/orders/order_template/order_template_list_robot.dart';
import '../../robots/orders/saved_order/saved_order_detail_robot.dart';
import '../../robots/orders/saved_order/saved_order_list_robot.dart';
import '../../robots/home/ship_to_search_robot.dart';
import '../../robots/orders/create_order/order_summary_robot.dart';

void main() {
  late LoginRobot loginRobot;
  late HomeRobot homeRobot;
  late CustomerSearchRobot customerSearchRobot;
  late ShipToSearchRobot shipToSearchRobot;
  late MaterialListRobot materialListRobot;
  late MaterialDetailRobot materialDetailRobot;
  late CartRobot cartRobot;
  late OrderSummaryRobot orderSummaryRobot;
  late SavedOrderListRobot savedOrderListRobot;
  late SavedOrderDetailRobot savedOrderDetailRobot;
  late OrderTemplateListRobot orderTemplateListRobot;
  late OrderTemplateDetailRobot orderTemplateDetailRobot;
  late MaterialRootRobot materialRootRobot;
  late OrderConfirmationRobot orderConfirmationRobot;
  late OrderHistoryRobot orderHistoryRobot;
  late FavoriteRobot favoriteRobot;
  late AccountSettingsRobot accountSettingsRobot;
  late OrderHistoryDetailsRobot orderHistoryDetailsRobot;
  late CovidListRobot covidListRobot;
  late CovidDetailRobot covidDetailRobot;
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('E2E  external sales rep (PH Market) - Order', (tester) async {
    loginRobot = LoginRobot(tester);
    homeRobot = HomeRobot(tester);
    customerSearchRobot = CustomerSearchRobot(tester);
    shipToSearchRobot = ShipToSearchRobot(tester);
    materialListRobot = MaterialListRobot(tester);
    materialDetailRobot = MaterialDetailRobot(tester);
    cartRobot = CartRobot(tester);
    orderSummaryRobot = OrderSummaryRobot(tester);
    savedOrderListRobot = SavedOrderListRobot(tester);
    savedOrderDetailRobot = SavedOrderDetailRobot(tester);
    orderTemplateListRobot = OrderTemplateListRobot(tester);
    orderTemplateDetailRobot = OrderTemplateDetailRobot(tester);
    materialRootRobot = MaterialRootRobot(tester);
    orderConfirmationRobot = OrderConfirmationRobot(tester);
    orderHistoryRobot = OrderHistoryRobot(tester);
    favoriteRobot = FavoriteRobot(tester);
    accountSettingsRobot = AccountSettingsRobot(tester);
    orderHistoryDetailsRobot = OrderHistoryDetailsRobot(tester);
    covidListRobot = CovidListRobot(tester);
    covidDetailRobot = CovidDetailRobot(tester);

    const userName = 'phexternalsalesrep';
    const passWord = 'St@ysafe01';
    const salesOrg = '2500';
    const customerCode = '0030007793';
    const shipToCode = '0070009441';
    const templateName = 'clientTemplate7';
    const materialNumber = '23001758';
    const material1 = '000000000023001758';
    const material2 = '000000000023001032';
    const bonusMaterial = '000000000011002989';
    const currency = 'PHP';
    const materialWithoutPrice = '000000000023344187';
    const orderType = 'ZPOR';
    const minimumOrderAmount = '0';
    const country = 'PH';
    const postalCode = '2000';
    const listPrice1 = '0';
    const unitPrice1 = listPrice1;
    const unitPrice2 = '352';
    const totalPrice = listPrice1;
    const subTotalPrice1 = totalPrice;
    const grandTotalPrice1 = subTotalPrice1; // 0% vat
    const salesRepUserFullName = 'PH ExternalSR';
    const salesRepUserRole = 'External Sales Rep';
    const covidMaterial = '000000000026280517';
    // For Tier Pricing
    const tier1UnitPrice = '200';
    const tier2UnitPrice = '300';
    const tier3UnitPrice = tier2UnitPrice;
    const principleFullText = 'NOVARTIS HEALTHCARE PHILIPPINES,';
    const principleSearchText = 'NOV';

    //init app
    await runAppForTesting(tester);
    await loginRobot.findAndCloseAnnouncementIcon();
    await loginRobot.login(userName, passWord);
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
    //create order
    await homeRobot.goToCreateOrder();
    await materialRootRobot.findAndCloseAnnouncementIcon();
    materialListRobot.verify();
    materialRootRobot.findMaterialTab();
    materialRootRobot.findPrincipleSelector();
    await materialRootRobot.tapPrincipleSelector();
    materialRootRobot.verifyMaterialFilterPage();
    await materialRootRobot.enterTextAndSubmit(
        principleSearchText: principleSearchText);
    materialRootRobot.verifySearchResultAppears(
        principleFullText: principleFullText);
    await materialRootRobot.tapOnSearchResult(
        principleFullText: principleFullText);
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
    materialRootRobot.findCovidTab();
    //Bonus Material
    await materialListRobot.search(
      bonusMaterial,
    );
    await materialListRobot.tapMaterial(bonusMaterial);
    materialDetailRobot.verify();
    materialDetailRobot.verifyBonusesMaterial();
    await materialDetailRobot.changeQuantity(8);
    await materialDetailRobot.deductQuantity();
    await materialDetailRobot.addQuantity();
    materialDetailRobot.findAddToCart();
    await materialDetailRobot.tapAddToCart();
    materialListRobot.verify();
    materialListRobot.findCartButton();
    await materialListRobot.tapCartButton();
    //cart page
    cartRobot.verify();
    ////Price - overriden///
    cartRobot.verifyEnablePriceOverride(bonusMaterial);
    await cartRobot.tapPrice(bonusMaterial);
    await cartRobot.changePrice(80);
    await cartRobot.tapPriceOverrideButton();
    cartRobot.verifyUnitPrice(currency, '80');
    await cartRobot.tapPrice(bonusMaterial);
    await cartRobot.changePrice(290);
    await cartRobot.tapPriceOverrideButton();
    cartRobot.verifyUnitPrice(currency, '290');
    ////Price - overriden///
    cartRobot.findMaterialItem(bonusMaterial, 8);
    cartRobot.findAddQuantity(bonusMaterial);
    await cartRobot.changeQuantity(bonusMaterial, 16);
    await cartRobot.getKeyboardDown();
    cartRobot.findMaterialItem(bonusMaterial, 16);
    cartRobot.verifyBonusMaterial(bonusMaterial, false, 2);
    await cartRobot.deleteMaterial(bonusMaterial);
    await cartRobot.goBack();
    //verify tired pricing
    materialListRobot.verify();
    await materialListRobot.clearSearchMaterial();
    await materialListRobot.search(material2);
    await materialListRobot.tapMaterial(material2);
    materialDetailRobot.verify();
    materialDetailRobot.verifyTieredPricingMaterial();
    await materialDetailRobot.changeQuantity(2);
    materialDetailRobot.findAddToCart();
    await materialDetailRobot.tapAddToCart();
    materialListRobot.verify();
    materialListRobot.findCartButton();
    await materialListRobot.tapCartButton();
    //cart page
    cartRobot.verify();
    cartRobot.findMaterialItem(material2, 2);
    cartRobot.verifyUnitPrice(currency, tier1UnitPrice);
    cartRobot.findAddQuantity(material2);
    await cartRobot.changeQuantity(material2, 100);
    await cartRobot.getKeyboardDown();
    cartRobot.findMaterialItem(material2, 100);
    cartRobot.verifyUnitPrice(currency, tier2UnitPrice);
    await cartRobot.changeQuantity(material2, 200);
    await cartRobot.getKeyboardDown();
    cartRobot.findMaterialItem(material2, 200);
    cartRobot.verifyUnitPrice(currency, tier3UnitPrice);
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await cartRobot.deleteMaterial(material2);
    await cartRobot.goBack();
    //add material
    materialListRobot.verify();
    await materialListRobot.clearSearchMaterial();
    await materialListRobot.search(material1);
    //Disable Order Type Selection as Enable
    materialListRobot.verifyDisableOrderTypeSelection();
    //Enable List Price
    materialListRobot.verifyEnableListPrice(material1);
    await materialListRobot.tapMaterial(material1);
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
    cartRobot.findMaterialItem(material1, 4);
    //update material quantity
    await cartRobot.tapMaterial(materialNumber);
    await materialDetailRobot.changeQuantity(19);
    await materialDetailRobot.tapUpdateAddToCart();
    cartRobot.verify();
    cartRobot.findMaterialItem(material1, 19);
    cartRobot.findAddQuantity(material1);
    await cartRobot.tapAddQuantity(material1);
    cartRobot.findMaterialItem(material1, 20);
    await cartRobot.verifyStockMaterial(material1);
    //Enable Discount override
    cartRobot.verifyEnableDiscountOverrideMaterial();
    await cartRobot.setDiscountOverrideMaterial(10);
    cartRobot.verifyDiscountOverridePercentage(10);
    //Add remark (Enable Material Remarks)
    cartRobot.findRemarkButton(material1);
    await cartRobot.addRemark(material1, 'Good');
    cartRobot.findRemarkText('Good');
    await cartRobot.editRemark(material1, 'Nice');
    await cartRobot.deleteRemark(material1);

    cartRobot.findOrderSummary();
    await cartRobot.tapOrderSummary();
    //save order
    orderSummaryRobot.verify();
    orderSummaryRobot.findContinueButton(0);
    await orderSummaryRobot.tapContinueButton(0);
    orderSummaryRobot.verifySoldToID(customerCode);
    orderSummaryRobot.verifyCountry(country);
    orderSummaryRobot.verifyPhone('NA');
    orderSummaryRobot.verifyPostalCode(postalCode);
    orderSummaryRobot.findContinueButton(1);
    await orderSummaryRobot.tapContinueButton(1);
    orderSummaryRobot.verifyShipToID(shipToCode);
    orderSummaryRobot.verifyCountry(country);
    orderSummaryRobot.verifyPhone('NA');
    orderSummaryRobot.verifyPostalCode(postalCode);
    orderSummaryRobot.findContinueButton(2);
    await orderSummaryRobot.tapContinueButton(2);
    //Enable Special Instructions
    orderSummaryRobot.findSpecialInstruction();
    await orderSummaryRobot.enterSpecialInstruction('special');
    await orderSummaryRobot.getKeyboardDown();
    orderSummaryRobot.findContinueButton(3);
    await orderSummaryRobot.tapContinueButton(3);
    //enable po reference
    if (orderSummaryRobot.verifyPOReferenceValidation()) {
      orderSummaryRobot.findCustomerPOReference();
      await orderSummaryRobot.enterCustomerPOReference('po');
      await orderSummaryRobot.getKeyboardDown();
      orderSummaryRobot.findContinueButton(3);
      await orderSummaryRobot.tapContinueButton(3);
    }

    orderSummaryRobot.findSave();
    await orderSummaryRobot.tapSave();
    await savedOrderListRobot.goBack();

    //Place order from saved orders

    homeRobot.findSavedOrders();
    await homeRobot.tapSavedOrders();
    savedOrderListRobot.findOrder();
    savedOrderListRobot.verifySoldToID(customerCode);
    savedOrderListRobot.verifyShipToID(shipToCode);
    await savedOrderListRobot.tapOrder();
    savedOrderDetailRobot.verify();
    savedOrderDetailRobot.findAddToCart();
    await savedOrderDetailRobot.tapAddToCart();
    cartRobot.verify();
    cartRobot.findOrderSummary();
    await cartRobot.tapOrderSummary();

    orderSummaryRobot.verifySoldToID(customerCode);
    orderSummaryRobot.findContinueButton(0);
    await orderSummaryRobot.tapContinueButton(0);
    orderSummaryRobot.verifySoldToID(customerCode);
    orderSummaryRobot.verifyCountry(country);
    orderSummaryRobot.findContinueButton(1);
    await orderSummaryRobot.tapContinueButton(1);

    orderSummaryRobot.findContinueButton(2);
    await orderSummaryRobot.tapContinueButton(2);
    orderSummaryRobot.findContinueButton(3);
    await orderSummaryRobot.tapContinueButton(3);
    orderSummaryRobot.findSubmit();
    await orderSummaryRobot.tapSubmit();
    orderConfirmationRobot.verify();
    orderConfirmationRobot.findCreateNewOrderButton();
    await orderConfirmationRobot.tapCreateNewOrderButton();
    await materialListRobot.clearSearchMaterial();
    await materialListRobot.search(materialWithoutPrice);
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
    orderSummaryRobot.findCustomerPOReference();
    await orderSummaryRobot.enterCustomerPOReference('po');
    await orderSummaryRobot.getKeyboardDown();
    orderSummaryRobot.findSpecialInstruction();
    await orderSummaryRobot.enterSpecialInstruction('special');
    await orderSummaryRobot.getKeyboardDown();
    orderSummaryRobot.findContinueButton(3);
    await orderSummaryRobot.tapContinueButton(3);
    //Minimum Order Amount
    orderSummaryRobot.allowMinimumOrderAmount('$currency $minimumOrderAmount');
    orderSummaryRobot.verifySubTotalPrice(currency, subTotalPrice1);
    orderSummaryRobot.verifyGrandTotalPrice(currency, grandTotalPrice1);
    //verify orders with currency check
    orderSummaryRobot.findMaterialItem(materialWithoutPrice, 1);
    orderSummaryRobot.verifyMaterialListPrice(false, currency, listPrice1);
    orderSummaryRobot.verifyMaterialUnitPrice(false, currency, unitPrice1);
    orderSummaryRobot.verifyMaterialTotalPrice(false, currency, totalPrice);
    orderSummaryRobot.findSubmit();
    await orderSummaryRobot.tapSubmit();
    //Save Order Template
    await orderConfirmationRobot.tapCreateNewOrderButton();
    materialListRobot.verify();
    await materialListRobot.clearSearchMaterial();
    await materialListRobot.search(
      materialNumber,
    );
    await materialListRobot.tapMaterial(material1);
    materialDetailRobot.verify();
    await materialDetailRobot.changeQuantity(100);
    materialDetailRobot.findAddToCart();
    await materialDetailRobot.tapAddToCart();
    materialListRobot.verify();
    materialListRobot.findCartButton();
    await materialListRobot.tapCartButton();
    cartRobot.verify();
    cartRobot.findMaterialItem(material1, 100);
    cartRobot.findOrderSummary();
    await cartRobot.tapOrderSummary();
    orderSummaryRobot.findOrderTemplate();
    await orderSummaryRobot.tapOrderTemplate();
    orderSummaryRobot.findOrderTemplate();
    await orderSummaryRobot.enterTemplateName(templateName);
    orderSummaryRobot.findTemplateSaveButton();
    await orderSummaryRobot.tapTemplateSaveButton();
    await orderSummaryRobot.goBack();
    await cartRobot.deleteMaterial(material1);
    await cartRobot.goBack();
    await materialListRobot.goBack();

    //Place Order From Saved Order Templates
    homeRobot.verify();
    homeRobot.findOrderTemplate();
    await homeRobot.tapOrderTemplate();
    orderTemplateListRobot.findTemplateItem(templateName);
    await orderTemplateListRobot.tapTemplateItem(templateName);
    orderTemplateDetailRobot.verifyMaterialNumber(materialNumber);
    orderTemplateDetailRobot.findAddToCart();
    await orderTemplateDetailRobot.tapAddToCart();
    cartRobot.verify();
    cartRobot.findOrderSummary();
    await cartRobot.tapOrderSummary();
    orderSummaryRobot.verifySoldToID(customerCode);
    orderSummaryRobot.findContinueButton(0);
    await orderSummaryRobot.tapContinueButton(0);
    orderSummaryRobot.verifySoldToID(customerCode);
    orderSummaryRobot.findContinueButton(1);
    await orderSummaryRobot.tapContinueButton(1);
    orderSummaryRobot.findContinueButton(2);
    await orderSummaryRobot.tapContinueButton(2);
    orderSummaryRobot.findCustomerPOReference();
    await orderSummaryRobot.enterCustomerPOReference('po');
    await orderSummaryRobot.getKeyboardDown();
    orderSummaryRobot.findSpecialInstruction();
    await orderSummaryRobot.enterSpecialInstruction('special');
    await orderSummaryRobot.getKeyboardDown();
    orderSummaryRobot.findContinueButton(3);
    await orderSummaryRobot.tapContinueButton(3);
    orderSummaryRobot.findSubmit();
    await orderSummaryRobot.tapSubmit();
    orderConfirmationRobot.verify();

    //Go TO Order History
    orderConfirmationRobot.findGoToOrderHistoryButton();
    await orderConfirmationRobot.tapGoToOrderHistoryButton();
    orderHistoryRobot.verify();
    orderHistoryRobot.findOrderedItem();
    orderHistoryRobot.verifyOrderType(orderType);
    orderHistoryRobot.verifyMaterialID(materialNumber);
    await orderHistoryRobot.tapOrderedItem();
    orderHistoryDetailsRobot.verify();
    orderHistoryDetailsRobot.findOrderDetails();
    orderHistoryDetailsRobot.verifyOrderType(orderType);
    orderHistoryDetailsRobot.findSoldToAddress();
    orderHistoryDetailsRobot.verifySoldToID(customerCode);
    orderHistoryDetailsRobot.verifyPostalCode(postalCode);
    orderHistoryDetailsRobot.verifyCountry(country);
    orderHistoryDetailsRobot.findShipToAddress();
    orderHistoryDetailsRobot.verifyShipToID(shipToCode);
    orderHistoryDetailsRobot.verifyPostalCode(postalCode);
    orderHistoryDetailsRobot.verifyCountry(country);
    orderHistoryDetailsRobot.findInvoices();
    orderHistoryDetailsRobot.findOrderSummary();
    orderHistoryDetailsRobot.verifyMaterialType('Comm');
    //Enable Tax Display
    orderHistoryDetailsRobot.verifyEnableTaxDisplay();
    //Enable Order History Price
    orderHistoryDetailsRobot.verifyEnableTotalPrice(material1);
    orderHistoryDetailsRobot.verifyEnableZPPrice(material1);

    //re-order
    orderHistoryDetailsRobot.findTopmenuReOrderButton();
    await orderHistoryDetailsRobot.tapTopMenuReOrderButton();
    cartRobot.verify();
    cartRobot.findMaterialItem(material1, 100);
    await cartRobot.goBack();

    //Order History FIlters

    orderHistoryRobot.findFilterButton();
    await orderHistoryRobot.tapFilterButton();
    await orderHistoryRobot
        .findOrderHistoryFilterByMaterialNumber(materialNumber);
    orderHistoryRobot.findOrderItemByMaterialNumber(material1);
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
    //try to add covid material to cart
    await homeRobot.goToCreateOrder();
    materialRootRobot.findCovidTab();
    await materialRootRobot.tapCovidTab();
    covidListRobot.verify();
    covidListRobot.findCovidMaterial(covidMaterial);
    await covidListRobot.tapCovidMaterial(covidMaterial);
    covidDetailRobot.verify();
    await covidDetailRobot.addQuantity();
    covidDetailRobot.findAddToCart();
    await covidDetailRobot.tapAddToCart();
    materialListRobot.findCartButton();
    await materialListRobot.tapCartButton();
    cartRobot.verify();
    cartRobot.findOrderSummary();
    await cartRobot.tapOrderSummary();
    orderSummaryRobot.verifySoldToID(customerCode);
    orderSummaryRobot.findContinueButton(0);
    await orderSummaryRobot.tapContinueButton(0);
    orderSummaryRobot.verifySoldToID(customerCode);
    orderSummaryRobot.findContinueButton(1);
    await orderSummaryRobot.tapContinueButton(1);
    orderSummaryRobot.findContinueButton(2);
    await orderSummaryRobot.tapContinueButton(2);
    orderSummaryRobot.findCustomerPOReference();
    await orderSummaryRobot.enterCustomerPOReference('po');
    await orderSummaryRobot.getKeyboardDown();
    orderSummaryRobot.findSpecialInstruction();
    await orderSummaryRobot.enterSpecialInstruction('special');
    await orderSummaryRobot.getKeyboardDown();
    orderSummaryRobot.findContinueButton(3);
    await orderSummaryRobot.tapContinueButton(3);
    orderSummaryRobot.findSubmit();
    await orderSummaryRobot.tapSubmit();
    orderConfirmationRobot.verify();
    orderConfirmationRobot.findCreateNewOrderButton();
    await orderConfirmationRobot.tapCreateNewOrderButton();

    //check favorite material
    await materialListRobot.clearSearchMaterial();
    await materialListRobot.search(materialNumber);
    materialListRobot.findFavoriteIcon(materialNumber);
    await materialListRobot.tapFavoriteIcon(materialNumber);
    await materialListRobot.goBack();
    homeRobot.verify();
    homeRobot.findFavoriteTab();
    await homeRobot.tapFavoriteTab();
    favoriteRobot.verify();
    favoriteRobot.findFavoriteItem();
    favoriteRobot.verifyMaterialNumber(materialNumber);
    favoriteRobot.verifyUnitPrice('$currency $unitPrice2');
    favoriteRobot.findFavoriteIcon(material1);
    await favoriteRobot.tapFavoriteIcon(material1);
    homeRobot.findAccountTab();
    await homeRobot.tapAccountTab();
    //account page
    accountSettingsRobot.verify();
    //check login on behalf
    accountSettingsRobot.findNoLoginOnBehalf();
    accountSettingsRobot.findUserFullName(salesRepUserFullName);
    accountSettingsRobot.findUserRole(salesRepUserRole);
  });
}
