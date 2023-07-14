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
import '../../robots/orders/create_order/bonus_list/bonus_list_robot.dart';
import '../../robots/orders/create_order/bundle_list/bundle_detail_robot.dart';
import '../../robots/orders/create_order/bundle_list/bundle_list_robot.dart';
import '../../robots/orders/create_order/material_list/material_detail_robot.dart';
import '../../robots/orders/create_order/material_list/material_list_robot.dart';
import '../../robots/orders/create_order/material_root_robot.dart';
import '../../robots/orders/create_order/order_confirmation_robot.dart';
import '../../robots/orders/create_order/order_summary_robot.dart';
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
  late BonusListRobot bonusListRobot;
  late MaterialRootRobot materialRootRobot;
  late BundleListRobot bundleListRobot;
  late BundleDetailRobot bundleDetailRobot;
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('MY external rep - end to end - order test', (tester) async {
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
    bonusListRobot = BonusListRobot(tester);
    materialRootRobot = MaterialRootRobot(tester);
    bundleListRobot = BundleListRobot(tester);
    bundleDetailRobot = BundleDetailRobot(tester);

    ///================================================================////

    //initialize variables
    const username = 'myexternalsalesrep';
    const password = 'St@ysafe01';
    const salesOrg = '2001';
    const customerCode = '0030088374';
    const shipToCode = '0070155583';
    //country & country currency variable
    const currency = 'MYR';
    const country = 'MY';
    //postal code & phone Number
    const minimumOrderAmount = '$currency 300';
    const soldToPhoneNumber = '03-42512251';
    const soldToPostalCode = '54200';
    const shipToPhoneNumber = '09-4662333';
    const shipToPostalCode = '26400';
    //materials
    const material = '000000000023063786';
    const materialAbsolute = '23063786';
    const tieredMaterialAbsolute = '21041454';
    const tieredMaterial = '000000000021041454';
    const pngPrincipalMaterialAbsolute = '21247738';
    const pngPrincipalMaterial = '000000000021247738';
    const bonusMaterialAbsolute = '21247723';
    const bonusMaterial = '000000000021247723';
    const bundleCode = '0015999834';
    const bundleMaterial = '000000000023348769';
    const orderTemplateName = 'myExternalSalesRepTemplate';
    const orderType = 'ZPOR';
    const principleFullText = 'PARVUS SDN BHD';
    const principleSearchText = 'PAR';

    //============================================================
    // Material Price's
    //============================================================

    // For Tier Pricing
    const tier1TotalPrice = '196';
    const initialUnitPrice = '80';
    const afterUnitPrice = '98';
    const tier2TotalPrice = '9,800';
    const tier3TotalPrice = '19,600';

    ///Price for P&G Principal hidePrice == true
    const pnGMaterialUnitPrice = '0';
    const pnGMaterialTotalPrice = pnGMaterialUnitPrice;
    const pnGMaterialSubTotalPrice = pnGMaterialTotalPrice;
    const pnGMaterialGrandTotalPrice = pnGMaterialSubTotalPrice;

    /// Price After price override
    const overridenUnitPrice = '550';
    const overridenTotalPrice = '550';
    const overridenSubTotalPrice = overridenTotalPrice;
    const overridenGrandTotalPrice = overridenSubTotalPrice;

    // Bundle's Price
    const bundleMaterialUnitPrice = '112';
    const bundleMaterialTotalAmount = '3,360';
    const bundleMaterialSubTotalPrice = bundleMaterialTotalAmount;
    const bundleMaterialGrandTotalPrice = bundleMaterialSubTotalPrice;

    // Favourite Material Price
    const favMaterialUnitPrice = '1,458';

    ///================================================================////

    //init app
    await runAppForTesting(tester);

    await loginRobot.findAndCloseAnnouncementIcon();
    await loginRobot.login(username, password);

    await homeRobot.findAndCloseAnnouncementIcon();

    // selects sales org
    homeRobot.findSalesOrgSelector();
    await homeRobot.tapSalesOrgSelector();
    await homeRobot.selectSalesOrg(salesOrg);
    // selects customer code
    homeRobot.findCustomerCodeSelector();
    await homeRobot.tapCustomerCodeSelector();
    customerSearchRobot.verify();
    await customerSearchRobot.search(customerCode);
    await customerSearchRobot.tapCustomerCode(customerCode);
    homeRobot.verify();
    // selects shippinfg address
    homeRobot.findShipToSelector();
    await homeRobot.tapShipToSelector();
    shipToSearchRobot.verify();
    await shipToSearchRobot.search(shipToCode);
    await shipToSearchRobot.tapShipToCode(shipToCode: shipToCode);
    homeRobot.verify();
    //Create orders
    await homeRobot.goToCreateOrder();
    materialRootRobot.verify();
    await materialRootRobot.findAndCloseAnnouncementIcon();

    materialListRobot.verify();
    materialListRobot.verifyDisableOrderTypeSelection();
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

    //verify tired pricing
    await materialListRobot.search(tieredMaterialAbsolute);
    await materialListRobot.tapMaterial(tieredMaterial);
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
    cartRobot.findMaterialItem(tieredMaterial, 2);
    cartRobot.verifyEnablePriceOverride(tieredMaterial);
    await cartRobot.tapPrice(tieredMaterial);
    await cartRobot.changePrice(double.parse(initialUnitPrice));
    await cartRobot.tapPriceOverrideButton();
    cartRobot.verifyUnitPrice(currency, initialUnitPrice);
    await cartRobot.tapPrice(tieredMaterial);
    await cartRobot.changePrice(double.parse(afterUnitPrice));
    await cartRobot.tapPriceOverrideButton();
    cartRobot.verifyUnitPrice(currency, afterUnitPrice);
    ////Price - overriden///
    cartRobot.verifyUnitPrice(currency, afterUnitPrice);
    cartRobot.verifyTotal(currency, tier1TotalPrice);
    cartRobot.findAddQuantity(tieredMaterial);
    await cartRobot.changeQuantity(tieredMaterial, 100);
    await cartRobot.getKeyboardDown();
    cartRobot.findMaterialItem(tieredMaterial, 100);
    cartRobot.verifyUnitPrice(currency, afterUnitPrice);
    cartRobot.verifyTotal(currency, tier2TotalPrice);
    await cartRobot.changeQuantity(tieredMaterial, 200);
    await cartRobot.getKeyboardDown();
    cartRobot.findMaterialItem(tieredMaterial, 200);
    cartRobot.verifyUnitPrice(currency, afterUnitPrice);
    cartRobot.verifyTotal(currency, tier3TotalPrice);
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await cartRobot.deleteMaterial(tieredMaterial);
    await cartRobot.goBack();

    //Verify P&G Principal hidePrice == true and Bonus Override
    materialListRobot.verify();
    await materialListRobot.clearSearchMaterial();
    await materialListRobot.search(pngPrincipalMaterialAbsolute);
    await materialListRobot.tapMaterial(pngPrincipalMaterial);
    materialDetailRobot.verify();
    await materialDetailRobot.changeQuantity(1);
    materialDetailRobot.findAddToCart();
    await materialDetailRobot.tapAddToCart();
    materialListRobot.verify();
    materialListRobot.findCartButton();
    await materialListRobot.tapCartButton();
    //cart page
    cartRobot.verify();
    cartRobot.findMaterialItem(pngPrincipalMaterial, 1);
    cartRobot.findAddQuantity(pngPrincipalMaterial);
    await cartRobot.tapAddQuantity(pngPrincipalMaterial);
    cartRobot.findMaterialItem(pngPrincipalMaterial, 2);
    cartRobot.findAddBonusButton();
    await cartRobot.tapAddBonusButton();
    bonusListRobot.verify();
    await bonusListRobot.searchBonus(bonusMaterialAbsolute);
    await bonusListRobot.tapBonusMaterial(bonusMaterial);
    await bonusListRobot.changeBonusMaterialQuantity(5);
    await bonusListRobot.deductBonusMaterialQuantity();
    await bonusListRobot.addBonusMaterialQuantity();
    await bonusListRobot.tapAddToBonusButton();
    bonusListRobot.verifyBonusSnackbar();
    await bonusListRobot.goBack();
    //verify bonus override material
    cartRobot.verifyBonusMaterial(bonusMaterial, true, 5);
    cartRobot.verifyTotal(currency, '0');
    await tester.pumpAndSettle(const Duration(seconds: 5));
    cartRobot.findOrderSummary();
    await cartRobot.tapOrderSummary();
    //order summary page
    orderSummaryRobot.verifySoldToID(customerCode);
    orderSummaryRobot.findContinueButton(0);
    await orderSummaryRobot.tapContinueButton(0);

    orderSummaryRobot.verifySoldToID(customerCode);
    orderSummaryRobot.verifyCountry(country);
    orderSummaryRobot.verifyPhone(soldToPhoneNumber);
    orderSummaryRobot.verifyPostalCode(soldToPostalCode);
    orderSummaryRobot.findContinueButton(1);
    await orderSummaryRobot.tapContinueButton(1);

    orderSummaryRobot.verifyShipToID(shipToCode);
    orderSummaryRobot.verifyCountry(country);
    orderSummaryRobot.verifyPhone(shipToPhoneNumber);
    orderSummaryRobot.verifyPostalCode(shipToPostalCode);
    orderSummaryRobot.findContinueButton(2);
    await orderSummaryRobot.tapContinueButton(2);

    //Enable Special Instructions
    orderSummaryRobot.findCustomerPoReference();
    await orderSummaryRobot.enterCustomerPoReference('PORefrence2');
    await orderSummaryRobot.getKeyboardDown();
    orderSummaryRobot.findSpecialInstruction();
    await orderSummaryRobot.enterSpecialInstruction('specialInstruction1');
    await orderSummaryRobot.getKeyboardDown();
    orderSummaryRobot.findContinueButton(3);
    await orderSummaryRobot.tapContinueButton(3);
    //Minimum Order Amount
    orderSummaryRobot.allowMinimumOrderAmount(minimumOrderAmount);
    orderSummaryRobot.verifySubTotalPrice(currency, pnGMaterialSubTotalPrice);
    orderSummaryRobot.verifyGrandTotalPrice(
        currency, pnGMaterialGrandTotalPrice);
    //verify orders with currency check
    orderSummaryRobot.findMaterialItem(pngPrincipalMaterial, 2);
    orderSummaryRobot.verifyMaterialUnitPrice(
        false, currency, pnGMaterialUnitPrice);
    orderSummaryRobot.verifyMaterialTotalPrice(
        false, currency, pnGMaterialTotalPrice);
    orderSummaryRobot.findSubmit();
    await orderSummaryRobot.tapSubmit();
    await orderSummaryRobot.goBack();
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await cartRobot.deleteMaterial(pngPrincipalMaterial);
    await cartRobot.goBack();
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // Verify Bonus Deals
    materialListRobot.verify();
    await materialListRobot.clearSearchMaterial();
    await materialListRobot.search(materialAbsolute);
    materialListRobot.verifyCurrencyCheck(currency);
    await materialListRobot.tapMaterial(material);
    materialDetailRobot.verify();
    materialDetailRobot.verifyBonusesMaterial();
    await materialDetailRobot.changeQuantity(5);
    materialDetailRobot.findAddToCart();
    await materialDetailRobot.tapAddToCart();
    materialListRobot.verify();
    materialListRobot.findCartButton();
    await materialListRobot.tapCartButton();
    cartRobot.verify();
    cartRobot.findMaterialItem(material, 5);
    await cartRobot.tapMaterial(materialAbsolute);
    await materialDetailRobot.changeQuantity(20);
    await materialDetailRobot.tapUpdateAddToCart();
    cartRobot.verify();
    cartRobot.findMaterialItem(material, 20);
    cartRobot.verifyBonusMaterial(material, false, 6);
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
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await cartRobot.deleteBonusMaterial();
    cartRobot.verifyExpiryMaterial(material);
    await cartRobot.changeQuantity(material, 1);
    //Enable Price override
    cartRobot.verifyEnablePriceOverride(material);
    await cartRobot.tapPrice(material);
    await tester.pump();
    await cartRobot.changePrice(550);
    await cartRobot.getKeyboardDown();
    await cartRobot.tapPriceOverrideButton();
    await tester.pumpAndSettle(const Duration(seconds: 2));
    cartRobot.findOrderSummary();
    await cartRobot.tapOrderSummary();
    orderSummaryRobot.verifySoldToID(customerCode);
    orderSummaryRobot.findContinueButton(0);
    await orderSummaryRobot.tapContinueButton(0);
    orderSummaryRobot.verifySoldToID(customerCode);
    orderSummaryRobot.verifyCountry(country);
    orderSummaryRobot.verifyPhone(soldToPhoneNumber);
    orderSummaryRobot.verifyPostalCode(soldToPostalCode);
    orderSummaryRobot.findContinueButton(1);
    await orderSummaryRobot.tapContinueButton(1);
    orderSummaryRobot.verifyShipToID(shipToCode);
    orderSummaryRobot.verifyCountry(country);
    orderSummaryRobot.verifyPhone(shipToPhoneNumber);
    orderSummaryRobot.verifyPostalCode(shipToPostalCode);
    orderSummaryRobot.findContinueButton(2);
    await orderSummaryRobot.tapContinueButton(2);

    //Enable Special Instructions,CollectiveNumber
    orderSummaryRobot.findCustomerPoReference();
    await orderSummaryRobot.enterCustomerPoReference('PORefrence2');
    await orderSummaryRobot.getKeyboardDown();
    orderSummaryRobot.findSpecialInstruction();
    await orderSummaryRobot.enterSpecialInstruction('specialInstruction1');
    await orderSummaryRobot.getKeyboardDown();
    orderSummaryRobot.findCollectiveNumber();
    await orderSummaryRobot.enterCollectiveNumber('CollectiveNumber');
    await orderSummaryRobot.getKeyboardDown();
    orderSummaryRobot.findContinueButton(3);
    await orderSummaryRobot.tapContinueButton(3);

    //Minimum Order Amount
    orderSummaryRobot.allowMinimumOrderAmount(minimumOrderAmount);
    orderSummaryRobot.verifySubTotalPrice(currency, overridenSubTotalPrice);
    orderSummaryRobot.verifyGrandTotalPrice(currency, overridenGrandTotalPrice);

    //verify orders with currency check
    orderSummaryRobot.findMaterialItem(material, 1);
    orderSummaryRobot.verifyMaterialUnitPrice(
        true, currency, overridenUnitPrice);
    orderSummaryRobot.verifyMaterialTotalPrice(
        true, currency, overridenTotalPrice);
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
    orderHistoryRobot.verifyQuantity('1');
    await orderHistoryRobot.tapOrderedItem();
    orderHistoryDetailsRobot.verify();
    orderHistoryDetailsRobot.findOrderDetails();
    orderHistoryDetailsRobot.verifyOrderType(orderType);
    orderHistoryDetailsRobot.verifyContactNumber(soldToPhoneNumber);
    await orderHistoryDetailsRobot.tapOrderDetails();
    orderHistoryDetailsRobot.findSoldToAddress();
    orderHistoryDetailsRobot.verifySoldToID(customerCode);
    orderHistoryDetailsRobot.verifyPostalCode(soldToPostalCode);
    orderHistoryDetailsRobot.verifyCountry(country);
    orderHistoryDetailsRobot.verifyPhone(soldToPhoneNumber);
    await orderHistoryDetailsRobot.tapSoldToAddress();
    orderHistoryDetailsRobot.findShipToAddress();
    orderHistoryDetailsRobot.verifyShipToID(shipToCode);
    orderHistoryDetailsRobot.verifyPostalCode(shipToPostalCode);
    orderHistoryDetailsRobot.verifyCountry(country);
    orderHistoryDetailsRobot.verifyPhone(shipToPhoneNumber);
    await orderHistoryDetailsRobot.tapShipToAddress();
    orderHistoryDetailsRobot.findInvoices();
    orderHistoryDetailsRobot.findOrderSummary();
    orderHistoryDetailsRobot.verifyMaterialID(materialAbsolute);

    //Enable Order History Price in history detail page
    orderHistoryDetailsRobot.verifyEnableZPPrice(material);
    orderHistoryDetailsRobot.verifyEnableTotalPrice(material);
    //Display Batch Number and Expiry Date in Order Details
    orderHistoryDetailsRobot.verifyDisplayBatchExpiryDate();
    //re-order
    await orderHistoryDetailsRobot.tapOrderSummary();
    orderHistoryDetailsRobot.findReOrderButton();
    await orderHistoryDetailsRobot.tapReOrderButton();
    cartRobot.verify();
    cartRobot.findMaterialItem(material, 1);
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
    await homeRobot.goToCreateOrder();
    materialRootRobot.findBundlesTab();
    await materialRootRobot.tapBundlesTab();

    //add bundles
    bundleListRobot.verify();
    await bundleListRobot.tapBundle(bundleCode);
    bundleDetailRobot.verify();
    await bundleDetailRobot.tapAddBundleMaterialQuantity(bundleMaterial);
    await bundleDetailRobot.changeBundleMaterialQuantity(bundleMaterial, 4);
    await bundleDetailRobot.addBundlesToCart();
    // bundles in cart
    await cartRobot.deleteMaterial(material);
    await cartRobot.findBundleItem(bundleCode);
    await cartRobot.tapAddQuantity(bundleMaterial);
    await cartRobot.tapDeductQuantity(bundleMaterial);
    await cartRobot.changeQuantity(bundleMaterial, 11);
    await cartRobot.changeQuantity(bundleMaterial, 30);
    await cartRobot.getKeyboardDown();
    cartRobot.findBundleMaterialItem(bundleMaterial, 30);
    cartRobot.verifyExpiryMaterial(bundleMaterial);
    cartRobot.findOrderSummary();
    await cartRobot.tapOrderSummary();
    //order summary
    orderSummaryRobot.verifySoldToID(customerCode);
    orderSummaryRobot.findContinueButton(0);
    await orderSummaryRobot.tapContinueButton(0);
    orderSummaryRobot.verifySoldToID(customerCode);
    orderSummaryRobot.verifyCountry(country);
    orderSummaryRobot.verifyPhone(soldToPhoneNumber);
    orderSummaryRobot.verifyPostalCode(soldToPostalCode);
    orderSummaryRobot.findContinueButton(1);
    await orderSummaryRobot.tapContinueButton(1);
    orderSummaryRobot.verifyShipToID(shipToCode);
    orderSummaryRobot.verifyCountry(country);
    orderSummaryRobot.verifyPhone(shipToPhoneNumber);
    orderSummaryRobot.verifyPostalCode(shipToPostalCode);
    orderSummaryRobot.findContinueButton(2);
    await orderSummaryRobot.tapContinueButton(2);
    //Enable Special Instructions,CollectiveNumber
    orderSummaryRobot.findCustomerPoReference();
    await orderSummaryRobot.enterCustomerPoReference('PORefrence2');
    await orderSummaryRobot.getKeyboardDown();
    orderSummaryRobot.findSpecialInstruction();
    await orderSummaryRobot.enterSpecialInstruction('specialInstruction1');
    await orderSummaryRobot.getKeyboardDown();
    orderSummaryRobot.findContinueButton(3);
    await orderSummaryRobot.tapContinueButton(3);
    //Minimum Order Amount
    orderSummaryRobot.allowMinimumOrderAmount(minimumOrderAmount);
    orderSummaryRobot.verifySubTotalPrice(
        currency, bundleMaterialSubTotalPrice);
    orderSummaryRobot.verifyGrandTotalPrice(
        currency, bundleMaterialGrandTotalPrice);
    //verify orders with currency check
    orderSummaryRobot.findBundleItem(bundleCode);
    orderSummaryRobot.findBundleMaterialItem(bundleMaterial, 30);
    orderSummaryRobot.verifyBundleMaterialUnitPrice(
        true, currency, bundleMaterialUnitPrice);
    orderSummaryRobot.verifyBundleMaterialTotalAmount(
        true, currency, bundleMaterialTotalAmount);
    orderSummaryRobot.findSubmit();
    await orderSummaryRobot.tapSubmit();
    //minimum order amount crosses
    orderConfirmationRobot.verify();
    orderConfirmationRobot.findTitle();
    orderConfirmationRobot.findDescription();
    orderConfirmationRobot.findCreateNewOrderButton();
    orderConfirmationRobot.findGoToOrderHistoryButton();
    await orderConfirmationRobot.tapCreateNewOrderButton();
    //check favorite material
    await materialListRobot.clearSearchMaterial();
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
    favoriteRobot.verifyUnitPrice('$currency $favMaterialUnitPrice');
    favoriteRobot.findFavoriteIcon(material);
    await favoriteRobot.tapFavoriteIcon(material);
    homeRobot.findAccountTab();
    await homeRobot.tapAccountTab();
    //account page
    accountSettingsRobot.verify();
    //check login on behalf
    accountSettingsRobot.findNoLoginOnBehalf();
    accountSettingsRobot.findUserFullName('MY ExternalSR');
    accountSettingsRobot.findUserRole('External Sales Rep');
  });
}
