import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../core/common.dart';
import '../../core/infrastructure/infra_core/zephyr_service/zephyr_service.dart';
import '../../core/infrastructure/zephyr/repository/zephyr_repository.dart';
import '../../robots/common/common_robot.dart';
import '../../robots/common/enum.dart';
import '../../robots/common/extension.dart';
import '../../robots/home/customer_search_robot.dart';
import '../../robots/home/home_robot.dart';
import '../../robots/login_robot.dart';
import '../../robots/orders/cart/cart_delivery_address_robot.dart';
import '../../robots/orders/cart/cart_robot.dart';
import '../../robots/orders/cart/oos_pre_order_robot.dart';
import '../../robots/orders/checkout/checkout_robot.dart';
import '../../robots/orders/checkout/order_price_summary_robot.dart';
import '../../robots/orders/checkout/order_success_robot.dart';
import '../../robots/orders/orders_root_robot.dart';
import '../../robots/orders/view_by_items/view_by_items_filter_robot.dart';
import '../../robots/orders/view_by_items/view_by_items_robot.dart';
import '../../robots/orders/view_by_orders/view_by_orders_filter_robot.dart';
import '../../robots/orders/view_by_orders/view_by_orders_robot.dart';
import '../../robots/products/filter_sort_product_robot.dart';
import '../../robots/products/product_detail_robot.dart';
import '../../robots/products/product_robot.dart';
import '../../robots/products/product_suggestion_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late CommonRobot commonRobot;
  late LoginRobot loginRobot;
  late HomeRobot homeRobot;
  late ProductRobot productRobot;
  late ProductDetailRobot productDetailRobot;
  late FilterSortProductRobot filterSortProductRobot;
  late ProductSuggestionRobot productSuggestionRobot;
  late CartRobot cartRobot;
  late OOSPreOrderRobot oosPreOrderRobot;
  late CartDeliveryAddressRobot cartDeliveryAddressDetailRobot;
  late OrderPriceSummaryRobot orderPriceSummaryRobot;
  late CheckoutRobot checkoutRobot;
  late OrderSuccessRobot orderSuccessRobot;

  late OrdersRootRobot ordersRootRobot;
  late ViewByItemsRobot viewByItemsRobot;
  late ViewByItemsFilterRobot viewByItemsFilterRobot;
  late ViewByOrdersRobot viewByOrdersRobot;
  late ViewByOrdersFilterRobot viewByOrdersFilterRobot;
  late CustomerSearchRobot customerSearchRobot;

  void initializeRobot(WidgetTester tester) {
    commonRobot = CommonRobot(tester);
    loginRobot = LoginRobot(tester);
    homeRobot = HomeRobot(tester);
    productRobot = ProductRobot(tester);
    productDetailRobot = ProductDetailRobot(tester);
    filterSortProductRobot = FilterSortProductRobot(tester);
    productSuggestionRobot = ProductSuggestionRobot(tester);
    cartRobot = CartRobot(tester);
    oosPreOrderRobot = OOSPreOrderRobot(tester);
    cartDeliveryAddressDetailRobot = CartDeliveryAddressRobot(tester);
    orderPriceSummaryRobot = OrderPriceSummaryRobot(tester);
    checkoutRobot = CheckoutRobot(tester);
    orderSuccessRobot = OrderSuccessRobot(tester);
    customerSearchRobot = CustomerSearchRobot(tester);

    ordersRootRobot = OrdersRootRobot(tester);
    viewByItemsRobot = ViewByItemsRobot(tester);
    viewByItemsFilterRobot = ViewByItemsFilterRobot(tester);
    viewByOrdersRobot = ViewByOrdersRobot(tester);
    viewByOrdersFilterRobot = ViewByOrdersFilterRobot(tester);
  }

  const marketMalaysia = 'Indonesia';
  const username = 'rootadmin';
  const password = 'Pa55word@1234';
  const customerCode = '0000100164';
  const shipToCode = '0000100164';
  const shipToAddress = 'MARGARETHA FARMA. AP.';
  const currency = 'IDR';
  const invalidLengthSearchKey = '1';
  const invalidSearchKey = 'auto-test-auto-test';
  const materialNumber = 'AIABG5';
  const oosPreOrderMaterialNumber = 'DAOPPL20';
  const materialName = 'ABBOTIC GRANULES 250 MG / 50 ML';
  const materialPrincipalName = 'PT. ABBOTT INDONESIA';
  const materialUnitMeasurement = 'BTL';
  const multiImageMaterialNumber = 'TM1537N';
  const otherInfoMaterialNumber = 'TM1537N';
  const materialUnitPrice = 219317;
  const cartTotalPrice = 255941;
  const lowPriceMaterialNumber = 'MLENAPRO';
  const lowPriceMaterialUnitPrice = 150001;
  const bonusMaterialNumber = 'AIABG3';
  const orderNumber = 'e6dc4fe4-b9cb-11ee-9744-aebcc4cb434b';
  const orderMaterialNumber = 'AIABG3';
  const orderMaterialName = 'ABBOTIC GRANULES 30 ML';

  var loginRequired = true;
  final materialStockInfo = StockInfo.empty();
  final materialExpiryDate = materialStockInfo.expiryDate.dateOrNaString;
  final materialBatch = materialStockInfo.batch.displayLabel;
  final oosPreOrderMaterialStockInfo = StockInfo.empty();

  Future<void> pumpAppWithHomeScreen(
    WidgetTester tester, {
    String shipToCode = shipToCode,
  }) async {
    initializeRobot(tester);
    await runAppForTesting(tester);
    if (loginRequired) {
      await loginRobot.loginToHomeScreen(username, password, marketMalaysia);
      await customerSearchRobot.selectCustomerSearch(shipToCode);
      loginRequired = false;
      await commonRobot.dismissSnackbar(dismissAll: true);
      await commonRobot.closeAnnouncementAlertDialog();
    } else {
      await commonRobot.dismissSnackbar(dismissAll: true);
      await commonRobot.changeDeliveryAddress(
        shipToCode,
      );
    }
  }

  Future<void> browseProductFromEmptyCart() async {
    await homeRobot.tapMiniCartIcon();
    await cartRobot.clearCart();
    await cartRobot.tapBrowseProductButton();
    await productRobot.openSearchProductScreen();
  }

  Future<void> clearCart() async {
    await homeRobot.tapMiniCartIcon();
    await cartRobot.clearCart();
    await cartRobot.tapCloseButton();
  }

  Future<void> checkoutWithMaterial(
    String materialNumber,
    int qty, {
    bool isPreOrder = false,
  }) async {
    await browseProductFromEmptyCart();
    await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
    await productSuggestionRobot.tapSearchResult(materialNumber);
    await productDetailRobot.tapAddToCart();
    await productDetailRobot.tapCartButton();
    await cartRobot.changeMaterialQty(materialNumber, qty);
    await cartRobot.tapCheckoutButton();
    if (isPreOrder) {
      await oosPreOrderRobot.tapContinueButton();
    }
  }

  group('Product Tab - ', () {
    const sortByZToA = 'Z-A';
    testWidgets('EZRX-T30 | Verify default and display items in Product list',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyPageVisible();
      productRobot.verifyCartButtonVisible();
      productRobot.verifyCartButtonVisible();
      productRobot.verifyFilterFavoritesChip();
      productRobot.verifyAppTabBarVisible();
      productRobot.verifySearchBarVisible();
      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyDefaultFilterProductForIdMarket();
    });
    testWidgets('EZRX-T218 | Verify reset button in Product filter',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);

      final firstNameProduct = productRobot.getFistMaterialName();
      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyDefaultFilterProductForIdMarket();
      await filterSortProductRobot.chooseSortProductsBy(sortByZToA);
      filterSortProductRobot.verifyRadioSort(
        sortByZToA,
        true,
      );
      await filterSortProductRobot.tapFilterApplyButton();
      productRobot.verifyProductSortChanged(firstNameProduct);
      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyRadioSort(
        sortByZToA,
        true,
      );
      await filterSortProductRobot.tapFilterResetButton();
      productRobot.verifyFirstNameProduct(firstNameProduct);
      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyDefaultFilterProductForIdMarket();
    });
    testWidgets(
        'EZRX-T31 | Verify Search Product by inputting keyword contains product name',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifySearchBarVisible();
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(materialName);
      productSuggestionRobot.verifySuggestProductsSearch(materialName);
      await commonRobot.autoSearch(materialName);
      productSuggestionRobot.verifySuggestProductsSearch(materialName);
    });
    testWidgets(
        'EZRX-T32 | Verify Search Product by inputting keyword contains Product code',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifySearchBarVisible();
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot
          .searchWithKeyboardAction(invalidLengthSearchKey);
      await productSuggestionRobot
          .verifyAndDismissInvalidLengthSearchMessageSnackbar();
      productSuggestionRobot.verifyNoSuggestedProduct();
      await productSuggestionRobot.dismissSnackbar();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      productSuggestionRobot.verifySuggestProductsSearch(materialName);
    });
    testWidgets(
        'EZRX-T33 | Verify Search Product by inputting keyword not contain Product name/code',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifySearchBarVisible();
      await productRobot.openSearchProductScreen();

      await productSuggestionRobot.autoSearch(materialName);
      productSuggestionRobot.verifySuggestProductsSearch(materialName);
      await productSuggestionRobot.autoSearch(invalidSearchKey);
      productSuggestionRobot.verifyNoSuggestedProduct();
      productSuggestionRobot.verifyNoRecordFound();
      await productSuggestionRobot.tapClearSearch();
      productSuggestionRobot.verifyNoRecordFound(isVisible: false);
    });
    testWidgets('EZRX-T34 | Verify Favorite list', (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyCartButtonVisible();
      await productRobot.tapFirstMaterial();
      await productDetailRobot.setProductToFavoriteList(true);
      final nameProduct =
          productDetailRobot.getMaterialDetailsMaterialDescription();
      await productDetailRobot.tapBackButton();
      await productRobot.filterFavoritesInProductsScreen();
      productRobot.verifyFirstNameProduct(nameProduct);
      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyCheckboxCheckedShowProduct(
        'Favourites',
        true,
      );
    });
    testWidgets('EZRX-T35 | Verify display by Sort by Z-A', (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyCartButtonVisible();
      final firstProduct = productRobot.getFistMaterialName();
      await productRobot.openFilterProductScreen();
      await filterSortProductRobot.chooseSortProductsBy(sortByZToA);
      filterSortProductRobot.verifyRadioSort(
        sortByZToA,
        true,
      );
      await filterSortProductRobot.tapFilterApplyButton();
      productRobot.verifyProductSortChanged(firstProduct);
      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyRadioSort(
        sortByZToA,
        true,
      );
    });
    testWidgets('EZRX-T38 | Verify Filter by Manufacturer', (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyCartButtonVisible();

      await productRobot.openFilterProductScreen();
      await filterSortProductRobot.openFilterManufacturerScreen();
      await filterSortProductRobot
          .searchWithKeyboardAction(materialPrincipalName);
      filterSortProductRobot
          .verifyListManufacturerMatched(materialPrincipalName);
      await filterSortProductRobot.tapFirstSuggestedManufacturer();
      filterSortProductRobot.verifyManufacturerSelected(materialPrincipalName);
      await filterSortProductRobot.tapToBackIcon();
      filterSortProductRobot.verifyManufactureListSelectedVisible(1);
      await filterSortProductRobot.tapFilterApplyButton();

      productRobot
          .verifyManufacturerMaterialFilterMatched(materialPrincipalName);
    });
    testWidgets('EZRX-T39 | Verify Filter by Country of origin',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyCartButtonVisible();

      await productRobot.openFilterProductScreen();
      filterSortProductRobot.verifyFilterCountryOfOriginInvisibleForIdMarket();
    });

    testWidgets('EZRX-T40 | Verify combine filter with Sort conditions',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyCartButtonVisible();
      final firstProduct = productRobot.getFistMaterialName();
      await productRobot.openFilterProductScreen();
      await filterSortProductRobot.chooseSortProductsBy(sortByZToA);
      filterSortProductRobot.verifyRadioSort(
        sortByZToA,
        true,
      );
      await filterSortProductRobot.openFilterManufacturerScreen();
      await filterSortProductRobot
          .searchWithKeyboardAction(materialPrincipalName);
      await filterSortProductRobot.tapFirstSuggestedManufacturer();
      filterSortProductRobot.verifyManufacturerSelected(materialPrincipalName);
      await commonRobot.tapToBackIcon();
      await filterSortProductRobot.tapFilterApplyButton();
      productRobot.verifyCartButtonVisible();
      productRobot
          .verifyManufacturerMaterialFilterMatched(materialPrincipalName);
      productRobot.verifyProductSortChanged(firstProduct);
    });
    testWidgets('EZRX-T61 | Verify action click Cart icon in Product tab',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.tapCartButton();
      cartRobot.verifyPage();
    });
  });

  group('Product Detail - ', () {
    testWidgets('EZRX-T62 | Verify Product detail via Product tab',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productSuggestionRobot.tapSearchResult(materialNumber);
      productDetailRobot.verifyProductImageDisplayed();
      productDetailRobot.verifyProductFavoriteIconDisplayed();
      productDetailRobot.verifyProductNameDisplayed();
      productDetailRobot.verifyExpiryDate(
        materialExpiryDate,
      );
      await productDetailRobot.tapExpiryDateInfoIcon();
      await commonRobot.verifyExpiryDateBottomSheetAndTapClose();
      productDetailRobot.verifyProductPriceDisplayed();
      productDetailRobot.verifyMaterialDetailsInfoTileDisplayed();
      productDetailRobot.verifyProductDetailsQuantityInputPriceDisplayed();
      productDetailRobot.verifyCartButtonDisplayed();
      productDetailRobot.verifyAddToCartCartButtonDisplayed();
      await productDetailRobot.openMaterialInformation();
      productDetailRobot.verifyBatchDisplayed(
        value: materialBatch,
        isVisible: false,
      );
      productDetailRobot.verifyExpiryDateLabelDisplayed(
        value: materialExpiryDate,
      );
    });

    testWidgets('EZRX-T42 | Verify Product detail via Home screen',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await homeRobot.findBrowseProductsIcon();
      await homeRobot.tapOnFirstBrowseProduct();
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
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productSuggestionRobot.tapSearchResult(materialNumber);
      await productDetailRobot.openMaterialInformation();
      productDetailRobot.verifyMateriaNumberDisplayed(materialNumber);
      productDetailRobot.verifyManufacturerDisplayed(materialPrincipalName);
      productDetailRobot
          .verifyUnitOfMeasurementLabelDisplayed(materialUnitMeasurement);
    });

    testWidgets(
        'EZRX-T64 | Verify display image when Product has multiple images',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productRobot.searchWithKeyboardAction(multiImageMaterialNumber);
      await productSuggestionRobot.tapSearchResult(multiImageMaterialNumber);
      productDetailRobot.verifyImageMaterialSelected(0, true);
      productDetailRobot.verifyImageMaterialSelected(1, false);
      await productDetailRobot.tapToImageMaterial(1, false);
      productDetailRobot.verifyImageMaterialSelected(1, true);
    });

    testWidgets('EZRX-T66 | Verify Related products in the product detail page',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productSuggestionRobot.tapSearchResult(materialNumber);
      await productDetailRobot.dragMaterialDetailsInfoTileDisplayed();
      await productDetailRobot.verifyRelateProductDisplayed();
    });

    testWidgets('EZRX-T67 | Verify other information in Product detail',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot
          .searchWithKeyboardAction(otherInfoMaterialNumber);
      await productSuggestionRobot.tapSearchResult(otherInfoMaterialNumber);
      await productDetailRobot.tapToSeeMore();
      productDetailRobot.verifyMaterialHowToUseDisplayed();
      productDetailRobot.verifyMaterialCompositionDisplayed();
    });

    testWidgets('EZRX-T68 | Verify action click Cart icon in Product detail',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productSuggestionRobot.tapSearchResult(materialNumber);
      await productDetailRobot.tapCartButton();
      cartRobot.verifyPage();
    });

    testWidgets('EZRX-T215 | Verify add favorite product in product detail',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyCartButtonVisible();
      await productRobot.tapFirstMaterial();
      await productDetailRobot.setProductToFavoriteList(true);
      final nameProduct =
          productDetailRobot.getMaterialDetailsMaterialDescription();
      await productDetailRobot.tapBackButton();
      await productRobot.filterFavoritesInProductsScreen();
      productRobot.verifyProductFilter(nameProduct, matched: true);
    });

    testWidgets('EZRX-T216 | Verify remove favorite product in product detail',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await productRobot.navigateToScreen(NavigationTab.products);
      productRobot.verifyCartButtonVisible();
      await productRobot.tapFirstMaterial();
      final nameProduct =
          productDetailRobot.getMaterialDetailsMaterialDescription();
      await productDetailRobot.setProductToFavoriteList(false);
      await productDetailRobot.tapBackButton();
      await productRobot.filterFavoritesInProductsScreen();
      productRobot.verifyProductFilter(nameProduct, matched: false);
    });
  });

  group('Cart - ', () {
    testWidgets('EZRX-T97 | Verify Cart when NO product is added to cart',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
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
      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();
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
      cartRobot.verifyMaterialExpiryDateAndBatch(
        materialNumber,
        materialStockInfo,
        isBatchNumberVisible: false,
      );
      await cartRobot.tapMaterialExpiryDateInfoIcon(materialNumber);
      await commonRobot.verifyExpiryDateBottomSheetAndTapClose();
      cartRobot.verifyMaterialUnitPrice(
        materialNumber,
        materialUnitPrice.priceDisplayForID(currency),
      );
      cartRobot.verifyMaterialTotalPrice(
        materialNumber,
        materialUnitPrice.priceDisplayForID(currency),
      );
      cartRobot.verifyCartQty(1);
      cartRobot.verifyQtyOnAppBar(1);
      cartRobot.verifyCartShipToAddress(shipToAddress);
      cartRobot
          .verifyCartTotalPrice(cartTotalPrice.priceDisplayForID(currency));
      cartRobot.verifyCheckoutButton();
    });

    testWidgets('EZRX-T113 | Verify delete all items in cart', (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

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

    testWidgets('EZRX-T108 | Verify remove Product in the Cart',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

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
    });

    testWidgets(
        'EZRX-T114 | Verify the customer code & deliver to in Order for [Selected address] in Cart detail',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

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
        'EZRX-T107 | Verify update Cart when increasing/decreasing the quantity of the selected product from the cart details page',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

      //verify
      await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
      await productSuggestionRobot.tapSearchResult(materialNumber);
      await productDetailRobot.tapAddToCart();
      await productDetailRobot.tapCartButton();

      var totalPrice = materialUnitPrice;
      await cartRobot.verifyMaterial(materialNumber);
      cartRobot.verifyMaterialQty(materialNumber, 1);
      cartRobot.verifyMaterialTotalPrice(
        materialNumber,
        totalPrice.priceDisplayForID(currency),
      );
      cartRobot
          .verifyCartTotalPrice(cartTotalPrice.priceDisplayForID(currency));

      await cartRobot.increaseMaterialQty(materialNumber);
      totalPrice = materialUnitPrice * 2;
      var totalCartPrice = 486883;
      cartRobot.verifyMaterialQty(materialNumber, 2);
      cartRobot.verifyMaterialTotalPrice(
        materialNumber,
        totalPrice.priceDisplayForID(currency),
      );
      cartRobot
          .verifyCartTotalPrice(totalCartPrice.priceDisplayForID(currency));

      await cartRobot.changeMaterialQty(materialNumber, 10);
      totalPrice = materialUnitPrice * 10;
      totalCartPrice = 2434418;
      cartRobot.verifyMaterialQty(materialNumber, 10);
      cartRobot.verifyMaterialTotalPrice(
        materialNumber,
        totalPrice.priceDisplayForID(currency),
      );
      cartRobot
          .verifyCartTotalPrice(totalCartPrice.priceDisplayForID(currency));

      await cartRobot.decreaseMaterialQty(materialNumber);
      totalPrice = materialUnitPrice * 9;
      totalCartPrice = 2190976;
      cartRobot.verifyMaterialQty(materialNumber, 9);
      cartRobot.verifyMaterialTotalPrice(
        materialNumber,
        totalPrice.priceDisplayForID(currency),
      );
      cartRobot
          .verifyCartTotalPrice(totalCartPrice.priceDisplayForID(currency));
    });

    testWidgets(
        'EZRX-T110 | Verify notification if Cart is under the minimum order value',
        (tester) async {
      const inValidTotalPrice = 179001;
      const validTotalPrice = 333002;
      const validMaterialPrice = lowPriceMaterialUnitPrice * 2;

      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

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
        lowPriceMaterialUnitPrice.priceDisplayForID(currency),
      );
      cartRobot.verifyMaterialTotalPrice(
        lowPriceMaterialNumber,
        lowPriceMaterialUnitPrice.priceDisplayForID(currency),
      );
      cartRobot.verifyCartTotalPrice(
        inValidTotalPrice.priceDisplayForID(currency),
      );
      await cartRobot.tapToSeePriceBreakDown();

      cartRobot.verifySmallOrderFee(
        isMinOrderValue: true,
      );
      await cartRobot.changeMaterialQty(lowPriceMaterialNumber, 2);
      cartRobot.verifyMaterialQty(lowPriceMaterialNumber, 2);
      cartRobot.verifyMaterialTotalPrice(
        lowPriceMaterialNumber,
        validMaterialPrice.priceDisplayForID(currency),
      );
      cartRobot
          .verifyCartTotalPrice(validTotalPrice.priceDisplayForID(currency));
      await cartRobot.tapToSeePriceBreakDown();
      cartRobot.verifySmallOrderFee(
        isMinOrderValue: false,
      );
    });

    testWidgets('EZRX-T65| Verify Available offers in the product detail page',
        (tester) async {
      await pumpAppWithHomeScreen(tester);

      await commonRobot.navigateToScreen(NavigationTab.products);
      await productRobot.openSearchProductScreen();
      await productRobot.searchWithKeyboardAction(materialNumber);
      await productSuggestionRobot.tapSearchResult(materialNumber);
      final productName =
          productDetailRobot.getMaterialDetailsMaterialDescription();
      await productDetailRobot.openAvailableOffers();
      productDetailRobot.verifyNameProductOffer(productName);
      productDetailRobot.verifyCodeProductOffer(materialNumber);
      productDetailRobot.verifyQuantityProductDisplayedForTirePriceOffer();
      productDetailRobot.verifyButtonCloseDisplayed();
    });
    testWidgets('EZRX-T115 | Verify checkout cart when having pre-order items',
        (tester) async {
      const qty = 2;

      //init app
      await pumpAppWithHomeScreen(tester);
      await browseProductFromEmptyCart();

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
      oosPreOrderRobot.verifySheet(isVisible: true);
      oosPreOrderRobot.verifyCancelButton();
      oosPreOrderRobot.verifyContinueButton();
      oosPreOrderRobot.verifyWarningMessage();
      oosPreOrderRobot.verifyMaterial(oosPreOrderMaterialNumber, qty);
      oosPreOrderRobot.verifyExpiryDateAndBatch(
        oosPreOrderMaterialNumber,
        oosPreOrderMaterialStockInfo,
        isBatchNumberVisible: false,
      );
      await oosPreOrderRobot.tapExpiryDateInfoIcon(oosPreOrderMaterialNumber);
      await commonRobot.verifyExpiryDateBottomSheetAndTapClose();
      await oosPreOrderRobot.tapCancelButton();
      cartRobot.verifyPage();
      oosPreOrderRobot.verifySheet(isVisible: false);
      await cartRobot.tapCheckoutButton();
      oosPreOrderRobot.verifyMaterial(oosPreOrderMaterialNumber, qty);
      await oosPreOrderRobot.tapContinueButton();
      checkoutRobot.verifyPage();
    });
  });

  group('Checkout -', () {
    testWidgets('EZRX-T116 | Verify display checkout with default components',
        (tester) async {
      const qty = 30;
      const totalPrice = 5426400;
      const smallOrderFee = 0;
      const tax = 596904;
      const totalSaving = 1356600;
      const grandTotalPrice = 6023304;
      //init app
      await pumpAppWithHomeScreen(tester);
      await checkoutWithMaterial(materialNumber, qty);

      //verify
      checkoutRobot.verifyPage();
      checkoutRobot.verifyAddressSection();
      checkoutRobot.verifyCustomerCode(customerCode);
      checkoutRobot.verifyDeliveryTo(shipToCode);
      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      // Should be 2 here because material has offer
      await checkoutRobot.verifyYoursItemLabel(1);
      await checkoutRobot.verifyMaterial(materialNumber);
      checkoutRobot.verifyMaterialExpiryDateAndBatch(
        materialNumber,
        materialStockInfo,
        isBatchNumberVisible: false,
      );
      await checkoutRobot.tapMaterialExpiryDateInfoIcon(materialNumber);
      await commonRobot.verifyExpiryDateBottomSheetAndTapClose();
      await checkoutRobot
          .verifySubTotalLabel(totalPrice.priceDisplayForID(currency));
      await checkoutRobot
          .verifySmallOrderFeeLabel(smallOrderFee.priceDisplayForID(currency));
      await checkoutRobot.verifyTaxLabel(tax.priceDisplayForID(currency));
      await checkoutRobot
          .verifyGrandTotalLabel(grandTotalPrice.priceDisplayForID(currency));
      await checkoutRobot
          .verifyTotalSavingLabel(totalSaving.priceDisplayForID(currency));
      checkoutRobot.verifyStickyTotalQty(1);
      checkoutRobot
          .verifyStickyGrandTotal(grandTotalPrice.priceDisplayForID(currency));
      await checkoutRobot.tapStickyGrandTotal();
      orderPriceSummaryRobot.verifySheet(isVisible: true);
      orderPriceSummaryRobot
          .verifySubTotalLabel(totalPrice.priceDisplayForID(currency));
      orderPriceSummaryRobot
          .verifySmallOrderFeeLabel(smallOrderFee.priceDisplayForID(currency));
      orderPriceSummaryRobot
          .verifyGrandTotalLabel(grandTotalPrice.priceDisplayForID(currency));
      orderPriceSummaryRobot
          .verifyTotalSavingLabel(totalSaving.priceDisplayForID(currency));
      await orderPriceSummaryRobot.tapCloseButton();
      orderPriceSummaryRobot.verifySheet(isVisible: false);
      checkoutRobot.verifyPlaceOrderButton();
    });

    testWidgets(
        'EZRX-T118 | Validate fields in checkout and go to order submitted',
        (tester) async {
      const emptyPoReference = 'NA';

      //init app
      await pumpAppWithHomeScreen(tester);
      await checkoutWithMaterial(materialNumber, 30);

      //verify
      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      await checkoutRobot.tapPlaceOrderButton();
      checkoutRobot.verifyEmptyPoReferenceMessage(isVisible: false);
      orderSuccessRobot.verifyPage();
      orderSuccessRobot.verifyPoReference(emptyPoReference);
    });

    testWidgets('EZRX-T119 | Verify display of bonus in checkout',
        (tester) async {
      const qty = 2;
      const totalPrice = 173120;
      const smallOrderFee = 0;
      const tax = 19043;
      const totalSaving = 43280;
      const grandTotalPrice = 192163;
      //init app
      await pumpAppWithHomeScreen(tester);
      await checkoutWithMaterial(bonusMaterialNumber, qty);

      //verify
      checkoutRobot.verifyPage();
      checkoutRobot.verifyAddressSection();
      checkoutRobot.verifyCustomerCode(customerCode);
      checkoutRobot.verifyDeliveryTo(shipToCode);
      await checkoutRobot.verifyPoReferenceField(isVisible: true);
      // Should be 2 here because material has offer
      await checkoutRobot.verifyYoursItemLabel(1);
      await checkoutRobot.verifyMaterial(bonusMaterialNumber);
      await checkoutRobot
          .verifySubTotalLabel(totalPrice.priceDisplayForID(currency));
      await checkoutRobot
          .verifySmallOrderFeeLabel(smallOrderFee.priceDisplayForID(currency));
      await checkoutRobot.verifyTaxLabel(tax.priceDisplayForID(currency));
      await checkoutRobot
          .verifyGrandTotalLabel(grandTotalPrice.priceDisplayForID(currency));
      await checkoutRobot
          .verifyTotalSavingLabel(totalSaving.priceDisplayForID(currency));
      checkoutRobot.verifyStickyTotalQty(1);
      checkoutRobot
          .verifyStickyGrandTotal(grandTotalPrice.priceDisplayForID(currency));
      await checkoutRobot.tapStickyGrandTotal();
      orderPriceSummaryRobot.verifySheet(isVisible: true);
      orderPriceSummaryRobot
          .verifySubTotalLabel(totalPrice.priceDisplayForID(currency));
      orderPriceSummaryRobot
          .verifySmallOrderFeeLabel(smallOrderFee.priceDisplayForID(currency));
      orderPriceSummaryRobot
          .verifyGrandTotalLabel(grandTotalPrice.priceDisplayForID(currency));
      orderPriceSummaryRobot
          .verifyTotalSavingLabel(totalSaving.priceDisplayForID(currency));
      await orderPriceSummaryRobot.tapCloseButton();
      orderPriceSummaryRobot.verifySheet(isVisible: false);
      checkoutRobot.verifyPlaceOrderButton();
    });
  });

  group('Order success -', () {
    testWidgets(
        'EZRX-T123 | Verify display order submitted with default components + close page',
        (tester) async {
      //init app
      await pumpAppWithHomeScreen(tester);
      await checkoutWithMaterial(materialNumber, 30);

      //verify
      await checkoutRobot.tapPlaceOrderButton();
      orderSuccessRobot.verifyPage();
      await orderSuccessRobot.verifyOrderSubmittedMessage();
      await orderSuccessRobot.dismissSnackbar();
      orderSuccessRobot.verifyOrderId();
      orderSuccessRobot.verifyOrderDate();
      await orderSuccessRobot.verifyOrderSummarySection();

      await orderSuccessRobot.tapCloseButton();
      productRobot.verifyPageVisible();
      await productRobot.tapCartButton();
      cartRobot.verifyPage();
      cartRobot.verifyNoRecordFound();
    });

    testWidgets('EZRX-T125 | Verify display material in order submitted',
        (tester) async {
      const qty = 30;
      const totalPrice = 5426400;
      const smallOrderFee = 0;
      const manualFee = 0;
      const tax = 596904;
      const totalSaving = 1356600;
      const grandTotalPrice = 6023304;
      //init app
      await pumpAppWithHomeScreen(tester);
      await checkoutWithMaterial(materialNumber, qty);
      await checkoutRobot.tapPlaceOrderButton();
      await orderSuccessRobot.dismissSnackbar();

      //verify
      await orderSuccessRobot.verifyOrderSummarySection();
      await orderSuccessRobot
          .verifySubTotal(totalPrice.priceDisplayForID(currency));
      await orderSuccessRobot.verifyTax(tax.priceDisplayForID(currency));
      await orderSuccessRobot
          .verifySmallOrderFee(smallOrderFee.priceDisplayForID(currency));
      await orderSuccessRobot
          .verifyManualFee(manualFee.priceDisplayForID(currency));
      await orderSuccessRobot
          .verifyGrandTotal(grandTotalPrice.priceDisplayForID(currency));
      await orderSuccessRobot
          .verifyTotalSaving(totalSaving.priceDisplayForID(currency));
      await orderSuccessRobot.verifyOrderItemTotalQty(1);
    });
//TODO we do not have any material with bonus material on offer
    // testWidgets(
    //     'EZRX-T125 | Verify display material on offer with bonus in order submitted',
    //     (tester) async {
    //   const qty = 1000;
    //   const bonusQty = qty ~/ bonusMaterialNumberTierQty;
    //   final totalPrice =
    //       (bonusMaterialNumberUnitPrice * qty).priceDisplay(currency);

    //   //init app
    //   await pumpAppWithHomeScreen(tester);
    //   await checkoutWithMaterial(bonusMaterialNumber, qty, isPreOrder: true);
    //   await checkoutRobot.tapPlaceOrderButton();
    //   await orderSuccessRobot.dismissSnackbar();

    //   //verify
    //   await orderSuccessRobot.verifyOrderSummarySection();
    //   await orderSuccessRobot.verifySubTotal(totalPrice);
    //   await orderSuccessRobot.verifyGrandTotal(totalPrice);
    //   await orderSuccessRobot.verifyOrderItemTotalQty(2);
    //   await orderSuccessRobot.startVerifyMaterial(index: 0);
    //   orderSuccessRobot.verifyMaterialNumber(bonusMaterialNumber);
    //   orderSuccessRobot.verifyMateriaDescription(bonusMaterialName);
    //   orderSuccessRobot.verifyItemQty(qty);
    //   orderSuccessRobot.verifyMaterialOnOfferTag();
    //   orderSuccessRobot.verifyMaterialUnitPrice(
    //     bonusMaterialNumberUnitPrice.priceDisplay(currency),
    //   );
    //   orderSuccessRobot.verifyMaterialTotalPrice(totalPrice);
    //   await orderSuccessRobot.startVerifyMaterial(index: 1);
    //   orderSuccessRobot.verifyMaterialNumber(bonusMaterialNumber);
    //   orderSuccessRobot.verifyMateriaDescription(bonusMaterialName);
    //   orderSuccessRobot.verifyItemQty(bonusQty);
    //   orderSuccessRobot.verifyMaterialBonusTag();
    //   orderSuccessRobot.verifyMaterialUnitPrice(
    //     0.priceDisplay(currency),
    //     isFree: true,
    //   );
    //   orderSuccessRobot.verifyMaterialTotalPrice(
    //     0.priceDisplay(currency),
    //     isFree: true,
    //   );
    // });
  });

  group('Order Tab -', () {
    final fromDate = DateTime.now().subtract(const Duration(days: 150));
    final toDate = DateTime.now().subtract(const Duration(days: 2));
    group('View by items -', () {
      testWidgets('EZRX-T69 | Verify display list of order (with/without data)',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyTabBar();
        ordersRootRobot.verifyViewByItemsPage();
        ordersRootRobot.verifySearchBar();
        ordersRootRobot.verifyFilterButton();
        ordersRootRobot.verifyFilterApplied(0);
        await ordersRootRobot.switchToViewByOrders();
        ordersRootRobot.verifyViewByOrdersPage();
        ordersRootRobot.verifySearchBar();
        ordersRootRobot.verifyFilterButton();
        ordersRootRobot.verifyFilterApplied(0);
        await ordersRootRobot.switchToViewByItems();
        ordersRootRobot.verifyViewByItemsPage();

        await ordersRootRobot.tapFilterButton();
        viewByItemsFilterRobot.verifyApplyButton();
        viewByItemsFilterRobot.verifyResetButton();
        viewByItemsFilterRobot.verifyDefaultFilterApplied();
        await viewByItemsFilterRobot.tapCloseIcon();
        viewByItemsRobot.verifyOrders();
        await commonRobot.pullToRefresh();
        viewByItemsRobot.verifyOrders();

        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        viewByItemsRobot.verifyNoRecordFound();
        await commonRobot.pullToRefresh();
        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        viewByItemsRobot.verifyNoRecordFound();
      });

      testWidgets(
          'EZRX-T75 | Verify search by material number/material description/order number',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();
        await commonRobot.searchWithKeyboardAction(invalidLengthSearchKey);
        await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar();
        await commonRobot.searchWithKeyboardAction(orderMaterialName);
        viewByItemsRobot.verifyOrdersWithProductName(orderMaterialName);
        await commonRobot.pullToRefresh();
        commonRobot.verifySearchBarText('');

        await commonRobot.searchWithSearchIcon(orderMaterialNumber);
        viewByItemsRobot.verifyOrdersWithProductCode(orderMaterialNumber);
        await commonRobot.pullToRefresh();

        await commonRobot.autoSearch(invalidLengthSearchKey);
        await commonRobot.waitAutoSearchDuration();
        await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar(
          isVisible: false,
        );
        await commonRobot.pullToRefresh();

        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        viewByItemsRobot.verifyNoRecordFound();
        await commonRobot.tapClearSearch();
        commonRobot.verifySearchBarText('');
        viewByItemsRobot.verifyOrders();
      });

      testWidgets(
          'EZRX-T81 | Verify Filter by date when having result found in View by items tab',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();
        await ordersRootRobot.tapFilterButton();
        await viewByItemsFilterRobot.tapFromDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
        );
        await viewByItemsFilterRobot.tapApplyButton();
        ordersRootRobot.verifyFilterApplied(1);
        viewByItemsRobot.verifyOrderGroupInDateRange(
          fromDate: fromDate,
          toDate: toDate,
        );
        await ordersRootRobot.tapFilterButton();
        viewByItemsFilterRobot.verifyDateRangeFilterApplied(
          fromDate.displayDate,
          toDate.displayDate,
        );
        await viewByItemsFilterRobot.tapCloseIcon();

        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        viewByItemsRobot.verifyNoRecordFound();
        await commonRobot.pullToRefresh();
        ordersRootRobot.verifyFilterApplied(0);
        viewByItemsRobot.verifyOrderItems();
      });

      testWidgets(
          'EZRX-T85 | Verify Filter by status when selecting 1 checkbox and existing data available',
          (tester) async {
        const statusFilter = 'Order created';

        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        ordersRootRobot.verifyViewByItemsPage();
        await ordersRootRobot.tapFilterButton();
        await viewByItemsFilterRobot.tapFromDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
        );
        await viewByItemsFilterRobot.tapStatusCheckbox(statusFilter);
        viewByItemsFilterRobot.verifyStatusFilterValue(statusFilter, true);
        await viewByItemsFilterRobot.tapStatusCheckbox(statusFilter);
        viewByItemsFilterRobot.verifyStatusFilterValue(statusFilter, false);
        await viewByItemsFilterRobot.tapStatusCheckbox(statusFilter);
        viewByItemsFilterRobot.verifyStatusFilterValue(statusFilter, true);
        await viewByItemsFilterRobot.tapApplyButton();
        ordersRootRobot.verifyFilterApplied(2);
        viewByItemsRobot.verifyOrderGroupInDateRange(
          fromDate: fromDate,
          toDate: toDate,
        );
        viewByItemsRobot.verifyOrderGroups();
        viewByItemsRobot.verifyOrderItems();

        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        viewByItemsRobot.verifyNoRecordFound();
        await commonRobot.pullToRefresh();
        ordersRootRobot.verifyFilterApplied(0);
        viewByItemsRobot.verifyOrderItems();
      });
    });

    group('View by orders - ', () {
      testWidgets(
          'EZRX-T71 | Verify display items in View by orders tab with data available',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);
        await ordersRootRobot.switchToViewByOrders();

        //verify
        ordersRootRobot.verifyViewByOrdersPage();
        ordersRootRobot.verifyFilterApplied(0);
        await ordersRootRobot.tapFilterButton();
        viewByOrdersFilterRobot.verifyApplyButtonVisible();
        viewByOrdersFilterRobot.verifyResetButtonVisible();
        viewByOrdersFilterRobot.verifyDefaultFilterApplied();
        await viewByOrdersFilterRobot.tapCloseIcon();
        viewByOrdersRobot.verifyOrdersForID();
        await commonRobot.pullToRefresh();
        viewByOrdersRobot.verifyOrdersForID();
      });

      testWidgets(
          'EZRX-T74 | Verify display items in View by orders tab with no data available with auto search feature',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);
        await ordersRootRobot.switchToViewByOrders();

        //verify
        ordersRootRobot.verifyViewByOrdersPage();
        ordersRootRobot.verifyFilterApplied(0);
        viewByOrdersRobot.verifyOrdersForID();
        final orderId = viewByOrdersRobot.getOrderIdText(index: 0);
        await commonRobot.autoSearch(invalidSearchKey);
        viewByOrdersRobot.verifyNoRecordFound();
        await commonRobot.autoSearch(invalidLengthSearchKey);
        await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar(
          isVisible: false,
        );
        viewByOrdersRobot.verifyNoRecordFound();
        await commonRobot.autoSearch(orderId);
        viewByOrdersRobot.verifyOrdersForID();
      });

      testWidgets(
          'EZRX-T78 | Verify search my order history by inputting keyword contains Order code in View by orders tab',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);
        await ordersRootRobot.switchToViewByOrders();

        //verify
        final orderId = viewByOrdersRobot.getOrderIdText(index: 0);
        viewByOrdersRobot.verifyOrdersForID();
        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        viewByOrdersRobot.verifyNoRecordFound();
        await commonRobot.searchWithKeyboardAction(invalidLengthSearchKey);
        await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar();
        viewByOrdersRobot.verifyNoRecordFound();
        await commonRobot.searchWithKeyboardAction(orderId);
        viewByOrdersRobot.verifyOrdersWithOrderCode(orderId);
        await commonRobot.waitAutoSearchDuration();
        commonRobot.verifyLoadingImage(isVisible: false);
      });

      testWidgets(
          'EZRX-T80 | Verify search my order history by inputting keyword not contain order code in View by orders tab',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);
        await ordersRootRobot.switchToViewByOrders();

        //verify
        viewByOrdersRobot.verifyOrdersForID();
        await commonRobot.searchWithSearchIcon(invalidSearchKey);
        viewByOrdersRobot.verifyNoRecordFound();
        await commonRobot.waitAutoSearchDuration();
        commonRobot.verifyLoadingImage(isVisible: false);
        await commonRobot.tapClearSearch();
        viewByOrdersRobot.verifyOrdersForID();
        await commonRobot.searchWithSearchIcon(invalidLengthSearchKey);
        await commonRobot.verifyAndDismissInvalidLengthSearchMessageSnackbar();
      });

      testWidgets(
          'EZRX-T83 | Verify Filter by date when no having result found in View by orders tab',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);
        await ordersRootRobot.switchToViewByOrders();

        //verify
        await ordersRootRobot.tapFilterButton();
        await viewByOrdersFilterRobot.tapFromDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
        );
        await viewByOrdersFilterRobot.tapApplyButton();
        ordersRootRobot.verifyFilterApplied(1);
        await commonRobot.searchWithKeyboardAction(invalidSearchKey);
        viewByOrdersRobot.verifyNoRecordFound();
      });

      testWidgets(
          'EZRX-T84 | Verify Filter by date when having result found in View by orders tab',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);
        await ordersRootRobot.switchToViewByOrders();

        //verify
        await ordersRootRobot.tapFilterButton();
        await viewByOrdersFilterRobot.tapToDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
        );
        await viewByOrdersFilterRobot.tapApplyButton();
        ordersRootRobot.verifyFilterApplied(1);
        viewByOrdersRobot.verifyOrderGroupInDateRange(
          fromDate: fromDate,
          toDate: toDate,
        );
      });

      testWidgets(
          'EZRX-T86 | Verify Filter by status when having result found in View by orders tab',
          (tester) async {
        const statusFilter = 'Order received';
        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);
        await ordersRootRobot.switchToViewByOrders();

        //verify
        await ordersRootRobot.tapFilterButton();
        await viewByOrdersFilterRobot.tapStatusCheckbox(statusFilter);
        viewByOrdersFilterRobot.verifyStatusFilterValue(statusFilter, true);
        await viewByOrdersFilterRobot.tapStatusCheckbox(statusFilter);
        viewByOrdersFilterRobot.verifyStatusFilterValue(statusFilter, false);
        await viewByOrdersFilterRobot.tapStatusCheckbox(statusFilter);
        viewByOrdersFilterRobot.verifyStatusFilterValue(statusFilter, true);
        await viewByOrdersFilterRobot.tapApplyButton();
        ordersRootRobot.verifyFilterApplied(1);
      });

      testWidgets('EZRX-T217 | Verify click on reset button in filter',
          (tester) async {
        const index = 0;
        final fromDate = DateTime.now().subtract(const Duration(days: 100));
        final toDate = DateTime.now().subtract(const Duration(days: 99));

        //init app
        await pumpAppWithHomeScreen(tester);
        await commonRobot.navigateToScreen(NavigationTab.orders);
        await ordersRootRobot.switchToViewByOrders();

        //verify
        ordersRootRobot.verifyFilterApplied(0);
        viewByOrdersRobot.verifyOrdersForID();
        final orderId = viewByOrdersRobot.getOrderIdText(index: index);
        await ordersRootRobot.tapFilterButton();
        await viewByOrdersFilterRobot.tapToDateField();
        await commonRobot.setDateRangePickerValue(
          fromDate: fromDate,
          toDate: toDate,
        );
        await viewByOrdersFilterRobot.tapApplyButton();
        viewByOrdersRobot.verifyOrderIdText(
          orderId,
          index: index,
          isVisible: false,
        );
        await ordersRootRobot.tapFilterButton();
        await viewByOrdersFilterRobot.tapResetButton();
        viewByOrdersRobot.verifyOrdersForID();
        viewByOrdersRobot.verifyOrderIdText(
          orderId,
          index: index,
          isVisible: true,
        );
        await ordersRootRobot.tapFilterButton();
        viewByOrdersFilterRobot.verifyDefaultFilterApplied();
      });

      testWidgets('EZRX-T72 | Verify click on Buy again in View by orders tab',
          (tester) async {
        //init app
        await pumpAppWithHomeScreen(tester);
        await clearCart();
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify

        await ordersRootRobot.switchToViewByOrders();
        await commonRobot.pullToRefresh();
        await commonRobot.autoSearch(orderNumber);
        await viewByOrdersRobot.tapFirstBuyAgainButton();
        cartRobot.verifyPage();
        await cartRobot.verifyMaterial(materialNumber);
        cartRobot.verifyMaterialQty(materialNumber, 2);
      });

      testWidgets(
          'EZRX-T90 | Verify click on Buy again in Order detail via View by orders tab when having existing items in Cart',
          (tester) async {
        const orderQty = 2;
        const cartQty = 3;
        //init app
        await pumpAppWithHomeScreen(tester);

        //setup data
        await clearCart();
        await commonRobot.navigateToScreen(NavigationTab.products);
        await productRobot.openSearchProductScreen();
        await productSuggestionRobot.searchWithKeyboardAction(materialNumber);
        await productSuggestionRobot.tapSearchResult(materialNumber);
        await productDetailRobot.tapAddToCart();
        await productDetailRobot.dismissSnackbar();
        await productDetailRobot.tapCartButton();
        await cartRobot.changeMaterialQty(materialNumber, cartQty);
        await cartRobot.tapCloseButton();
        await productDetailRobot.tapBackButton();
        await productSuggestionRobot.tapToBackScreen();
        await commonRobot.navigateToScreen(NavigationTab.orders);

        //verify
        await ordersRootRobot.switchToViewByOrders();
        await commonRobot.pullToRefresh();
        await commonRobot.autoSearch(orderNumber);
        await viewByOrdersRobot.tapFirstBuyAgainButton();
        cartRobot.verifyPage();
        await cartRobot.verifyMaterial(materialNumber);
        cartRobot.verifyMaterialQty(materialNumber, orderQty + cartQty);
      });
    });
  });

  tearDown(() async {
    locator<ZephyrService>().setNameAndStatus();
    await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  });
}
