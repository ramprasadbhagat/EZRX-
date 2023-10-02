import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../core/common.dart';
import '../../robots/common/common_robot.dart';
import '../../robots/common/enum.dart';
import '../../robots/login_robot.dart';
import '../../robots/products/filter_sort_product_robot.dart';
import '../../robots/products/product_detail_robot.dart';
import '../../robots/products/product_robot.dart';
import '../../core/infrastructure/infra_core/zephyr_service/zephyr_service.dart';
import '../../core/infrastructure/zephyr/repository/zephyr_repository.dart';
import '../../core/test_locator.dart';

void main() {
  late LoginRobot loginRobot;
  late ProductRobot productRobot;
  late CommonRobot commonRobot;
  late FilterSortProductRobot filterSortProductRobot;
  late ProductDetailRobot productDetailRobot;

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // initialize variables
  const marketMalaysia = 'Malaysia';
  const username = 'myclientuser';
  const password = 'St@ysafe01';
  const productNameSearch = 'BIPOLAR PENANG 61';
  const productNameInvalid = 'AUTO TEST';
  const productCode = '23270469';
  const manufacturerMaterial = 'BAXTER HEALTHCARE -M';
  const countryMaterial = 'Malaysia';
  const customerCode = '0070149863';
  const sortByZToA = 'Z-A';

  testWidgets('EZRX-T30 | Verify default and display items in Product list',
      (tester) async {
    //initialize necessary robots
    loginRobot = LoginRobot(tester);
    productRobot = ProductRobot(tester);
    commonRobot = CommonRobot(tester);
    filterSortProductRobot = FilterSortProductRobot(tester);
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
    await commonRobot.changeDeliveryAddress(customerCode);

    await commonRobot.navigateToScreen(NavigationTab.products);
    productRobot.verifyMaterialCartVisible();
    productRobot.verifyCartButtonVisible();
    productRobot.verifyLabelFilterFavoritesVisible();

    productRobot.verifyCustomerCodeSelectorVisible();
    productRobot.verifyAppTabBarVisible();
    productRobot.verifySearchBarVisible();

    await productRobot.openFilterProductScreen();

    filterSortProductRobot.verifyDefaultFilterProduct();
  });

  testWidgets('EZRX-T218 | Verify reset button in Product filter',
      (tester) async {
    //initialize necessary robots
    loginRobot = LoginRobot(tester);
    productRobot = ProductRobot(tester);
    commonRobot = CommonRobot(tester);
    filterSortProductRobot = FilterSortProductRobot(tester);
    //init app
    await runAppForTesting(tester);
    await commonRobot.changeDeliveryAddress(customerCode);

    await commonRobot.navigateToScreen(NavigationTab.products);

    final firstNameProduct = productRobot.getFistMaterialName();
    await productRobot.openFilterProductScreen();

    filterSortProductRobot.verifyDefaultFilterProduct();
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
    filterSortProductRobot.verifyDefaultFilterProduct();
  });

  testWidgets(
      'EZRX-T31 | Verify Search Product by inputting keyword contains product name',
      (tester) async {
    //initialize necessary robots
    loginRobot = LoginRobot(tester);
    productRobot = ProductRobot(tester);
    commonRobot = CommonRobot(tester);
    filterSortProductRobot = FilterSortProductRobot(tester);
    //init app
    await runAppForTesting(tester);
    await commonRobot.changeDeliveryAddress(customerCode);

    await productRobot.navigateToScreen(NavigationTab.products);
    productRobot.verifySearchBarVisible();
    await productRobot.openSearchProductScreen();
    await productRobot.searchWithKeyboardAction(productNameSearch);
    productRobot.verifySuggestProductsSearch(productNameSearch);

    await productRobot.autoSearch(productNameSearch);
    productRobot.verifySuggestProductsSearch(productNameSearch);
  });

  testWidgets(
      'EZRX-T32 | Verify Search Product by inputting keyword contains Product code',
      (tester) async {
    //initialize necessary robots
    loginRobot = LoginRobot(tester);
    productRobot = ProductRobot(tester);
    commonRobot = CommonRobot(tester);
    filterSortProductRobot = FilterSortProductRobot(tester);
    //init app
    await runAppForTesting(tester);
    await commonRobot.changeDeliveryAddress(customerCode);

    await commonRobot.navigateToScreen(NavigationTab.products);
    productRobot.verifySearchBarVisible();
    await productRobot.openSearchProductScreen();
    await productRobot.searchWithKeyboardAction('1');

    productRobot.verifyNoSuggestProductsSearch();

    await productRobot.searchWithKeyboardAction(productCode);
    productRobot.verifySuggestProductsSearch(productNameSearch);
  });

  testWidgets(
      'EZRX-T33 | Verify Search Product by inputting keyword not contain Product name/code',
      (tester) async {
    //initialize necessary robots
    loginRobot = LoginRobot(tester);
    productRobot = ProductRobot(tester);
    commonRobot = CommonRobot(tester);
    filterSortProductRobot = FilterSortProductRobot(tester);
    //init app
    await runAppForTesting(tester);
    await productRobot.changeDeliveryAddress(customerCode);

    await productRobot.navigateToScreen(NavigationTab.products);
    productRobot.verifySearchBarVisible();
    await productRobot.openSearchProductScreen();

    await productRobot.autoSearch(productNameSearch);
    productRobot.verifySuggestProductsSearch(productNameSearch);

    await productRobot.autoSearch(productNameInvalid);
    productRobot.verifyTextVisible(
      'That didn’t match anything',
    );
    productRobot.verifyTextVisible(
      'Try adjusting your search or filter selection to find what you’re looking for',
    );

    await productRobot.tapClearSearch();

    productRobot.verifyTextNotVisible(
      'That didn’t match anything',
    );
    productRobot.verifyTextNotVisible(
      'Try adjusting your search or filter selection to find what you’re looking for',
    );
  });

  testWidgets('EZRX-T34 | Verify Favorite list', (tester) async {
    //initialize necessary robots
    loginRobot = LoginRobot(tester);
    productRobot = ProductRobot(tester);
    commonRobot = CommonRobot(tester);
    filterSortProductRobot = FilterSortProductRobot(tester);
    productDetailRobot = ProductDetailRobot(tester);
    //init app
    await runAppForTesting(tester);
    await productRobot.changeDeliveryAddress(customerCode);

    await productRobot.navigateToScreen(NavigationTab.products);
    productRobot.verifyMaterialCartVisible();
    await productRobot.openDetailFirstProduct();
    await productDetailRobot.addProductToFavoriteList();
    final nameProduct =
        productDetailRobot.getMaterialDetailsMaterialDescription().toString();

    await productRobot.backToProductsScreen();
    await productRobot.filterFavoritesInProductsScreen();

    productRobot.verifyProductFilterMatched(nameProduct);

    await productRobot.openFilterProductScreen();

    filterSortProductRobot.verifyCheckboxCheckedShowProduct(
      'Favourites',
      true,
    );
  });

  testWidgets('EZRX-T35 | Verify display by Sort by Z-A', (tester) async {
    //initialize necessary robots
    loginRobot = LoginRobot(tester);
    productRobot = ProductRobot(tester);
    commonRobot = CommonRobot(tester);
    filterSortProductRobot = FilterSortProductRobot(tester);
    productDetailRobot = ProductDetailRobot(tester);
    //init app
    await runAppForTesting(tester);

    await productRobot.changeDeliveryAddress(customerCode);

    await productRobot.navigateToScreen(NavigationTab.products);
    productRobot.verifyMaterialCartVisible();
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
    //initialize necessary robots
    loginRobot = LoginRobot(tester);
    productRobot = ProductRobot(tester);
    commonRobot = CommonRobot(tester);
    filterSortProductRobot = FilterSortProductRobot(tester);
    productDetailRobot = ProductDetailRobot(tester);
    //init app
    await runAppForTesting(tester);

    await commonRobot.changeDeliveryAddress(customerCode);

    await commonRobot.navigateToScreen(NavigationTab.products);
    productRobot.verifyMaterialCartVisible();

    await productRobot.openFilterProductScreen();
    await filterSortProductRobot.openFilterManufacturerScreen();
    await filterSortProductRobot.searchWithKeyboardAction(manufacturerMaterial);
    filterSortProductRobot.verifyListManufacturerMatched(manufacturerMaterial);
    await filterSortProductRobot.tapFirstSuggestedManufacturer();
    await filterSortProductRobot.tapToBackIcon();
    filterSortProductRobot.verifyManufactureListSelectedVisible(1);
    await filterSortProductRobot.tapFilterApplyButton();

    productRobot.verifyManufacturerMaterialFilterMatched(manufacturerMaterial);
  });

  testWidgets('EZRX-T39 | Verify Filter by Country of origin', (tester) async {
    //initialize necessary robots
    loginRobot = LoginRobot(tester);
    productRobot = ProductRobot(tester);
    commonRobot = CommonRobot(tester);
    filterSortProductRobot = FilterSortProductRobot(tester);
    productDetailRobot = ProductDetailRobot(tester);
    //init app
    await runAppForTesting(tester);

    await commonRobot.changeDeliveryAddress(customerCode);

    await commonRobot.navigateToScreen(NavigationTab.products);
    productRobot.verifyMaterialCartVisible();

    await productRobot.openFilterProductScreen();
    await filterSortProductRobot.openFilterCountryOfOriginScreen();
    await filterSortProductRobot.searchWithKeyboardAction(countryMaterial);
    filterSortProductRobot.verifyListCountryOfOriginMatched(countryMaterial);
    await filterSortProductRobot.tapFirstSuggestedCountry();
    await commonRobot.tapToBackIcon();
    filterSortProductRobot.verifyCountryListSelectedVisible(1);
    await filterSortProductRobot.tapFilterApplyButton();

    await productRobot.openDetailFirstProduct();
    await productDetailRobot.openMaterialInformation();
    productDetailRobot.verifyCountryOfOriginDisplayed(countryMaterial);
  });

  testWidgets('EZRX-T40 | Verify combine filter with Sort conditions',
      (tester) async {
    //initialize necessary robots
    loginRobot = LoginRobot(tester);
    productRobot = ProductRobot(tester);
    commonRobot = CommonRobot(tester);
    filterSortProductRobot = FilterSortProductRobot(tester);
    productDetailRobot = ProductDetailRobot(tester);
    //init app
    await runAppForTesting(tester);

    await commonRobot.changeDeliveryAddress(customerCode);

    await commonRobot.navigateToScreen(NavigationTab.products);
    productRobot.verifyMaterialCartVisible();

    final firstProduct = productRobot.getFistMaterialName();
    await productRobot.openFilterProductScreen();
    await filterSortProductRobot.chooseSortProductsBy(sortByZToA);
    filterSortProductRobot.verifyRadioSort(
      sortByZToA,
      true,
    );

    await filterSortProductRobot.openFilterManufacturerScreen();
    await filterSortProductRobot.searchWithKeyboardAction(manufacturerMaterial);
    await filterSortProductRobot.tapFirstSuggestedManufacturer();
    await commonRobot.tapToBackIcon();

    await filterSortProductRobot.tapFilterApplyButton();

    productRobot.verifyMaterialCartVisible();
    productRobot.verifyManufacturerMaterialFilterMatched(manufacturerMaterial);
    productRobot.verifyProductSortChanged(firstProduct);
  });

  testWidgets('EZRX-T61 | Verify action click Cart icon in Product tab',
      (tester) async {
    //initialize necessary robots
    loginRobot = LoginRobot(tester);
    productRobot = ProductRobot(tester);
    commonRobot = CommonRobot(tester);
    filterSortProductRobot = FilterSortProductRobot(tester);
    productDetailRobot = ProductDetailRobot(tester);
    //init app
    await runAppForTesting(tester);

    await commonRobot.changeDeliveryAddress(customerCode);

    await commonRobot.navigateToScreen(NavigationTab.products);
    await productRobot.openCardCartPopup();
    productRobot.verifyCartPopupDisplayed();
  });

  tearDown(() async {
    locator<ZephyrService>().setNameAndStatus();
    await locator<ZephyrRepository>().zephyrUpdate(id: CycleKeyId.myClient);
  });
}
