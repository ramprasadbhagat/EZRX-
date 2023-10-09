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

import '../../../robots/orders/checkout/checkout_robot.dart';
import '../../../robots/orders/cart/bonus_sample_robot.dart';
import '../../../robots/orders/cart/request_counter_offer_robot.dart';
import '../../../robots/orders/cart/cart_delivery_address_robot.dart';
import '../../../robots/orders/cart/oos_pre_order_robot.dart';
import '../../../robots/orders/cart/cart_robot.dart';
import '../../../robots/products/bundle_detail_robot.dart';
import '../../../robots/products/product_detail_robot.dart';
import '../../../robots/products/product_robot.dart';
import '../../../robots/products/product_suggestion_robot.dart';

void main() {
  late LoginRobot loginRobot;
  late HomeRobot homeRobot;
  late CartRobot cartRobot;
  late CartDeliveryAddressRobot cartDeliveryAddressDetailRobot;
  late OOSPreOrderRobot cartOOSPreOrderRobot;
  late CheckoutRobot cartCheckoutRobot;
  late RequestCounterOfferRobot cartCounterOfferRobot;
  late BonusSampleRobot bonusSampleRobot;
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
  final minOrderAmount = '$currency ${300.0.priceFormatted}';

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
  const bundlerTier1UnitPrice = 150.0;
  const bundleTier1UnitPriceDisplay = '$currency $bundlerTier1UnitPrice';
  const bundleTier2Qty = 10;
  const bundleTier2UnitPrice = 145.0;
  const bundleTier2UnitPriceDisplay = '$currency $bundleTier2UnitPrice';
  const bundleMaterialNumber1 = '23046516';
  const bundleMaterialName1 = "(Z) JANUMET XR 100/1000 TABS 28'S";
  const bundleMaterialPrincipalName1 = 'MERCK SHARP & DOHME (I.A)';
  const bundleMaterialNumber2 = '23046796';
  const bundleMaterialName2 = "DUODART 0.5/0.4MG30'S";
  const bundleMaterialPrincipalName2 = 'GLAXOSMITHKLINE PHARMACEUTICAL_';
  const bundleMaterialNumber3 = '23046799';
  const bundleMaterialName3 = "AVODARTCAP0.5MG30'S";
  const bundleMaterialPrincipalName3 = 'GLAXOSMITHKLINE PHARMACEUTICAL_';

  const lowPriceMaterialNumber = '21042567';
  const lowPriceMaterialUnitPrice = 30.6;
  final lowPriceMaterialUnitPriceDisplay =
      '$currency ${lowPriceMaterialUnitPrice.priceFormatted}';

  const oosPreOrderMaterialNumber = '21041761';

  const bonusMaterialNumber = '21247723';
  const bonusMaterialName = 'SANGOBION COMPLETE 100S';

  void initializeRobot(WidgetTester tester) {
    loginRobot = LoginRobot(tester);
    homeRobot = HomeRobot(tester);
    commonRobot = CommonRobot(tester);
    productSuggestionRobot = ProductSuggestionRobot(tester);
    productRobot = ProductRobot(tester);
    productDetailRobot = ProductDetailRobot(tester);
    bundleDetailRobot = BundleDetailRobot(tester);
    cartRobot = CartRobot(tester);
    cartDeliveryAddressDetailRobot = CartDeliveryAddressRobot(tester);
    cartOOSPreOrderRobot = OOSPreOrderRobot(tester);
    cartCheckoutRobot = CheckoutRobot(tester);
    cartCounterOfferRobot = RequestCounterOfferRobot(tester);
    bonusSampleRobot = BonusSampleRobot(tester);
  }

  Future<void> goSearchProduct() async {
    await commonRobot.changeDeliveryAddress(shipToCode);
    await homeRobot.tapMiniCartIcon();
    await cartRobot.clearCart();
    await cartRobot.tapBrowseProductButton();
    await productRobot.openSearchProductScreen();
  }

  testWidgets('EZRX-T97 | Verify Cart when NO product is added to cart',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await loginRobot.loginToHomeScreen(username, password, marketMalaysia);
    await commonRobot.changeDeliveryAddress(shipToCode);
    await homeRobot.tapMiniCartIcon();

    //verify
    cartRobot.verifyPage();
    await cartRobot.clearCart();
    cartRobot.verifyNoRecordFound();
    cartRobot.verifyQtyOnAppBar(0);
    await cartRobot.tapBrowseProductButton();
    productRobot.verifyPageVisible();
  });

  testWidgets('EZRX-T98 | Verify Cart when products are added to the cart',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goSearchProduct();
    await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
    await productSuggestionRobot.tapSearchResult(materialNumber);
    await productDetailRobot.tapAddToCart();
    productDetailRobot.verifyCartButtonQty(1);
    await productDetailRobot.tapCartButton();

    //verify
    cartRobot.verifyClearCartButton();
    await cartRobot.verifyMaterial(materialNumber);
    cartRobot.verifyManufacturerName(materialPrincipalName);
    cartRobot.verifyMaterialNumber(materialNumber);
    cartRobot.verifyMaterialImage(materialNumber);
    cartRobot.verifyMaterialQty(materialNumber, 1);
    cartRobot.verifyMaterialDescription(materialNumber, materialName);
    cartRobot.verifyMaterialUnitPrice(materialNumber, materialUnitPriceDisplay);
    cartRobot.verifyMaterialTotalPrice(
      materialNumber,
      materialUnitPriceDisplay,
    );
    cartRobot.verifyCartQty(1);
    cartRobot.verifyQtyOnAppBar(1);
    cartRobot.verifyCartShipToAddress(shipToAddress);
    cartRobot.verifyCartTotalPrice(materialUnitPriceDisplay);
    cartRobot.verifyCheckoutButton();
  });

  testWidgets('EZRX-T113 | Verify delete all items in cart', (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goSearchProduct();

    //verify
    await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
    await productSuggestionRobot.tapSearchResult(materialNumber);
    await productDetailRobot.tapAddToCart();
    await productDetailRobot.dismissSnackbar();
    await productDetailRobot.tapBackButton();
    await productSuggestionRobot
        .searchWithKeyboardAction(lowPriceMaterialNumber);
    await productSuggestionRobot.tapSearchResult(lowPriceMaterialNumber);
    await productDetailRobot.tapAddToCart();
    await productDetailRobot.tapCartButton();
    cartRobot.verifyCartQty(2);
    await cartRobot.tapClearCartButton();
    await cartRobot.verifyClearCartSuccessMessage();
    cartRobot.verifyNoRecordFound();
    cartRobot.verifyQtyOnAppBar(0);
  });

  testWidgets('EZRX-T99 | Verify Cart when bundles are added to the cart',
      (tester) async {
    const materialQty1 = 3;
    const materialQty2 = 2;
    const materialQty3 = 1;
    const totalQty = materialQty1 + materialQty2 + materialQty3;
    final totalPrice =
        '$currency ${(totalQty * bundlerTier1UnitPrice).priceFormatted}';

    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goSearchProduct();

    //verify
    await productSuggestionRobot.searchWithKeyboardAction(bundleShortNumber);
    await productSuggestionRobot.tapSearchResult(bundleShortNumber);
    await bundleDetailRobot.tapAddToCartButton();
    await bundleDetailRobot.enterMaterialQty(
      bundleMaterialNumber1,
      materialQty1,
    );
    await bundleDetailRobot.enterMaterialQty(
      bundleMaterialNumber2,
      materialQty2,
    );
    await bundleDetailRobot.enterMaterialQty(
      bundleMaterialNumber3,
      materialQty3,
    );
    await bundleDetailRobot.tapSheetAddToCartButton();
    bundleDetailRobot.verifyCartButtonQty(1);
    await bundleDetailRobot.tapCartButton();
    cartRobot.verifyPage();
    await cartRobot.verifyBundle(bundleNumber);
    cartRobot.verifyBundleNumber(bundleNumber);
    cartRobot.verifyBundleName(bundleNumber, bundleName);
    cartRobot.verifyBundleQty(bundleNumber, totalQty);
    cartRobot.verifyBundleRate(
      bundleNumber,
      bundleTier1Qty,
      bundleTier1UnitPriceDisplay,
    );
    await cartRobot.verifyBundleItem(
      bundleNumber,
      bundleMaterialNumber1,
    );
    cartRobot.verifyBundleItemMaterialNumber(
      bundleNumber,
      bundleMaterialNumber1,
    );
    cartRobot.verifyBundleItemMaterialDescription(
      bundleNumber,
      bundleMaterialNumber1,
      bundleMaterialName1,
    );
    cartRobot.verifyBundleItemPrincipalName(
      bundleNumber,
      bundleMaterialNumber1,
      bundleMaterialPrincipalName1,
    );
    cartRobot.verifyBundleItemQty(
      bundleNumber,
      bundleMaterialNumber1,
      materialQty1,
    );
    cartRobot.verifyBundleItemDeleteButton(
      bundleNumber,
      bundleMaterialNumber1,
    );
    await cartRobot.verifyBundleItem(
      bundleNumber,
      bundleMaterialNumber2,
    );
    cartRobot.verifyBundleItemMaterialNumber(
      bundleNumber,
      bundleMaterialNumber2,
    );
    cartRobot.verifyBundleItemMaterialDescription(
      bundleNumber,
      bundleMaterialNumber2,
      bundleMaterialName2,
    );
    cartRobot.verifyBundleItemPrincipalName(
      bundleNumber,
      bundleMaterialNumber2,
      bundleMaterialPrincipalName2,
    );
    cartRobot.verifyBundleItemQty(
      bundleNumber,
      bundleMaterialNumber2,
      materialQty2,
    );
    cartRobot.verifyBundleItemDeleteButton(
      bundleNumber,
      bundleMaterialNumber2,
    );
    await cartRobot.verifyBundleItem(
      bundleNumber,
      bundleMaterialNumber3,
    );
    cartRobot.verifyBundleItemMaterialNumber(
      bundleNumber,
      bundleMaterialNumber3,
    );
    cartRobot.verifyBundleItemMaterialDescription(
      bundleNumber,
      bundleMaterialNumber3,
      bundleMaterialName3,
    );
    cartRobot.verifyBundleItemPrincipalName(
      bundleNumber,
      bundleMaterialNumber3,
      bundleMaterialPrincipalName3,
    );
    cartRobot.verifyBundleItemQty(
      bundleNumber,
      bundleMaterialNumber3,
      materialQty3,
    );
    cartRobot.verifyBundleItemDeleteButton(
      bundleNumber,
      bundleMaterialNumber3,
    );
    cartRobot.verifyBundleTotalPrice(bundleNumber, totalPrice);
    cartRobot.verifyCartQty(1);
    cartRobot.verifyCartShipToAddress(shipToAddress);
    cartRobot.verifyCartTotalPrice(totalPrice);
    cartRobot.verifyCheckoutButton();
  });

  testWidgets(
      'EZRX-T100 | Verify Cart when bundles and products are added to the cart',
      (tester) async {
    const materialQty = 1;
    const bundleMaterialQty1 = 9;
    const bundleMaterialQty2 = 2;
    const bundleTotalQty = bundleMaterialQty2 + bundleMaterialQty1;
    const bundleTotalPrice = bundleTotalQty * bundleTier2UnitPrice;
    final bundleTotalPriceDisplayed =
        '$currency ${bundleTotalPrice.priceFormatted}';
    const totalPrice = materialQty * materialUnitPrice + bundleTotalPrice;
    final totalPriceDisplayed = '$currency ${totalPrice.priceFormatted}';

    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goSearchProduct();

    //verify
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
    await bundleDetailRobot.dismissSnackbar();
    bundleDetailRobot.verifyCartButtonQty(1);
    await bundleDetailRobot.tapBackButton();
    await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
    await productSuggestionRobot.tapSearchResult(materialNumber);
    await productDetailRobot.tapAddToCart();
    await productDetailRobot.dismissSnackbar();
    productDetailRobot.verifyCartButtonQty(2);
    await productDetailRobot.tapCartButton();
    cartRobot.verifyPage();
    await cartRobot.verifyMaterial(materialNumber);
    cartRobot.verifyMaterialQty(materialNumber, materialQty);
    cartRobot.verifyMaterialUnitPrice(materialNumber, materialUnitPriceDisplay);
    cartRobot.verifyMaterialTotalPrice(
      materialNumber,
      materialUnitPriceDisplay,
    );
    await cartRobot.verifyBundle(bundleNumber);
    cartRobot.verifyBundleQty(bundleNumber, bundleTotalQty);
    cartRobot.verifyBundleRate(
      bundleNumber,
      bundleTier2Qty,
      bundleTier2UnitPriceDisplay,
    );
    await cartRobot.verifyBundleItem(
      bundleNumber,
      bundleMaterialNumber1,
    );
    cartRobot.verifyBundleItemQty(
      bundleNumber,
      bundleMaterialNumber1,
      bundleMaterialQty1,
    );
    await cartRobot.verifyBundleItem(
      bundleNumber,
      bundleMaterialNumber2,
    );
    cartRobot.verifyBundleItemQty(
      bundleNumber,
      bundleMaterialNumber2,
      bundleMaterialQty2,
    );
    cartRobot.verifyBundleTotalPrice(bundleNumber, bundleTotalPriceDisplayed);
    cartRobot.verifyCartQty(2);
    cartRobot.verifyQtyOnAppBar(2);
    cartRobot.verifyCartShipToAddress(shipToAddress);
    cartRobot.verifyCartTotalPrice(totalPriceDisplayed);
    cartRobot.verifyCheckoutButton();
  });

  testWidgets('EZRX-T108 | Verify remove Product in the Cart', (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goSearchProduct();

    //verify
    await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
    await productSuggestionRobot.tapSearchResult(materialNumber);
    await productDetailRobot.tapAddToCart();
    await productDetailRobot.dismissSnackbar();
    await productDetailRobot.tapCartButton();
    await cartRobot.verifyMaterial(materialNumber);
    await cartRobot.swipeMaterialToDelete(materialNumber);
    await cartRobot.verifyClearCartSuccessMessage();
    cartRobot.verifyNoRecordFound();
    await cartRobot.tapBrowseProductButton();
    await productRobot.openSearchProductScreen();
    await productSuggestionRobot.searchWithKeyboardAction(bundleShortNumber);
    await productSuggestionRobot.tapSearchResult(bundleShortNumber);
    await bundleDetailRobot.tapAddToCartButton();
    await bundleDetailRobot.enterMaterialQty(
      bundleMaterialNumber1,
      bundleTier1Qty,
    );
    await bundleDetailRobot.tapSheetAddToCartButton();
    await bundleDetailRobot.dismissSnackbar();
    await bundleDetailRobot.tapCartButton();
    await cartRobot.verifyBundle(bundleNumber);
    await cartRobot.swipeBundleToDelete(bundleNumber);
    cartRobot.verifyNoRecordFound();
    await cartRobot.verifyClearCartSuccessMessage();
  });

  testWidgets(
      'EZRX-T114 | Verify the customer code & deliver to in Order for [Selected address] in Cart detail',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goSearchProduct();

    //verify
    await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
    await productSuggestionRobot.tapSearchResult(materialNumber);
    await productDetailRobot.tapAddToCart();
    await productDetailRobot.dismissSnackbar();
    await productDetailRobot.tapCartButton();
    await cartRobot.verifyMaterial(materialNumber);
    cartRobot.verifyCartQty(1);
    await cartRobot.tapShowShipToAddressDetail();
    cartDeliveryAddressDetailRobot.verifySheet(isVisible: true);
    cartDeliveryAddressDetailRobot.verifyCustomerCode(customerCode);
    cartDeliveryAddressDetailRobot.verifyShipToCode(shipToCode);
    await cartDeliveryAddressDetailRobot.tapCloseButton();
    cartDeliveryAddressDetailRobot.verifySheet(isVisible: false);
  });

  testWidgets(
      'EZRX-T110 | Verify notification if Cart is under the minimum order value',
      (tester) async {
    const validQty = 10;
    final validTotalPrice =
        '$currency ${(lowPriceMaterialUnitPrice * validQty).priceFormatted}';

    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goSearchProduct();

    //verify
    await productSuggestionRobot
        .searchWithKeyboardAction(lowPriceMaterialNumber);
    await productSuggestionRobot.tapSearchResult(lowPriceMaterialNumber);
    await productDetailRobot.tapAddToCart();
    await productDetailRobot.tapCartButton();
    await cartRobot.verifyMaterial(lowPriceMaterialNumber);
    cartRobot.verifyMaterialQty(lowPriceMaterialNumber, 1);
    cartRobot.verifyMaterialUnitPrice(
      lowPriceMaterialNumber,
      lowPriceMaterialUnitPriceDisplay,
    );
    cartRobot.verifyMaterialTotalPrice(
      lowPriceMaterialNumber,
      lowPriceMaterialUnitPriceDisplay,
    );
    cartRobot.verifyCartTotalPrice(lowPriceMaterialUnitPriceDisplay);
    await cartRobot.tapCheckoutButton();
    cartRobot.verifyMOVWarningMessage(minOrderAmount, isVisible: true);
    await cartRobot.changeMaterialQty(lowPriceMaterialNumber, validQty);
    cartRobot.verifyMaterialQty(lowPriceMaterialNumber, validQty);
    cartRobot.verifyMaterialTotalPrice(
      lowPriceMaterialNumber,
      validTotalPrice,
    );
    cartRobot.verifyCartTotalPrice(validTotalPrice);
    cartRobot.verifyMOVWarningMessage(minOrderAmount, isVisible: false);
  });

  testWidgets(
      'EZRX-T107 | Verify update Cart when increasing/decreasing the quantity of the selected product from the cart details page',
      (tester) async {
    var totalPrice = materialUnitPrice;
    String totalPriceDisplay() => '$currency ${totalPrice.priceFormatted}';
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goSearchProduct();

    //verify
    await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
    await productSuggestionRobot.tapSearchResult(materialNumber);
    await productDetailRobot.tapAddToCart();
    await productDetailRobot.tapCartButton();

    await cartRobot.verifyMaterial(materialNumber);

    cartRobot.verifyMaterialQty(materialNumber, 1);
    cartRobot.verifyMaterialTotalPrice(materialNumber, totalPriceDisplay());
    cartRobot.verifyCartTotalPrice(totalPriceDisplay());

    await cartRobot.increaseMaterialQty(materialNumber);
    totalPrice = materialUnitPrice * 2;
    cartRobot.verifyMaterialQty(materialNumber, 2);
    cartRobot.verifyMaterialTotalPrice(materialNumber, totalPriceDisplay());
    cartRobot.verifyCartTotalPrice(totalPriceDisplay());

    await cartRobot.changeMaterialQty(materialNumber, 10);
    totalPrice = materialUnitPrice * 10;
    cartRobot.verifyMaterialQty(materialNumber, 10);
    cartRobot.verifyMaterialTotalPrice(materialNumber, totalPriceDisplay());
    cartRobot.verifyCartTotalPrice(totalPriceDisplay());

    await cartRobot.decreaseMaterialQty(materialNumber);
    totalPrice = materialUnitPrice * 9;
    cartRobot.verifyMaterialQty(materialNumber, 9);
    cartRobot.verifyMaterialTotalPrice(materialNumber, totalPriceDisplay());
    cartRobot.verifyCartTotalPrice(totalPriceDisplay());
  });

  testWidgets(
      'EZRX-T227 | Verify update Cart when increasing/decreasing the quantity of the selected bundle from the cart details page',
      (tester) async {
    var totalPrice = bundleTier2UnitPrice * 10;
    String totalPriceDisplay() => '$currency ${totalPrice.priceFormatted}';
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goSearchProduct();

    //verify
    await productSuggestionRobot.searchWithKeyboardAction(bundleShortNumber);
    await productSuggestionRobot.tapSearchResult(bundleShortNumber);
    await bundleDetailRobot.tapAddToCartButton();
    await bundleDetailRobot.enterMaterialQty(bundleMaterialNumber1, 8);
    await bundleDetailRobot.enterMaterialQty(bundleMaterialNumber2, 2);
    await bundleDetailRobot.tapSheetAddToCartButton();
    await bundleDetailRobot.tapCartButton();

    await cartRobot.verifyBundle(bundleNumber);
    cartRobot.verifyBundleQty(bundleNumber, 10);
    cartRobot.verifyBundleRate(
      bundleNumber,
      bundleTier2Qty,
      bundleTier2UnitPriceDisplay,
    );
    await cartRobot.verifyBundleItem(bundleNumber, bundleMaterialNumber1);
    cartRobot.verifyBundleItemQty(bundleNumber, bundleMaterialNumber1, 8);
    await cartRobot.verifyBundleItem(bundleNumber, bundleMaterialNumber2);
    cartRobot.verifyBundleItemQty(bundleNumber, bundleMaterialNumber2, 2);
    cartRobot.verifyBundleTotalPrice(bundleNumber, totalPriceDisplay());
    cartRobot.verifyCartTotalPrice(totalPriceDisplay());

    await cartRobot.decreaseBundleItemQty(
      bundleNumber,
      bundleMaterialNumber1,
    );
    totalPrice = bundlerTier1UnitPrice * 9;
    cartRobot.verifyBundleQty(bundleNumber, 9);
    cartRobot.verifyBundleRate(
      bundleNumber,
      bundleTier1Qty,
      bundleTier1UnitPriceDisplay,
    );
    cartRobot.verifyBundleItemQty(bundleNumber, bundleMaterialNumber1, 7);
    cartRobot.verifyBundleItemQty(bundleNumber, bundleMaterialNumber2, 2);
    cartRobot.verifyBundleTotalPrice(bundleNumber, totalPriceDisplay());
    cartRobot.verifyCartTotalPrice(totalPriceDisplay());

    await cartRobot.increaseBundleItemQty(
      bundleNumber,
      bundleMaterialNumber2,
    );
    totalPrice = bundleTier2UnitPrice * 10;
    cartRobot.verifyBundleQty(bundleNumber, 10);
    cartRobot.verifyBundleRate(
      bundleNumber,
      bundleTier2Qty,
      bundleTier2UnitPriceDisplay,
    );
    cartRobot.verifyBundleItemQty(bundleNumber, bundleMaterialNumber1, 7);
    cartRobot.verifyBundleItemQty(bundleNumber, bundleMaterialNumber2, 3);
    cartRobot.verifyBundleTotalPrice(bundleNumber, totalPriceDisplay());
    cartRobot.verifyCartTotalPrice(totalPriceDisplay());

    await cartRobot.changeBundleItemQty(
      bundleNumber,
      bundleMaterialNumber1,
      17,
    );
    cartRobot.verifyBundleQty(bundleNumber, 20);
    totalPrice = bundleTier2UnitPrice * 20;
    cartRobot.verifyBundleRate(
      bundleNumber,
      bundleTier2Qty,
      bundleTier2UnitPriceDisplay,
    );
    cartRobot.verifyBundleItemQty(bundleNumber, bundleMaterialNumber1, 17);
    cartRobot.verifyBundleItemQty(bundleNumber, bundleMaterialNumber2, 3);
    cartRobot.verifyBundleTotalPrice(bundleNumber, totalPriceDisplay());
    cartRobot.verifyCartTotalPrice(totalPriceDisplay());
  });

  testWidgets(
      'EZRX-T115 | Verify cart when list of Product included Item in the order in Cart detail',
      (tester) async {
    const qty = 100;

    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goSearchProduct();

    //verify
    await productSuggestionRobot
        .searchWithKeyboardAction(oosPreOrderMaterialNumber);
    await productSuggestionRobot.tapSearchResult(oosPreOrderMaterialNumber);
    await productDetailRobot.tapAddToCart();
    await productDetailRobot.dismissSnackbar();
    await productDetailRobot.tapCartButton();
    await cartRobot.verifyMaterial(oosPreOrderMaterialNumber);
    cartRobot.verifyMaterialOOSPreOrderStatus(oosPreOrderMaterialNumber);
    await cartRobot.changeMaterialQty(oosPreOrderMaterialNumber, qty);
    await cartRobot.tapCheckoutButton();
    cartOOSPreOrderRobot.verifySheet(isVisible: true);
    cartOOSPreOrderRobot.verifyCancelButton();
    cartOOSPreOrderRobot.verifyContinueButton();
    cartOOSPreOrderRobot.verifyWarningMessage();
    cartOOSPreOrderRobot.verifyMaterial(oosPreOrderMaterialNumber, qty);
    await cartOOSPreOrderRobot.tapCancelButton();
    cartRobot.verifyPage();
    cartOOSPreOrderRobot.verifySheet(isVisible: false);
    await cartRobot.tapCheckoutButton();
    cartOOSPreOrderRobot.verifyMaterial(oosPreOrderMaterialNumber, qty);
    await cartOOSPreOrderRobot.tapContinueButton();
    cartCheckoutRobot.verifyPage();
  });

  testWidgets(
      'EZRX-T101 | Verify Cart when having bonus product add to the cart',
      (tester) async {
    const tier1Qty = 3;
    const tier1BonusQty = 1;
    const tier2Qty = 30;
    const tier2BonusQty = 12;

    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goSearchProduct();

    //verify
    await productSuggestionRobot.searchWithKeyboardAction(bonusMaterialNumber);
    await productSuggestionRobot.tapSearchResult(bonusMaterialNumber);
    await productDetailRobot.tapAddToCart();
    await productDetailRobot.dismissSnackbar();
    await productDetailRobot.tapCartButton();
    await cartRobot.verifyMaterial(bonusMaterialNumber);
    cartRobot.verifyMaterialQty(bonusMaterialNumber, 1);
    cartRobot.verifyMaterialOfferTag(bonusMaterialNumber);
    await cartRobot.changeMaterialQty(bonusMaterialNumber, tier1Qty);
    await cartRobot.verifyBonusMaterial(
      bonusMaterialNumber,
      bonusMaterialNumber,
    );
    cartRobot.verifyBonusMaterialQty(
      bonusMaterialNumber,
      bonusMaterialNumber,
      tier1BonusQty,
    );
    cartRobot.verifyBonusMaterialFreeLabel(
      bonusMaterialNumber,
      bonusMaterialNumber,
    );
    cartRobot.verifyBonusMaterialTag(
      bonusMaterialNumber,
      bonusMaterialNumber,
    );
    cartRobot.verifyBonusMaterialDescription(
      bonusMaterialNumber,
      bonusMaterialNumber,
      bonusMaterialName,
    );
    cartRobot.verifyBonusMaterialImage(
      bonusMaterialNumber,
      bonusMaterialNumber,
    );
    await cartRobot.changeMaterialQty(bonusMaterialNumber, tier2Qty);
    cartRobot.verifyBonusMaterialQty(
      bonusMaterialNumber,
      bonusMaterialNumber,
      tier2BonusQty,
    );
    await cartRobot.increaseBonusMaterialQty(
      bonusMaterialNumber,
      bonusMaterialNumber,
    );
    cartRobot.verifyBonusMaterialQty(
      bonusMaterialNumber,
      bonusMaterialNumber,
      tier2BonusQty,
    );
    await cartRobot.decreaseBonusMaterialQty(
      bonusMaterialNumber,
      bonusMaterialNumber,
    );
    cartRobot.verifyBonusMaterialQty(
      bonusMaterialNumber,
      bonusMaterialNumber,
      tier2BonusQty,
    );
  });

  testWidgets(
      'EZRX-T105 | Verify display request counter offer for the product added to cart',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goSearchProduct();

    //verify
    await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
    await productSuggestionRobot.tapSearchResult(materialNumber);
    await productDetailRobot.tapAddToCart();
    await productDetailRobot.tapCartButton();
    await cartRobot.verifyMaterial(materialNumber);
    cartRobot.verifyMaterialUnitPrice(materialNumber, materialUnitPriceDisplay);
    cartRobot.verifyMaterialCounterOfferButton(materialNumber);
    await cartRobot.tapMaterialCounterOfferButton(materialNumber);
    cartCounterOfferRobot.verifySheet(isVisible: true);
    cartCounterOfferRobot.verifyListPrice(materialUnitPriceDisplay);
    cartCounterOfferRobot.verifyOfferPrice(materialUnitPriceDisplay);
    cartCounterOfferRobot.verifyPriceTextField();
    cartCounterOfferRobot.verifyPriceText('');
    cartCounterOfferRobot.verifyRemarkTextField();
    cartCounterOfferRobot.verifyRemarkText('');
    cartCounterOfferRobot.verifyRemarkMaximumLengthMessage();
    cartCounterOfferRobot.verifyConfirmButton();
    cartCounterOfferRobot.verifyCancelButton();
    await cartCounterOfferRobot.tapCancelButton();
    cartCounterOfferRobot.verifySheet(isVisible: false);
    cartRobot.verifyMaterialUnitPrice(materialNumber, materialUnitPriceDisplay);
  });

  testWidgets(
      'EZRX-T106 | Verify request counter offer for the product added to cart',
      (tester) async {
    const newUnitPrice = 1000;
    final newUnitPriceDisplay = '$currency ${newUnitPrice.priceFormatted}';
    const remark = 'AUTO-TEST';
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goSearchProduct();

    //verify
    await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
    await productSuggestionRobot.tapSearchResult(materialNumber);
    await productDetailRobot.tapAddToCart();
    await productDetailRobot.tapCartButton();
    await cartRobot.verifyMaterial(materialNumber);
    cartRobot.verifyMaterialUnitPrice(materialNumber, materialUnitPriceDisplay);
    cartRobot.verifyMaterialQty(materialNumber, 1);
    cartRobot.verifyMaterialCounterOfferButton(materialNumber);
    await cartRobot.tapMaterialCounterOfferButton(materialNumber);
    cartCounterOfferRobot.verifyListPrice(materialUnitPriceDisplay);
    cartCounterOfferRobot.verifyOfferPrice(materialUnitPriceDisplay);
    await cartCounterOfferRobot.tapConfirmButton();
    cartCounterOfferRobot.verifyPriceTextEmptyMessage();
    await cartCounterOfferRobot.enterPrice(newUnitPrice.toString());
    await cartCounterOfferRobot.enterRemark(remark);
    await cartCounterOfferRobot.tapConfirmButton();
    cartCounterOfferRobot.verifySheet(isVisible: false);
    cartRobot.verifyMaterialUnitPrice(materialNumber, newUnitPriceDisplay);
    await cartRobot.tapMaterialCounterOfferButton(materialNumber);
    cartCounterOfferRobot.verifyListPrice(materialUnitPriceDisplay);
    cartCounterOfferRobot.verifyOfferPrice(newUnitPriceDisplay);
    cartCounterOfferRobot.verifyPriceText(newUnitPrice.toStringAsFixed(1));
    cartCounterOfferRobot.verifyRemarkText(remark);
  });

  testWidgets('EZRX-T102 | Verify display bonus/sample item to the cart',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goSearchProduct();

    //verify
    await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
    await productSuggestionRobot.tapSearchResult(materialNumber);
    await productDetailRobot.tapAddToCart();
    await productDetailRobot.tapCartButton();
    await cartRobot.verifyMaterial(materialNumber);
    cartRobot.verifyMaterialBonusSampleButton(materialNumber);
    await cartRobot.tapMaterialBonusSampleButton(materialNumber);
    bonusSampleRobot.verifySheet(isVisible: true);
    bonusSampleRobot.verifySearchBar();
    bonusSampleRobot.verifyBonusSampleItems();
    bonusSampleRobot.verifyCloseButton();
    await bonusSampleRobot.tapCloseButton();
    bonusSampleRobot.verifySheet(isVisible: false);
  });

  testWidgets(
      'EZRX-T104 | Verify add bonus/sample item to the cart with invalid quantity',
      (tester) async {
    const invalidQty = 1000;
    const materialIndex = 0;
    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goSearchProduct();

    //verify
    await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
    await productSuggestionRobot.tapSearchResult(materialNumber);
    await productDetailRobot.tapAddToCart();
    await productDetailRobot.tapCartButton();
    await cartRobot.verifyMaterial(materialNumber);
    cartRobot.verifyMaterialBonusSampleButton(materialNumber);
    await cartRobot.tapMaterialBonusSampleButton(materialNumber);
    await bonusSampleRobot.tapSubmitButton(materialIndex);
    bonusSampleRobot.verifyEmptyQtyMessage(isVisible: true);
    await bonusSampleRobot.enterBonusSampleQty(materialIndex, invalidQty);
    await bonusSampleRobot.tapSubmitButton(materialIndex);
    bonusSampleRobot.verifyEmptyQtyMessage(isVisible: false);
    bonusSampleRobot.verifyInvalidQtyMessage();
  });

  testWidgets(
      'EZRX-T103 | Verify add bonus/sample item to the cart with valid quantity',
      (tester) async {
    const materialIndex = 0;
    const bonusSampleQty = 10;

    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await goSearchProduct();

    //verify
    await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
    await productSuggestionRobot.tapSearchResult(materialNumber);
    await productDetailRobot.tapAddToCart();
    await productDetailRobot.tapCartButton();
    await cartRobot.verifyMaterial(materialNumber);
    cartRobot.verifyMaterialBonusSampleButton(materialNumber);
    await cartRobot.tapMaterialBonusSampleButton(materialNumber);
    final bonusSampleMaterialNumber =
        bonusSampleRobot.getBonusSampleMaterialNumber(materialIndex);
    final bonusSampleMaterialDescription =
        bonusSampleRobot.getBonusSampleMaterialDescription(materialIndex);
    await bonusSampleRobot.enterBonusSampleQty(materialIndex, bonusSampleQty);
    await bonusSampleRobot.tapSubmitButton(materialIndex);
    bonusSampleRobot.verifyAddToCartSuccessMessage();
    await bonusSampleRobot.dismissSnackbar();
    await bonusSampleRobot.tapCloseButton();
    bonusSampleRobot.verifySheet(isVisible: false);
    await cartRobot.verifyBonusSampleMaterial(
      materialNumber,
      bonusSampleMaterialNumber,
    );
    cartRobot.verifyBonusSampleMaterialQty(
      materialNumber,
      bonusSampleMaterialNumber,
      bonusSampleQty,
    );
    cartRobot.verifyBonusSampleMaterialDescription(
      materialNumber,
      bonusSampleMaterialNumber,
      bonusSampleMaterialDescription,
    );
    cartRobot.verifyBonusSampleMaterialFreeLabel(
      materialNumber,
      bonusSampleMaterialNumber,
    );
    cartRobot.verifyBonusSampleMaterialTag(
      materialNumber,
      bonusSampleMaterialNumber,
    );
    cartRobot.verifyBonusSampleMaterialImage(
      materialNumber,
      bonusSampleMaterialNumber,
    );
  });

  tearDown(() async {
    locator<ZephyrService>().setNameAndStatus();
    await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  });
}
