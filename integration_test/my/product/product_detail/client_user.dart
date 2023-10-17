import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../../core/common.dart';
import '../../../robots/common/common_robot.dart';
import '../../../robots/common/enum.dart';
import '../../../robots/home/home_robot.dart';
import '../../../robots/login_robot.dart';
import '../../../robots/orders/cart/cart_robot.dart';
import '../../../robots/products/bundle_detail_robot.dart';
import '../../../robots/products/product_detail_robot.dart';
import '../../../robots/products/product_robot.dart';
import '../../../core/infrastructure/infra_core/zephyr_service/zephyr_service.dart';
import '../../../core/infrastructure/zephyr/repository/zephyr_repository.dart';
import '../../../core/test_locator.dart';
import '../../../robots/products/product_suggestion_robot.dart';

void main() {
  late LoginRobot loginRobot;
  late HomeRobot homeRobot;
  late ProductRobot productRobot;
  late CommonRobot commonRobot;
  late ProductDetailRobot productDetailRobot;
  late ProductSuggestionRobot productSuggestionRobot;
  late BundleDetailRobot bundleDetailRobot;
  late CartRobot cartRobot;

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  void initializeRobot(WidgetTester tester) {
    loginRobot = LoginRobot(tester);
    productRobot = ProductRobot(tester);
    commonRobot = CommonRobot(tester);
    productDetailRobot = ProductDetailRobot(tester);
    productSuggestionRobot = ProductSuggestionRobot(tester);
    bundleDetailRobot = BundleDetailRobot(tester);
    homeRobot = HomeRobot(tester);
    cartRobot = CartRobot(tester);
  }

  // initialize variables
  const marketMalaysia = 'Malaysia';
  const username = 'myclientuser';
  const password = 'St@ysafe01';
  const productNameSearch = "0.9% SODIUM CHLORIDEBP100ML1x72'S";
  const productCodeMultiImage = '21041738';
  const productCodeOffers = '21041741';
  const productCodeInfo = '21038302';
  const bundleCode = '8898400';
  const customerCode = '0070149863';

  // Product detail
  const materialNumberInfo = '21038305';
  const manufacturerInfo = 'BAXTER HEALTHCARE -M';
  const unitInfo = 'EA';
  const countryInfo = 'Philippines';
  const batchInfo = '12C054';
  const expiryInfo = 'NA';

  testWidgets('EZRX-T62 | Verify Product detail via Product tab',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);
    //init app
    await runAppForTesting(tester);

    //select market
    loginRobot.findMarketSelector();
    await loginRobot.tapToMarketSelector();
    await loginRobot.selectMarket(marketMalaysia);
    loginRobot.verifySelectedMarket(marketMalaysia);
    //login without username and password
    await loginRobot.login(username, password);

    await loginRobot.tapGetStartedButton();
    await commonRobot.dismissSnackbar();
    await commonRobot.changeDeliveryAddress(customerCode);

    await commonRobot.navigateToScreen(NavigationTab.products);
    await productRobot.openDetailFirstProduct();

    productDetailRobot.verifyProductImageDisplayed();
    productDetailRobot.verifyProductFavoriteIconDisplayed();
    productDetailRobot.verifyProductNameDisplayed();
    productDetailRobot.verifyProductPriceDisplayed();
    productDetailRobot.verifyMaterialDetailsInfoTileDisplayed();
    productDetailRobot.verifyProductDetailsQuantityInputPriceDisplayed();
    productDetailRobot.verifyCartButtonDisplayed();
    productDetailRobot.verifyAddToCartCartButtonDisplayed();
  });

  testWidgets('EZRX-T42 | Verify Product detail via Home screen',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);
    //init app
    await runAppForTesting(tester);
    await commonRobot.dismissSnackbar();

    await homeRobot.openDetailFirstViaHomeScreen(productNameSearch);

    productDetailRobot.verifyProductImageDisplayed();
    productDetailRobot.verifyProductFavoriteIconDisplayed();
    productDetailRobot.verifyProductNameDisplayed();
    productDetailRobot.verifyProductPriceDisplayed();
    productDetailRobot.verifyMaterialDetailsInfoTileDisplayed();
    productDetailRobot.verifyProductDetailsQuantityInputPriceDisplayed();
    productDetailRobot.verifyCartButtonDisplayed();
    productDetailRobot.verifyAddToCartCartButtonDisplayed();
  });

  testWidgets(
      'EZRX-T63 | Verify material information in the product detail page',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);
    //init app
    await runAppForTesting(tester);
    await commonRobot.dismissSnackbar();

    await homeRobot.openDetailFirstViaHomeScreen(productNameSearch);

    await productDetailRobot.openMaterialInformation();
    productDetailRobot.verifyMateriaNumberDisplayed(materialNumberInfo);
    productDetailRobot.verifyManufacturerDisplayed(manufacturerInfo);
    productDetailRobot.verifyUnitOfMeasurementLabelDisplayed(unitInfo);
    productDetailRobot.verifyCountryOfOriginLabelDisplayed(countryInfo);
    productDetailRobot.verifyBatchLabelDisplayed(batchInfo);
    productDetailRobot.verifyExpiryLabelDisplayed(expiryInfo);
  });

  testWidgets(
      'EZRX-T64 | Verify display image when Product has multiple images',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);
    //init app
    await runAppForTesting(tester);
    await commonRobot.dismissSnackbar();

    await commonRobot.navigateToScreen(NavigationTab.products);

    await productRobot.openSearchProductScreen();
    await productRobot.searchWithKeyboardAction(productCodeMultiImage);
    await productSuggestionRobot.tapToFirstSuggestedProductsTile();

    productDetailRobot.verifyMultipleImageMaterialDisplayed();
    productDetailRobot.verifyImageMaterialSelected(0, true);
    productDetailRobot.verifyImageMaterialSelected(1, false);

    await productDetailRobot.tapToImageMaterial(1, false);
    productDetailRobot.verifyImageMaterialSelected(1, true);
  });

  testWidgets('EZRX-T65| Verify Available offers in the product detail page',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);
    //init app
    await runAppForTesting(tester);
    await commonRobot.dismissSnackbar();

    await commonRobot.navigateToScreen(NavigationTab.products);

    await productRobot.openSearchProductScreen();
    await productRobot.searchWithKeyboardAction(productCodeOffers);
    await productSuggestionRobot.tapToFirstSuggestedProductsTile();

    final productName =
        productDetailRobot.getMaterialDetailsMaterialDescription();

    await productDetailRobot.openAvailableOffers();
    productDetailRobot.verifyNameProductOffer(productName);
    productDetailRobot.verifyCodeProductOffer(productCodeOffers);
    productDetailRobot.verifyQuantityProductDisplayed();
    productDetailRobot.verifyButtonCloseDisplayed();
  });

  testWidgets('EZRX-T66 | Verify Related products in the product detail page',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);
    //init app
    await runAppForTesting(tester);
    await commonRobot.dismissSnackbar();

    await commonRobot.navigateToScreen(NavigationTab.products);

    await productRobot.openSearchProductScreen();
    await productRobot.searchWithKeyboardAction(productCodeOffers);
    await productSuggestionRobot.tapToFirstSuggestedProductsTile();
    productDetailRobot.verifyRelateProductDisplayed();
  });

  testWidgets('EZRX-T67 | Verify other information in Product detail',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);
    //init app
    await runAppForTesting(tester);
    await commonRobot.dismissSnackbar();

    await productRobot.navigateToScreen(NavigationTab.products);

    await productRobot.openSearchProductScreen();
    await productRobot.searchWithKeyboardAction(productCodeMultiImage);
    await productSuggestionRobot.tapToFirstSuggestedProductsTile();
    await productDetailRobot.tapToSeeMore();

    productDetailRobot.verifyMaterialDosageDisplayed();
    productDetailRobot.verifyMaterialHowToUseDisplayed();
    productDetailRobot.verifyMaterialDeliveryInstructionsDisplayed();
    productDetailRobot.verifyMaterialCompositionDisplayed();
  });

  testWidgets('EZRX-T68 | Verify action click Cart icon in Product detail',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);
    //init app
    await runAppForTesting(tester);
    await commonRobot.dismissSnackbar();

    await productRobot.navigateToScreen(NavigationTab.products);

    await productRobot.openSearchProductScreen();
    await productRobot.searchWithKeyboardAction(productCodeInfo);
    await productSuggestionRobot.tapToFirstSuggestedProductsTile();

    await productDetailRobot.openCardCartPopup();
    cartRobot.verifyPage();
  });

  testWidgets('EZRX-T212 | Verify bundles detail page', (tester) async {
    //initialize necessary robots
    initializeRobot(tester);
    //init app
    await runAppForTesting(tester);
    await commonRobot.dismissSnackbar();

    await productRobot.navigateToScreen(NavigationTab.products);

    await productRobot.openSearchProductScreen();
    await productRobot.searchWithKeyboardAction(bundleCode);
    await productSuggestionRobot.tapToFirstSuggestedProductsTile();
    bundleDetailRobot.verifyAllInformationBundleOfferDisplayed();
  });

  testWidgets('EZRX-T215 | Verify add favorite product in product detail',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);
    //init app
    await runAppForTesting(tester);
    await commonRobot.dismissSnackbar();

    await productRobot.navigateToScreen(NavigationTab.products);
    productRobot.verifyMaterialCartVisible();
    await productRobot.openDetailFirstProduct();
    await productDetailRobot.setProductToFavoriteList(true);
    final nameProduct =
        productDetailRobot.getMaterialDetailsMaterialDescription().toString();

    await productDetailRobot.backToProductsScreen();
    await productRobot.filterFavoritesInProductsScreen();

    productRobot.verifyProductFilterMatched(nameProduct);
  });

  testWidgets('EZRX-T216 | Verify remove favorite product in product detail',
      (tester) async {
    //initialize necessary robots
    initializeRobot(tester);
    //init app
    await runAppForTesting(tester);
    await commonRobot.dismissSnackbar();

    await productRobot.navigateToScreen(NavigationTab.products);
    productRobot.verifyMaterialCartVisible();
    await productRobot.openDetailFirstProduct();
    final nameProduct =
        productDetailRobot.getMaterialDetailsMaterialDescription().toString();
    await productDetailRobot.setProductToFavoriteList(false);

    await productDetailRobot.backToProductsScreen();
    await productRobot.filterFavoritesInProductsScreen();

    productRobot.verifyNotProductFilterMatched(nameProduct);
  });

  tearDown(() async {
    locator<ZephyrService>().setNameAndStatus();
    await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  });
}
