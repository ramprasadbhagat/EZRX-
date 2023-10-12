import 'package:ezrxmobile/locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../../core/common.dart';
import '../../../core/infrastructure/infra_core/zephyr_service/zephyr_service.dart';
import '../../../core/infrastructure/zephyr/repository/zephyr_repository.dart';
import '../../../robots/common/common_robot.dart';
import '../../../robots/common/extension.dart';
import '../../../robots/home/home_robot.dart';
import '../../../robots/login_robot.dart';

import '../../../robots/orders/cart/request_counter_offer_robot.dart';
import '../../../robots/orders/checkout/checkout_robot.dart';
import '../../../robots/orders/cart/cart_robot.dart';
import '../../../robots/orders/checkout/order_price_summary_robot.dart';
import '../../../robots/orders/checkout/order_success_robot.dart';
import '../../../robots/products/bundle_detail_robot.dart';
import '../../../robots/products/product_detail_robot.dart';
import '../../../robots/products/product_robot.dart';
import '../../../robots/products/product_suggestion_robot.dart';

void main() {
  late LoginRobot loginRobot;
  late HomeRobot homeRobot;
  late CartRobot cartRobot;
  late RequestCounterOfferRobot counterOfferRobot;
  late OrderSuccessRobot orderSuccessRobot;
  late OrderPriceSummaryRobot orderPriceSummaryRobot;
  late CheckoutRobot checkoutRobot;
  late ProductRobot productRobot;
  late ProductDetailRobot productDetailRobot;
  late ProductSuggestionRobot productSuggestionRobot;
  late BundleDetailRobot bundleDetailRobot;
  late CommonRobot commonRobot;
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // initialize variables
  const marketMalaysia = 'Malaysia';
  const currency = 'MYR';
  const username = 'myclientuser';
  const password = 'St@ysafe01';
  const customerCode = '0030082707';
  const shipToCode = '0070149863';
  const shipToAddress = 'RSD HOSPITALS SDN BHD (SJMC)';

  const materialNumber = '21038302';
  const materialName = '0.9% SODIUM CHLORIDEBP 96X50ML';
  const materialPrincipalName = 'BAXTER HEALTHCARE -M';
  const materialUnitPrice = 364.80;
  final materialUnitPriceDisplay =
      '$currency ${materialUnitPrice.priceFormatted}';

  const bundleShortNumber = '8898400';
  const bundleNumber = '0008898400';
  const bundleName = 'Testing ZMP2';
  const bundleTier1Qty = 5;
  const bundleTier1UnitPrice = 150.0;
  const bundleTier1UnitPriceDisplay = '$currency $bundleTier1UnitPrice';
  const bundleMaterialNumber1 = '23046516';
  const bundleMaterialName1 = "(Z) JANUMET XR 100/1000 TABS 28'S";
  const bundleMaterialQty1 = 3;
  const bundleMaterialPrincipalName1 = 'MERCK SHARP & DOHME (I.A)';
  const bundleMaterialNumber2 = '23046799';
  const bundleMaterialQty2 = 2;
  const bundleMaterialName2 = "AVODARTCAP0.5MG30'S";
  const bundleMaterialPrincipalName2 = 'GLAXOSMITHKLINE PHARMACEUTICAL_';
  const bundleTotalQty = bundleMaterialQty1 + bundleMaterialQty2;
  const bundleTotalPrice = bundleTotalQty * bundleTier1UnitPrice;
  final bundleTotalPriceDisplay =
      '$currency ${bundleTotalPrice.priceFormatted}';

  const poReference = 'Auto-test-po-reference';
  const deliveryInstruction = 'Auto-test-delivery-instruction';
  final zeroPriceDisplay = '$currency ${0.priceFormatted}';

  void initializeRobot(WidgetTester tester) {
    loginRobot = LoginRobot(tester);
    homeRobot = HomeRobot(tester);
    commonRobot = CommonRobot(tester);
    productSuggestionRobot = ProductSuggestionRobot(tester);
    productRobot = ProductRobot(tester);
    productDetailRobot = ProductDetailRobot(tester);
    bundleDetailRobot = BundleDetailRobot(tester);
    counterOfferRobot = RequestCounterOfferRobot(tester);
    cartRobot = CartRobot(tester);
    checkoutRobot = CheckoutRobot(tester);
    orderSuccessRobot = OrderSuccessRobot(tester);
    orderPriceSummaryRobot = OrderPriceSummaryRobot(tester);
  }

  Future<void> goToProductSearch() async {
    await commonRobot.dismissSnackbar();
    await commonRobot.changeDeliveryAddress(shipToCode);
    await homeRobot.tapMiniCartIcon();
    await cartRobot.clearCart();
    await cartRobot.tapBrowseProductButton();
    await productRobot.openSearchProductScreen();
  }

  Future<void> checkoutWithMaterial() async {
    await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
    await productSuggestionRobot.tapSearchResult(materialNumber);
    await productDetailRobot.tapAddToCart();
    await productDetailRobot.dismissSnackbar();
    await productDetailRobot.tapCartButton();
    await cartRobot.tapCheckoutButton();
  }

  Future<void> checkoutWithBundle() async {
    await productSuggestionRobot.searchWithKeyboardAction(bundleShortNumber);
    await productSuggestionRobot.tapSearchResult(bundleShortNumber);
    await bundleDetailRobot.tapAddToCartButton();
    await bundleDetailRobot.enterMaterialQty(
      bundleMaterialNumber1,
      bundleMaterialQty1,
    );
    await bundleDetailRobot.enterMaterialQty(
      bundleMaterialNumber2,
      bundleMaterialQty2,
    );
    await bundleDetailRobot.tapSheetAddToCartButton();
    await bundleDetailRobot.tapCartButton();
    await cartRobot.tapCheckoutButton();
  }

  testWidgets('EZRX-T116 | Verify display Checkout screen', (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await loginRobot.loginToHomeScreen(username, password, marketMalaysia);
    await goToProductSearch();
    await checkoutWithMaterial();

    //verify
    checkoutRobot.verifyPage();
    checkoutRobot.verifyAddressSection();
    await checkoutRobot.verifyPoReferenceField(isVisible: true);
    await checkoutRobot.verifyDeliveryDateField(isVisible: false);
    await checkoutRobot.verifyReferenceNoteField(isVisible: false);
    await checkoutRobot.verifyPaymentTermField(isVisible: false);
    await checkoutRobot.verifyContactPersonField(isVisible: false);
    await checkoutRobot.verifyMobileNumberField(isVisible: false);
    await checkoutRobot.verifyDeliveryInstructionField(isVisible: true);
    await checkoutRobot.verifyPoAttachmentSection(isVisible: false);
    await checkoutRobot.verifyYoursItemLabel(1);
    await checkoutRobot.verifyMaterial(materialNumber);
    await checkoutRobot.verifySubTotalLabel(materialUnitPriceDisplay);
    await checkoutRobot.verifyStampDutyLabel(zeroPriceDisplay);
    await checkoutRobot.verifySmallOrderFeeLabel(zeroPriceDisplay);
    await checkoutRobot.verifyGrandTotalLabel(materialUnitPriceDisplay);
    await checkoutRobot.verifyTotalSavingLabel(zeroPriceDisplay);
    checkoutRobot.verifyStickyTotalQty(1);
    checkoutRobot.verifyStickyGrandTotal(materialUnitPriceDisplay);
    checkoutRobot.verifyPlaceOrderButton();
  });

  testWidgets(
      'EZRX-T117 | Verify the customer code & deliver to in Order for [Selected address] in Checkout page',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToProductSearch();
    await checkoutWithMaterial();

    //verify
    checkoutRobot.verifyAddressSection();
    checkoutRobot.verifyCustomerCode(customerCode);
    checkoutRobot.verifyDeliveryTo(shipToCode);
  });

  testWidgets('EZRX-T118 | Validate textbox fields in Checkout page',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToProductSearch();
    await checkoutWithMaterial();

    //verify
    await checkoutRobot.verifyPoReferenceField(isVisible: true);
    await checkoutRobot.verifyDeliveryInstructionField(isVisible: true);
    await checkoutRobot.tapDeliveryInformationArrowButton();
    await checkoutRobot.verifyPoReferenceField(isVisible: false);
    await checkoutRobot.verifyDeliveryInstructionField(isVisible: false);
    await checkoutRobot.tapDeliveryInformationArrowButton();
    await checkoutRobot.verifyPoReferenceField(isVisible: true);
    await checkoutRobot.enterPoReference(poReference);
    await checkoutRobot.verifyDeliveryInstructionField(isVisible: true);
    await checkoutRobot.enterDeliveryInstruction(deliveryInstruction);
    await checkoutRobot.tapPlaceOrderButton();
    orderSuccessRobot.verifyPage();
    orderSuccessRobot.verifyPoReference(poReference);
    orderSuccessRobot.verifyDeliveryInstruction(deliveryInstruction);
  });

  testWidgets(
      'EZRX-T121 | Verify click on Place order without inputting any textbox field',
      (tester) async {
    const emptyPoReference = '';
    const emptyDeliveryInstruction = 'NA';

    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToProductSearch();
    await checkoutWithMaterial();

    //verify
    await checkoutRobot.verifyPoReferenceField(isVisible: true);
    await checkoutRobot.tapPlaceOrderButton();
    checkoutRobot.verifyEmptyPoReferenceMessage(isVisible: false);
    orderSuccessRobot.verifyPage();
    orderSuccessRobot.verifyPoReference(emptyPoReference);
    orderSuccessRobot.verifyDeliveryInstruction(emptyDeliveryInstruction);
  });

  testWidgets(
      'EZRX-T122 | Verify show Order Summary when click on Grand Total price',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToProductSearch();
    await checkoutWithMaterial();

    //verify
    await checkoutRobot.tapStickyGrandTotal();
    orderPriceSummaryRobot.verifySheet(isVisible: true);
    orderPriceSummaryRobot.verifySubTotalLabel(materialUnitPriceDisplay);
    orderPriceSummaryRobot.verifyStampDutyLabel(zeroPriceDisplay);
    orderPriceSummaryRobot.verifySmallOrderFeeLabel(zeroPriceDisplay);
    orderPriceSummaryRobot.verifyGrandTotalLabel(materialUnitPriceDisplay);
    orderPriceSummaryRobot.verifyTotalSavingLabel(zeroPriceDisplay);
    await orderPriceSummaryRobot.tapCloseButton();
    orderPriceSummaryRobot.verifySheet(isVisible: false);
  });

  testWidgets('EZRX-T126 | Verify Close Order submmitted! page',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToProductSearch();
    await checkoutWithMaterial();

    //verify
    await checkoutRobot.tapPlaceOrderButton();
    await orderSuccessRobot.dismissSnackbar();
    await orderSuccessRobot.tapCloseButton();
    productRobot.verifyPageVisible();
    await productRobot.tapCartButton();
    cartRobot.verifyPage();
    cartRobot.verifyNoRecordFound();
  });

  testWidgets(
      'EZRX-T124 | Verify the customer code & deliver to in Order for [Selected address] in Order submmitted! page',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToProductSearch();
    await checkoutWithMaterial();

    //verify
    await checkoutRobot.tapPlaceOrderButton();
    orderSuccessRobot.verifyCustomerCode(customerCode);
    orderSuccessRobot.verifyDeliveryTo(shipToCode);
    orderSuccessRobot.verifyOrderAddress(shipToAddress);
  });

  testWidgets('EZRX-T119 | Verify display Product in Checkout page',
      (tester) async {
    const newUnitPrice = 1000;
    final newUnitPriceDisplay = '$currency ${newUnitPrice.priceFormatted}';
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToProductSearch();
    await checkoutWithMaterial();

    //verify
    await checkoutRobot.verifyMaterialPrincipal(materialPrincipalName);
    await checkoutRobot.verifyMaterial(materialNumber);
    checkoutRobot.verifyMaterialQty(materialNumber, 1);
    checkoutRobot.verifyMaterialDescription(materialNumber, materialName);
    checkoutRobot.verifyMaterialImage(materialNumber);
    checkoutRobot.verifyMaterialUnitPrice(
      materialNumber,
      materialUnitPriceDisplay,
    );
    checkoutRobot.verifyMaterialTotalPrice(
      materialNumber,
      materialUnitPriceDisplay,
    );
    checkoutRobot.verifyMaterialCounterOfferLabel(
      materialNumber,
      isVisible: false,
    );
    await checkoutRobot.tapCloseButton();
    await cartRobot.tapMaterialCounterOfferButton(materialNumber);
    await counterOfferRobot.enterPrice(newUnitPrice.toString());
    await counterOfferRobot.tapConfirmButton();
    await cartRobot.tapCheckoutButton();
    await checkoutRobot.verifyMaterial(materialNumber);
    checkoutRobot.verifyMaterialUnitPrice(
      materialNumber,
      newUnitPriceDisplay,
    );
    checkoutRobot.verifyMaterialTotalPrice(
      materialNumber,
      newUnitPriceDisplay,
    );
    checkoutRobot.verifyMaterialCounterOfferLabel(
      materialNumber,
      isVisible: true,
    );
    await checkoutRobot.verifySubTotalLabel(newUnitPriceDisplay);
    await checkoutRobot.verifyStampDutyLabel(zeroPriceDisplay);
    await checkoutRobot.verifySmallOrderFeeLabel(zeroPriceDisplay);
    await checkoutRobot.verifyGrandTotalLabel(newUnitPriceDisplay);
    await checkoutRobot.verifyTotalSavingLabel(zeroPriceDisplay);
    checkoutRobot.verifyStickyTotalQty(1);
    checkoutRobot.verifyStickyGrandTotal(newUnitPriceDisplay);
  });

  testWidgets('EZRX-T120 | Verify display Bundle in Checkout page',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToProductSearch();
    await checkoutWithBundle();

    //verify
    await checkoutRobot.verifyBundle(bundleNumber);
    checkoutRobot.verifyBundleName(bundleNumber, bundleName);
    checkoutRobot.verifyBundleRate(
      bundleNumber,
      bundleTier1Qty,
      bundleTier1UnitPriceDisplay,
    );
    await checkoutRobot.verifyBundleItem(bundleNumber, bundleMaterialNumber1);
    checkoutRobot.verifyBundleItemImage(bundleNumber, bundleMaterialNumber1);
    checkoutRobot.verifyBundleItemDescription(
      bundleNumber,
      bundleMaterialNumber1,
      bundleMaterialName1,
    );
    checkoutRobot.verifyBundleItemPrincipal(
      bundleNumber,
      bundleMaterialNumber1,
      bundleMaterialPrincipalName1,
    );
    checkoutRobot.verifyBundleItemQty(
      bundleNumber,
      bundleMaterialNumber1,
      bundleMaterialQty1,
    );
    await checkoutRobot.verifyBundleItem(bundleNumber, bundleMaterialNumber2);
    checkoutRobot.verifyBundleItemImage(bundleNumber, bundleMaterialNumber2);
    checkoutRobot.verifyBundleItemDescription(
      bundleNumber,
      bundleMaterialNumber2,
      bundleMaterialName2,
    );
    checkoutRobot.verifyBundleItemPrincipal(
      bundleNumber,
      bundleMaterialNumber2,
      bundleMaterialPrincipalName2,
    );
    checkoutRobot.verifyBundleItemQty(
      bundleNumber,
      bundleMaterialNumber2,
      bundleMaterialQty2,
    );
    checkoutRobot.verifyBundleTotalQty(
      bundleNumber,
      bundleTotalQty,
    );
    await checkoutRobot.verifySubTotalLabel(bundleTotalPriceDisplay);
    await checkoutRobot.verifyStampDutyLabel(zeroPriceDisplay);
    await checkoutRobot.verifySmallOrderFeeLabel(zeroPriceDisplay);
    await checkoutRobot.verifyGrandTotalLabel(bundleTotalPriceDisplay);
    await checkoutRobot.verifyTotalSavingLabel(zeroPriceDisplay);
    checkoutRobot.verifyBundleTotalPrice(bundleNumber, bundleTotalPriceDisplay);
    checkoutRobot.verifyStickyTotalQty(2);
    checkoutRobot.verifyStickyGrandTotal(bundleTotalPriceDisplay);
  });

  testWidgets('EZRX-T123 | Verify display Order Summited page', (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToProductSearch();
    await checkoutWithMaterial();

    //verify
    await checkoutRobot.tapPlaceOrderButton();
    orderSuccessRobot.verifyPage();
    orderSuccessRobot.verifyOrderSubmittedMessage();
    await orderSuccessRobot.dismissSnackbar();
    orderSuccessRobot.verifyOrderId();
    orderSuccessRobot.verifyOrderDate();
    await orderSuccessRobot.verifyOrderSummarySection();
    await orderSuccessRobot.verifyOrderItemsSection();
  });

  testWidgets('EZRX-T125 | Verify display Product in Order submmitted! page',
      (tester) async {
    const materialIndex = 0;
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goToProductSearch();
    await checkoutWithMaterial();

    //verify
    await checkoutRobot.verifySubTotalLabel(materialUnitPriceDisplay);
    await checkoutRobot.verifyGrandTotalLabel(materialUnitPriceDisplay);
    checkoutRobot.verifyStickyTotalQty(1);
    checkoutRobot.verifyStickyGrandTotal(materialUnitPriceDisplay);
    await checkoutRobot.tapPlaceOrderButton();
    await orderSuccessRobot.dismissSnackbar();
    await orderSuccessRobot.verifyOrderSummarySection();
    await orderSuccessRobot.verifySubTotal(materialUnitPriceDisplay);
    await orderSuccessRobot.verifyGrandTotal(materialUnitPriceDisplay);
    await orderSuccessRobot.verifyOrderItemsSection();
    await orderSuccessRobot.verifyOrderItemTotalQty(1);
    await orderSuccessRobot.verifyItem(materialIndex);
    orderSuccessRobot.verifyItemMaterialNumber(materialIndex, materialNumber);
    orderSuccessRobot.verifyItemMateriaDescription(materialIndex, materialName);
    orderSuccessRobot.verifyItemQty(materialIndex, 1);
    orderSuccessRobot.verifyItemUnitPrice(
      materialIndex,
      materialUnitPriceDisplay,
    );
    orderSuccessRobot.verifyItemTotalPrice(
      materialIndex,
      materialUnitPriceDisplay,
    );
  });

  tearDown(() async {
    locator<ZephyrService>().setNameAndStatus();
    await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  });
}
