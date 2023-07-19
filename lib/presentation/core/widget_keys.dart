import 'package:flutter/material.dart';

class WidgetKeys {
  //============================================================
  //  COMMON
  //============================================================

  static const Key closeButton = Key('closeButton');
  static const Key filterResetButton = Key('filterResetButton');
  static const Key filterApplyButton = Key('filterApplyButton');
  static const Key productImage = Key('productImage');

  //============================================================
  //  LOGIN
  //============================================================

  static const Key loginMobileScreen = Key('loginMobileScreen');
  static const Key loginWebScreen = Key('loginMobileScreen');
  static const Key loginUsernameField = Key('loginUsernameField');
  static const Key loginPasswordField = Key('loginPasswordField');
  static const Key loginPasswordFieldSuffixIcon =
      Key('loginPasswordFieldSuffixIcon');
  static const Key loginRememberPasswordCheckbox =
      Key('loginRememberPasswordCheckbox');
  static const Key loginSubmitButton = Key('loginSubmitButton');
  static const Key ssoLoginButton = Key('ssoLoginButton');
  static const Key appMarketSelector = Key('appMarketSelector');
  static const Key createAccountButton = Key('createAccountButton');
  //============================================================
  //  AupTCDialog
  //============================================================
  static const Key aupTcWebView = Key('aupTcWebView');
  //============================================================
  //  HOME TAB BAR
  //============================================================

  static const Key homeTabBar = Key('homeTabBar');
  static const Key homeTab = Key('homeTab');
  static const Key productsTab = Key('productsTab');
  static const Key ordersTab = Key('ordersTab');
  static const Key notificationTab = Key('notificationTab');
  static const Key moreTab = Key('moreTab');
  static const Key aupTcScreen = Key('aupTcScreen');
  static const Key customerCodeSelector = Key('customerCodeSelector');
  static const Key homeTabAnnouncementWidget = Key('homeTabAnnouncementWidget');
  static const Key homeScreen = Key('homeScreen');
  static const Key homeProductSearchBar = Key('homeProductSearchBar');
  static const Key homeQuickAccessPanel = Key('homeQuickAccessPanel');
  static const Key homeQuickAccessWebLoginMenu =
      Key('homeQuickAccessWebLoginMenu');
  static const Key homeQuickAccessOrdersMenu = Key('homeQuickAccessOrdersMenu');
  static const Key homeQuickAccessReturnsMenu =
      Key('homeQuickAccessReturnsMenu');
  static const Key homeQuickAccessPaymentsMenu =
      Key('homeQuickAccessPaymentsMenu');
  static const Key homeQuickAccessLoyaltyMenu =
      Key('homeQuickAccessLoyaltyMenu');
  static const Key homeQuickAccessChatSupportMenu =
      Key('homeQuickAccessChatSupportMenu');

  //============================================================
  //  MORE TAB BAR
  //============================================================
  static const Key profileTile = Key('profileTile');

  //  Change Delivery Address BottomSheet
  //============================================================
  static const Key cancelButton = Key('cancel_button');
  static const Key confirmButton = Key('confirm_change_delivery_address');

  //============================================================
  //  CustomerCode Search Page
  //============================================================
  static const Key customerSearchPage = Key('customerSearchPage');
  static const Key customerCodeSelect = Key('customerCodeSelect');
  static const Key customerCodeSearch = Key('customerCodeSearchField');
  static const Key customerCodeSearchSuffixIcon =
      Key('customerCodeSearchSuffixIcon');
  static Key customerDeliveryAddressOption(String shipToName) =>
      Key('customerDeliveryAddressOption$shipToName');

  //============================================================
  //  ShipToSearch page Keys
  //============================================================
  static const Key shipToSearchPage = Key('shipToSearchPage');
  static const Key shipToCodeSearchField = Key('shipToCodeSearchField');
  static const Key shipToCodeSelect = Key('shipToCodeSelect');
  static Key shipToAddressOption(String shipToCustomerCode) =>
      Key('shipToOption$shipToCustomerCode');

  //============================================================
  //  CovidMaterialListSearch Page Keys
  //============================================================

  static Key covidMaterialSearchField(String searchKey) =>
      Key('covidMaterialSearchField$searchKey');
  //============================================================
  //  Payment TAB BAR
  //============================================================
  static const Key paymentsTabPage = Key('paymentsTabPage');
  static const Key accountSummaryTab = Key('accountSummaryPage');
  static const Key paymentsSummaryTab = Key('paymentsSummaryPage');
  static const Key statementSummaryTab = Key('statementSummaryPage');

  //============================================================
  //  MaterialListSearch Page Keys
  //============================================================

  static Key materialSearchField(String searchKey) =>
      Key('materialSearchField$searchKey');
  static const Key materialListPage = Key('materialListPage');

  //============================================================
  //  MaterialFilterSearch Page Keys
  //============================================================

  static const Key materialFilterSearchField = Key('materialFilterSearchField');
  static const Key clearSearchFilter = Key('clearSearchFilter');
  static const Key materialFilterPage = Key('materialFilterPage');
  static const Key applyMaterialFilter = Key('applyMaterialFilter');

  //============================================================
  //  Search Bonus page Keys
  //============================================================
  static Key addBonusTextField(String searchKey) =>
      Key('addBonusTextField$searchKey');
  static Key addItem(String materialNumber) => Key('addItem$materialNumber');
  static const Key addBonus = Key('addBonus');
  static const Key addBonusEmpty = Key('empty');
  static const Key addBonusLoaderImage = Key('loaderImage');
  static const Key bonusItemList = Key('bonusItemList');

  //============================================================
  //  Combo Deal Page Keys
  //============================================================
  static const Key comboDealDetailPage = Key('comboDealDetailPage');

  //============================================================
  //  PolicyConfiguration page Keys
  //============================================================
  static const Key policyConfigurationLoader = Key('LoaderImage');
  static const Key policyConfigSearchBuilder = Key('policyConfigSearchBuilder');
  static Key policyConfigurationSearch(String searchKey) =>
      Key('policyConfigurationSearch$searchKey');

  //============================================================
  //  UserRestrictionList page Keys
  //============================================================
  static const Key userRestrictionListPage = Key('UserRestrictionListPage');
  static const Key userRestrictionListLoader = Key('LoaderImage');
  static const Key userRestrictionList = Key('userRestrictionList');
  static const Key userRestrictionListSearchField =
      Key('userRestrictionListSearchField');
  static Key userRestrictionTile(String userName) =>
      Key('userRestrictionTile-$userName');

  //============================================================
  //  SearchBar Keys
  //============================================================
  static const Key clearIconKey = Key('clearIconKey');
  static const Key searchIconKey = Key('searchIconKey');
  static const Key clearUserRestrictionListSearch =
      Key('clearUserRestrictionListSearch');
  static const Key clearPolicyConfigurationSearch =
      Key('clearPolicyConfigurationSearch');
  static const Key clearMaterialFilterSearch = Key('clearMaterialFilterSearch');
  static const Key clearMaterialListSearchBar = Key('clearSearch');
  static const Key clearCovidMaterialListSearchBar = Key('clearSearch');
  static const Key addBonusTextFieldClear = Key('addBonusTextFieldClear');
  static const Key clearShipToSearch = Key('clearShipToSearch');
  //============================================================
  //  Returns
  //============================================================

  static const Key returnRootPage = Key('returnRootPage');
  static const Key returnByItemPage = Key('returnByItemPage');
  static const Key returnByRequestRootPage = Key('returnByRequestRootPage');
  //============================================================
  //  Reset Password
  //============================================================

  static const Key forgotUsernameField = Key('forgotUsernameField');

  //============================================================
  //  BANNER
  //============================================================

  static const Key visibilityDetector = Key('visibilityDetector');

  static const Key homeBanner = Key('homeBanner');

  //============================================================
  //  Presentation/core Keys
  //============================================================
  static const Key staticHtmlViewer = Key('staticHtmlViewer');
  static const Key scrollList = Key('scrollList');
  static const Key loadMoreLoader = Key('loadIndicator');
  static const Key noRecordsFoundSearchIcon = Key('noRecordsFoundSearchIcon');
  static const Key loaderImage = Key('loaderImage');
  static const Key loader = Key('loader');
  static const Key webview = Key('webview');
  static Key balanceTextRow(String keyText, String valueText) =>
      Key('$keyText$valueText');

  //============================================================
  //  Quantity Input Widget Keys
  //============================================================
  static const Key cartItemAddKey = Key('cartItemAddKey');
  static const Key cartItemDeleteKey = Key('cartItemDeleteKey');
  static const Key quantityInputTextKey = Key('quantityInputTextKey');
  static const Key cartProductImage = Key('cartProductImage');
  static const Key startBrowsingProducts = Key('startBrowsingProducts');

  //============================================================
  //  Cart Page Keys
  //============================================================
  static const Key cartPage = Key('cartpage');
  static const Key totalSection = Key('totalSection');
  static const Key totalTaxKey = Key('totalTaxKey');
  static const Key grandTotalKey = Key('grandTotalKey');
  static const Key selectAllRadioButton = Key('selectAllRadioButton');
  static const Key taxCodeInPercentageKey = Key('taxCodeInPercentageKey');
  static const Key orderSummaryButton = Key('orderSummaryButton');
  static const Key checkoutButton = Key('checkoutButton');
  static const Key selectAllButton = Key('selectAllButton');
  static Key cartMaterialItemTile(String cartMaterialItemTileKey) =>
      Key(cartMaterialItemTileKey);
  static const Key cartButton = Key('cartButton');

  //============================================================
  //  Checkout Page Keys
  //============================================================
  static const Key checkoutPage = Key('checkoutPage');
  static const Key showDeliveryInfo = Key('showDeliveryInfo');
  static const Key checkoutProductImage = Key('checkoutProductImage');
  static const Key deliveryDate = Key('deliveryDate');

  //============================================================
  //  Material List
  //============================================================

  static const Key materialListPageAppBar = Key('materialListPageAppBar');
  static const Key materialListLoader = Key('LoaderImage');
  static const Key totalMaterialItemCount = Key('totalMaterialCount');
  static const Key materialListStockLabel = Key('stockLabel');
  static const Key materialListBundleCard = Key('bundleCard');
  static const Key materialListMaterialCard = Key('MaterialCard');
  static const Key priceLoading = Key('price-loading');
  static Key materialListBundleMaterial(String materialNumber) =>
      Key('bundleMaterialCard$materialNumber');
  //============================================================
  //  ProductSearch Keys
  //============================================================
  static const Key productSearchClearKey = Key('productClearIcon');
  static const Key productScanCameraKey = Key('productScanCameraKey');
  static const Key productSearchPage = Key('productSearchPage');
  static const Key materialFavouriteButton = Key('materialFavouriteButton');

  //============================================================
  //  ALL INVOICES
  //============================================================

  static const Key tempFilter = Key('tempFilter');
  static const Key fromDocumentDateField = Key('fromDocumentDateField');
  static const Key toDocumentDateField = Key('toDocumentDateField');
  static const Key fromDueDateField = Key('fromDueDateField');
  static const Key toDueDateField = Key('toDueDateField');
  static const Key amountValueFrom = Key('amountValueFrom');
  static const Key amountValueTo = Key('amountValueTo');
  //============================================================
  //  BundleDetails Keys
  //============================================================
  static const Key bundleDetailPage = Key('bundleDetailPage');
  static const Key bundleInputAddKey = Key('bundleInputAddKey');
  static const Key bundleInputDeleteKey = Key('bundleInputAddKey');
  static const Key bundleQuantityTextKey = Key('bundleInputAddKey');
  static const Key bundleAddToCartSheet = Key('bundleAddToCartSheet');
  static const Key bundleMaterialListItem = Key('bundleMaterialListItem');

  //============================================================
  //  Orders
  //============================================================

  static const Key materialDescription = Key('materialDescription');
  static const Key orderPriceLoading = Key('priceLoading');
  static const Key startBrowsingViewByItem = Key('startBrowsingViewByItem');

  //============================================================
  //  Order History
  //============================================================

  static const Key fromOrderDateField = Key('fromOrderDateField');
  static const Key toOrderDateField = Key('toOrderDateField');

  //============================================================
  //  Material Details
  //============================================================

  static const Key materialDetailsPageBack = Key('materialDetailsPageBack');
  static const Key materialDetailsPageCartIcon =
      Key('materialDetailsPageCartIcon');
  static const Key materialDetailsFloatingButton =
      Key('materialDetailsFloatingButton');
  static const Key materialDetailsCarousel = Key('materialDetailsCarousel');
  static const Key materialDetailsImageCounter =
      Key('materialDetailsImageCounter');
  static const Key materialDetailsMaterialNumber =
      Key('materialDetailsMaterialNumber');
  static const Key materialDetailsMaterialDescription =
      Key('materialDetailsMaterialDescription');
  static const Key materialDetailsFavouriteIcon =
      Key('materialDetailsMaterialFavouriteIcon');
  static const Key materialDetailsStock = Key('materialDetailsStock');
  static const Key materialDetailsInfoTile = Key('materialDetailsInfoTile');
  static const Key materialDetailsPromoShort = Key('materialDetailsPromoShort');
  static const Key materialDetailsPromo = Key('materialDetailsPromo');
  static const Key materialDetailsPromoSeeMore =
      Key('materialDetailsPromoSeeMore');
  static const Key materialDetailsQuantityInput =
      Key('materialDetailsQuantityInput');
  static const Key materialDetailsAddToCartButton =
      Key('materialDetailsAddToCartButton');
  //============================================================
  //  Return
  //============================================================

  static const Key fromReturnDateField = Key('fromReturnDateField');
  static const Key toReturnDateField = Key('toReturnDateField');
  static const Key fromReturnAmountField = Key('fromReturnAmountField');
  static const Key toReturnAmountField = Key('toReturnAmountField');

  //============================================================
  //  Payment Summary
  //============================================================
  static const Key invoiceTab = Key('invoiceTab');
  static const Key creditsTab = Key('creditsTab');
}
