import 'package:flutter/cupertino.dart';
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
  late MaterialRootRobot materialRootRobot;

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('VN market test external sales rep user',
      (WidgetTester tester) async {
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
    const username = 'vnexternalsalesrep';
    const password = 'St@ysafe01';
    const userRole = 'External Sales Rep';
    const user = 'ExternalSR';
    const customerCode = '0030282241';
    const customerCode1 = '0030264525';
    const customerCode2 = '0030264612';
    const shipTo = '0071209479';
    const material1 = '000000000021128991';
    const material2 = '000000000021129643';
    const material4 = '000000000021130222';
    const material6 = '000000000021128917';
    const templateMaterial = '21128991';
    const tenderContract = '0040022344';
    const phoneNumber = '0839525292';
    const saveTemplateText = 'vn template 2';
    const templateQty = '100';
    const currency = 'VND';
    const country = 'VN';
    const salesOrg = '3050';
    const unitPrice = '198,450';
    const grandTotalPrice = '19,845,000'; //Tax calculated at material level.
    const subTotalPrice = '18,900,000';
    const materialTotalPrice = '19,845,000';
    const salesOrg1 = '3070';
    const unitPriceBeforeZdp5Discount = '6,551,795.25';
    const unitPriceAfterZdp5Discount = '6,627,920.25';
    const tierQuantityUnitPrice1 = '171,899.7';
    const tierQuantityUnitPrice8 = '154,709.73';
    const minimumOrderAmount = '1,000,000 $currency';
    const principleFullText = 'Besins Healthcare (Hong Kong) Ltd.';
    const principleSearchText = 'Bes';

    Future<void> tenderOrderValidation({
      required String materialNumber,
      required int qty,
    }) async {
      final tenderOrderInvalidCombinationError =
          find.byKey(const Key('addTOCartTenderOrderInvalidCombinationError'));

      if (tenderOrderInvalidCombinationError.evaluate().isNotEmpty) {
        expect(tenderOrderInvalidCombinationError, findsOneWidget);
      }
      materialDetailRobot.findAddToCart();
      await materialDetailRobot.tapAddToCart();

      final materialDetails = find.byKey(const Key('materialDetailsPage'));

      if (materialDetails.evaluate().isNotEmpty) {
        expect(materialDetails, findsOneWidget);
        await materialDetailRobot.goBack();
      } else {
        materialListRobot.verify();
        materialListRobot.findCartButton();
        await materialListRobot.tapCartButton();
        cartRobot.verify();
        cartRobot.findMaterialItem(materialNumber, qty);
        await cartRobot.deleteMaterial(materialNumber);
        await cartRobot.goBack();
      }
    }

    //init app
    await runAppForTesting(tester);

    await loginRobot.findAndCloseAnnouncementIcon();
    await loginRobot.login(username, password);
    await homeRobot.findAndCloseAnnouncementIcon();

    homeRobot.findSalesOrgSelector();
    await homeRobot.tapSalesOrgSelector();
    await homeRobot.selectSalesOrg(salesOrg);
    homeRobot.findCustomerCodeSelector();
    await homeRobot.tapCustomerCodeSelector();
    customerSearchRobot.verify();
    await customerSearchRobot.search(customerCode);
    await customerSearchRobot.tapCustomerCode(customerCode);
    homeRobot.verify();
    homeRobot.findShipToSelector();
    await homeRobot.tapShipToSelector();
    shipToSearchRobot.verify();
    await shipToSearchRobot.search(shipTo);
    await shipToSearchRobot.tapShipToCode(shipToCode: shipTo);
    homeRobot.verify();
    await homeRobot.goToCreateOrder();
    materialListRobot.verify();
    await materialRootRobot.findAndCloseAnnouncementIcon();

    //Disable Order Type Selection as Enable
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

    //check bundle tab disabled
    materialRootRobot.findNoBundleTab();

    await materialListRobot.search(material1);

    //currency check at material level
    materialListRobot.verifyCurrencyCheck(currency);

    //display Total Tax as per config for VN user
    materialListRobot.displayTotalTax(material1);

    //display price before vat
    materialListRobot.displayPriceBeforeVat(material1);

    await materialListRobot.tapMaterial(material1);
    materialDetailRobot.verify();

    await materialDetailRobot.changeQuantity(100);

    materialDetailRobot.findAddToCart();
    await materialDetailRobot.tapAddToCart();

    //Cart page
    materialListRobot.findCartButton();
    await materialListRobot.tapCartButton();
    cartRobot.verify();

    //Stock Status Check
    await cartRobot.verifyStockMaterial(material1);

    //Delete Cart Item
    cartRobot.findMaterialItem(material1, 100);

    cartRobot.verifyEnablePriceOverride(material1);
    await cartRobot.tapPrice(material1);
    await cartRobot.changePrice(180000);
    await cartRobot.tapPriceOverrideButton();
    cartRobot.verifyUnitPrice(currency, '189,000');
    await cartRobot.tapPrice(material1);
    await cartRobot.changePrice(189000);
    await cartRobot.tapPriceOverrideButton();
    cartRobot.verifyUnitPrice(currency, '198,450');
    ////Price - overriden///
    await cartRobot.deleteMaterial(material1);

    await cartRobot.goBack();

    await materialListRobot.tapMaterial(material1);
    materialDetailRobot.verify();

    await materialDetailRobot.changeQuantity(100);
    await materialDetailRobot.tapAddToCart();
    materialListRobot.findCartButton();
    await materialListRobot.tapCartButton();
    cartRobot.verify();

    //Navigate To Order Summary page
    cartRobot.findOrderSummary();
    await cartRobot.tapOrderSummary();
    orderSummaryRobot.verifyCustomerEmail('NA');
    orderSummaryRobot.verifySoldToID(customerCode);

    //Save Order
    orderSummaryRobot.findContinueButton(0);
    await orderSummaryRobot.tapContinueButton(0);
    orderSummaryRobot.verifySoldToID(customerCode);
    orderSummaryRobot.verifyCountry(country);
    orderSummaryRobot.verifyPhone(phoneNumber);
    orderSummaryRobot.findContinueButton(1);
    await orderSummaryRobot.tapContinueButton(1);

    orderSummaryRobot.findContinueButton(2);
    await orderSummaryRobot.tapContinueButton(2);
    //Enable Special Instructions
    orderSummaryRobot.findSpecialInstruction();
    await orderSummaryRobot.enterSpecialInstruction('special');
    await orderSummaryRobot.getKeyboardDown();
    orderSummaryRobot.findContinueButton(3);
    await orderSummaryRobot.tapContinueButton(3);

    orderSummaryRobot.findSave();
    await orderSummaryRobot.tapSave();

    savedOrderListRobot.verify();
    await savedOrderListRobot.goBack();

    //Place order from saved orders
    homeRobot.findSavedOrders();
    await homeRobot.tapSavedOrders();

    savedOrderListRobot.findOrder();
    savedOrderListRobot.verifySoldToID(customerCode);
    savedOrderListRobot.verifyShipToID(shipTo);
    await savedOrderListRobot.tapOrder();
    savedOrderDetailRobot.verify();
    savedOrderDetailRobot.findAddToCart();
    await savedOrderDetailRobot.tapAddToCart();
    cartRobot.verify();
    cartRobot.findOrderSummary();
    await cartRobot.tapOrderSummary();

    orderSummaryRobot.verifyCustomerEmail('NA');
    orderSummaryRobot.verifySoldToID(customerCode);
    orderSummaryRobot.findContinueButton(0);
    await orderSummaryRobot.tapContinueButton(0);
    orderSummaryRobot.verifySoldToID(customerCode);
    orderSummaryRobot.verifyCountry(country);
    orderSummaryRobot.verifyPhone(phoneNumber);
    orderSummaryRobot.findContinueButton(1);
    await orderSummaryRobot.tapContinueButton(1);

    orderSummaryRobot.findContinueButton(2);
    await orderSummaryRobot.tapContinueButton(2);
    orderSummaryRobot.findContinueButton(3);
    await orderSummaryRobot.tapContinueButton(3);
    //Verify MinimumOrder Value And Currency
    orderSummaryRobot.allowMinimumOrderAmount(minimumOrderAmount);
    orderSummaryRobot.verifyMaterialUnitPriceForVN(currency, unitPrice);
    orderSummaryRobot.verifySubTotalPrice(currency, subTotalPrice);
    orderSummaryRobot.verifyMaterialTotalPriceVN(currency, materialTotalPrice);
    orderSummaryRobot.verifyGrandTotalPrice(currency, grandTotalPrice);
    orderSummaryRobot.findSubmit();
    await orderSummaryRobot.tapSubmit();
    orderConfirmationRobot.verify();
    orderConfirmationRobot.findCreateNewOrderButton();
    await orderConfirmationRobot.goBack();

    //Save Order Template
    await homeRobot.goToCreateOrder();
    materialListRobot.verify();
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
    await orderSummaryRobot.enterTemplateName(saveTemplateText);
    orderSummaryRobot.findTemplateSaveButton();
    await orderSummaryRobot.tapTemplateSaveButton();
    await orderSummaryRobot.goBack();
    await cartRobot.goBack();
    await materialListRobot.goBack();

    //Place Order From Saved Order Templates
    homeRobot.verify();
    homeRobot.findOrderTemplate();
    await homeRobot.tapOrderTemplate();
    orderTemplateListRobot.findTemplateItem(saveTemplateText);
    await orderTemplateListRobot.tapTemplateItem(saveTemplateText);
    orderTemplateDetailRobot.verifyMaterialNumber(templateMaterial);
    orderTemplateDetailRobot.verifyMaterialQuantity(templateQty);
    orderTemplateDetailRobot.findAddToCart();
    await orderTemplateDetailRobot.tapAddToCart();
    cartRobot.verify();
    cartRobot.findOrderSummary();
    await cartRobot.tapOrderSummary();
    orderSummaryRobot.verifyCustomerEmail('NA');
    orderSummaryRobot.verifySoldToID(customerCode);
    orderSummaryRobot.findContinueButton(0);
    await orderSummaryRobot.tapContinueButton(0);
    orderSummaryRobot.verifySoldToID(customerCode);
    orderSummaryRobot.verifyCountry(country);
    orderSummaryRobot.verifyPhone(phoneNumber);
    orderSummaryRobot.findContinueButton(1);
    await orderSummaryRobot.tapContinueButton(1);

    orderSummaryRobot.findContinueButton(2);
    await orderSummaryRobot.tapContinueButton(2);
    orderSummaryRobot.findContinueButton(3);
    await orderSummaryRobot.tapContinueButton(3);

    orderSummaryRobot.verifyMaterialUnitPriceForVN(currency, unitPrice);
    orderSummaryRobot.verifySubTotalPrice(currency, subTotalPrice);
    orderSummaryRobot.verifyMaterialTotalPriceVN(currency, materialTotalPrice);
    orderSummaryRobot.verifyGrandTotalPrice(currency, grandTotalPrice);
    orderSummaryRobot.findSubmit();
    await orderSummaryRobot.tapSubmit();
    orderConfirmationRobot.verify();

    //Go TO Order History
    orderConfirmationRobot.findGoToOrderHistoryButton();
    await orderConfirmationRobot.tapGoToOrderHistoryButton();
    orderHistoryRobot.verify();

    orderHistoryRobot.findOrderedItem();
    await orderHistoryRobot.tapOrderedItem();
    orderHistoryDetailsRobot.findOrderDetails();
    await orderHistoryDetailsRobot.tapOrderDetails();
    orderHistoryDetailsRobot.findSoldToAddress();
    await orderHistoryDetailsRobot.tapSoldToAddress();
    orderHistoryDetailsRobot.findShipToAddress();
    await orderHistoryDetailsRobot.tapShipToAddress();
    //Disable Delivery Time (PDD/POD)
    orderHistoryDetailsRobot.verifyDeliveryDateTime(false);
    orderHistoryDetailsRobot.verify();
    orderHistoryDetailsRobot.findOrderSummary();

    //Enable Vat Display
    orderHistoryDetailsRobot.verifyEnableTaxDisplay();
    orderHistoryDetailsRobot.verifyEnableZPPrice(material1);
    orderHistoryDetailsRobot.verifyEnableTotalPrice(material1);
    await orderHistoryDetailsRobot.tapOrderSummary();

    orderHistoryDetailsRobot.findReOrderButton();
    await orderHistoryDetailsRobot.tapReOrderButton();
    cartRobot.findMaterialItem(material1, 100);
    cartRobot.verify();
    await cartRobot.deleteMaterial(material1);
    await cartRobot.goBack();

    //Order History FIlters
    orderHistoryRobot.findOrderHistoryFilter();
    await orderHistoryRobot.findOrderHistoryFilterByMaterialNumber(material1);
    await orderHistoryRobot.tapOrderHistoryFilterApplyButton();
    orderHistoryRobot.findOrderItemByMaterialNumber(material1);

    orderHistoryRobot.findOrderHistoryFilter();
    await orderHistoryRobot.tapFilterButton();
    orderHistoryRobot.findFilterClearButton();
    await orderHistoryRobot.tapFilterClearButton();
    homeRobot.findHomeTab();
    await homeRobot.tapHomeTab();

    //Add To Favorites
    await homeRobot.goToCreateOrder();
    materialListRobot.verify();
    materialListRobot.findFavoriteIcon(templateMaterial);
    await materialListRobot.tapFavoriteIcon(templateMaterial);
    await materialListRobot.goBack();

    homeRobot.verify();
    homeRobot.findFavoriteTab();
    await homeRobot.tapFavoriteTab();
    favoriteRobot.verify();
    await favoriteRobot.refreshFavoriteList();
    favoriteRobot.findFavoriteItem();
    favoriteRobot.verifyMaterialNumber(templateMaterial);

    favoriteRobot.findFavoriteIcon(material1);
    await favoriteRobot.tapFavoriteIcon(material1);

    homeRobot.findHomeTab();
    await homeRobot.tapHomeTab();
    await homeRobot.goToCreateOrder();
    materialListRobot.verify();
    await materialListRobot.tapMaterial(material1);
    materialDetailRobot.verify();

    await materialDetailRobot.changeQuantity(1);
    materialDetailRobot.findAddToCart();
    await materialDetailRobot.tapAddToCart();
    materialListRobot.findCartButton();
    await materialListRobot.tapCartButton();
    cartRobot.verify();
    cartRobot.findOrderSummary();
    await cartRobot.tapOrderSummary();
    orderSummaryRobot.verifyCustomerEmail('NA');
    orderSummaryRobot.verifySoldToID(customerCode);

    orderSummaryRobot.findContinueButton(0);
    await orderSummaryRobot.tapContinueButton(0);
    orderSummaryRobot.verifySoldToID(customerCode);
    orderSummaryRobot.verifyCountry(country);
    orderSummaryRobot.verifyPhone(phoneNumber);
    orderSummaryRobot.findContinueButton(1);
    await orderSummaryRobot.tapContinueButton(1);

    orderSummaryRobot.findContinueButton(2);
    await orderSummaryRobot.tapContinueButton(2);
    orderSummaryRobot.findContinueButton(3);
    await orderSummaryRobot.tapContinueButton(3);

    //Not able to submit order since does not satisfy the minimum order condition
    orderSummaryRobot.findSubmit();
    await orderSummaryRobot.tapSubmit();
    orderSummaryRobot.verify();
    await orderSummaryRobot.goBack();
    await cartRobot.goBack();
    await materialListRobot.goBack();

    //Delete Saved Order
    homeRobot.findSavedOrders();
    await homeRobot.tapSavedOrders();
    savedOrderListRobot.findSavedOrderItemDelete();
    await savedOrderListRobot.tapSavedOrderItemDelete();
    savedOrderListRobot.verifyConfirmationDialog();
    savedOrderListRobot.findConfirmButton();
    await savedOrderListRobot.tapConfirmButton();
    await savedOrderListRobot.goBack();
    homeRobot.verify();

    //Delete Order Template
    homeRobot.findOrderTemplate();
    await homeRobot.tapOrderTemplate();
    orderTemplateListRobot.findTemplateItemDelete();
    await orderTemplateListRobot.tapTemplateItemDelete();
    orderTemplateListRobot.verifyConfirmationDialog();
    orderTemplateListRobot.findConfirmButton();
    await orderTemplateListRobot.tapConfirmButton();
    await orderTemplateListRobot.goBack();
    homeRobot.verify();

    //Find no login on behalf
    homeRobot.findAccountTab();
    await homeRobot.tapAccountTab();
    accountSettingsRobot.findNoLoginOnBehalf();

    accountSettingsRobot.findUserFullName('$country $user');
    accountSettingsRobot.findUserRole(userRole);

    //Tender Order Flow
    homeRobot.findHomeTab();
    await homeRobot.tapHomeTab();
    homeRobot.verify();
    await homeRobot.goToCreateOrder();
    materialListRobot.verify();
    materialListRobot.findCartButton();
    await materialListRobot.tapCartButton();
    cartRobot.verify();
    cartRobot.findMaterialItem(material1, 1);
    await cartRobot.deleteMaterial(material1);

    await cartRobot.goBack();
    await materialListRobot.clearSearchMaterial();
    await materialListRobot.search(material2);
    await materialListRobot.tapMaterial(material2);
    materialDetailRobot.verify();

    //Add Material With Tender Contract To Cart(730 contract)
    await materialDetailRobot.tenderOrderErrorTextVisible();
    materialDetailRobot.findTenderContractText();
    await materialDetailRobot.tapTenderContract(tenderContract);
    await materialDetailRobot.selectTenderContract(tenderContract);
    await materialDetailRobot.changeQuantity(1001);
    await materialDetailRobot.deductQuantity();
    await materialDetailRobot.tenderOrderErrorTextNotVisible();
    await materialDetailRobot.addTenderMaterialToCartIfQuantityIsValidated();

    //Tender Order Validation(Tender material 730 cannot be combined with any other material in the cart.)
    await materialListRobot.clearSearchMaterial();
    await materialListRobot.search(material1);
    await materialListRobot.tapMaterial(material1);
    materialDetailRobot.verify();
    await tenderOrderValidation(materialNumber: material1, qty: 1);
    materialListRobot.verify();
    materialListRobot.findCartButton();
    await materialListRobot.tapCartButton();
    cartRobot.verify();
    await cartRobot.deleteMaterialIfItemPresentInCart(material2, 1000);
    await cartRobot.goBack();

    await materialListRobot.goBack();

    //Zdp5 Validation
    homeRobot.findCustomerCodeSelector();
    await homeRobot.tapCustomerCodeSelector();
    customerSearchRobot.verify();
    await customerSearchRobot.search(customerCode2);
    await customerSearchRobot.tapCustomerCode(customerCode2);
    homeRobot.verify();
    await homeRobot.goToCreateOrder();
    materialListRobot.verify();
    await materialListRobot.clearSearchMaterial();
    await materialListRobot.search(
      material6,
    );
    await materialListRobot.tapMaterial(material6);
    materialDetailRobot.verify();
    await materialDetailRobot.changeQuantity(7);
    await materialDetailRobot
        .findUnitPrice('$unitPriceBeforeZdp5Discount $currency');
    await materialDetailRobot.changeQuantity(9);
    materialDetailRobot.zdp5QtyExceedWarning();
    await materialDetailRobot.getKeyboardDown();
    await materialDetailRobot
        .findUnitPrice('$unitPriceAfterZdp5Discount $currency');
    await materialDetailRobot.deductQuantity();
    await tester.pumpAndSettle(const Duration(seconds: 4));
    await materialDetailRobot
        .findUnitPrice('$unitPriceBeforeZdp5Discount $currency');

    materialDetailRobot.findAddToCart();
    await materialDetailRobot.tapAddToCart();
    materialListRobot.findCartButton();
    await materialListRobot.tapCartButton();
    cartRobot.verify();
    cartRobot.verifyUnitPrice(currency, unitPriceBeforeZdp5Discount);
    await cartRobot.tapAddQuantity(material6);
    await cartRobot.tapAddQuantity(material6);
    cartRobot.zdp5QtyExceedWarning();
    cartRobot.verifyUnitPrice(currency, unitPriceAfterZdp5Discount);
    cartRobot.findMaterialItem(material6, 10);
    await cartRobot.deleteMaterial(material6);
    await cartRobot.goBack();
    materialListRobot.verify();
    await materialListRobot.goBack();

    //Tiered Pricing

    homeRobot.findSalesOrgSelector();
    await homeRobot.tapSalesOrgSelector();
    await homeRobot.selectSalesOrg(salesOrg1);
    homeRobot.findCustomerCodeSelector();
    await homeRobot.tapCustomerCodeSelector();
    customerSearchRobot.verify();
    await customerSearchRobot.search(customerCode1);
    await customerSearchRobot.tapCustomerCode(customerCode1);
    homeRobot.verify();
    await homeRobot.goToCreateOrder();
    materialListRobot.verify();
    await materialListRobot.clearSearchMaterial();
    await materialListRobot.search(
      material4,
    );
    await materialListRobot.tapMaterial(material4);
    materialDetailRobot.verify();
    materialDetailRobot.verifyTieredPricingMaterial();
    await materialDetailRobot.changeQuantity(7);
    await materialDetailRobot.deductQuantity();
    await materialDetailRobot.addQuantity();
    materialDetailRobot.findAddToCart();
    await materialDetailRobot.tapAddToCart();
    materialListRobot.verify();
    materialListRobot.findCartButton();
    await materialListRobot.tapCartButton();
    cartRobot.findMaterialItem(material4, 7);

    cartRobot.verifyUnitPrice(currency, tierQuantityUnitPrice1);

    await cartRobot.changeQuantity(material4, 12);
    await cartRobot.getKeyboardDown();
    cartRobot.verifyUnitPrice(currency, tierQuantityUnitPrice8);
  });
}
