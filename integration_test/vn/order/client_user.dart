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

  testWidgets('VN market test client user', (WidgetTester tester) async {
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
    const username = 'vnclientuser';
    const password = 'St@ysafe01';
    const userRole = 'Client User';
    const customerCode = '0030282241';
    const customerCode1 = '0030264525';
    const customerCode2 = '0030264612';
    const customerCode3 = '0030264490';
    const shipTo = '0071209479';
    const material1 = '000000000021130327';
    const material2 = '000000000021128991';
    const material3 = '000000000021129643';
    const material4 = '000000000021129707';
    const material5 = '000000000021130222';
    const material6 = '000000000021128917';
    const material7 = '000000000021129929';
    const material8 = '000000000021129875';
    const templateMaterial = '21128991';
    const templateQty = '100';
    const bonusMaterial = '000000000021129956';
    const tenderContract = '0040022344';
    const phoneNumber = '0839525292';
    const saveTemplateText = 'vn template 32';
    const currency = 'VND';
    const country = 'VN';
    const salesOrg = '3050';
    const salesOrg1 = '3070';
    const minimumOrderAmount = '1,000,000 $currency';
    const unitPrice = '105,000';
    const grandTotalPrice = '105,000,000'; //Tax calculated at material level.
    const materialTotalPrice = '105,000,000';
    const subTotalPrice = '100,000,000';
    const unitPriceBeforeZdp5Discount = '6,551,795.25';
    const unitPriceAfterZdp5Discount = '6,627,920.25';
    const tierQuantityUnitPrice1 = '171,899.7';
    const tierQuantityUnitPrice8 = '154,709.73';
    const unitPriceMat2 = '198,450';
    const grandTotalPrice2 = '19,845,000'; //Tax calculated at material level.
    const materialTotalPrice2 = '19,845,000';
    const subTotalPrice2 = '18,900,000';

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

    //Add Material With Tender Contract To Cart(730 contract)
    await materialDetailRobot.changeQuantity(1001);
    await materialDetailRobot.tenderOrderErrorTextVisible();
    await materialDetailRobot.deductQuantity();
    await materialDetailRobot.tenderOrderErrorTextNotVisible();

    await materialDetailRobot.addTenderMaterialToCartIfQuantityIsValidated();

    //Tender Order Validation(Tender material 730 cannot be combined with any other material in the cart.)
    await materialListRobot.clearSearchMaterial();
    await materialListRobot.search(material2);
    await materialListRobot.tapMaterial(material2);
    materialDetailRobot.verify();
    await tenderOrderValidation(materialNumber: material2, qty: 1);

    //Add another material with 730 contract to cart
    await materialListRobot.clearSearchMaterial();
    await materialListRobot.search(
      material3,
    );
    await materialListRobot.tapMaterial(material3);
    materialDetailRobot.verify();
    materialDetailRobot.findTenderContractText();
    await materialDetailRobot.tapTenderContract(tenderContract);
    await materialDetailRobot.selectTenderContract(tenderContract);
    await materialDetailRobot.addTenderMaterialToCartIfQuantityIsValidated();

    //Cart page
    materialListRobot.findCartButton();
    await materialListRobot.tapCartButton();
    cartRobot.verify();

    //Delete Cart Item if item present in cart
    await cartRobot.deleteMaterialIfItemPresentInCart(material3, 1);
    await cartRobot.deleteMaterialIfItemPresentInCart(material1, 1000);

    await cartRobot.goBack();
    await materialListRobot.clearSearchMaterial();
    await materialListRobot.search(material8);
    await materialListRobot.tapMaterial(material8);
    materialDetailRobot.verify();
    await materialDetailRobot.changeQuantity(1000);
    materialDetailRobot.findAddToCart();
    await materialDetailRobot.tapAddToCart();
    materialListRobot.verify();
    materialListRobot.findCartButton();
    await materialListRobot.tapCartButton();
    cartRobot.verify();
    cartRobot.findMaterialItem(material8, 1000);

    //Stock Status Check
    await cartRobot.verifyStockMaterial(material8);

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
    //Enable Special Instructions
    orderSummaryRobot.findSpecialInstruction();
    await orderSummaryRobot.enterSpecialInstruction('special');
    await orderSummaryRobot.getKeyboardDown();
    orderSummaryRobot.findContinueButton(3);
    await orderSummaryRobot.tapContinueButton(3);
    orderSummaryRobot.verifySubTotalPrice(currency, subTotalPrice);
    orderSummaryRobot.verifyGrandTotalPrice(currency, grandTotalPrice);
    orderSummaryRobot.verifyMaterialTotalPriceVN(currency, materialTotalPrice);
    orderSummaryRobot.verifyMaterialUnitPriceForVN(currency, unitPrice);
    orderSummaryRobot.findSubmit();
    await orderSummaryRobot.tapSubmit();
    orderConfirmationRobot.verify();
    orderConfirmationRobot.findCreateNewOrderButton();
    await orderConfirmationRobot.goBack();

    //Save Order Template
    await homeRobot.goToCreateOrder();
    materialListRobot.verify();
    await materialListRobot.clearSearchMaterial();
    await materialListRobot.search(
      material2,
    );
    await materialListRobot.tapMaterial(material2);
    materialDetailRobot.verify();
    await materialDetailRobot.changeQuantity(100);
    materialDetailRobot.findAddToCart();
    await materialDetailRobot.tapAddToCart();
    materialListRobot.verify();
    materialListRobot.findCartButton();
    await materialListRobot.tapCartButton();
    cartRobot.verify();
    cartRobot.findMaterialItem(material2, 100);
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
    orderSummaryRobot.verifyPhone(phoneNumber);
    orderSummaryRobot.findContinueButton(1);
    await orderSummaryRobot.tapContinueButton(1);

    orderSummaryRobot.findContinueButton(2);
    await orderSummaryRobot.tapContinueButton(2);
    orderSummaryRobot.findContinueButton(3);
    await orderSummaryRobot.tapContinueButton(3);

    //Verify MinimumOrder Value And Currency
    orderSummaryRobot.allowMinimumOrderAmount(minimumOrderAmount);
    orderSummaryRobot.verifySubTotalPrice(currency, subTotalPrice2);
    orderSummaryRobot.verifyGrandTotalPrice(currency, grandTotalPrice2);
    orderSummaryRobot.verifyMaterialTotalPriceVN(currency, materialTotalPrice2);
    orderSummaryRobot.verifyMaterialUnitPriceForVN(currency, unitPriceMat2);
    orderSummaryRobot.findSubmit();
    await orderSummaryRobot.tapSubmit();
    orderConfirmationRobot.verify();

    //Go TO Order History
    orderConfirmationRobot.findGoToOrderHistoryButton();
    await orderConfirmationRobot.tapGoToOrderHistoryButton();
    orderHistoryRobot.verify();

    orderHistoryRobot.findOrderedItem();
    await orderHistoryRobot.tapOrderedItem();
    orderHistoryDetailsRobot.verify();
    orderHistoryDetailsRobot.findOrderDetails();
    await orderHistoryDetailsRobot.tapOrderDetails();
    orderHistoryDetailsRobot.findSoldToAddress();
    await orderHistoryDetailsRobot.tapSoldToAddress();
    orderHistoryDetailsRobot.findShipToAddress();
    await orderHistoryDetailsRobot.tapShipToAddress();
    orderHistoryDetailsRobot.findOrderSummary();
    orderHistoryDetailsRobot.verifyEnableZPPrice(material2);
    orderHistoryDetailsRobot.verifyEnableTotalPrice(material2);
    //Disable Delivery Time (PDD/POD)
    orderHistoryDetailsRobot.verifyDeliveryDateTime(false);

    //Enable Vat Display
    orderHistoryDetailsRobot.verifyEnableTaxDisplay();
    await orderHistoryDetailsRobot.tapOrderSummary();

    orderHistoryDetailsRobot.findReOrderButton();
    await orderHistoryDetailsRobot.tapReOrderButton();
    cartRobot.findMaterialItem(material2, 100);
    cartRobot.verify();
    await cartRobot.deleteMaterial(material2);
    await cartRobot.goBack();

    //Order History FIlters
    orderHistoryRobot.findOrderHistoryFilter();
    await orderHistoryRobot.findOrderHistoryFilterByMaterialNumber(material2);
    await orderHistoryRobot.tapOrderHistoryFilterApplyButton();
    orderHistoryRobot.findOrderItemByMaterialNumber(material2);

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

    favoriteRobot.findFavoriteIcon(material2);
    await favoriteRobot.tapFavoriteIcon(material2);

    //Add Out Of Stock Material To Cart
    homeRobot.findHomeTab();
    await homeRobot.tapHomeTab();
    await homeRobot.goToCreateOrder();
    materialListRobot.verify();
    await materialListRobot.clearSearchMaterial();
    await materialListRobot.search(
      material4,
    );
    await materialListRobot.tapMaterial(material4);
    materialDetailRobot.verify();
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
    cartRobot.findMaterialItem(material4, 1);
    await cartRobot.deleteMaterial(material4);
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

    accountSettingsRobot
        .findUserFullName('$country ${userRole.replaceAll(' ', '')}');
    accountSettingsRobot.findUserRole(userRole);

    //Zdp5 Discount
    homeRobot.findHomeTab();
    await homeRobot.tapHomeTab();
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
    await cartRobot.goBack();
    materialListRobot.verify();
    await materialListRobot.goBack();

    //Add bonus
    homeRobot.findCustomerCodeSelector();
    await homeRobot.tapCustomerCodeSelector();
    customerSearchRobot.verify();
    await customerSearchRobot.search(customerCode3);
    await customerSearchRobot.tapCustomerCode(customerCode3);
    homeRobot.verify();
    await homeRobot.goToCreateOrder();
    materialListRobot.verify();
    await materialListRobot.clearSearchMaterial();
    await materialListRobot.search(material7);
    await materialListRobot.tapMaterial(material7);
    materialDetailRobot.verify();
    materialDetailRobot.findAddToCart();
    await materialDetailRobot.tapAddToCart();
    materialListRobot.verify();
    materialListRobot.findCartButton();
    await materialListRobot.tapCartButton();
    cartRobot.verify();
    await cartRobot.changeQuantity(material7, 11);
    await cartRobot.getKeyboardDown();
    cartRobot.verifyBonusMaterial(bonusMaterial, false, 1);
    cartRobot.findMaterialItem(material7, 11);
    await cartRobot.deleteMaterial(material7);
    await cartRobot.goBack();
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
      material5,
    );
    await materialListRobot.tapMaterial(material5);
    materialDetailRobot.verify();
    materialDetailRobot.verifyTieredPricingMaterial();
    await materialDetailRobot.changeQuantity(7);
    await cartRobot.getKeyboardDown();
    await materialDetailRobot.deductQuantity();
    await materialDetailRobot.addQuantity();
    materialDetailRobot.findAddToCart();
    await materialDetailRobot.tapAddToCart();
    materialListRobot.verify();
    materialListRobot.findCartButton();
    await materialListRobot.tapCartButton();
    cartRobot.findMaterialItem(material5, 7);

    cartRobot.verifyUnitPrice(currency, tierQuantityUnitPrice1);

    await cartRobot.changeQuantity(material5, 12);
    await cartRobot.getKeyboardDown();
    cartRobot.verifyUnitPrice(currency, tierQuantityUnitPrice8);
  });
}
