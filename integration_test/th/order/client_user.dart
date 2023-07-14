import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../core/common.dart';
import '../../robots/account_settings_robot.dart';
import '../../robots/orders/cart_robot.dart';
import '../../robots/home/customer_search_robot.dart';
import '../../robots/favorite_robot.dart';
import '../../robots/home/home_robot.dart';
import '../../robots/login_robot.dart';
import '../../robots/orders/create_order/material_list/material_detail_robot.dart';
import '../../robots/orders/create_order/material_list/material_list_robot.dart';
import '../../robots/orders/create_order/material_root_robot.dart';
import '../../robots/orders/create_order/order_confirmation_robot.dart';
import '../../robots/history/order_history_details_robot.dart';
import '../../robots/history/order_history_robot.dart';
import '../../robots/orders/order_template/order_template_detail_robot.dart';
import '../../robots/orders/order_template/order_template_list_robot.dart';
import '../../robots/orders/saved_order/saved_order_detail_robot.dart';
import '../../robots/orders/saved_order/saved_order_list_robot.dart';
import '../../robots/home/ship_to_search_robot.dart';
import '../../robots/orders/create_order/order_summary_robot.dart';

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

  const thClientUserName = 'thclientuser';
  const thClientPassWord = 'St@ysafe01';
  const salesOrg = '2902';
  const bonusCustomerCode = '0000101502';
  const bonusShipToCode = '0071057789';
  const customerCode = '0000101476';
  const shipToCode = '0071057768';
  const templateName = 'tHClientTemplate';
  final materialWithoutPrice = MaterialNumber('000000000023343634');
  const minimumOrderAmount = 'THB 1,500';
  //country & country currency variable
  const currency = 'THB';
  const country = 'TH';
  const orderType = 'ZPOR';
  const contactPerson = 'TH ClientUser, User31';
  const postalCode = '10330';
  const userRole = 'Client User';
  const referenceNote = 'test Note';

  ////////Minimum Price Material////////////
  final minimumOrderMaterial = MaterialNumber('000000000023246949');
  const minimumOrderMaterialUnitPrice = '1,226.1';
  const minimumOrderMaterialListPrice = minimumOrderMaterialUnitPrice;
  const minimumOrderMaterialSubTotalPrice = '1,145.89';
  const minimumOrderMaterialTotalPrice = minimumOrderMaterialUnitPrice;
  const minimumOrderMaterialGrandTotalPrice =
      minimumOrderMaterialUnitPrice; //7% vat

  ///////Bonus Material/////////////////
  final bonusMaterial = MaterialNumber('000000000023246951');
  const bonusMaterialUnitPrice = '3,400.75';
  const bonusMaterialListPrice = '745.14';
  const bonusMaterialSubTotalPrice = bonusMaterialUnitPrice;
  const bonusMaterialGrandTotalPrice = bonusMaterialUnitPrice;
  const bonusMaterialTotalPrice = bonusMaterialUnitPrice;
  const bonusMaterialDiscountedPrice = '3,275';
  const bonusMaterialDiscountedTotalPrice = '32,750';

  /////////////Regular Material /////////////////////////////
  final regularMaterial = MaterialNumber('000000000023251182');
  const regularMaterialUnitPrice = '149,000';
  const regularMaterialListPrice = regularMaterialUnitPrice;
  const regularMaterialSubTotalPrice = regularMaterialUnitPrice;
  const regularMaterialGrandTotalPrice = regularMaterialUnitPrice;
  const regularMaterialTotalPrice = regularMaterialUnitPrice;

  const principleFullText = 'Becton Dickinson Holdings Pte Ltd';
  const principleSearchText = 'Bec';

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('E2E Client User (TH Market) - Order', (tester) async {
    //initialize necessary robots
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

    //init app
    await runAppForTesting(tester);
    await loginRobot.findAndCloseAnnouncementIcon();
    await loginRobot.login(thClientUserName, thClientPassWord);
    await homeRobot.findAndCloseAnnouncementIcon();
    homeRobot.findSalesOrgSelector();
    await homeRobot.tapSalesOrgSelector();
    await homeRobot.selectSalesOrg(salesOrg);
    homeRobot.findCustomerCodeSelector();
    await homeRobot.tapCustomerCodeSelector();
    customerSearchRobot.verify();
    await customerSearchRobot.search(bonusCustomerCode);
    await customerSearchRobot.tapCustomerCode(bonusCustomerCode);
    homeRobot.verify();
    homeRobot.findShipToSelector();
    await homeRobot.tapShipToSelector();
    shipToSearchRobot.verify();
    await shipToSearchRobot.search(bonusShipToCode);
    await shipToSearchRobot.tapShipToCode(shipToCode: bonusShipToCode);
    homeRobot.verify();
    await homeRobot.findAndCloseAnnouncementIcon();
    await homeRobot.goToCreateOrder();
    await materialRootRobot.findAndCloseAnnouncementIcon();
    materialListRobot.verify();
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
    materialRootRobot.findNoBundleTab();
    //block submitting order when less than min order amount
    await materialListRobot.search(minimumOrderMaterial.displayMatNo);
    materialListRobot.verifyCurrencyCheck(currency);
    materialListRobot.displayTotalTax(
      minimumOrderMaterial.getOrDefaultValue(''),
    );
    materialListRobot.verifyEnableListPrice(
      minimumOrderMaterial.getOrDefaultValue(''),
    );
    materialListRobot.verifyDefaultMaterialDescription(
      materialNumber: minimumOrderMaterial.getOrDefaultValue(''),
    );
    materialListRobot.findItemRegistrationNumber(
      minimumOrderMaterial.getOrDefaultValue(''),
    );
    await materialListRobot.tapMaterial(
      minimumOrderMaterial.getOrDefaultValue(''),
    );
    materialDetailRobot.verify();
    materialDetailRobot.findAddToCart();
    await materialDetailRobot.tapAddToCart();
    materialListRobot.verify();
    materialListRobot.findCartButton();
    await materialListRobot.tapCartButton();
    cartRobot.verifyEnableVatAtTotalLevel(
      bonusMaterial.getOrDefaultValue(''),
      7,
    );
    cartRobot.findMaterialItem(
      minimumOrderMaterial.getOrDefaultValue(''),
      1,
    );
    cartRobot.findOrderSummary();
    await cartRobot.tapOrderSummary();
    orderSummaryRobot.findContinueButton(0);
    await orderSummaryRobot.tapContinueButton(0);
    orderSummaryRobot.findContinueButton(1);
    await orderSummaryRobot.tapContinueButton(1);
    orderSummaryRobot.findContinueButton(2);
    await orderSummaryRobot.tapContinueButton(2);
    await orderSummaryRobot.scrollToContinueButton(3);
    orderSummaryRobot.findContinueButton(3);
    await orderSummaryRobot.tapContinueButton(3);
    //Minimum Order Amount
    orderSummaryRobot.allowMinimumOrderAmount(minimumOrderAmount);
    //verify orders with currency check
    orderSummaryRobot.verifySubTotalPrice(
      currency,
      minimumOrderMaterialSubTotalPrice,
    );
    orderSummaryRobot.verifyGrandTotalPrice(
      currency,
      minimumOrderMaterialGrandTotalPrice,
    );
    orderSummaryRobot.findMaterialItem(
        minimumOrderMaterial.getOrDefaultValue(''), 1);
    orderSummaryRobot.verifyMaterialListPrice(
      true,
      currency,
      minimumOrderMaterialListPrice,
    );
    orderSummaryRobot.verifyMaterialUnitPrice(
      true,
      currency,
      minimumOrderMaterialUnitPrice,
    );
    orderSummaryRobot.verifyMaterialTotalPrice(
      true,
      currency,
      minimumOrderMaterialTotalPrice,
    );
    orderSummaryRobot.findSave();
    orderSummaryRobot.findSubmit();
    await orderSummaryRobot.tapSubmit();
    orderSummaryRobot.verify();
    await orderSummaryRobot.goBack();
    cartRobot.verify();
    await cartRobot.deleteMaterial(minimumOrderMaterial.getOrDefaultValue(''));
    await cartRobot.goBack();
    materialListRobot.verify();
    await materialListRobot.clearSearchMaterial();
    await materialListRobot.search(materialWithoutPrice.displayMatNo);
    await materialListRobot
        .tapMaterial(materialWithoutPrice.getOrDefaultValue(''));
    materialDetailRobot.verify();
    materialDetailRobot.findAddToCart();
    await materialDetailRobot.tapAddToCart();
    materialDetailRobot.verify();
    await materialListRobot.goBack();
    materialListRobot.verify();
    materialListRobot.findCartButton();
    await materialListRobot.tapCartButton();
    cartRobot.verify();
    cartRobot.notFindMaterialItem(
      materialWithoutPrice.getOrDefaultValue(''),
      1,
    );
    await cartRobot.goBack();
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await materialListRobot.clearSearchMaterial();
    await materialListRobot.search(
      bonusMaterial.getOrDefaultValue(''),
    );
    materialListRobot.verifyCurrencyCheck(currency);
    materialListRobot.verifyEnableListPrice(
      bonusMaterial.getOrDefaultValue(''),
    );
    materialListRobot.verifyDefaultMaterialDescription(
      materialNumber: bonusMaterial.getOrDefaultValue(''),
    );
    materialListRobot.findItemRegistrationNumber(
      bonusMaterial.getOrDefaultValue(''),
    );
    await materialListRobot.tapMaterial(
      bonusMaterial.getOrDefaultValue(''),
    );
    materialDetailRobot.verify();
    materialDetailRobot.verifyBonusesMaterial();
    materialDetailRobot.verifyTieredPricingMaterial();
    materialDetailRobot.findAddToCart();
    await materialDetailRobot.tapAddToCart();
    materialListRobot.verify();

    materialListRobot.findCartButton();
    await materialListRobot.tapCartButton();
    cartRobot.verify();
    cartRobot.verifyEnableVatAtTotalLevel(
      bonusMaterial.getOrDefaultValue(''),
      7,
    );
    cartRobot.findMaterialItem(
      bonusMaterial.getOrDefaultValue(''),
      1,
    );
    cartRobot.findAddQuantity(
      bonusMaterial.getOrDefaultValue(''),
    );
    //Add remark (Enable Material Remarks)
    cartRobot.findRemarkButton(
      bonusMaterial.getOrDefaultValue(''),
    );
    await cartRobot.addRemark(bonusMaterial.getOrDefaultValue(''), 'ezrx');
    cartRobot.findRemarkText('ezrx');
    await cartRobot.editRemark(bonusMaterial.getOrDefaultValue(''), 'ezrxv2');
    await cartRobot.deleteRemark(
      bonusMaterial.getOrDefaultValue(''),
    );
    cartRobot.verifyEnableVatAtTotalLevel(
      bonusMaterial.getOrDefaultValue(''),
      7,
    );
    cartRobot.findOrderSummary();
    await cartRobot.tapOrderSummary();
    //order summary page
    orderSummaryRobot.findContinueButton(0);
    await orderSummaryRobot.tapContinueButton(0);
    orderSummaryRobot.findContinueButton(1);
    await orderSummaryRobot.tapContinueButton(1);
    orderSummaryRobot.findContinueButton(2);
    await orderSummaryRobot.tapContinueButton(2);
    await orderSummaryRobot.scrollToContinueButton(3);
    orderSummaryRobot.findContinueButton(3);
    await orderSummaryRobot.tapContinueButton(3);
    //Minimum Order Amount
    orderSummaryRobot.allowMinimumOrderAmount(minimumOrderAmount);
    //verify orders with currency check
    orderSummaryRobot.verifySubTotalPrice(
      currency,
      bonusMaterialSubTotalPrice,
    );
    orderSummaryRobot.verifyGrandTotalPrice(
      currency,
      bonusMaterialGrandTotalPrice,
    );
    orderSummaryRobot.findMaterialItem(bonusMaterial.getOrDefaultValue(''), 1);
    orderSummaryRobot.verifyMaterialListPrice(
      true,
      currency,
      bonusMaterialListPrice,
    );
    orderSummaryRobot.verifyMaterialUnitPrice(
      true,
      currency,
      bonusMaterialUnitPrice,
    );
    orderSummaryRobot.verifyMaterialTotalPrice(
      true,
      currency,
      bonusMaterialTotalPrice,
    );
    await orderSummaryRobot.goBack();
    cartRobot.findMaterialItem(
      bonusMaterial.getOrDefaultValue(''),
      1,
    );
    cartRobot.findAddQuantity(
      bonusMaterial.getOrDefaultValue(''),
    );
    await cartRobot.tapMaterial(
      bonusMaterial.displayMatNo,
    );
    await materialDetailRobot.changeQuantity(10);
    await materialDetailRobot.tapUpdateAddToCart();
    cartRobot.verify();
    //verify bonus override material
    cartRobot.verifyBonusMaterial(
      bonusMaterial.getOrDefaultValue(''),
      false,
      1,
    );
    cartRobot.findOrderSummary();
    await cartRobot.tapOrderSummary();
    //order summary page
    orderSummaryRobot.verifySoldToID(bonusCustomerCode);
    orderSummaryRobot.findContinueButton(0);
    await orderSummaryRobot.tapContinueButton(0);
    orderSummaryRobot.verifyCountry(country);
    orderSummaryRobot.verifyPostalCode(postalCode);
    orderSummaryRobot.findContinueButton(1);
    await orderSummaryRobot.tapContinueButton(1);
    orderSummaryRobot.verifyShipToID(bonusShipToCode);
    orderSummaryRobot.verifyCountry(country);
    orderSummaryRobot.verifyPostalCode(postalCode);
    orderSummaryRobot.findContinueButton(2);
    await orderSummaryRobot.tapContinueButton(2);
    orderSummaryRobot.findReferenceNote();
    await orderSummaryRobot.enterReferenceNote(referenceNote);
    orderSummaryRobot.findSpecialInstruction();
    await orderSummaryRobot.enterSpecialInstruction('special');
    await orderSummaryRobot.getKeyboardDown();
    orderSummaryRobot.findPoAttachmentUpload();
    await orderSummaryRobot.scrollToContinueButton(3);
    orderSummaryRobot.findContinueButton(3);
    await orderSummaryRobot.tapContinueButton(3);
    //Minimum Order Amount
    orderSummaryRobot.allowMinimumOrderAmount(minimumOrderAmount);
    orderSummaryRobot.findMaterialItem(
      bonusMaterial.getOrDefaultValue(''),
      10,
    );
    orderSummaryRobot.verifyMaterialListPrice(
      true,
      currency,
      bonusMaterialListPrice,
    );
    orderSummaryRobot.verifyMaterialUnitPrice(
      true,
      currency,
      bonusMaterialDiscountedPrice,
    );
    orderSummaryRobot.verifyMaterialTotalPrice(
      true,
      currency,
      bonusMaterialDiscountedTotalPrice,
    );
    orderSummaryRobot.findSave();
    orderSummaryRobot.findSubmit();
    await orderSummaryRobot.tapSubmit();
    orderConfirmationRobot.verify();
    orderConfirmationRobot.findTitle();
    orderConfirmationRobot.findDescription();
    orderConfirmationRobot.findCreateNewOrderButton();
    orderConfirmationRobot.findGoToOrderHistoryButton();
    await orderConfirmationRobot.tapGoToOrderHistoryButton();
    orderHistoryRobot.verify();
    await orderHistoryRobot.tapOrderedItem();
    // order history details
    orderHistoryDetailsRobot.verify();
    orderHistoryDetailsRobot.verifyPaymentTermIsDisabled();
    orderHistoryDetailsRobot.findOrderDetails();
    orderHistoryDetailsRobot.verifyOrderType(orderType);
    orderHistoryDetailsRobot.findTotalTax();
    orderHistoryDetailsRobot.verifyContactPerson(contactPerson);
    orderHistoryDetailsRobot.findReferenceNoteText(referenceNote);
    await orderHistoryDetailsRobot.tapOrderDetails();
    orderHistoryDetailsRobot.findSoldToAddress();
    orderHistoryDetailsRobot.verifySoldToID(bonusCustomerCode);
    orderHistoryDetailsRobot.verifyCountry(country);
    orderHistoryDetailsRobot.verifyPostalCode(postalCode);
    await orderHistoryDetailsRobot.tapSoldToAddress();
    orderHistoryDetailsRobot.findShipToAddress();
    orderHistoryDetailsRobot.verifyShipToID(bonusShipToCode);
    orderHistoryDetailsRobot.verifyPostalCode(postalCode);
    await orderHistoryDetailsRobot.tapShipToAddress();
    orderHistoryDetailsRobot.findInvoices();
    orderHistoryDetailsRobot.findOrderSummary();
    orderHistoryDetailsRobot.verifyMaterialType('Comm');
    orderHistoryDetailsRobot.verifyMaterialID(
      bonusMaterial.displayMatNo,
    );
    orderHistoryDetailsRobot.verifyQuantity('10');
    //Enable Order History Price in history detail page
    orderHistoryDetailsRobot.verifyEnableZPPrice(
      bonusMaterial.getOrDefaultValue(''),
    );
    orderHistoryDetailsRobot.verifyEnableTotalPrice(
      bonusMaterial.getOrDefaultValue(''),
    );
    orderHistoryDetailsRobot.verifyEnableTaxDisplay();
    await orderHistoryDetailsRobot.tapOrderSummary();
    orderHistoryDetailsRobot.findReOrderButton();
    await orderHistoryDetailsRobot.tapReOrderButton();
    cartRobot.verify();
    cartRobot.findMaterialItem(
      bonusMaterial.getOrDefaultValue(''),
      10,
    );
    await cartRobot.deleteMaterial(
      bonusMaterial.getOrDefaultValue(''),
    );
    await cartRobot.goBack();
    await homeRobot.tapHomeTab();
    homeRobot.verify();
    homeRobot.findCustomerCodeSelector();
    await homeRobot.tapCustomerCodeSelector();
    customerSearchRobot.verify();
    await customerSearchRobot.search(customerCode);
    await customerSearchRobot.tapCustomerCode(customerCode);
    homeRobot.findShipToSelector();
    await homeRobot.tapShipToSelector();
    shipToSearchRobot.verify();
    await shipToSearchRobot.search(shipToCode);
    await shipToSearchRobot.tapShipToCode(shipToCode: shipToCode);
    homeRobot.verify();
    //save order
    await homeRobot.goToCreateOrder();
    materialListRobot.verify();
    await materialListRobot.clearSearchMaterial();
    await materialListRobot.search(regularMaterial.getOrDefaultValue(''));
    //display price before vat
    materialListRobot
        .displayPriceBeforeVat(regularMaterial.getOrDefaultValue(''));
    await materialListRobot.tapMaterial(regularMaterial.getOrDefaultValue(''));
    materialDetailRobot.verify();
    materialDetailRobot.findAddToCart();
    await materialDetailRobot.tapAddToCart();
    materialListRobot.verify();
    materialListRobot.findCartButton();
    await materialListRobot.tapCartButton();
    cartRobot.verify();
    cartRobot.findMaterialItem(regularMaterial.getOrDefaultValue(''), 1);
    cartRobot.findOrderSummary();
    await cartRobot.tapOrderSummary();
    orderSummaryRobot.findContinueButton(0);
    await orderSummaryRobot.tapContinueButton(0);
    orderSummaryRobot.findContinueButton(1);
    await orderSummaryRobot.tapContinueButton(1);
    orderSummaryRobot.findContinueButton(2);
    await orderSummaryRobot.tapContinueButton(2);
    await orderSummaryRobot.scrollToContinueButton(3);
    orderSummaryRobot.findContinueButton(3);
    await orderSummaryRobot.tapContinueButton(3);
    orderSummaryRobot.allowMinimumOrderAmount(minimumOrderAmount);
    orderSummaryRobot.findMaterialItem(
      regularMaterial.getOrDefaultValue(''),
      1,
    );
    orderSummaryRobot.verifyMaterialListPrice(
      true,
      currency,
      regularMaterialListPrice,
    );
    orderSummaryRobot.verifyMaterialUnitPrice(
      true,
      currency,
      regularMaterialUnitPrice,
    );
    orderSummaryRobot.verifyMaterialTotalPrice(
      true,
      currency,
      regularMaterialTotalPrice,
    );
    orderSummaryRobot.verifySubTotalPrice(
      currency,
      regularMaterialSubTotalPrice,
    );
    orderSummaryRobot.verifyGrandTotalPrice(
      currency,
      regularMaterialGrandTotalPrice,
    );
    orderSummaryRobot.findSave();
    await orderSummaryRobot.tapSave();
    savedOrderListRobot.verify();
    savedOrderListRobot.findOrder();
    savedOrderListRobot.verifySoldToID(customerCode);
    savedOrderListRobot.verifyShipToID(shipToCode);
    await savedOrderListRobot.tapOrder();
    savedOrderDetailRobot.verify();
    savedOrderDetailRobot.verifyMaterialNumber(regularMaterial.displayMatNo);
    savedOrderDetailRobot.verifyMaterialQuantity('1');
    savedOrderDetailRobot.findAddToCart();
    await savedOrderDetailRobot.tapAddToCart();
    cartRobot.verify();
    cartRobot.findOrderSummary();
    await cartRobot.tapOrderSummary();
    orderSummaryRobot.findContinueButton(0);
    await orderSummaryRobot.tapContinueButton(0);
    orderSummaryRobot.findContinueButton(1);
    await orderSummaryRobot.tapContinueButton(1);
    orderSummaryRobot.findContinueButton(2);
    await orderSummaryRobot.tapContinueButton(2);
    await orderSummaryRobot.scrollToContinueButton(3);
    orderSummaryRobot.findContinueButton(3);
    await orderSummaryRobot.tapContinueButton(3);
    orderSummaryRobot.findSubmit();
    await orderSummaryRobot.tapSubmit();
    orderConfirmationRobot.verify();
    orderConfirmationRobot.findGoToOrderHistoryButton();
    await orderConfirmationRobot.tapGoToOrderHistoryButton();
    orderHistoryRobot.verify();
    //Favorite Check
    homeRobot.findHomeTab();
    await homeRobot.tapHomeTab();
    await homeRobot.goToCreateOrder();
    await materialListRobot.clearSearchMaterial();
    await materialListRobot.search(regularMaterial.getOrDefaultValue(''));
    materialListRobot.findFavoriteIcon(regularMaterial.displayMatNo);
    await materialListRobot.tapFavoriteIcon(
      regularMaterial.displayMatNo,
    );
    await materialListRobot.goBack();
    homeRobot.verify();
    homeRobot.findFavoriteTab();
    await homeRobot.tapFavoriteTab();
    favoriteRobot.verify();
    favoriteRobot.findFavoriteItem();
    favoriteRobot.verifyMaterialNumber(regularMaterial.displayMatNo);
    favoriteRobot.findFavoriteIcon(regularMaterial.getOrDefaultValue(''));
    await favoriteRobot.tapFavoriteIcon(regularMaterial.getOrDefaultValue(''));
    homeRobot.findAccountTab();
    await homeRobot.tapAccountTab();
    accountSettingsRobot.findNoLoginOnBehalf();
    homeRobot.findHomeTab();
    await homeRobot.tapHomeTab();
    await homeRobot.goToCreateOrder();
    materialListRobot.verify();
    await materialListRobot.clearSearchMaterial();
    await materialListRobot.search(regularMaterial.getOrDefaultValue(''));
    await materialListRobot.tapMaterial(regularMaterial.getOrDefaultValue(''));
    materialDetailRobot.verify();
    materialDetailRobot.findAddToCart();
    await materialDetailRobot.tapAddToCart();
    materialListRobot.verify();
    materialListRobot.findCartButton();
    await materialListRobot.tapCartButton();
    cartRobot.verify();
    cartRobot.findMaterialItem(regularMaterial.getOrDefaultValue(''), 1);
    cartRobot.findOrderSummary();
    await cartRobot.tapOrderSummary();
    orderSummaryRobot.findOrderTemplate();
    await orderSummaryRobot.tapOrderTemplate();
    orderSummaryRobot.findOrderTemplate();
    await orderSummaryRobot.enterTemplateName(templateName);
    orderSummaryRobot.findTemplateSaveButton();
    await orderSummaryRobot.tapTemplateSaveButton();
    await orderSummaryRobot.goBack();
    await cartRobot.goBack();
    await materialListRobot.goBack();
    homeRobot.findOrderTemplate();
    await homeRobot.tapOrderTemplate();
    orderTemplateListRobot.findTemplateItem(templateName);
    await orderTemplateListRobot.tapTemplateItem(templateName);
    orderTemplateDetailRobot.verifyMaterialNumber(regularMaterial.displayMatNo);
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
    await orderSummaryRobot.scrollToContinueButton(3);
    orderSummaryRobot.findContinueButton(3);
    await orderSummaryRobot.tapContinueButton(3);
    orderSummaryRobot.allowMinimumOrderAmount(minimumOrderAmount);
    orderSummaryRobot.findMaterialItem(
      regularMaterial.getOrDefaultValue(''),
      1,
    );
    orderSummaryRobot.verifyMaterialListPrice(
      true,
      currency,
      regularMaterialListPrice,
    );
    orderSummaryRobot.verifyMaterialUnitPrice(
      true,
      currency,
      regularMaterialUnitPrice,
    );
    orderSummaryRobot.verifyMaterialTotalPrice(
      true,
      currency,
      regularMaterialTotalPrice,
    );
    orderSummaryRobot.findSubmit();
    await orderSummaryRobot.tapSubmit();
    orderConfirmationRobot.verify();
    orderConfirmationRobot.findGoToOrderHistoryButton();
    await orderConfirmationRobot.tapGoToOrderHistoryButton();
    orderHistoryRobot.verify();
    homeRobot.findHomeTab();
    await homeRobot.tapHomeTab();
    homeRobot.findOrderTemplate();
    await homeRobot.tapOrderTemplate();
    //find and delete template order
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
    accountSettingsRobot.verify();
    //check login on behalf
    accountSettingsRobot.findNoLoginOnBehalf();
    accountSettingsRobot
        .findUserFullName('$country ${userRole.replaceAll(' ', '')}');
    accountSettingsRobot.findUserRole(userRole);
  });
}
