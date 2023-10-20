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
  late FavoriteRobot favoriteRobot;
  late MaterialRootRobot materialRootRobot;

  final zporMaterial = MaterialNumber('000000000023269154');
  final zpfcMaterial = MaterialNumber('000000000023269226');

  const salesOrg = '2902';
  const customerCode = '0000101502';
  const shipToCode = '0071057789';
  const orderTypeZPOR = 'ZPOR';
  const orderTypeZPFC = 'ZPFC';
  const orderTypeZPFB = 'ZPFB';
  const postalCode = '10330';
  const minimumOrderAmount = 'THB 1,500';
  const user = 'ExternalSR';
  const discount = 10.0;
  const referenceNote = 'test Note';

  //country & country currency variable
  const currency = 'THB';
  const country = 'TH';
  const thClientUserName = 'thexternalsalesrep';
  const thClientPassWord = 'St@ysafe01';
  final materialWithoutPrice = MaterialNumber('000000000023342316');
  const userRole = 'External Sales Rep';

  ////////Minimum Price Material////////////
  final minimumOrderMaterial = MaterialNumber('000000000023236010');
  const minimumOrderMaterialListPrice = '1,177';
  const minimumOrderMaterialSubTotalPrice = '1,177';
  const minimumOrderMaterialTotalPrice = '1,259.39'; //7% vat
  const minimumOrderMaterialGrandTotalPrice = minimumOrderMaterialTotalPrice;
  const minimumOrderMaterialUnitPrice = minimumOrderMaterialTotalPrice;

  /////// Bonus Material/////////////////
  final bonusMaterial = MaterialNumber('000000000023246951');
  const bonusMaterialDiscountedPrice = '3,275';
  const bonusMaterialUnitPrice = '3,400.75';
  const bonusMaterialSubTotalPrice = bonusMaterialUnitPrice;
  const bonusMaterialGrandTotalPrice = bonusMaterialUnitPrice;
  const bonusMaterialTotalPrice = '32,750';

  /////////////Regular Material /////////////////////////////
  final regularMaterial = MaterialNumber('000000000023269154');
  const regularMaterialListPrice = '17,058.01';
  const regularMaterialUnitPrice = regularMaterialListPrice;
  const regularMaterialSubTotalPrice = '15,942.07';
  const regularMaterialGrandTotalPrice = regularMaterialListPrice;
  const regularMaterialTotalPrice = regularMaterialListPrice;
  const regularMaterialDiscountOverridePrice =
      '15,352.21'; // 10 % discount override price

  const principleFullText = 'Stryker (Thailand) Ltd.';
  const principleSearchText = 'Str';

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('E2E External Sales Rep User (TH Market) - Order',
      (tester) async {
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
    favoriteRobot = FavoriteRobot(tester);
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
    await customerSearchRobot.tapCustomerCode(customerCode);
    homeRobot.verify();
    homeRobot.findShipToSelector();
    await homeRobot.tapShipToSelector();
    shipToSearchRobot.verify();
    await shipToSearchRobot.tapShipToCode(shipToCode: shipToCode);
    homeRobot.verify();
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
    cartRobot.verify();
    cartRobot.verifyEnableVatAtTotalLevel(
      minimumOrderMaterial.getOrDefaultValue(''),
      7,
    );
    cartRobot.findMaterialItem(
      minimumOrderMaterial.getOrDefaultValue(''),
      1,
    );
    cartRobot.verifyEnablePriceOverride(minimumOrderMaterial.getOrCrash());
    await cartRobot.tapPrice(minimumOrderMaterial.getOrCrash());
    await cartRobot.changePrice(80);
    await cartRobot.tapPriceOverrideButton();
    cartRobot.verifyUnitPrice(currency, '85.6');
    await cartRobot.tapPrice(minimumOrderMaterial.getOrCrash());
    await cartRobot.changePrice(1177);
    await cartRobot.tapPriceOverrideButton();
    cartRobot.verifyUnitPrice(currency, minimumOrderMaterialTotalPrice);
    ////Price - overriden///
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
      minimumOrderMaterial.getOrDefaultValue(''),
      1,
    );
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
    await materialListRobot.clearSearchMaterial();
    await materialListRobot.search(
      bonusMaterial.getOrDefaultValue(''),
    );
    materialListRobot.verifyCurrencyCheck(currency);
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
    //Add remark (Enable Material Remarks)
    cartRobot.findRemarkButton(
      bonusMaterial.getOrDefaultValue(''),
    );
    await cartRobot.addRemark(
      bonusMaterial.getOrDefaultValue(''),
      'ezrx',
    );
    cartRobot.findRemarkText('ezrx');
    await cartRobot.editRemark(
      bonusMaterial.getOrDefaultValue(''),
      'ezrxv2',
    );
    await cartRobot.deleteRemark(
      bonusMaterial.getOrDefaultValue(''),
    );
    cartRobot.findMaterialItem(
      bonusMaterial.getOrDefaultValue(''),
      1,
    );
    cartRobot.verifyEnableVatAtTotalLevel(
      bonusMaterial.getOrDefaultValue(''),
      7,
    );
    cartRobot.findOrderSummary();
    await cartRobot.tapOrderSummary();
    //order summary page
    orderSummaryRobot.verifySoldToID(customerCode);
    orderSummaryRobot.verifyShipToID(shipToCode);
    orderSummaryRobot.findContinueButton(0);
    await orderSummaryRobot.tapContinueButton(0);
    orderSummaryRobot.verifyCountry(country);
    orderSummaryRobot.verifyPostalCode(postalCode);
    orderSummaryRobot.findContinueButton(1);
    await orderSummaryRobot.tapContinueButton(1);
    orderSummaryRobot.verifyShipToID(shipToCode);
    orderSummaryRobot.verifyCountry(country);
    orderSummaryRobot.verifyPostalCode(postalCode);
    orderSummaryRobot.findReferenceNote();
    await orderSummaryRobot.enterReferenceNote(referenceNote);
    orderSummaryRobot.findSpecialInstruction();
    orderSummaryRobot.findPoAttachmentUpload();
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
    orderSummaryRobot.verifyMaterialUnitPrice(
      true,
      currency,
      bonusMaterialUnitPrice,
    );
    orderSummaryRobot.verifyMaterialTotalPrice(
      true,
      currency,
      bonusMaterialUnitPrice,
    );
    orderSummaryRobot.findSubmit();
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
    //verify bonus override material
    cartRobot.verifyBonusMaterial(
      bonusMaterial.getOrDefaultValue(''),
      false,
      1,
    );
    cartRobot.findOrderSummary();
    await cartRobot.tapOrderSummary();
    orderSummaryRobot.verifySoldToID(customerCode);
    orderSummaryRobot.findContinueButton(0);
    await orderSummaryRobot.tapContinueButton(0);
    orderSummaryRobot.findContinueButton(1);
    orderSummaryRobot.verifyPostalCode(postalCode);
    await orderSummaryRobot.tapContinueButton(1);
    orderSummaryRobot.findContinueButton(2);
    await orderSummaryRobot.tapContinueButton(2);
    orderSummaryRobot.findReferenceNote();
    await orderSummaryRobot.enterReferenceNote(referenceNote);
    //Enable Special Instructions
    orderSummaryRobot.findSpecialInstruction();
    await orderSummaryRobot.enterSpecialInstruction('special');
    await orderSummaryRobot.getKeyboardDown();
    orderSummaryRobot.findPoAttachmentUpload();
    await orderSummaryRobot.scrollToContinueButton(3);
    orderSummaryRobot.findContinueButton(3);
    await orderSummaryRobot.tapContinueButton(3);
    orderSummaryRobot.allowMinimumOrderAmount(minimumOrderAmount);
    orderSummaryRobot.verifyMaterialUnitPrice(
      true,
      currency,
      bonusMaterialDiscountedPrice,
    );
    orderSummaryRobot.verifyMaterialTotalPrice(
      true,
      currency,
      bonusMaterialTotalPrice,
    );
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
    orderHistoryDetailsRobot.verify();
    orderHistoryDetailsRobot.findOrderDetails();
    orderHistoryDetailsRobot.verifyQuantity('10');
    //Enable Order History Price in history detail page
    orderHistoryDetailsRobot.verifyEnableZPPrice(
      bonusMaterial.getOrDefaultValue(''),
    );
    orderHistoryDetailsRobot.verifyEnableTotalPrice(
      bonusMaterial.getOrDefaultValue(''),
    );
    orderHistoryDetailsRobot.findTotalTax();
    orderHistoryDetailsRobot.findReferenceNoteText(referenceNote);
    await orderHistoryDetailsRobot.tapOrderDetails();
    orderHistoryDetailsRobot.findSoldToAddress();
    orderHistoryDetailsRobot.verifySoldToID(customerCode);
    orderHistoryDetailsRobot.verifyCountry(country);
    orderHistoryDetailsRobot.verifyPostalCode(postalCode);
    await orderHistoryDetailsRobot.tapSoldToAddress();
    orderHistoryDetailsRobot.findShipToAddress();
    orderHistoryDetailsRobot.verifyShipToID(shipToCode);
    orderHistoryDetailsRobot.verifyPostalCode(postalCode);
    await orderHistoryDetailsRobot.tapShipToAddress();
    orderHistoryDetailsRobot.findInvoices();
    orderHistoryDetailsRobot.findOrderSummary();
    orderHistoryDetailsRobot.verifyMaterialID(
      bonusMaterial.displayMatNo,
    );
    orderHistoryDetailsRobot.verifyEnableTaxDisplay();
    await orderHistoryDetailsRobot.tapOrderSummary();
    orderHistoryDetailsRobot.findBackButton();
    await orderHistoryDetailsRobot.tapBackButton();
    orderHistoryRobot.verify();
    await homeRobot.tapHomeTab();
    homeRobot.verify();
    await homeRobot.goToCreateOrder();
    materialListRobot.verify();
    await materialListRobot.clearSearchMaterial();
    await materialListRobot.search(
      zpfcMaterial.getOrDefaultValue(''),
    );
    //display price before vat
    materialListRobot.displayPriceBeforeVat(zpfcMaterial.getOrDefaultValue(''));
    await materialListRobot.tapMaterial(
      zpfcMaterial.getOrDefaultValue(''),
    );
    materialDetailRobot.verify();
    materialDetailRobot.findAddToCart();
    await materialDetailRobot.tapAddToCart();
    materialListRobot.verify();
    materialListRobot.findCartButton();
    await materialListRobot.tapCartButton();
    cartRobot.verify();
    cartRobot.findMaterialItem(zpfcMaterial.getOrDefaultValue(''), 1);
    await cartRobot.goBack();
    // Order Type check

    materialListRobot.verifyOrderTypeSelector();
    materialListRobot.verify();
    await materialListRobot.tapOrderTypeSelector();
    materialListRobot.findOrderDocumentTypeSectorDialog();
    await materialListRobot.tapOrderType(orderTypeZPFC);
    await materialListRobot.tapOrderTypeSelector();
    materialListRobot.findOrderDocumentTypeSectorDialog();
    await materialListRobot.tapOrderType(orderTypeZPOR);
    materialListRobot.findCartClearDialog();
    materialListRobot.findOrderTypeChangeDialogCancel();
    await materialListRobot.cancelClearCart();
    await materialListRobot.goBack();
    materialListRobot.findCartButton();
    await materialListRobot.tapCartButton();
    cartRobot.findMaterialItem(zpfcMaterial.getOrDefaultValue(''), 1);
    await cartRobot.tapOrderSummary();
    //order summary page
    orderSummaryRobot.verifySoldToID(customerCode);
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
    orderConfirmationRobot.findTitle();
    orderConfirmationRobot.findDescription();
    orderConfirmationRobot.findCreateNewOrderButton();
    orderConfirmationRobot.findGoToOrderHistoryButton();
    await orderConfirmationRobot.tapGoToOrderHistoryButton();
    orderHistoryRobot.verify();
    orderHistoryRobot.findOrderHistoryFilter();
    await orderHistoryRobot.findOrderHistoryFilterByMaterialNumber(
      zpfcMaterial.getOrDefaultValue(''),
    );
    await orderHistoryRobot.tapOrderHistoryFilterApplyButton();
    orderHistoryRobot.findOrderItemByMaterialNumber(
      zpfcMaterial.getOrDefaultValue(''),
    );
    orderHistoryRobot.findOrderedItem();
    orderHistoryRobot.verifyOrderType(orderTypeZPFC);
    orderHistoryRobot.verifyMaterialID(
      zpfcMaterial.displayMatNo,
    );
    await orderHistoryRobot.tapOrderedItem();
    orderHistoryDetailsRobot.verify();
    orderHistoryDetailsRobot.findOrderDetails();
    orderHistoryDetailsRobot.findTotalTax();
    await orderHistoryDetailsRobot.tapOrderDetails();
    orderHistoryDetailsRobot.findSoldToAddress();
    orderHistoryDetailsRobot.verifySoldToID(customerCode);
    orderHistoryDetailsRobot.verifyPostalCode(postalCode);
    await orderHistoryDetailsRobot.tapSoldToAddress();
    orderHistoryDetailsRobot.findShipToAddress();
    orderHistoryDetailsRobot.verifyShipToID(shipToCode);
    orderHistoryDetailsRobot.verifyPostalCode(postalCode);
    await orderHistoryDetailsRobot.tapShipToAddress();
    orderHistoryDetailsRobot.findInvoices();
    orderHistoryDetailsRobot.findOrderSummary();
    orderHistoryDetailsRobot.verifyMaterialID(
      zpfcMaterial.displayMatNo,
    );
    await orderHistoryDetailsRobot.tapOrderSummary();
    //re-order
    await orderHistoryDetailsRobot.tapOrderSummary();
    orderHistoryDetailsRobot.findReOrderButton();
    await orderHistoryDetailsRobot.tapReOrderButton();
    cartRobot.verify();
    cartRobot.findMaterialItem(zpfcMaterial.getOrDefaultValue(''), 1);
    await cartRobot.deleteMaterial(zpfcMaterial.getOrDefaultValue(''));
    await cartRobot.goBack();
    orderHistoryRobot.verify();
    await homeRobot.tapHomeTab();
    homeRobot.verify();
    await homeRobot.goToCreateOrder();
    materialListRobot.verify();
    materialListRobot.verify();
    await materialListRobot.tapOrderTypeSelector();
    materialListRobot.findOrderDocumentTypeSectorDialog();
    await materialListRobot.tapOrderType(orderTypeZPOR);
    await materialListRobot.clearSearchMaterial();
    await materialListRobot.search(zporMaterial.displayMatNo);
    await materialListRobot.tapMaterial(
      zporMaterial.getOrDefaultValue(''),
    );
    materialDetailRobot.verify();
    materialDetailRobot.findAddToCart();
    await materialDetailRobot.tapAddToCart();
    materialListRobot.verify();
    materialListRobot.findCartButton();
    await materialListRobot.tapCartButton();
    cartRobot.verify();
    cartRobot.findMaterialItem(
      zporMaterial.getOrDefaultValue(''),
      1,
    );
    await cartRobot.goBack();
    materialListRobot.verify();
    await materialListRobot.tapOrderTypeSelector();
    materialListRobot.findOrderDocumentTypeSectorDialog();
    await materialListRobot.tapOrderType(orderTypeZPFB);
    materialListRobot.findOrderTypeDialogChange();
    materialListRobot.findCartClearDialog();
    await materialListRobot.clearCart();
    await materialListRobot.tapCartButton();
    cartRobot.verify();
    cartRobot.notFindMaterialItem(
      zporMaterial.getOrDefaultValue(''),
      1,
    );
    await cartRobot.goBack();
    materialListRobot.verify();
    await materialListRobot.tapOrderTypeSelector();
    materialListRobot.findOrderDocumentTypeSectorDialog();
    materialListRobot.findOrderDocumentType(orderTypeZPOR);
    await materialListRobot.tapOrderType(orderTypeZPOR);
    await materialListRobot.search(regularMaterial.displayMatNo);
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
    orderSummaryRobot.verifySubTotalPrice(
      currency,
      regularMaterialSubTotalPrice,
    );
    orderSummaryRobot.verifyGrandTotalPrice(
      currency,
      regularMaterialGrandTotalPrice,
    );
    orderSummaryRobot.verifyMaterialTotalPrice(
      true,
      currency,
      regularMaterialTotalPrice,
    );
    cartRobot.findMaterialItem(
      regularMaterial.getOrDefaultValue(''),
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
    orderSummaryRobot.findSubmit();
    await orderSummaryRobot.tapSubmit();

    orderConfirmationRobot.verify();
    orderConfirmationRobot.findGoToOrderHistoryButton();
    await orderConfirmationRobot.tapGoToOrderHistoryButton();
    orderHistoryRobot.verify();
    homeRobot.findHomeTab();
    //Favorite Check
    await homeRobot.tapHomeTab();
    await homeRobot.goToCreateOrder();
    await materialListRobot.clearSearchMaterial();
    await materialListRobot.search(regularMaterial.getOrDefaultValue(''));
    materialListRobot.findFavoriteIcon(regularMaterial.displayMatNo);
    await materialListRobot.tapFavoriteIcon(regularMaterial.displayMatNo);
    await materialListRobot.goBack();
    homeRobot.verify();
    homeRobot.findFavoriteTab();
    await homeRobot.tapFavoriteTab();
    favoriteRobot.verify();
    favoriteRobot.findFavoriteItem();
    favoriteRobot.verifyMaterialNumber(regularMaterial.displayMatNo);
    favoriteRobot.findFavoriteIcon(regularMaterial.getOrDefaultValue(''));
    await favoriteRobot.tapFavoriteIcon(regularMaterial.getOrDefaultValue(''));
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
    cartRobot.findMaterialItem(
      regularMaterial.getOrDefaultValue(''),
      1,
    );
    cartRobot.findOrderSummary();
    await cartRobot.tapOrderSummary();
    cartRobot.findMaterialItem(
      regularMaterial.getOrDefaultValue(''),
      1,
    );
    cartRobot.verifyEnableDiscountOverrideMaterial();
    await cartRobot.setDiscountOverrideMaterial(discount);
    cartRobot.verifyDiscountOverridePercentage(discount);
    cartRobot.verifyUnitPrice(
      currency,
      regularMaterialDiscountOverridePrice,
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
    orderSummaryRobot.findSubmit();
    await orderSummaryRobot.tapSubmit();
    orderConfirmationRobot.verify();
    orderConfirmationRobot.findGoToOrderHistoryButton();
    await orderConfirmationRobot.tapGoToOrderHistoryButton();
    orderHistoryRobot.verify();
    homeRobot.findHomeTab();
    await homeRobot.tapHomeTab();
    homeRobot.verify();
    await homeRobot.tapAccountTab();
    accountSettingsRobot.verify();
    accountSettingsRobot.findNoLoginOnBehalf();
    accountSettingsRobot.findUserFullName('$country $user');
    accountSettingsRobot.findUserRole(userRole);
  });
}
