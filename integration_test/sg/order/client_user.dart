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
import '../../robots/orders/create_order/covid_list/covid_detail_robot.dart';
import '../../robots/orders/create_order/covid_list/covid_list_robot.dart';
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
  late CovidListRobot covidListRobot;
  late BundleDetailRobot bundleDetailRobot;
  late MaterialDetailRobot materialDetailRobot;
  late CovidDetailRobot covidDetailRobot;
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

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('SG client user - end to end - order test', (tester) async {
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
    bonusListRobot = BonusListRobot(tester);
    covidListRobot = CovidListRobot(tester);
    covidDetailRobot = CovidDetailRobot(tester);

    //initialize variables
    const username = 'sgclientuser';
    const password = 'St@ysafe01';
    const salesOrg = '2601';
    const ediCustomerCode = '0030032074';
    const ediShipToCode = '0070042484';
    const customerCode = '0030036549';
    const shipToCode = '0070047032';
    const userRole = 'Client User';
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
    const bundleCode = '0008896426';
    const bundleMaterial1 = '000000000023007533';
    const bundleMaterial2 = '000000000023007532';
    const bundleMaterial3 = '000000000023007529';
    const materialForEdi = '000000000023007310';
    const materialForEdiAbsolute = '23007310';
    const bonusMaterial = '000000000026164640';
    const bonusMaterialAbsolute = '26164640';
    const materialWithoutPriceAbsolute = '21230639';
    const materialWithoutPrice = '000000000021230639';
    const material = '000000000021022175';
    const materialAbsolute = '21022175';
    const covidMaterial = '000000000023348698';
    const orderTemplateName = 'sgClientTemplate';
    const orderType = 'ZPOR';
    //material price
    const materialUnitPrice = '80';
    const materialTotalPrice = '1,600'; //80*20
    const bundleMaterialUnitPrice = '120';
    const bundleMaterialTotalAmount = '1,080';
    const material1UnitPrice = '0';
    const material1TotalPrice = material1UnitPrice;
    const material1SubTotalPrice = material1TotalPrice;
    const material1GrandTotalPrice = material1SubTotalPrice;
    const material2SubTotalPrice = '939.4';
    const material2GrandTotalPrice = '1,014.55'; //8% vat
    const material2UnitPrice = '469.7';
    const material2TotalPrice = material2SubTotalPrice;
    const principleFullText = 'Becton Dickinson Holdings Pte Ltd';
    const principleSearchText = 'Bec';

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
    await homeRobot.findAndCloseAnnouncementIcon();
    await homeRobot.goToCreateOrder();
    await materialRootRobot.findAndCloseAnnouncementIcon();
    materialRootRobot.verify();
    materialRootRobot.findBundlesTab();
    await materialRootRobot.tapBundlesTab();
    //add bundles
    bundleListRobot.verify();
    await bundleListRobot.tapBundle(bundleCode);
    bundleDetailRobot.verify();
    await bundleDetailRobot.findAndCloseAnnouncementIcon();
    await bundleDetailRobot.tapAddBundleMaterialQuantity(bundleMaterial1);
    await bundleDetailRobot.changeBundleMaterialQuantity(bundleMaterial2, 5);
    await bundleDetailRobot.tapAddBundleMaterialQuantity(bundleMaterial3);
    await bundleDetailRobot.tapDeductBundleMaterialQuantity(bundleMaterial2);
    await bundleDetailRobot.addBundlesToCart();
    await cartRobot.goBack();
    await bundleDetailRobot.goBack();
    //add material
    await materialRootRobot.tapMaterialTab();
    materialListRobot.verify();
    await materialListRobot.search(materialForEdiAbsolute);
    //Display Currency at material list page
    materialListRobot.verifyCurrencyCheck(currency);
    await materialListRobot.tapMaterial(materialForEdi);
    materialDetailRobot.verify();
    materialDetailRobot.verifyBonusesMaterial();
    materialDetailRobot.verifyTieredPricingMaterial();
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
    cartRobot.verifyExpiryMaterial(materialForEdi);
    //Enable GST At Total Level Only
    //GST value %
    cartRobot.verifyEnableVatAtTotalLevel(materialForEdi, 8);
    //update material quantity
    await cartRobot.tapMaterial(materialForEdiAbsolute);
    await materialDetailRobot.changeQuantity(19);
    await materialDetailRobot.tapUpdateAddToCart();
    cartRobot.verify();
    cartRobot.findMaterialItem(materialForEdi, 19);
    cartRobot.findAddQuantity(materialForEdi);
    await cartRobot.tapAddQuantity(materialForEdi);
    cartRobot.findMaterialItem(materialForEdi, 20);
    //Add remark (Enable Material Remarks)
    cartRobot.findRemarkButton(materialForEdi);
    await cartRobot.addRemark(materialForEdi, 'Good');
    cartRobot.findRemarkText('Good');
    await cartRobot.editRemark(materialForEdi, 'Nice');
    await cartRobot.deleteRemark(materialForEdi);
    //enable bonus override
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
    cartRobot.verifyBonusMaterial(materialForEdi, false, 1);
    //Enable Price override
    cartRobot.verifyEnablePriceOverride(materialForEdi);
    await cartRobot.tapPrice(materialForEdi);
    await cartRobot.changePrice(80);
    await cartRobot.tapPriceOverrideButton();
    //bundle update
    await cartRobot.findBundleItem(bundleCode);
    await cartRobot.tapAddQuantity(bundleMaterial1);
    await cartRobot.tapDeductQuantity(bundleMaterial2);
    await cartRobot.changeQuantity(bundleMaterial3, 4);
    await cartRobot.getKeyboardDown();
    cartRobot.findBundleMaterialItem(bundleMaterial1, 2);
    cartRobot.findBundleMaterialItem(bundleMaterial2, 3);
    cartRobot.findBundleMaterialItem(bundleMaterial3, 4);
    //Display Expiry Date
    cartRobot.verifyExpiryMaterial(bundleMaterial1);
    cartRobot.verifyExpiryMaterial(bundleMaterial2);
    cartRobot.verifyExpiryMaterial(bundleMaterial3);
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
    orderSummaryRobot.verifyPhone(phoneNumberEdi);
    orderSummaryRobot.verifyPostalCode(postalCodeEdi);
    orderSummaryRobot.findContinueButton(2);
    await orderSummaryRobot.tapContinueButton(2);
    //Enable Special Instructions
    orderSummaryRobot.findSpecialInstruction();
    await orderSummaryRobot.enterSpecialInstruction('special');
    await orderSummaryRobot.getKeyboardDown();
    orderSummaryRobot.findContinueButton(3);
    await orderSummaryRobot.tapContinueButton(3);
    //Minimum Order Amount
    orderSummaryRobot.allowMinimumOrderAmount('$currency $minimumOrderAmount');
    //verify orders with currency check
    orderSummaryRobot.findMaterialItem(materialForEdi, 20);
    orderSummaryRobot.verifyMaterialUnitPrice(
        true, currency, materialUnitPrice);
    orderSummaryRobot.verifyMaterialTotalPrice(
        true, currency, materialTotalPrice);
    orderSummaryRobot.findBundleItem(bundleCode);
    orderSummaryRobot.findBundleMaterialItem(bundleMaterial1, 2);
    orderSummaryRobot.findBundleMaterialItem(bundleMaterial2, 3);
    orderSummaryRobot.findBundleMaterialItem(bundleMaterial3, 4);
    orderSummaryRobot.verifyBundleMaterialUnitPrice(
        true, currency, bundleMaterialUnitPrice);
    orderSummaryRobot.verifyBundleMaterialTotalAmount(
        true, currency, bundleMaterialTotalAmount);
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
    materialRootRobot.findBundlesTab();
    materialRootRobot.findCovidTab();
    materialListRobot.verify();
    await materialListRobot.search(materialWithoutPriceAbsolute);
    //enable materials without price
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
    orderSummaryRobot.allowMinimumOrderAmount('$currency $minimumOrderAmount');
    orderSummaryRobot.verifySubTotalPrice(currency, material1SubTotalPrice);
    orderSummaryRobot.verifyGrandTotalPrice(currency, material1GrandTotalPrice);
    //verify orders with currency check
    orderSummaryRobot.findMaterialItem(materialWithoutPrice, 1);
    orderSummaryRobot.verifyMaterialUnitPrice(
        false, currency, material1UnitPrice);
    orderSummaryRobot.verifyMaterialTotalPrice(
        false, currency, material1TotalPrice);
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
    materialDetailRobot.findAddToCart();
    await materialDetailRobot.tapAddToCart();
    materialListRobot.findCartButton();
    await materialListRobot.tapCartButton();
    cartRobot.verify();
    cartRobot.findMaterialItem(material, 1);
    await cartRobot.goBack();
    //try to add covid material
    materialRootRobot.findCovidTab();
    await materialRootRobot.tapCovidTab();
    covidListRobot.verify();
    covidListRobot.findCovidMaterial(covidMaterial);
    await covidListRobot.tapCovidMaterial(covidMaterial);
    covidDetailRobot.verify();
    await covidDetailRobot.addQuantity();
    covidDetailRobot.findAddToCart();
    await covidDetailRobot.tapAddToCart();
    covidDetailRobot.verifyCovidMaterialCannotAddSnackBar();
    await covidDetailRobot.goBack();
    materialListRobot.findCartButton();
    await materialListRobot.tapCartButton();
    cartRobot.verify();
    cartRobot.findMaterialItem(material, 1);
    await cartRobot.tapAddQuantity(material);
    await tester.pumpAndSettle(const Duration(seconds: 2));
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
    orderTemplateDetailRobot.verifyMaterialQuantity('2');
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
    savedOrderDetailRobot.verifyMaterialQuantity('2');
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
    orderSummaryRobot.allowMinimumOrderAmount('$currency $minimumOrderAmount');
    orderSummaryRobot.verifySubTotalPrice(currency, material2SubTotalPrice);
    orderSummaryRobot.verifyGrandTotalPrice(currency, material2GrandTotalPrice);
    //verify orders with currency check
    orderSummaryRobot.findMaterialItem(material, 2);
    orderSummaryRobot.verifyMaterialUnitPrice(
        true, currency, material2UnitPrice);
    orderSummaryRobot.verifyMaterialTotalPrice(
        true, currency, material2TotalPrice);
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
    orderHistoryRobot.verifyQuantity('2');
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
    orderHistoryDetailsRobot.verifyQuantity('2');
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
    cartRobot.findMaterialItem(material, 2);
    await cartRobot.deleteMaterial(material);
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
    cartRobot.findMaterialItem(covidMaterial, 2);
    await cartRobot.deleteMaterial(covidMaterial);
    await cartRobot.goBack();
    await materialRootRobot.goBack();
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
    favoriteRobot.verifyUnitPrice('$currency 469.7');
    favoriteRobot.findFavoriteIcon(material);
    await favoriteRobot.tapFavoriteIcon(material);
    homeRobot.findAccountTab();
    await homeRobot.tapAccountTab();
    //account page
    accountSettingsRobot.verify();
    //check login on behalf
    accountSettingsRobot.findNoLoginOnBehalf();
    accountSettingsRobot
        .findUserFullName('$country ${userRole.replaceAll(' ', '')}');
    accountSettingsRobot.findUserRole(userRole);
  });
}
