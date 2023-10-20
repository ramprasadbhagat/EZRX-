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

enum Pages { materialList }

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
  late FavoriteRobot favoriteRobot;
  late MaterialRootRobot materialRootRobot;

  var quantity = 0;
  const username = 'khclientuser';
  const password = 'St@ysafe01';
  const salesOrg = '1500';
  const customerCode = '0030331498';
  const shipToCodeSearchText = '2812';
  const shipToCode = '0071262812';
  const materialSearchText = '718';
  const materialNumber = '000000000021130718';
  const listPrice = '250';

  const materialLessMinSearchText = '410';
  const materialLessMinNumber = '000000000021223410';
  const listPriceLessMin = 12.89;
  const unitPriceLessMin = 12.89;

  const minOrderAmount = '20';
  const currency = 'USD';
  const countryCode = 'KH';
  const customerDetailsPhoneNumber = '011 222 211';
  const shippingPhoneNumber = '012 773 990';
  const na = 'Price Not Available';
  const emptyString = '';
  const contactPerson = '1234';
  const poReferenceText = 'PO Reference';
  const specialInstruction = 'Special Instruction';
  const orderType = 'ZPOR';
  const materialType = 'Comm';
  const clientUserFullName = 'KH ClientUser';
  const clientUserRole = 'Client User';
  final materialActualNumber = num.parse(materialNumber).toInt().toString();
  var unitPrice = '200';
  const principleFullText = 'Abbott Products Operations A.G';
  const principleSearchText = 'Abbott';

  void onChangeQuantity({required int qty}) {
    quantity = qty;
    unitPrice = quantity < 5 ? '200' : '80';
  }

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Future<void> setConfig() async {
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
    await shipToSearchRobot.search(shipToCodeSearchText);
    await shipToSearchRobot.tapShipToCode(shipToCode: shipToCode);
    homeRobot.verify();
  }

  Future<void> addMaterialToCart({
    required String materialSearchText,
    required String materialNumber,
  }) async {
    await materialListRobot.search(materialSearchText);
    await materialListRobot.tapMaterial(materialNumber);
    materialDetailRobot.verify();
    await materialDetailRobot.findAndCloseAnnouncementIcon();
    materialDetailRobot.findAddToCart();
    await materialDetailRobot.tapAddToCart();
    materialListRobot.verify();

    materialListRobot.verifyDefaultMaterialDescription(
      materialNumber: materialNumber,
    );
    materialListRobot.verifyGenericMaterialDescription(
      materialNumber: materialNumber,
    );
    onChangeQuantity(qty: 1);
  }

  Future<void> goToCartPage({required Pages fromWhere}) async {
    switch (fromWhere) {
      case Pages.materialList:
        materialListRobot.findCartButton();
        await materialListRobot.tapCartButton();
        break;
      default:
    }

    cartRobot.verify();
    cartRobot.findMaterialItem(materialNumber, quantity);
    cartRobot.findAddQuantity(materialNumber);
    cartRobot.verifyEnableListPrice(currency, listPrice);
    cartRobot.verifyExpiryMaterial(materialNumber);
    await cartRobot.tapAddQuantity(materialNumber);
    cartRobot.findMaterialItem(materialNumber, ++quantity);
    onChangeQuantity(qty: quantity);
    final total = double.parse(unitPrice) * quantity;
    cartRobot.verifyTotal(currency, total.toInt().toString());
  }

  Future<void> verifyOrderSummaryCustomerDetailsAndProceed() async {
    orderSummaryRobot.verifyCustomerEmail(na);
    orderSummaryRobot.verifyShipToID(shipToCode);
    orderSummaryRobot.verifySoldToID(customerCode);
    orderSummaryRobot.findContinueButton(0);
    await orderSummaryRobot.tapContinueButton(0);
  }

  Future<void> verifyOrderSummarySoldToDetailsAndProceed() async {
    orderSummaryRobot.verifySoldToID(customerCode);
    orderSummaryRobot.verifyCountry(countryCode);
    orderSummaryRobot.verifyPhone(customerDetailsPhoneNumber);
    orderSummaryRobot.verifyPostalCode(emptyString);
    orderSummaryRobot.findContinueButton(1);
    await orderSummaryRobot.tapContinueButton(1);
  }

  Future<void> verifyOrderSummaryShipToDetailsAndProceed() async {
    orderSummaryRobot.verifyShipToID(shipToCode);
    orderSummaryRobot.verifyCountry(countryCode);
    orderSummaryRobot.verifyPhone(shippingPhoneNumber);
    orderSummaryRobot.verifyPostalCode(emptyString);
    orderSummaryRobot.findContinueButton(2);
    await orderSummaryRobot.tapContinueButton(2);
  }

  Future<void> fillOrderSummaryAdditionalDetailsAndProceed() async {
    orderSummaryRobot.findSpecialInstruction();
    await orderSummaryRobot.enterSpecialInstruction(specialInstruction);
    orderSummaryRobot.findContactPerson();
    await orderSummaryRobot.enterContactPerson(contactPerson);
    await orderSummaryRobot.getKeyboardDown();
    orderSummaryRobot.doNotFindSelectPaymentTerm();
    orderSummaryRobot.findContinueButton(3);
    await orderSummaryRobot.tapContinueButton(3);
    final flag = orderSummaryRobot.verifyPOReferenceValidationCheck();
    if (flag) {
      orderSummaryRobot.findCustomerPOReference();
      await orderSummaryRobot.enterCustomerPOReference(poReferenceText);
      await orderSummaryRobot.getKeyboardDown();
      orderSummaryRobot.findContinueButton(3);
      await orderSummaryRobot.tapContinueButton(3);
    }
  }

  void verifyPriceInOrderSummary({
    required String listPrice,
    required String unitPrice,
    required String totalPrice,
  }) {
    orderSummaryRobot.verifyMaterialListPrice(true, currency, listPrice);
    orderSummaryRobot.verifyMaterialUnitPrice(true, currency, unitPrice);
    orderSummaryRobot.verifyMaterialTotalPrice(true, currency, totalPrice);
  }

  Future<void> verifyOrderSummaryCartDetailsAndProceed() async {
    orderSummaryRobot.allowMinimumOrderAmount('$currency $minOrderAmount');
    verifyPriceInOrderSummary(
      listPrice: listPrice,
      unitPrice: unitPrice,
      totalPrice: (double.parse(unitPrice) * quantity).toInt().toString(),
    );
    orderSummaryRobot.findMaterialItem(materialNumber, quantity);
    orderSummaryRobot.findAddQuantity(materialNumber);
    await orderSummaryRobot.tapAddQuantity(materialNumber);
    orderSummaryRobot.findMaterialItem(materialNumber, ++quantity);
    onChangeQuantity(qty: quantity);
    verifyPriceInOrderSummary(
      listPrice: listPrice,
      unitPrice: unitPrice,
      totalPrice: (quantity * double.parse(unitPrice)).toInt().toString(),
    );
  }

  Future<void> orderSummarySubmitOrder() async {
    await orderSummaryRobot.tapSubmit();
    orderConfirmationRobot.verify();
    orderConfirmationRobot.findTitle();
    orderConfirmationRobot.findDescription();
    orderConfirmationRobot.findCreateNewOrderButton();
    orderConfirmationRobot.findGoToOrderHistoryButton();
  }

  Future<void> handleOrderSummarySubmit() async {
    orderSummaryRobot.verifyIfHideStockDisplayIsEnable(materialNumber);
    orderSummaryRobot.findSubmit();
    await orderSummarySubmitOrder();
  }

  Future<void> goToOrderSummary() async {
    cartRobot.findOrderSummary();
    await cartRobot.tapOrderSummary();
    await verifyOrderSummaryCustomerDetailsAndProceed();
    await verifyOrderSummarySoldToDetailsAndProceed();
    await verifyOrderSummaryShipToDetailsAndProceed();
    await fillOrderSummaryAdditionalDetailsAndProceed();
    await verifyOrderSummaryCartDetailsAndProceed();
    await handleOrderSummarySubmit();
  }

  Future<void> gotoOrderHistory({required bool withFilter}) async {
    if (!withFilter) {
      await orderConfirmationRobot.tapGoToOrderHistoryButton();
    }
    orderHistoryRobot.verify();
    if (withFilter) {
      orderHistoryRobot.findOrderHistoryFilter();
      await orderHistoryRobot
          .findOrderHistoryFilterByMaterialNumber(materialActualNumber);
      await orderHistoryRobot.getKeyboardDown();
      await orderHistoryRobot.tapOrderHistoryFilterApplyButton();
      orderHistoryRobot.findOrderItemByMaterialNumber(materialNumber);
    }

    orderHistoryRobot.findOrderedItem();
    orderHistoryRobot.verifyOrderType(orderType);
    orderHistoryRobot.verifyMaterialID(materialActualNumber);
    orderHistoryRobot.verifyQuantity(quantity.toString());
    orderHistoryRobot.verifyOrderProcessingStatus(false);
    await orderHistoryRobot.tapOrderedItem();
  }

  Future<void> gotoOrderHistoryDetails() async {
    orderHistoryDetailsRobot.verify();
    orderHistoryDetailsRobot.findOrderDetails();
    orderHistoryDetailsRobot.verifyOrderType(orderType);
    orderHistoryDetailsRobot.verifyContactNumber(customerDetailsPhoneNumber);
    await orderHistoryDetailsRobot.tapOrderDetails();
    orderHistoryDetailsRobot.findSoldToAddress();
    orderHistoryDetailsRobot.verifySoldToID(customerCode);
    orderHistoryDetailsRobot.verifyPostalCode(emptyString);
    orderHistoryDetailsRobot.verifyCountry(countryCode);
    orderHistoryDetailsRobot.verifyPhone(shippingPhoneNumber);
    await orderHistoryDetailsRobot.tapSoldToAddress();
    orderHistoryDetailsRobot.findShipToAddress();
    orderHistoryDetailsRobot.verifyShipToID(shipToCode);
    orderHistoryDetailsRobot.verifyPostalCode(emptyString);
    orderHistoryDetailsRobot.verifyCountry(countryCode);
    orderHistoryDetailsRobot.verifyPhone(shippingPhoneNumber);
    await orderHistoryDetailsRobot.tapShipToAddress();
    orderHistoryDetailsRobot.findInvoices();
    orderHistoryDetailsRobot.findOrderSummary();
    orderHistoryDetailsRobot.verifyMaterialType(materialType);
    orderHistoryDetailsRobot.verifyMaterialID(materialActualNumber);
    orderHistoryDetailsRobot.verifyQuantity(quantity.toString());
    orderHistoryDetailsRobot.verifyEnableZPPrice(materialNumber);
    orderHistoryDetailsRobot.verifyEnableTotalPrice(materialNumber);
    orderHistoryDetailsRobot.verifyEnableTaxDisplay();
    orderHistoryDetailsRobot.verifyDisplayBatchExpiryDate();
    orderHistoryDetailsRobot.verifyDisplayDiscount();
    orderHistoryDetailsRobot.verifyPaymentTermIsDisabled();
    await orderHistoryDetailsRobot.tapOrderSummary();
    orderHistoryDetailsRobot.findReOrderButton();
    await orderHistoryDetailsRobot.tapReOrderButton();
  }

  testWidgets('Client user KH regression Test', (WidgetTester tester) async {
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
    favoriteRobot = FavoriteRobot(tester);
    materialRootRobot = MaterialRootRobot(tester);
    //init app
    await runAppForTesting(tester);
    //login
    await loginRobot.findAndCloseAnnouncementIcon();
    await loginRobot.login(username, password);
    await setConfig();
    //block submitting order when less than min order amount
    await homeRobot.findAndCloseAnnouncementIcon();
    await homeRobot.goToCreateOrder();
    await materialRootRobot.findAndCloseAnnouncementIcon();
    materialListRobot.verify();
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
    await addMaterialToCart(
      materialSearchText: materialLessMinSearchText,
      materialNumber: materialLessMinNumber,
    );
    materialListRobot.findCartButton();
    await materialListRobot.tapCartButton();
    cartRobot.verify();
    cartRobot.findMaterialItem(materialLessMinNumber, 1);
    cartRobot.findAddQuantity(materialLessMinNumber);
    cartRobot.verifyExpiryMaterial(materialLessMinNumber);
    cartRobot.verifyConcreteTotal(
      currency,
      (unitPriceLessMin * 1).toStringAsFixed(2),
    );
    cartRobot.findOrderSummary();
    await cartRobot.tapOrderSummary();
    await verifyOrderSummaryCustomerDetailsAndProceed();
    await verifyOrderSummarySoldToDetailsAndProceed();
    await verifyOrderSummaryShipToDetailsAndProceed();
    await fillOrderSummaryAdditionalDetailsAndProceed();
    orderSummaryRobot.allowMinimumOrderAmount('$currency $minOrderAmount');
    verifyPriceInOrderSummary(
      listPrice: listPriceLessMin.toStringAsFixed(2),
      unitPrice: unitPriceLessMin.toStringAsFixed(2),
      totalPrice: (unitPriceLessMin * 1).toStringAsFixed(2),
    );
    orderSummaryRobot.findMaterialItem(materialLessMinNumber, 1);
    verifyPriceInOrderSummary(
      listPrice: listPriceLessMin.toStringAsFixed(2),
      unitPrice: unitPriceLessMin.toStringAsFixed(2),
      totalPrice: (unitPriceLessMin * 1).toStringAsFixed(2),
    );
    orderSummaryRobot.findSubmit();
    await orderSummaryRobot.tapSubmit();
    //could not able to place an order as it does not cross
    //the minimum order amount
    orderSummaryRobot.verify();
    await orderSummaryRobot.goBack();
    await cartRobot.deleteMaterial(materialLessMinNumber);
    await cartRobot.goBack();
    //add normal material to cart
    await materialListRobot.clearSearchMaterial();
    await materialListRobot.goBack();
    //create order
    await homeRobot.goToCreateOrder();
    materialListRobot.verify();
    await addMaterialToCart(
      materialSearchText: materialSearchText,
      materialNumber: materialNumber,
    );
    await goToCartPage(fromWhere: Pages.materialList);
    await goToOrderSummary();
    //order history
    await gotoOrderHistory(
      withFilter: false,
    );
    await gotoOrderHistoryDetails();
    //re-order
    cartRobot.verify();
    cartRobot.findMaterialItem(materialNumber, quantity);
    await cartRobot.deleteMaterial(materialNumber);
    await cartRobot.goBack();
    await gotoOrderHistory(withFilter: true);

    orderHistoryDetailsRobot.findTopmenuReOrderButton();
    await orderHistoryDetailsRobot.tapTopMenuReOrderButton();

    cartRobot.verify();
    cartRobot.findMaterialItem(materialNumber, quantity);
    cartRobot.findRemarkButton(materialNumber);
    await cartRobot.addRemark(materialNumber, 'Good');
    cartRobot.findRemarkText('Good');
    await cartRobot.editRemark(materialNumber, 'Nice');
    await cartRobot.deleteRemark(materialNumber);

    cartRobot.findOrderSummary();
    await cartRobot.tapOrderSummary();
    await orderSummaryRobot.goBack();
    await tester.pumpAndSettle(const Duration(seconds: 3));
    await cartRobot.goBack();
    await tester.pumpAndSettle(const Duration(seconds: 3));
    await homeRobot.tapHomeTab();
    homeRobot.verify();
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await homeRobot.goToCreateOrder();
    materialListRobot.findCartButton();
    await materialListRobot.tapCartButton();
    cartRobot.verify();
    await goToOrderSummary();
    orderConfirmationRobot.findCreateNewOrderButton();
    await orderConfirmationRobot.tapCreateNewOrderButton();
    await materialListRobot.goBack();
    await homeRobot.goToCreateOrder();
    materialListRobot.verify();
    await materialListRobot.clearSearchMaterial();
    await materialListRobot.search(materialSearchText);
    materialListRobot.findFavoriteIcon(materialActualNumber);
    await materialListRobot.tapFavoriteIcon(materialActualNumber);
    await materialListRobot.goBack();
    homeRobot.verify();
    homeRobot.findFavoriteTab();
    await homeRobot.tapFavoriteTab();
    favoriteRobot.verify();
    favoriteRobot.findFavoriteItem();
    favoriteRobot.verifyMaterialNumber(materialActualNumber);
    onChangeQuantity(qty: 1);
    favoriteRobot.verifyUnitPrice('$currency $unitPrice');
    favoriteRobot.findFavoriteIcon(materialNumber);
    await favoriteRobot.tapFavoriteIcon(materialNumber);
    homeRobot.findAccountTab();
    await homeRobot.tapAccountTab();
    //account page
    accountSettingsRobot.verify();
    //check login on behalf
    accountSettingsRobot.findNoLoginOnBehalf();
    accountSettingsRobot.findUserFullName(clientUserFullName);
    accountSettingsRobot.findUserRole(clientUserRole);
  });
}
