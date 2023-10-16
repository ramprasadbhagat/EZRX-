import 'package:flutter/material.dart';

class WidgetKeys {
  //============================================================
  //  Generic Key
  //============================================================
  static Key genericKey({required String key}) => Key(key);

  //============================================================
  //  COMMON
  //============================================================

  static const Key closeButton = Key('closeButton');
  static const Key filterResetButton = Key('filterResetButton');
  static const Key filterApplyButton = Key('filterApplyButton');
  static const Key productImage = Key('productImage');
  static const Key customSnackBar = Key('customSnackBar');
  static const Key customSnackBarMessage = Key('customSnackBarMessage');
  static const Key snackBarDismissButton = Key('snackBarDismissButton');
  static const Key scrollToTopArrowIcon = Key('scrollToTopArrowIconKey');
  static const Key nextButton = Key('nextButton');
  static const Key backButton = Key('backButton');
  static const Key arrowButton = Key('arrowButton');
  static const Key commonTileItemHeader = Key('commonTileItemHeader');
  static const Key commonTileItemQty = Key('commonTileItemQty');
  static const Key commonTileItemLabel = Key('commonTileItemLabel');
  static const Key commonTileItemStatusLabel = Key('commonTileItemStatusLabel');
  static const Key commonTileItemTitle = Key('commonTileItemTitle');
  static const Key commonTileItemSubTitle = Key('commonTileItemSubTitle');
  static const Key confirmBottomSheetConfirmButton =
      Key('confirmBottomSheetConfirmButton');
  static const Key addToCartErrorSection = Key('addToCartErrorSection');
  static const Key productDetailList = Key('productDetailList');
  static const Key moreTapListContent = Key('moreTapListContent');
  static const Key settingTile = Key('settingTile');
  static const Key customBadge = Key('customBadge');
  static const Key addressInfoSectionActionLabel =
      Key('addressInfoSectionActionLabel');
  static const Key addressInfoSectionCustomerCodeLabel =
      Key('addressInfoSectionCustomerCodeLabel');
  static const Key addressInfoSectionDeliveryToLabel =
      Key('addressInfoSectionDeliveryToLabel');
  static Key statusTracker(String status) => Key('statusTracker$status');
  static const Key offerTag = Key('offerTag');
  //============================================================
  //  PRE-ORDER-MODAL
  //============================================================

  static const Key preOrderModalCancelButton = Key('cancelButton');
  static const Key preOrderModalContinueButton = Key('continueButton');

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
  static const Key productSearchSuggestion = Key('productSearchSuggestion');
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
  static const Key announcementsTab = Key('announcementsTab');
  static Key announcementsArticleTabItems(String tabItem) => Key(tabItem);
  static const Key browseProductIcon = Key('browseProductIcon');
  static const Key announcementIcon = Key('announcementIcon');
  static const Key iconArrow = Key('iconArrow');
  static const Key productsOnOffer = Key('productsOnOffer');
  static const Key bundles = Key('bundles');
  static const Key productOnOffer = Key('productOnOffer');
  static const Key iconLabelOffer = Key('iconLabelOffer');
  static const Key materialNumberInfo = Key('materialNumberInfo');
  static const Key bundlesLabel = Key('bundlesLabel');
  static const Key bundlesNumber = Key('bundlesNumber');
  static const Key bundlesDescription = Key('bundlesDescription');
  static const Key bundlesManufactured = Key('bundlesManufactured');
  static const Key bundlesList = Key('bundlesList');
  static const Key listRecentlyOrdered = Key('listRecentlyOrdered');
  static const Key materialDescriptionRecentlyOrdered =
      Key('materialDescriptionRecentlyOrdered');
  static const Key browseProductsList = Key('browseProductsList');
  static const Key announcementsList = Key('announcementsList');
  static const Key announcementTitle = Key('announcementTitle');
  static Key sectionTileIcon(String title) => Key('sectionTitleIcon$title');

  //============================================================
  //  MORE TAB BAR
  //============================================================
  static const Key moreScreen = Key('moreScreen');
  static const Key logOutTile = Key('logOutTile');
  static const Key profileTileSection = Key('profileTileSection');
  static const Key profileTile = Key('profileTile');
  static const Key paymentsTile = Key('paymentsTile');
  static const Key returnsTile = Key('returnsTile');
  static const Key securityTile = Key('securityTile');
  static const Key contactUsTile = Key('contactUsTile');
  static const Key proxyLoginUserNameField = Key('proxyLoginUserNameField');
  static const Key proxyLoginButton = Key('proxyLoginButton');
  static const Key proxyLoginSheet = Key('proxyLoginSheet');
  static const Key loginOnBehalfButtonKey = Key('loginOnBehalfButtonKey');
  static const Key loginOnBehalfLoginButtonKey =
      Key('loginOnBehalfLoginButtonKey');
  static const Key loginOnBehalfCancelButtonKey =
      Key('loginOnBehalfCancelButtonKey');
  static const Key aboutUsFloatingButton = Key('aboutUsFloatingButton');
  static const Key announcementArticleTile = Key('announcementArticleTile');

  //  Change Delivery Address BottomSheet
  //============================================================
  static const Key cancelButton = Key('cancel_button');
  static const Key confirmButton = Key('confirm_change_delivery_address');

  //============================================================
  //  CustomerCode Search Page
  //============================================================
  static const Key customerSearchPage = Key('customerSearchPage');
  static const Key customerCodeList = Key('customerCodeList');
  static const Key customerCodeSelect = Key('customerCodeSelect');
  static const Key customerCodeSearch = Key('customerCodeSearchField');
  static const Key customerCodeSearchSuffixIcon =
      Key('customerCodeSearchSuffixIcon');
  static Key customerDeliveryAddressOption(String shipToName) =>
      Key('customerDeliveryAddressOption$shipToName');
  static const Key customerCode = Key('customerCode');

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
  static const Key paymentsSummaryTab = Key('paymentsSummaryPage');

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
  static const Key filterProductIcon = Key('filterProductIcon');
  static Key showProductCheckbox(String type) => Key('checkbox$type');
  static Key sortByRadio(String type) => Key('radioSort$type');
  static const Key clearSearchFilter = Key('clearSearchFilter');
  static const Key searchProductField = Key('searchProductField');
  static const Key txtSearchProductField = Key('txtSearchProductField');
  static const Key favoritesIcon = Key('favoritesIcon');
  static const Key suggestedProductsTile = Key('suggestedProductsTile');
  static const Key suggestedManufacturer = Key('suggestedManufacturer');
  static const Key suggestedManufacturerText = Key('suggestedManufacturerText');
  static const Key suggestedCountry = Key('suggestedCountry');
  static const Key suggestedCountryText = Key('suggestedCountryText');
  static const Key materialFilterPage = Key('materialFilterPage');
  static const Key applyMaterialFilter = Key('applyMaterialFilter');
  static const Key searchManufacturerFilterField =
      Key('searchManufacturerFilterField');
  static const Key manufacturerFilterSelected =
      Key('manufacturerFilterSelected');
  static const Key manufacturerMaterials = Key('manufacturerMaterials');
  static const Key expandIcon = Key('expandIcon');
  static const Key materialDosage = Key('materialDosage');
  static const Key materialHowToUse = Key('materialHowToUse');
  static const Key materialComposition = Key('materialComposition');
  static const Key countryListSelectedLength = Key('countryListSelectedLength');
  static const Key manufactureListSelectedLength =
      Key('manufactureListSelectedLength');
  static const Key materialDeliveryInstructions =
      Key('materialDeliveryInstructions');

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
  static const Key getComboDealButton = Key('getComboDealButton');
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
  static const Key availableCreditTabSearchBarKey =
      Key('availableCreditTabSearchBarKey');
  static const Key outstandingInvoiceTabSearchBarKey =
      Key('outstandingInvoiceTabSearchBarKey');

  //============================================================
  //  Returns
  //============================================================
  static const Key returnRootPage = Key('returnRootPage');
  static const Key returnByItemTab = Key('viewByItems');
  static const Key returnByRequestTab = Key('viewByReturnRequests');
  static const Key returnByItemPage = Key('returnByItemPage');
  static const Key returnByRequestRootPage = Key('returnByRequestRootPage');
  static const Key fromReturnDateField = Key('fromReturnDateField');
  static const Key toReturnDateField = Key('toReturnDateField');
  static Key returnStatusFilter(String name, bool value) =>
      Key('returnStatusFilter$name$value');

  //============================================================
  //  New Return Request
  //============================================================
  // step 1
  static const Key newRequestSearchItem = Key('newRequestSearchItem');
  static const Key newRequestFilterIcon = Key('newRequestFilterIcon');
  static const Key newRequestListItemAbleToReturn = Key('listItemAbleToReturn');
  static const Key newRequestReturnFor = Key('newRequestReturnFor');
  static const Key newReturnItem = Key('newReturnItem');
  static const Key closeSummaryInfoNewRequestPage =
      Key('closeSummaryInfoNewRequestPage');
  static const Key itemTitleKey = Key('itemTitleKey');
  static const Key cannotMoveToNextStep = Key('cannotMoveToNextStep');

  // step2
  static const Key newRequestStep2Title = Key('newRequestStep2Title');
  static const Key newRequestStep2ItemImage = Key('newRequestStep2ItemImage');
  static const Key newRequestStep2QuantityAndPrice =
      Key('newRequestStepsQuantityAndPrice');
  static const Key newRequestStep2DetailsSection =
      Key('newRequestStep2DetailsSection');
  static const Key newRequestStep2RemoveIcon = Key('newRequestStep2RemoveIcon');
  static const Key newRequestStep2ReasonDropdown =
      Key('newRequestStep2ReasonDropdown');
  static Key newRequestStepsDropdownItem(option) =>
      Key('newRequestStep2ReasonDropdownItem_$option');
  static Key materialQuantityField(String uuid) =>
      Key('materialQuantityField_$uuid');
  static Key bonusQuantityField(String uuid) => Key('bonusQuantityField$uuid');
  static const Key newRequestStep3MaterialDetail =
      Key('newRequestStep3MaterialDetail');
  static const Key newRequestSuccessItemTitle =
      Key('newRequestSuccessItemTitle');
  static const Key materialReturnDetailsSection =
      Key('materialReturnDetailsSection');
  static const Key newRequestSuccessMessage = Key('newRequestSuccessMessage');
  static const Key bonusItemSection = Key('bonusItemSection');
  //============================================================
  //  Returns by items
  //============================================================
  static const Key returnByItemsSearchBar = Key('returnByItemsSearchBar');
  static const Key returnByItemsFilterButton = Key('returnByItemsFilterButton');
  static const Key returnByItemsNewRequestButton =
      Key('returnByItemsNewRequestButton');
  static Key returnItem(String index) => Key('returnItem$index');
  static const Key returnItemTile = Key('returnItemTile');
  static const Key returnItemGroupDate = Key('returnItemGroupDate');
  static const Key returnItemTileStatus = Key('returnItemTileStatus');
  static const Key returnInvoiceId = Key('returnInvoiceId');

  //============================================================
  //  Returns by items detail
  //============================================================
  static const Key returnItemDetailScrollList =
      Key('returnItemDetailScrollList');
  static const Key returnItemDetailReturnId = Key('returnItemDetailReturnId');
  static const Key returnItemDetailCopyButton =
      Key('returnItemDetailCopyButton');
  static Key returnItemDetailMaterial(
    String materialNumber,
    String qty,
    String totalPrice,
  ) =>
      Key('returnItemDetailMaterial$materialNumber$qty$totalPrice');
  static const Key returnDetailShowDetailButton =
      Key('returnDetailShowMaterialDetailButton');
  static const Key returnItemDetailRequestDate =
      Key('returnItemDetailRequestDate');
  static const Key returnItemDetailMaterialInvoiceDate =
      Key('returnItemDetailMaterialInvoiceDate');
  static const Key returnDetailSummary = Key('returnDetailSummary');

  //============================================================
  //  Returns by request
  //============================================================
  static const Key returnByRequestSearchBar = Key('returnByRequestSearchBar');
  static const Key returnByRequestFilterButton =
      Key('returnByRequestFilterButton');
  static const Key returnByRequestNewRequestButton =
      Key('returnByRequestNewRequestButton');
  static Key returnRequest(String index) => Key('returnRequest$index');
  static const Key headsetMicOutlined = Key('headsetMicOutlined');
  static const Key returnRequestTile = Key('returnRequestTile');
  static const Key returnRequestGroupDate = Key('returnRequestGroupDate');
  static const Key returnRequestTileStatus = Key('returnRequestTileStatus');
  static const Key returnRequestTileIdLabel = Key('returnRequestTileIdLabel');
  static const Key returnRequestTileQtyLabel = Key('returnRequestTileQtyLabel');

  //============================================================
  //  Returns by request detail
  //============================================================
  static const Key returnRequestDetailScrollList =
      Key('returnRequestDetailScrollList');
  static const Key returnRequestDetailSubTotal =
      Key('returnRequestDetailSubTotal');
  static const Key returnRequestDetailGrandTotal =
      Key('returnRequestDetailGrandTotal');
  static const Key returnRequestDetailRequestDate =
      Key('returnRequestDetailRequestDate');
  static Key returnRequestDetailMaterial(int index) =>
      Key('returnRequestDetailMaterial$index');

  //============================================================
  //============================================================
  //  Reset Password
  //============================================================

  static const Key forgotUsernameField = Key('forgotUsernameField');

  //============================================================
  //  BANNER
  //============================================================

  static const Key visibilityDetector = Key('visibilityDetector');

  static const Key homeBanner = Key('homeBanner');
  static const Key nextBannerIcon = Key('nextBannerIcon');
  static const Key previousBannerIcon = Key('previousBannerIcon');
  static const Key imageBanner = Key('imageBanner');

  //============================================================
  //  Presentation/core Keys
  //============================================================
  static const Key staticHtmlViewer = Key('staticHtmlViewer');
  static const Key scrollList = Key('scrollList');
  static const Key loadMoreLoader = Key('loadIndicator');
  static const Key noRecordsFoundSearchIcon = Key('noRecordsFoundSearchIcon');
  static const Key loaderImage = Key('loaderImage');
  static const Key bundleSectionLoaderImage = Key('bundleSectionLoaderImage');
  static const Key productOfferSectionLoaderImage =
      Key('productOfferSectionLoaderImage');
  static const Key recentOrderSectionLoaderImage =
      Key('recentOrderSectionLoaderImage');
  static const Key loader = Key('loader');
  static const Key webview = Key('webview');
  static Key balanceTextRow(String keyText, String valueText) =>
      Key('$keyText$valueText');
  static const Key priceComponent = Key('priceComponent');

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
  static const Key cartButton = Key('cartButton');
  static const Key counterOfferPriceField = Key('counterOfferPriceField');
  static const Key counterOfferRemarksField = Key('counterOfferRemarksField');
  static const Key bonusSampleItemButtonKey = Key('bonusSampleItemButtonKey');
  static const Key counterOfferPriceButtonKey =
      Key('counterOfferPriceButtonKey');
  static const Key preOrderModel = Key('preOrderModel');
  static Key preOrderMaterial(String materialNumber) =>
      Key('preOrderMaterial$materialNumber');
  static const Key preOrderMaterialQty = Key('preOrderMaterialQty');
  static const Key bonusOfferItemAddKey = Key('bonusOfferItemAddKey');
  static const Key bonusOfferItemDeleteKey = Key('bonusOfferItemDeleteKey');
  static const Key bonusOfferItemInputKey = Key('bonusOfferItemInputKey');

  static const Key counterOfferDiscountField = Key('counterOfferDiscountField');
  static const Key discountOverrideField = Key('discountOverrideField');
  static const Key counterOfferBottomSheet = Key('counterOfferBottomSheet');
  static const Key counterOfferConfirmButton = Key('counterOfferConfirmButton');
  static const Key counterOfferCancelButton = Key('counterOfferCancelButton');
  static const Key counterOfferEmptyFieldErrorMessage =
      Key('counterOfferEmptyFieldErrorMessage');
  static const Key counterOfferDiscountedPriceWidget =
      Key('counterDiscountedPriceWidget');
  static const Key counterOfferListPriceWidget =
      Key('counterOfferListPriceWidget');
  static const Key counterOfferPriceWidget = Key('counterOfferPriceWidget');
  static const Key cartPageAppBarTitle = Key('cartPageAppBarTitle');
  static const Key cartPagePriceMessageWidget =
      Key('cartPagePriceMessageWidget');
  static const Key cartClearButton = Key('cartClearButton');
  static const Key cartTotalQty = Key('cartTotalQty');
  static const Key cartShipToAddress = Key('cartShipToAddress');
  static const Key cartShipToAddressSheet = Key('cartShipToAddressSheet');
  static const Key cartShipToAddressSheetCloseButton =
      Key('cartShipToAddressSheetCloseButton');
  static Key cartItemProductTile(String materialNumber) =>
      Key('cartItemProductTile$materialNumber');
  static const Key cartItemProductMaterialNumber =
      Key('cartItemProductMaterialNumber');
  static const Key cartItemProductMaterialDescription =
      Key('cartItemProductMaterialDescription');
  static const Key cartItemProductPrincipalName =
      Key('cartItemProductPrincipalName');
  static const Key cartPrincipalLabel = Key('cartItemPrincipalLabel');
  static const Key cartItemProductQty = Key('cartItemProductQty');
  static const Key cartItemProductUnitPrice = Key('cartItemProductUnitPrice');
  static const Key cartItemProductTotalPrice = Key('cartItemProductTotalPrice');
  static const Key cartItemProductCounterOfferLabel =
      Key('cartItemProductCounterOfferLabel');
  static Key cartItemBundleTile(String bundleNumber) =>
      Key('cartItemBundleTile$bundleNumber');
  static const Key cartItemBundleNumber = Key('cartItemBundleNumber');
  static const Key cartItemBundleName = Key('cartItemBundleName');
  static const Key cartItemBundleQty = Key('cartItemBundleQty');
  static const Key cartItemBundleRate = Key('cartItemBundleRate');
  static const Key cartItemBundleTotalPrice = Key('cartItemBundleTotalPrice');
  static const Key cartItemProductDeleteButton =
      Key('cartItemProductDeleteButton');
  static const Key cartItemSwipeDeleteButton = Key('cartItemSwipeDeleteButton');
  static Key cartItemBonus(String materialNumber, String bonusMaterialNumber) =>
      Key('cartItemBonus$materialNumber$bonusMaterialNumber');
  static const Key cartItemBonusMaterialDescription =
      Key('cartItemBonusMaterialDescription');
  static const Key cartItemBonusFreeLabel = Key('cartItemBonusFreeLabel');
  static Key cartItemBonusSample(
    String materialNumber,
    String bonusSampleMaterialNumber,
  ) =>
      Key('cartItemBonus$materialNumber$bonusSampleMaterialNumber');
  static const Key cartItemBonusSampleMaterialDescription =
      Key('cartItemBonusSampleMaterialDescription');
  static const Key cartItemBonusSampleFreeLabel =
      Key('cartItemBonusSampleFreeLabel');
  static const Key bonusSampleSheet = Key('bonusSampleBottomSheet');
  static const Key bonusSampleSheetCloseButton =
      Key('bonusSampleBottomSheetCloseButton');
  static const Key bonusSampleSheetItemTile = Key('bonusSampleSheetItemTile');
  static const Key bonusSampleSheetItemMaterialNumber =
      Key('bonusSampleSheetItemMaterialNumber');
  static const Key bonusSampleSheetItemMaterialDescription =
      Key('bonusSampleSheetItemMaterialDescription');
  static const Key bonusSampleSheetEmptyQtyWarning =
      Key('bonusSampleSheetEmptyQtyWarning');

  static const Key cartPageInvalidItemsBanner =
      Key('cartPageInvalidItemsBanner');
  static const Key cartPageInvalidItemsBannerButton =
      Key('cartPageInvalidItemsBannerButton');

  //============================================================
  //  Checkout Page Keys
  //============================================================
  static const Key checkoutPage = Key('checkoutPage');
  static const Key showDeliveryInfo = Key('showDeliveryInfo');
  static const Key checkoutProductImage = Key('checkoutProductImage');
  static const Key deliveryDate = Key('deliveryDate');
  static const Key paymentTermKey = Key('paymentTermKey');
  static const Key paymentTermDropdownKey = Key('paymentTermDropdownKey');
  static const Key selectDate = Key('selectDate');
  static const Key additionalDetailsForm = Key('additionalDetailsForm');
  static const Key mobileNumber = Key('mobileNumberKey');
  static const Key poAttachmentFileUploadButton =
      Key('poAttachmentFileUploadButton');
  static const Key poAttachmentPhotoUploadButton =
      Key('poAttachmentPhotoUploadButton');
  static const Key poAttachmentUploadDialog = Key('poAttachmentUploadDialog');
  static const Key checkoutScrollList = Key('checkoutScrollList');
  static const Key checkoutDeliveryArrowButton =
      Key('checkoutDeliveryArrowButton');
  static const Key checkoutSummarySubTotal = Key('checkoutSummarySubTotal');
  static const Key checkoutSummaryStampDuty = Key('checkoutSummaryStampDuty');
  static const Key checkoutSummarySmallOrderFee =
      Key('checkoutSummarySmallOrderFee');
  static const Key checkoutSummaryGrandTotal = Key('checkoutSummaryGrandTotal');
  static const Key checkoutSummaryTotalSaving =
      Key('checkoutSummaryTotalSaving');
  static const Key checkoutItemsTotalQty = Key('checkoutItemsTotalQty');
  static const Key checkoutStickyGrandTotal = Key('checkoutStickyGrandTotal');
  static const Key checkoutStickyTotalQty = Key('checkoutStickyTotalQty');
  static const Key orderPriceSummarySheet = Key('orderPriceSummarySheet');

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
  static const Key nameCart = Key('nameCart');
  static Key materialListBundleMaterial(String materialNumber) =>
      Key('bundleMaterialCard$materialNumber');
  static const Key materialNumberText = Key('materialNumberText');
  static const Key favouriteIcon = Key('favouriteIcon');
  //============================================================
  //  ProductSearch Keys
  //============================================================
  static const Key productScanCameraKey = Key('productScanCameraKey');
  static const Key productSearchPage = Key('productSearchPage');
  static const Key materialFavouriteButton = Key('materialFavouriteButton');
  static const Key materialFavoriteButton = Key('materialFavoriteButton');
  static Key searchedProduct(String materialNumber) =>
      Key('searchedProduct$materialNumber');
  static const Key searchBar = Key('searchBar');
  static const Key scanProductInfoDialog = Key('scanProductInfoDialog');
  static const Key scanFromGallery = Key('scanFromGallery');
  static const Key scanFromCamera = Key('scanFromCamera');
  static const Key favoritesChoiceChip = Key('favoritesChoiceChip');
  static Key statusFavoriteIcon(bool isFavorite) =>
      Key('isFavorite$isFavorite');

  //============================================================
  //  BundleDetails Keys
  //============================================================
  static const Key bundleDetailPage = Key('bundleDetailPage');
  static const Key bundleInputAddKey = Key('bundleInputAddKey');
  static const Key bundleInputDeleteKey = Key('bundleInputDeleteKey');
  static const Key bundleQuantityTextKey = Key('bundleQuantityTextKey');
  static const Key bundleAddToCartSheet = Key('bundleAddToCartSheet');
  static const Key bundleAddToCartSheetSubmitButton =
      Key('bundleAddToCartSheetSubmitButton');
  static Key bundleMaterialItem(String materialNumber) =>
      Key('bundleMaterialItem$materialNumber');

  //============================================================
  //  Orders
  //============================================================

  static const Key materialDescription = Key('materialDescription');
  static const Key orderPriceLoading = Key('priceLoading');
  static const Key startBrowsingViewByItem = Key('startBrowsingViewByItem');

  //============================================================
  //  Order success
  //============================================================
  static const Key orderSuccess = Key('orderSuccessKey');
  static const Key recentlyOrder = Key('recentlyOrder');
  static const Key filterOrderIcon = Key('filterOrderIcon');
  static const Key orderSuccessMessage = Key('orderSuccessMessage');
  static const Key orderSuccessOrderId = Key('orderSuccessOrderId');
  static const Key orderSuccessOrderSummarySection =
      Key('orderSuccessOrderSummarySection');
  static const Key orderSuccessItemTotalQty = Key('orderSuccessItemTotalQty');
  static const Key orderSuccessItemsSection = Key('orderSuccessItemsSection');
  static const Key orderSuccessSubTotal = Key('orderSuccessSubTotal');
  static const Key orderSuccessGrandTotal = Key('orderSuccessGrandTotal');
  static Key orderSuccessItem(int index) => Key('orderSuccessItem$index');
  static const Key orderSuccessItemQty = Key('orderSuccessItemQty');
  static const Key orderSuccessItemUnitPrice = Key('orderSuccessItemUnitPrice');
  static const Key orderSuccessItemTotalPrice =
      Key('orderSuccessItemTotalPrice');

  //============================================================
  //  Order History
  //============================================================

  static const Key fromOrderDateField = Key('fromOrderDateField');
  static const Key toOrderDateField = Key('toOrderDateField');
  static const Key viewByOrderDetailsPageListView =
      Key('viewByOrderDetailsPageListView');

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
  static const Key materialDetailsFavoriteIcon =
      Key('materialDetailsMaterialFavoriteIcon');
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
  static const Key materialDetailsAddToCartSnackBar =
      Key('materialDetailsAddToCartSnackBar');
  static const Key materialDetailsSimilarProductItem =
      Key('materialDetailsSimilarProductItem');
  static const Key materialDetailsSimilarProductsSection =
      Key('materialDetailsSimilarProductsSection');
  static const Key materialDetailsCarouselImage =
      Key('materialDetailsCarouselImage');
  static const Key customSnackBarCloseIcon = Key('customSnackBarCloseIcon');
  static const Key productDetailQuantityAddKey =
      Key('productDetailQuantityAddKey');
  static const Key productDetailQuantityDeleteKey =
      Key('productDetailQuantityDeleteKey');
  static const Key productDetailQuantityTextKey =
      Key('productDetailQuantityTextKey');
  static const Key availableOfferColumnKey = Key('availableOfferColumn');
  static const Key materialInfoDialog = Key('materialInfoDialog');

  //============================================================
  //  bundle Details
  //============================================================
  static const Key bundleImage = Key('bundleImage');
  static const Key bundleDetailsCarousel = Key('bundleDetailsCarousel');

  //============================================================
  //  Payment Summary
  //============================================================
  static const Key invoiceTab = Key('invoiceTab');
  static const Key creditsTab = Key('creditsTab');
  static const Key paymentSummaryPage = Key('paymentSummaryPage');
  static const Key paymentSummaryAppBar = Key('paymentSummaryAppBar');
  static const Key paymentListLoading = Key('paymentListLoading');
  static Key paymentSummaryFilterStatus(String name, bool value) =>
      Key('paymentSummaryFilterStatus$name$value');
  static const Key paymentSummaryFilterIcon = Key('paymentSummaryFilterIcon');

  //============================================================
  //  Statement of account
  //============================================================
  static const Key paymentStatementOfAccountPage =
      Key('paymentStatementOfAccountPage');

  //============================================================
  //  New Payment
  //============================================================
  static const Key newPaymentPage = Key('newPaymentPage');
  static const Key payButton = Key('payButton');
  static const Key paymentWebviewPage = Key('paymentWebviewPage');
  static const Key invoiceId = Key('invoiceId');
  static const Key orderId = Key('orderId');
  static const Key creditPaymentFilterPage = Key('creditPaymentFilterPage');
  static const Key outstandingInvoiceFilterPage =
      Key('outstandingInvoiceFilterPage');

  //============================================================
  //  Announcement
  //============================================================
  static const Key announcementDetailsPageKey =
      Key('announcementDetailsPageKey');
  static const Key announcementListPageKey = Key('announcementListPageKey');
  static const Key announcementNotFoundRecordKey =
      Key('announcementNotFoundRecordKey');
  static const Key announcementDetailsBackButton =
      Key('announcementDetailsBackButton');
  static Key announcementDetailsItem(String index) =>
      Key('announcementDetailsItem$index');
  static const Key announcementDetailsBottomBackButtonKey =
      Key('announcementDetailsBottomBackButtonKey');

  //============================================================
  //  Article
  //============================================================
  static const Key articleDetailsPageKey = Key('articleDetailsPageKey');
  static const Key articleDetailsBottomAppBarKey =
      Key('articleDetailsBottomAppBarKey');
  static const Key articleDetailsBackButtonKey =
      Key('articleDetailsBackButtonKey');
  static const Key articleDetailsBottomBackButtonKey =
      Key('articleDetailsBottomBackButtonKey');
  static const Key noArticleToShowKey = Key('noArticleToShow');
  static const Key articleImageKey = Key('articleImage');
  static const Key articleTitleKey = Key('articleTitle');
  static const Key articleTimeKey = Key('articleTime');
  static const Key articleDetailsTitleKey = Key('articleDetailsTitle');
  static const Key articleDetailsTimeKey = Key('articleDetailsTime');
  static const Key articleDetailsBodyKey = Key('articleDetailsBody');
  static const Key articleDetailsImageKey = Key('articleDetailsImage');

  //============================================================
  //  Change Password
  //============================================================
  static const Key currentPasswordField = Key('currentPasswordField');
  static const Key errorRequirementsFillAllField =
      Key('errorRequirementsFillAllField');
  static const Key newPasswordTextField = Key('newPasswordTextField');
  static const Key confirmPasswordField = Key('confirmPasswordField');
  static const Key currentPasswordToggle = Key('currentPasswordToggle');
  static const Key newPasswordToggle = Key('newPasswordToggle');
  static const Key confirmPasswordToggle = Key('confirmPasswordToggle');
  static const Key changePasswordButton = Key('changePasswordButton');
  static const Key changePasswordForm = Key('changePasswordForm');
  static Key obscureIcon(bool isVisible) => Key('obscureIcon$isVisible');

  //============================================================
  //  New Return Request
  //============================================================
  static const Key newRequestPage = Key('newRequestPage');
  static Key returnBalanceQuantityField(String uuid) =>
      Key('balanceQuantityField$uuid');
  static Key returnCommentField(String uuid) => Key('commentField$uuid');
  static Key returnReasonDropdown(String uuid) => Key('reasonDropdown$uuid');
  static Key returnQuantityField(String uuid) =>
      Key('returnQuantityField$uuid');
  static Key returnValueField(String uuid) => Key('returnValueField$uuid');
  static const Key returnReferenceField = Key('returnReferenceField');
  static Key returnActivateBonusButton(String uuid) =>
      Key('activateBonusButton$uuid');
  static Key returnUploadAttachmentButton(String uuid) =>
      Key('uploadAttachmentButton$uuid');
  static const Key submitButton = Key('submitButton');
  static const Key returnAttachmentFileUploadButton =
      Key('returnAttachmentFileUploadButton');
  static const Key returnAttachmentUploadDialog =
      Key('returnAttachmentUploadDialog');
  static const Key returnAttachmentPhotoUploadButton =
      Key('returnAttachmentPhotoUploadButton');
  static const Key newRequestSuccessfulPage = Key('newRequestSuccessfulPage');
  static const Key specialInstructionsField = Key('specialInstructionsField');
  static const Key fromInvoiceDateField = Key('fromInvoiceDateField');
  static const Key toInvoiceDateField = Key('toInvoiceDateField');
  static const Key returnDetailsListView = Key('returnDetailsListView');
  static const Key returnItemsFilter = Key('returnItemsFilter');
  static const Key invalidSelectedReturnItemError =
      Key('invalidSelectedReturnItemError');
  static const Key toggleIncludeBonusButton = Key('toggleIncludeBonusButton');
  static const Key returnDetailsSectionKey = Key('returnDetailsSection');
  static const Key returnReviewTabBodyKey = Key('returnReviewTabBody');

  //============================================================
  //  Contact Us Page
  //============================================================
  static const Key userNameKey = Key('userNameKey');
  static const Key timeSupport = Key('timeSupport');
  static const Key emailKey = Key('emailKey');
  static const Key phoneNumberKey = Key('phoneNumberKey');
  static const Key contactMessageKey = Key('contactMessageKey');
  static const Key sendMessageButtonKey = Key('sendMessageButtonKey');
  static const Key messageReceivedKey = Key('messageReceived');
  static const Key messageNotReceivedKey = Key('messageNotReceived');
  static const Key internationalPhoneNumberInputKey =
      Key('internationalPhoneNumberInput');
  static const Key contactDetailsKey = Key('contactDetails');

  //============================================================
  //  Payment summary details page
  //============================================================
  static const Key paymentSummaryFilter = Key('paymentSummaryFilter');
  static const Key deleteAdviceButtonKey = Key('deleteAdviceButton');
  static const Key downloadAdviceButtonKey = Key('downloadAdviceButton');
  static const Key buttonRowKey = Key('buttonRow');

  static Key returnContactUsFieldKeyRequest(String key, String msg) =>
      Key('$key$msg');
  //============================================================
  // Notification page
  //============================================================
  static const Key notificationNotFoundRecordKey =
      Key('notificationNotFoundRecordKey');
  static const Key notificationDeleteButton = Key('notificationDeleteButton');
  static const Key notificationItem = Key('notificationItem');
  static const Key notificationItemDifferenceTime =
      Key('notificationItemDifferenceTime');
  static const Key notificationItemIcon = Key('notificationItemIcon');
  static const Key notificationItemTitle = Key('notificationItemTitle');
  static const Key notificationItemDescription =
      Key('notificationItemDescription');
  static const Key notificationItemCreatedAt = Key('notificationItemCreatedAt');
  //============================================================
  // FAQ page
  //============================================================
  static const Key faqNotFoundRecordKey = Key('faqNotFoundRecordKey');
  //===========================================================
  //  Payment Home
  //============================================================
  static const Key paymentHome = Key('paymentHome');
  static const Key paymentHomeAppBar = Key('paymentHomeAppBar');
  static const Key paymentHomeOptionMenu = Key('paymentHomeOptionMenu');
  static const Key accountSummaryMenu = Key('accountSummary');
  static const Key paymentSummaryMenu = Key('paymentSummary');
  static const Key statementOfAccountsMenu = Key('statementOfAccounts');
  static const Key claimsMenu = Key('claims');
  static const Key paymentHomeInvoiceCard = Key('paymentHomeInvoiceCard');
  static const Key totalOutstanding = Key('totalOutstanding');
  static const Key totalOverdue = Key('totalOverdue');
  static const Key totalCreditLimit = Key('totalCreditLimit');
  static const Key paymentHomeCreditCard = Key('paymentHomeCreditCard');
  static const Key creditLimitUtilized = Key('creditLimitUtilized');
  static const Key creditLimitRemaining = Key('CreditLimitRemaining');
  static const Key paymentHomeInProgressCard = Key('paymentHomeInProgressCard');
  static const Key inProgressAmount = Key('inProgress');
  static const Key paymentHomeObscuredAmount = Key('paymentHomeObscuredAmount');
  static const Key paymentHomeSoa = Key('paymentHomeSoa');
  static const Key paymentAdviceCreatedPageBack =
      Key('paymentAdviceCreatedPageBack');
  //===========================================================
  //  New Payment
  //============================================================
  static const Key priceText = Key('priceText');
  static const Key checkAllWidget = Key('checkAllWidget');
  //step 1
  static const Key textOutstanding = Key('textOutstanding');
  static const Key paymentItem = Key('paymentItem');
  static const Key itemCheckBadge = Key('itemCheckBadge');
  static const Key creditDetailsPageListView = Key('creditDetailsPageListView');
  static const Key newPaymentButton = Key('newPaymentButton');
  static const Key itemStatementAccounts = Key('itemStatementAccounts');
  static const Key downloadStatementAccountIcon =
      Key('downloadStatementAccountIcon');
  //===========================================================
  //  Account summary
  //============================================================
  static const Key accountSummaryFilterButton =
      Key('accountSummaryFilterButton');
  static const Key accountSummaryDownloadButton =
      Key('accountSummaryDownloadButton');
  static const Key accountSummaryPage = Key('accountSummaryPage');
  static const Key accountSummarySearchBar = Key('accountSummarySearchBar');
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
  static Key statusFilter(String name, bool value) =>
      Key('statusFilter$name$value');
  static const Key invoiceItem = Key('invoiceItem');
  static const Key invoiceItemCreatedDate = Key('invoiceItemCreatedDate');
  static const Key invoiceItemDueDate = Key('invoiceItemDueDate');
  static const Key invoiceItemStatus = Key('invoiceItemStatus');
  static const Key invoiceItemId = Key('invoiceItemId');
  static const Key invoiceItemOrderId = Key('invoiceItemOrderId');

  //============================================================
  //  Invoice Details
  //============================================================
  static const Key invoiceDetailsPageListView =
      Key('invoiceDetailsPageListView');
  static const Key downloadEInvoiceButton = Key('downloadEInvoiceButton');
  static const Key invoiceDetailSubTotal = Key('invoiceDetailSubTotal');
  static const Key invoiceDetailGrandTotal = Key('invoiceDetailGrandTotal');
  static Key invoiceDetailMaterial(int groupIndex, int index) =>
      Key('invoiceDetailMaterial$groupIndex$index');
  static const Key invoiceDetailMaterialQty = Key('invoiceDetailMaterialQty');
  static const Key invoiceDetailMaterialUnitPrice =
      Key('invoiceDetailMaterialUnitPrice');
  static const Key invoiceDetailMaterialTotalPrice =
      Key('invoiceDetailMaterialTotalPrice');
  //============================================================
  //  All Credits
  //============================================================
  static Key creditFilterApplied(int count) => Key('creditAppliedFilter$count');
  //===========================================================
  //  Account Summary Page - All credits
  //============================================================
  static Key accountCreditsItemStatus(String name, bool value) =>
      Key('accountCreditsItemStatus$name$value');
  static const Key allCreditsPage = Key('allCreditsPage');
  static const Key creditsItemTile = Key('creditsItemTile');
  static const Key creditCreatedOn = Key('creditCreatedOn');
  static Key creditItemId(String id) => Key('creditItemById$id');
  static const Key creditDetailsPage = Key('creditDetailsPage');
  static const Key creditDetailsTile = Key('creditDetailsTile');
  static const Key creditSummaryTile = Key('creditSummaryTile');

  //===========================================================
  //  Intro Page
  //============================================================
  static const Key introGetStartedButton = Key('getStarted');

  //============================================================
  // Orders tab
  //============================================================
  static const Key ordersTabSearchBarKey = Key('ordersTabSearchBarKey');
  static const Key ordersTabFilterButtonKey = Key('orderTabFilterButtonKey');
  //============================================================
  // View By Items
  //============================================================
  static Key viewByItemsTabKey = const Key('view by items');
  static Key viewByItemsOrderGroupKey = const Key('viewByItemsOrderGroupKey');
  static Key viewByItemsOrderItemKey = const Key('viewByItemsOrderItemKey');
  static Key orderItemStatusKey = const Key('orderItemStatusKey');
  //============================================================
  // View By Items filter bottom sheet
  //============================================================
  static Key viewByItemsFilterFromDateKey =
      const Key('viewByItemsFilterFromDate');
  static Key viewByItemsFilterToDateKey = const Key('viewByItemsFilterToDate');
  static Key viewByItemsFilterStatusKey(String name, bool value) =>
      Key('viewByItemsFilterStatus$name$value');
  //============================================================
  // View By Item Detail
  //============================================================
  static Key viewByItemsOrderDetailPage =
      const Key('viewByItemsOrderDetailPage');
  static Key viewByItemsOrderDetailOrderCode =
      const Key('viewByItemsOrderDetailOrderCode');
  static Key viewByItemsOrderDetailOrderDate =
      const Key('viewByItemsOrderDetailOrderDate');
  static Key viewByItemsOrderDetailInvoiceNumber =
      const Key('viewByItemsOrderDetailInvoiceNumber');
  static Key viewByItemsOrderDetailPoReference =
      const Key('viewByItemsOrderDetailPoReference');
  //============================================================
  // View By Orders
  //============================================================
  static Key viewByOrdersTabKey = const Key('view by orders');
  static Key viewByOrdersGroupKey = const Key('viewByOrdersGroupKey');
  static Key viewByOrdersItemKey = const Key('viewByOrdersItemKey');
  static Key viewByOrdersCodeLabelKey = const Key('viewByOrdersCodeLabelKey');
  static Key viewByOrdersQtyLabelKey = const Key('viewByOrdersItemQtyLabelKey');
  static Key viewByOrderBuyAgainButtonKey =
      const Key('viewByOrderBuyAgainButtonKey');
  //============================================================
  // View By Orders filter bottom sheet
  //============================================================
  static const Key viewByOrdersFilterFromDateKey =
      Key('viewByOrdersFilterFromDate');
  static const Key viewByOrdersFilterToDateKey =
      Key('viewByOrdersFilterToDate');
  //============================================================
  // View By Orders detail
  //============================================================
  static Key viewByOrderDetailOrderCode =
      const Key('viewByOrderDetailOrderCode');
  static Key viewByOrderDetailItemsSection =
      const Key('viewByOrderDetailItems');
  static Key viewByOrderDetailOrderDate =
      const Key('viewByOrderDetailOrderDate');
  static Key viewByOrderDetailBuyAgain = const Key('viewByOrderDetailBuyAgain');
  //===========================================================
  //  Intro Page
  //============================================================
  static const Key profilePageLanguageDropdown =
      Key('profilePageLanguageDropdown');
  // SOA page
  //============================================================
  static const Key soaNotFoundRecordKey = Key('soaNotFoundRecordKey');
  static const Key soaNewpaymentButtonKey = Key('soaNewpaymentButton');
  static const Key soaToDateFieldKey = Key('toDateField');
  static const Key soaFromDateFieldKey = Key('fromDateField');
  static const Key soaLoadingAnimationWidgetKey = Key('loadingAnimationWidget');
  static const Key soaHeaderCustomerCodeKey = Key('soaHeaderCustomerCode');
  static const Key soaFilterbottomSheetKey = Key('soaFilterbottomSheet');
  static const Key soaFilterApplyButtonKey = Key('soaFilterApplyButton');
  static const Key soaFilterResetButtonKey = Key('soaFilterResetButton');
  static const Key soaItemTextKey = Key('soaItemText');
  static const Key soaPage = Key('soaPage');
  static const Key soaFilterButton = Key('soaFilterButton');
  static const Key soaSearchResultsKey = Key('soaSearchResults');
  //===========================================================
  //  Month Picker
  //============================================================
  static const Key monthPickerKey = Key('monthPicker');

  //===========================================================
  //  Account Profile Page
  //============================================================
  static const Key profilePage = Key('profilePage');
  static const Key profileUserDetails = Key('profileUserDetails');
  static const Key profile = Key('profileUserDetails');
  static const Key profileClearButton = Key('profileClearButton');
  static const Key profileSaveButton = Key('profileSaveButton');
  static const Key profileLicenseTile = Key('profileLicenseTile');
  static const Key profileLicenseName = Key('profileLicenseName');
  static const Key profileLicenseNo = Key('profileLicenseNo');
  static const Key profileLicenseStatus = Key('profileLicenseStatus');
  static const Key profileLicenseDateRange = Key('profileLicenseDateRange');
}
