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

import '../../../robots/orders/cart/cart_robot.dart';
import '../../../robots/products/bundle_detail_robot.dart';
import '../../../robots/products/product_detail_robot.dart';
import '../../../robots/products/product_robot.dart';
import '../../../robots/products/product_suggestion_robot.dart';

void main() {
  late LoginRobot loginRobot;
  late HomeRobot homeRobot;
  late CartRobot cartRobot;
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
  const bundlerTier2UnitPrice = 145.0;
  const bundleTier2UnitPriceDisplay = '$currency $bundlerTier2UnitPrice';
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

  void initializeRobot(WidgetTester tester) {
    loginRobot = LoginRobot(tester);
    homeRobot = HomeRobot(tester);
    commonRobot = CommonRobot(tester);
    productSuggestionRobot = ProductSuggestionRobot(tester);
    productRobot = ProductRobot(tester);
    productDetailRobot = ProductDetailRobot(tester);
    bundleDetailRobot = BundleDetailRobot(tester);
    cartRobot = CartRobot(tester);
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
    await commonRobot.changeDeliveryAddress(shipToCode);
    await homeRobot.tapMiniCartIcon();
    await cartRobot.clearCart();
    await cartRobot.tapBrowseProductButton();
    await productRobot.openSearchProductScreen();
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
    await commonRobot.changeDeliveryAddress(shipToCode);

    //verify
    await homeRobot.tapMiniCartIcon();
    await cartRobot.clearCart();
    await cartRobot.tapBrowseProductButton();
    await productRobot.openSearchProductScreen();
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
    await commonRobot.changeDeliveryAddress(shipToCode);

    //verify
    await homeRobot.tapMiniCartIcon();
    await cartRobot.clearCart();
    await cartRobot.tapBrowseProductButton();
    await productRobot.openSearchProductScreen();
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
    const bundleTotalPrice = bundleTotalQty * bundlerTier2UnitPrice;
    final bundleTotalPriceDisplayed =
        '$currency ${bundleTotalPrice.priceFormatted}';
    const totalPrice = materialQty * materialUnitPrice + bundleTotalPrice;
    final totalPriceDisplayed = '$currency ${totalPrice.priceFormatted}';

    //initialize necessary robots
    initializeRobot(tester);

    //init app
    await runAppForTesting(tester);
    await commonRobot.changeDeliveryAddress(shipToCode);

    //verify
    await homeRobot.tapMiniCartIcon();
    await cartRobot.clearCart();
    await cartRobot.tapBrowseProductButton();
    await productRobot.openSearchProductScreen();
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
    await commonRobot.changeDeliveryAddress(shipToCode);

    //verify
    await homeRobot.tapMiniCartIcon();
    await cartRobot.clearCart();
    await cartRobot.tapBrowseProductButton();
    await productRobot.openSearchProductScreen();
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
    await commonRobot.changeDeliveryAddress(shipToCode);

    //verify
    await homeRobot.tapMiniCartIcon();
    await cartRobot.clearCart();
    await cartRobot.tapBrowseProductButton();
    await productRobot.openSearchProductScreen();
    await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
    await productSuggestionRobot.tapSearchResult(materialNumber);
    await productDetailRobot.tapAddToCart();
    await productDetailRobot.dismissSnackbar();
    await productDetailRobot.tapCartButton();
    await cartRobot.verifyMaterial(materialNumber);
    cartRobot.verifyCartQty(1);
    await cartRobot.tapShowShipToAddressDetail();
    cartRobot.verifyShipToAddressDetail(isVisible: true);
    cartRobot.verifyCustomerCode(customerCode);
    cartRobot.verifyShipToCode(shipToCode);
    await cartRobot.tapCloseShipToAddressDetail();
    cartRobot.verifyShipToAddressDetail(isVisible: false);
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
    await commonRobot.changeDeliveryAddress(shipToCode);

    //verify
    await homeRobot.tapMiniCartIcon();
    await cartRobot.clearCart();
    await cartRobot.tapBrowseProductButton();
    await productRobot.openSearchProductScreen();
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

  tearDown(() async {
    locator<ZephyrService>().setNameAndStatus();
    await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  });
}
