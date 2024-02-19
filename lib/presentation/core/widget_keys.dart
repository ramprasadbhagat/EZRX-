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
  static const Key nextButtonID = Key('nextButtonID');
  static const Key backButton = Key('backButton');
  static const Key arrowButton = Key('arrowButton');
  static const Key commonTileItemHeader = Key('commonTileItemHeader');
  static const Key commonTileItemQty = Key('commonTileItemQty');
  static const Key commonTileItemImage = Key('commonTileItemImage');
  static const Key commonTileItemLabel = Key('commonTileItemLabel');
  static const Key commonTileItemStatusLabel = Key('commonTileItemStatusLabel');
  static const Key commonTileItemTitle = Key('commonTileItemTitle');
  static const Key commonTileItemSubTitle = Key('commonTileItemSubTitle');
  static const Key confirmBottomSheetConfirmButton =
      Key('confirmBottomSheetConfirmButton');
  static const Key addToCartErrorSection = Key('addToCartErrorSection');
  static const Key addToCartErrorSectionProceed =
      Key('addToCartErrorSectionProceed');
  static const Key moreTapListContent = Key('moreTapListContent');
  static const Key settingTile = Key('settingTile');
  static const Key versionDisplay = Key('versionDisplay');
  static const Key customBadge = Key('customBadge');
  static const Key addressInfoSectionActionLabel =
      Key('addressInfoSectionActionLabel');
  static const Key addressInfoSectionCustomerCodeLabel =
      Key('addressInfoSectionCustomerCodeLabel');
  static const Key addressInfoSectionDeliveryToLabel =
      Key('addressInfoSectionDeliveryToLabel');
  static Key statusTracker(String status) => Key('statusTracker$status');
  static const Key offerTag = Key('offerTag');
  static const Key bundleTag = Key('bundleTag');
  static const Key priceTextData = Key('priceTextData');
  static const Key priceTextTitle = Key('priceTextTitle');
  static const Key radioPaymentGateway = Key('radioPaymentGateway');
  static Key detailInfoSection(String label) => Key('detailInfoSection$label');
  static const Key expandableSection = Key('expandableSection');
  static Key favIcon(String label) => Key('favIcon$label');
  static const Key payerInformation = Key('payerInformation');
  static const Key orderItemUnitPrice = Key('orderItemUnitPrice');
  //============================================================
  //  PRE-ORDER-MODAL
  //============================================================

  static const Key preOrderModalCancelButton = Key('cancelButton');
  static const Key preOrderModalContinueButton = Key('continueButton');

  //============================================================
  //  LOGIN
  //============================================================

  static const Key loginMobileScreen = Key('loginMobileScreen');
  static const Key loginWebScreen = Key('loginWebScreen');
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
  static const Key forgotPasswordButton = Key('forgotPasswordButton');
  static const Key ezrxAplLogo = Key('ezrxAplLogo');

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
  static const Key notificationBadge = Key('notificationBadge');
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
  static const Key homeQuickAccessEZPointMenu =
      Key('homeQuickAccessEZPointMenu');
  static const Key homeQuickAccessLoyaltyMenu =
      Key('homeQuickAccessLoyaltyMenu');
  static const Key homeQuickAccessChatSupportMenu =
      Key('homeQuickAccessChatSupportMenu');
  static const Key announcementsTab = Key('announcementsTab');
  static const Key articlesTab = Key('articlesTab');
  static const Key articlesListTag = Key('articlesListTag');
  static const Key announcementTabBar = Key('Announcements');
  static const Key articleTabBar = Key('Articles');
  static const Key browseProductIcon = Key('browseProductIcon');
  static const Key browseProduct = Key('browseProduct');
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
  static const Key bundlesBody = Key('bundlesBody');
  static const Key bundlesListItem = Key('bundlesListItem');
  static const Key listRecentlyOrdered = Key('listRecentlyOrdered');
  static const Key materialDescriptionRecentlyOrdered =
      Key('materialDescriptionRecentlyOrdered');
  static const Key browseProductsList = Key('browseProductsList');
  static const Key announcementsList = Key('announcementsList');
  static const Key announcementTitle = Key('announcementTitle');
  static const Key announcementBottomSheet = Key('announcementBottomSheet');
  static const Key browseProductLoadingShimmer =
      Key('browseProductLoadingShimmer');
  static Key sectionTileIcon(String title) => Key('sectionTitleIcon$title');
  static Key searchSectionTab(String title) => Key('searchSectionTab$title');
  static Key bundleMaterialCount(String title) =>
      Key('bundleMaterialCount$title');
  //============================================================
  //  MORE TAB BAR
  //============================================================
  static const Key moreScreen = Key('moreScreen');
  static const Key logOutTile = Key('logOutTile');
  static const Key profileTileSection = Key('profileTileSection');
  static const Key profileTileSectionCustomerInformation =
      Key('profileTileSectionCustomerInformation');
  static const Key profileTile = Key('profileTile');
  static const Key paymentsTile = Key('paymentsTile');
  static const Key eZPointTile = Key('eZPointTile');
  static const Key returnsTile = Key('returnsTile');
  static const Key returnReviewItemKey = Key('returnReviewItemKey');
  static const Key returnSuccessfulItemKey = Key('returnReviewItemKey');
  static const Key orderTile = Key('orderTile');
  static const Key securityTile = Key('securityTile');
  static const Key notificationTile = Key('notificationTile');
  static const Key contactUsTile = Key('contactUsTile');
  static const Key userGuideTile = Key('userGuideTile');
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
  static const Key filterManufacturerButton = Key('filterManufacturerButton');
  static Key showProductCheckbox(String type) => Key('checkbox$type');
  static Key sortByRadio(String type) => Key('radioSort$type');
  static const Key clearSearchFilter = Key('clearSearchFilter');
  static const Key searchProductField = Key('searchProductField');
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
  static Key manufacturerFilterSelected(String filter) =>
      Key('manufacturerFilterSelected$filter');
  static const Key manufacturerMaterials = Key('manufacturerMaterials');
  static const Key expandIcon = Key('expandIcon');
  static const Key materialDosage = Key('materialDosage');
  static const Key materialHowToUse = Key('materialHowToUse');
  static const Key materialComposition = Key('materialComposition');
  static const Key countryListSelectedLength = Key('countryListSelectedLength');
  static const Key manufactureListSelectedLength =
      Key('manufactureListSelectedLength');
  static const Key lblNameProductOffers = Key('lblNameProductOffers');
  static const Key lblCodeProductOffers = Key('lblCodeProductOffers');
  static const Key lblQuantityProductOffers = Key('lblQuantityProductOffers');
  static const Key lblQuantityProductTireOffers =
      Key('lblQuantityProductTireOffers');
  static const Key availableOffersTile = Key('availableOffersTile');
  static const Key materialDeliveryInstructions =
      Key('materialDeliveryInstructions');
  static const Key productPriceOfferTitle = Key('productPriceOfferTitle');

  //============================================================
  //  Combo Deal Page Keys
  //============================================================
  static const Key comboDealDetailPage = Key('comboDealDetailPage');
  static const Key getComboDealButton = Key('getComboDealButton');
  static const Key comboTitleLoading = Key('comboTitleLoading');
  static const Key combodealsBody = Key('combodealsBody');
  static const Key exploreComboDealsButtton = Key('exploreComboDealsButtton');
  static const Key comboRequirementTitleLoading =
      Key('comboRequirementTitleLoading');
  static const Key comboRequirementSubTitleLoading =
      Key('comboRequirementSubTitleLoading');
  static const Key comboFixedList = Key('comboFixedList');
  static const Key comboMaterialList = Key('comboMaterialList');
  static const Key comboNotEligibleMessage = Key('comboNotEligibleMessage');
  static const Key comboNextDealInfo = Key('comboNextDealInfo');
  static const Key comboRateDiscounted = Key('comboRateDiscounted');
  static Key comboItemProductTile(String materialNumber) =>
      Key('comboItemProductTile$materialNumber');
  static Key comboItemMaterialDetail(String materialNumber) =>
      Key('comboItemMaterialDetail$materialNumber');
  static Key comboItemImageDetail(String materialNumber) =>
      Key('comboItemImageDetail$materialNumber');
  static Key comboDeteleButton = const Key('comboDeteleButton');
  static Key comboDeteleConfirmButton = const Key('comboDeteleConfirmButton');
  static Key comboBestDealIcon = const Key('comboBestDealIcon');
  static Key comboNextDealIcon = const Key('comboNextDealIcon');

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
  static const Key outsideReturnPolicyTag = Key('outsideReturnPolicyTag');

  //============================================================
  //  New Return Request
  //============================================================
  // step 1
  static const Key newRequestSearchItem = Key('newRequestSearchItem');
  static const Key newRequestFilterIcon = Key('newRequestFilterIcon');
  static const Key newRequestListItemAbleToReturn = Key('listItemAbleToReturn');
  static const Key newRequestReturnFor = Key('newRequestReturnFor');
  static const Key newReturnItem = Key('newReturnItem');
  static const Key newReturnItemImage = Key('newReturnItemImage');
  static const Key closeSummaryInfoNewRequestPage =
      Key('closeSummaryInfoNewRequestPage');
  static const Key itemTitleKey = Key('itemTitleKey');
  static const Key itemMaterialNumberKey = Key('itemMaterialNumberKey');
  static const Key itemQtyKey = Key('itemQtyKey');
  static const Key itemTotalPriceKey = Key('itemTotalPriceKey');
  static const Key itemBonusTagKey = Key('itemBonusTagKey');
  static const Key itemBatchKey = Key('itemBatchKey');
  static const Key itemExpiresKey = Key('itemExpiresKey');
  static const Key cannotMoveToNextStep = Key('cannotMoveToNextStep');

  // step2
  static const Key availableCreditsTabPage = Key('availableCreditsTabPage');
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

  //step 3
  static const Key newReturnBonusDetailsCard = Key('newReturnBonusDetailsCard');

  //============================================================
  //  Returns by items
  //============================================================
  static const Key returnByItemsSearchBar = Key('returnByItemsSearchBar');
  static const Key exportReturnByItem = Key('exportReturnByItem');
  static const Key exportReturnByRequest = Key('exportReturnByRequest');
  static const Key returnByItemsFilterButton = Key('returnByItemsFilterButton');
  static const Key returnByItemsNewRequestButton =
      Key('returnByItemsNewRequestButton');
  static Key returnItem(String index) => Key('returnItem$index');
  static const Key returnItemTile = Key('returnItemTile');
  static const Key returnItemGroupDate = Key('returnItemGroupDate');
  static const Key returnItemTileStatus = Key('returnItemTileStatus');
  static const Key returnItemTileBonusTag = Key('returnItemTileBonusTag');
  static const Key returnInvoiceId = Key('returnInvoiceId');

  //============================================================
  //  Returns by items detail
  //============================================================
  static const Key returnItemDetailScrollList =
      Key('returnItemDetailScrollList');
  static const Key returnItemDetailReturnId = Key('returnItemDetailReturnId');
  static const Key returnItemDetailBonusItem = Key('returnItemDetailBonusItem');
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
  static const Key returnDetailShowBonusDetailButton =
      Key('returnDetailShowBonusDetailButton');
  static const Key returnItemDetailRequestDate =
      Key('returnItemDetailRequestDate');
  static const Key returnItemDetailMaterialInvoiceDate =
      Key('returnItemDetailMaterialInvoiceDate');
  static const Key returnDetailSummary = Key('returnDetailSummary');
  static const Key returnAttachmentSection = Key('returnAttachmentSection');
  static const Key returnAttachmentTile = Key('returnAttachmentTile');
  static const Key returnAttachmentDownloadButton =
      Key('returnAttachmentDownloadButton');

  static const Key returnBonusApprovalDetail = Key('returnBonusApprovalDetail');
  static const Key returnBonusReturnDetail = Key('returnBonusReturnDetail');

  //============================================================
  //  Returns by request
  //============================================================
  static const Key returnByRequestSearchBar = Key('returnByRequestSearchBar');
  static const Key returnByRequestFilterButton =
      Key('returnByRequestFilterButton');
  static const Key returnByRequestNewRequestButton =
      Key('returnByRequestNewRequestButton');
  static Key returnRequest(String index) => Key('returnRequest$index');
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
  static const Key bonusPriceComponent = Key('bonusPriceComponent');
  static const Key returnRequestDetailSection =
      Key('returnRequestDetailSection');
  static Key returnSummaryInfoIcon(String header) => Key(header);
  static const Key returnSummaryInfoBottomSheet =
      Key('returnSummaryInfoBottomSheet');
  static const Key returnBonusItemCard = Key('returnBonusItemCard');

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
  static const Key preOrderModalItemList = Key('preOrderModalItemList');
  static const Key preOrderModalItemFinalPrice =
      Key('preOrderModalItemFinalPrice');
  static const Key preOrderModalItemTotalPrice =
      Key('preOrderModalItemTotalPrice');
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
  static const Key priceNotAvailableMessageWidget =
      Key('priceNotAvailableMessageWidget');
  static const Key invalidItemsMessageWidget = Key('invalidItemsMessageWidget');
  static const Key cartClearButton = Key('cartClearButton');
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
  static const Key cartItemCutOffListPrice = Key('cartItemCutOffListPrice');
  static const Key cartItemProductTotalPrice = Key('cartItemProductTotalPrice');
  static const Key cartItemProductTotalPriceWithTaxAmount =
      Key('cartItemProductTotalPriceWithTaxAmount');
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
  static const Key cartItemSwipeDeleteButtonForBonus =
      Key('cartItemSwipeDeleteButtonForBonus');
  static Key cartItemBonus(String materialNumber, String bonusMaterialNumber) =>
      Key('cartItemBonus$materialNumber$bonusMaterialNumber');
  static const Key cartItemBonusMaterialDescription =
      Key('cartItemBonusMaterialDescription');
  static const Key cartItemBonusQty = Key('cartItemBonusQty');
  static const Key cartItemBonusFreeLabel = Key('cartItemBonusFreeLabel');
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
  static const Key summaryInfoButton = Key('summaryInfoButton');
  static const Key showOrderSumaryListTile = Key('showOrderSumaryListTile');

  //============================================================
  //  Checkout Page Keys
  //============================================================
  static const Key checkoutPage = Key('checkoutPage');
  static const Key showDeliveryInfo = Key('showDeliveryInfo');
  static const Key checkoutProductImage = Key('checkoutProductImage');
  static const Key deliveryDate = Key('deliveryDate');
  static const Key paymentTermKey = Key('paymentTermKey');
  static const Key paymentTermDropdownKey = Key('paymentTermDropdownKey');
  static const Key uploadAttachmentKey = Key('uploadAttachment');
  static const Key attachmentsTileKey = Key('attachmentsTile');
  static const Key selectDate = Key('selectDate');
  static const Key additionalDetailsForm = Key('additionalDetailsForm');
  static const Key mobileNumber = Key('mobileNumberKey');
  static const Key internationalPhoneNumberInput =
      Key('internationalPhoneNumberInput');
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
  static const Key checkoutSummaryTax = Key('checkoutSummaryTax');
  static const Key checkoutSummaryTaxPrice = Key('checkoutSummaryTaxPrice');
  static const Key checkoutSummarySmallOrderFeePrice =
      Key('checkoutSummarySmallOrderFeePrice');
  static const Key checkoutSummaryGrandTotal = Key('checkoutSummaryGrandTotal');
  static const Key checkoutSummaryGrandTotalPrice =
      Key('checkoutSummaryGrandTotalPrice');
  static const Key checkoutSummaryTotalSaving =
      Key('checkoutSummaryTotalSaving');
  static const Key checkoutItemsTotalQty = Key('checkoutItemsTotalQty');
  static const Key priceSummaryGrandTotal = Key('checkoutStickyGrandTotal');
  static const Key priceSummaryTotalQty = Key('checkoutStickyTotalQty');
  static const Key priceSummarySheet = Key('orderPriceSummarySheet');
  static const Key priceSummaryListTile = Key('showOrderSummaryListTile');
  static const Key quantityAndPrice = Key('quantityAndPrice');
  static const Key productImageSection = Key('productImageSection');
  static const Key bonusProductDetail = Key('bonusProductDetail');

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
  static const Key covidLabel = Key('covidLabel');
  //============================================================
  //  ProductSearch Keys
  //============================================================
  static const Key productScanCameraKey = Key('productScanCameraKey');
  static const Key productSearchPage = Key('productSearchPage');
  static const Key materialFavouriteButton = Key('materialFavouriteButton');
  static const Key materialFavoriteButton = Key('materialFavoriteButton');
  static Key searchedProduct(String materialNumber) =>
      Key('searchedProduct$materialNumber');
  static Key searchProductHistory = const Key('searchProductHistory');
  static Key deleteProductHistory = const Key('deleteProductHistory');
  static Key noProductHistory = const Key('noProductHistory');
  static const Key searchBar = Key('searchBar');
  static const Key scanProductInfoDialog = Key('scanProductInfoDialog');
  static const Key scanFromGallery = Key('scanFromGallery');
  static const Key scanFromCamera = Key('scanFromCamera');
  static const Key favoritesChoiceChip = Key('favoritesChoiceChip');
  static Key statusFavoriteIcon(bool isFavorite) =>
      Key('isFavorite$isFavorite');
  static const Key materialCard = Key('MaterialCard');

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
  static const Key bundleAddToCart = Key('bundleAddToCart');
  static const Key bundleMaterialListItem = Key('bundleMaterialListItem');
  static const Key bundleOfferCode = Key('bundleOfferCode');
  static const Key bundleOfferName = Key('bundleOfferName');
  static const Key productTag = Key('productTag');
  static const Key bundleOfferMaterialInfo = Key('bundleOfferMaterialInfo');
  static const Key bundleInformation = Key('bundleInformation');
  static const Key bundleOfferSummary = Key('bundleOfferSummary');
  static const Key bundleOfferPrice = Key('bundleOfferPrice');
  static Key bundleMaterialItemDescription(String materialDescription) =>
      Key('bundleMaterialItemDescription$materialDescription');
  static const Key bundleMaterialDescriptionBottomSheet =
      Key('bundleMaterialDescriptionBottomSheet');
  static const Key bundleMaterialExpiryDate = Key('bundleMaterialExpiryDate');

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
  static const Key orderSummaryTax = Key('orderSummaryTax');
  static const Key orderSummarySmallFee = Key('orderSummarySmallFee');
  static const Key orderSummaryManualFee = Key('orderSummaryManualFee');
  static const Key orderSuccessGrandTotal = Key('orderSuccessGrandTotal');
  static Key orderSuccessMaterialItem(int index) =>
      Key('orderSuccessItem$index');
  static const Key orderSuccessItemUnitPrice = Key('orderSuccessItemUnitPrice');
  static const Key orderSuccessItemTotalPrice =
      Key('orderSuccessItemTotalPrice');
  static const Key orderSuccessAttachment = Key('orderSuccessAttachment');
  static const Key orderSuccessAttachmentShowButton =
      Key('orderSuccessAttachmentShowButton');
  static const Key orderSummaryTotalSaving = Key('orderSummaryTotalSaving');

  //============================================================
  //  Order History
  //============================================================

  static const Key fromOrderDateField = Key('fromOrderDateField');
  static const Key toOrderDateField = Key('toOrderDateField');
  static const Key poAttachmentTile = Key('poAttachmentTile');
  static const Key orderHistoryBundleInformation =
      Key('orderHistoryBundleInformation');
  static Key orderHistoryBundleItemMaterial(String materialNumber) =>
      Key('orderHistoryBundleItemMaterial$materialNumber');

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
  static const Key bodyContentProductDetail = Key('bodyContentProductDetail');
  static const Key productDetailSuspended = Key('productDetailSuspended');

  //============================================================
  //  bundle Details
  //============================================================
  static const Key bundleImage = Key('bundleImage');
  static const Key bundleDetailsCarousel = Key('bundleDetailsCarousel');
  static const Key addBundleMinimumQty = Key('addBundleMinimumQty');
  static const Key addBundleTotalQty = Key('addBundleTotalQty');
  static const Key addBundleInvalidQtyWarning =
      Key('addBundleInvalidQtyWarning');
  static const Key addBundleRate = Key('addBundleRate');

  //============================================================
  //  Payment Summary
  //============================================================
  static const Key invoiceTab = Key('invoiceTab');
  static const Key creditsTab = Key('creditsTab');
  static const Key summaryTab = Key('summaryTab');
  static const Key paymentSummaryPage = Key('paymentSummaryPage');
  static const Key paymentSummaryAppBar = Key('paymentSummaryAppBar');
  static const Key paymentListLoading = Key('paymentListLoading');
  static Key paymentSummaryFilterStatus(String name) =>
      Key('paymentSummaryFilterStatus$name');
  static const Key paymentSummaryFilterIcon = Key('paymentSummaryFilterIcon');
  static const Key paymentSummaryGroup = Key('paymentSummaryGroup');
  static const Key paymentSummaryItem = Key('paymentSummaryItem');
  static const Key paymentSummaryGroupDate = Key('paymentSummaryGroupDate');
  static const Key paymentSummaryTile = Key('paymentSummaryTile');
  static const Key paymentSummaryTileStatus = Key('paymentSummaryTileStatus');
  static const Key paymentSummaryTextStatus = Key('paymentSummaryTextStatus');
  static const Key paymentSummaryDateOrExpiry =
      Key('paymentSummaryDateOrExpiry');
  static const Key paymentSummaryAmountAndCurrency =
      Key('paymentSummaryAmountAndCurrency');
  static const Key paymentSummarySearchBar = Key('paymentSummarySearchBar');
  static const Key paymentSummaryFilterButton =
      Key('paymentSummaryFilterButton');
  static const Key paymentSummaryDownloadButton =
      Key('paymentSummaryDownloadButton');
  static const Key paymentSummaryDownloadInProgress =
      Key('paymentSummaryDownloadInProgress');
  static const Key paymentSummaryDownloadSuccess =
      Key('paymentSummaryDownloadSuccess');
  static const Key paymentSummaryScrollToTopButton =
      Key('paymentSummaryScrollToTopButton');
  static const Key transferViaSection = Key('transferViaSection');
  static const Key qrCodeTransferSection = Key('qrCodeTransferSection');

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
  static const Key invoiceIdPrice = Key('invoiceIdPrice');
  static const Key creditPaymentFilterPage = Key('creditPaymentFilterPage');
  static const Key outstandingInvoiceFilterPage =
      Key('outstandingInvoiceFilterPage');
  static const Key generatePaymentAdvice = Key('generatePaymentAdvice');
  static const Key paymentSavePdfButtonSection =
      Key('paymentSavePdfButtonSection');
  static const Key paymentCancelAdviceButton = Key('paymentCancelAdviceButton');
  static const Key paymentSummarySection = Key('paymentSummarySection');
  static const Key paymentAdviceBodyAPLSection =
      Key('paymentAdviceBodyAPLSection');

  //============================================================
  //  Announcement
  //============================================================
  static const Key announcementDetailsPageKey =
      Key('announcementDetailsPageKey');
  static const Key announcementListPageKey = Key('announcementListPageKey');
  static const Key announcementNotFoundRecordKey =
      Key('announcementNotFoundRecordKey');
  static const Key announcementListKey = Key('announcementListKey');
  static const Key announcementDetailsBackButton =
      Key('announcementDetailsBackButton');
  static Key announcementDetailsItem(String index) =>
      Key('announcementDetailsItem$index');
  static const Key announcementDetailsBottomBackButtonKey =
      Key('announcementDetailsBottomBackButtonKey');
  static const Key announcementItemDateKey = Key('announcementItemDateKey');
  static const Key announcementItemTitleKey = Key('announcementItemTitleKey');
  static const Key announcementItemNewTagKey = Key('announcementItemNewTagKey');
  static const Key announcementFilterKey = Key('announcementFilterKey');
  static const Key announcementDetailImageKey =
      Key('announcementDetailImageKey');
  static const Key announcementDetailDateKey = Key('announcementDetailDateKey');
  static const Key announcementDetailOtherSection =
      Key('announcementDetailOtherSection');

  static Key announcementStatusFilter(String name, bool value) =>
      Key('announcementStatusFilter$name$value');
  static const Key announcementFilterIcon = Key('announcementFilterIcon');

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
  static const Key articleFilterKey = Key('articleFilter');
  static Key articleStatusFilter(String name, bool value) =>
      Key('articleStatusFilter$name$value');
  static const Key articleFilterIcon = Key('articleFilterIcon');

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
  static Key requestCounterOfferTextField(String value) =>
      Key('requestCounterOfferTextField_$value');
  static Key requestCounterOfferText(String value) =>
      Key('requestCounterOfferText_$value');
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
  static const Key returnBonusItemSection = Key('returnBonusItemSection');
  static const Key returnExpandableSection = Key('returnExpandableSection');
  static const Key materialBonusDetailsSection =
      Key('materialBonusDetailsSection');

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
  static const Key contactDetailsSectionKey = Key('contactDetailsSection');

  //============================================================
  //  Payment summary details page
  //============================================================
  static const Key paymentSummaryDetailsPage = Key('paymentSummaryDetailsPage');
  static const Key paymentSummaryFilter = Key('paymentSummaryFilter');
  static const Key downloadAdviceButton = Key('downloadAdviceButton');
  static const Key paymentSummaryDetailsBackButton =
      Key('paymentSummaryDetailsBackButton');

  static const Key deleteAdviceButtonKey = Key('deleteAdviceButton');
  static const Key cancelAdviceButtonKey = Key('cancelAdviceButtonKey');
  static const Key pdfView = Key('pdfView');
  static const Key downloadAdviceButtonKey = Key('downloadAdviceButton');
  static const Key buttonRowKey = Key('buttonRow');
  static const Key deleteCancelAdviceBottomSheet =
      Key('deleteAdviceBottomSheet');
  static const Key deleteCancelAdviceBottomSheetButton =
      Key('deleteAdviceBottomSheetDeleteButton');

  static Key returnContactUsFieldKeyRequest(String key, String msg) =>
      Key('$key$msg');
  static const Key paymentAdviceButtonLoading =
      Key('paymentAdviceButtonLoading');
  static const Key paymentSummaryDetails = Key('paymentSummaryDetails');
  static Key paymentSummaryTitle(
    String title,
  ) =>
      Key('paymentSummaryTitle-$title');
  static Key paymentItems(String title, String id) =>
      Key('paymentItems$title$id');
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
  static const Key creditDetailsPageListView = Key('creditDetailsPageListView');
  static const Key newPaymentButton = Key('newPaymentButton');
  static const Key paymentSummaryRouteButton = Key('paymentSummaryRouteButton');
  static const Key accountSummaryButton = Key('accountSummaryButton');

  //===========================================================
  //  New Payment
  //============================================================
  static const Key priceText = Key('priceText');
  static const Key checkAllWidget = Key('checkAllWidget');
  //step 1
  static const Key outstandingInvoicesPage = Key('outstandingInvoicesPage');
  static const Key textOutstanding = Key('textOutstanding');
  static const Key paymentItem = Key('paymentItem');
  static const Key itemCheckBadge = Key('itemCheckBadge');
  //step 2
  static const Key creditPaymentItem = Key('creditPaymentItem');
  static const Key documentReferenceID = Key('documentReferenceID');
  static const Key accountingDocument = Key('accountingDocument');
  static const Key creditIdPrice = Key('creditIdPrice');
  static const Key itemStatementAccounts = Key('itemStatementAccounts');
  static const Key downloadStatementAccountIcon =
      Key('downloadStatementAccountIcon');

  //===========================================================
  //  New Payment - select payment method
  //============================================================
  static const Key createPaymentAdviseNote = Key('createPaymentAdviseNote');
  static const Key createPaymentAdviseWarning =
      Key('createPaymentAdviseWarning');
  static const Key paymentMethodTile = Key('paymentMethodTile');
  static const Key paymentMethodRadio = Key('paymentMethodRadio');
  static const Key aplPaymentSelector = Key('aplPaymentSelector');
  static const Key paymentMethodCheckbox = Key('paymentMethodCheckbox');
  static const Key paymentMethodSelector = Key('paymentMethodSelector');
  static const Key bankInAccountInfo = Key('bankInAccountInfo');
  static const Key invoiceCreditListView = Key('invoiceCreditListView');
  static const Key invoiceCreditItemTile = Key('invoiceCreditItemTile');
  static const Key invoiceCreditItemId = Key('invoiceCreditItemId');
  static const Key invoiceCreditItemDate = Key('invoiceCreditItemDate');
  static const Key invoiceCreditItemAmount = Key('invoiceCreditItemAmount');
  static const Key bankInInstructionNote = Key('bankInInstructionNote');
  static const Key bankInfoTile = Key('bankInInfoTile');
  static const Key paymentMethodListView = Key('paymentMethodListView');

  //===========================================================
  //  Account summary
  //============================================================
  static const Key accountSummaryFilterButton =
      Key('accountSummaryFilterButton');
  static const Key accountSummaryDownloadButton =
      Key('accountSummaryDownloadButton');
  static const Key accountSummaryPage = Key('accountSummaryPage');
  static const Key accountSummarySearchBar = Key('accountSummarySearchBar');

  //===========================================================
  //  Account summary details
  //============================================================
  static const Key accountSummaryDetailsAttention =
      Key('accountSummaryDetailsAttention');
  static const Key accountSummaryBankAccountSection =
      Key('accountSummaryBankAccountSection');
  static const Key invoiceCreditDocumentDate = Key('invoiceCreditDocumentDate');

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
  static const Key invoiceItemOrderIdLoadingShimmer =
      Key('invoiceItemOrderIdLoadingShimmer');

  //============================================================
  //  Invoice Details
  //============================================================
  static Key invoiceOrderNumber(String orderNumber) =>
      Key('invoiceOrderNumber$orderNumber');
  static const Key invoiceDetailsPageListView =
      Key('invoiceDetailsPageListView');
  static const Key downloadEInvoiceButton = Key('downloadEInvoiceButton');
  static const Key downloadEInvoiceloadingAnimationWidget =
      Key('downloadEInvoiceloadingAnimationWidget');
  static const Key invoiceDetailSubTotal = Key('invoiceDetailSubTotal');
  static const Key invoiceDetailGrandTotal = Key('invoiceDetailGrandTotal');
  static Key invoiceDetailMaterial(int groupIndex, int index) =>
      Key('invoiceDetailMaterial$groupIndex$index');
  static const Key invoiceDetailMaterialQty = Key('invoiceDetailMaterialQty');
  static const Key invoiceDetailMaterialUnitPrice =
      Key('invoiceDetailMaterialUnitPrice');
  static const Key invoiceDetailMaterialTotalPrice =
      Key('invoiceDetailMaterialTotalPrice');
  static const Key invoiceDetailsOrderNumberLoading =
      Key('invoiceDetailsOrderNumberLoading');
  static const Key invoiceDetailsOrderNumberButton =
      Key('invoiceDetailsOrderNumberButton');
  static const Key invoiceDetailIdAndStatus = Key('invoiceDetailIdAndStatus');
  static const Key invoiceDetailTax = Key('invoiceDetailTax');
  static const Key invoiceDetailTotalSaving = Key('invoiceDetailTotalSaving');
  static const Key invoiceDetailSmallOrderFee =
      Key('invoiceDetailSmallOrderFee');
  static const Key invoiceDetailManualFee = Key('invoiceDetailManualFee');

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
  static const Key creditStatusTag = Key('creditStatusTag');
  static const Key creditDetailCreditTotal = Key('creditDetailCreditTotal');
  static const Key creditDetailSubTotal = Key('creditDetailSubTotal');
  static const Key creditDetailTax = Key('creditDetailTax');
  static const Key creditDetailSmallOrderFee = Key('creditDetailSmallOrderFee');
  static const Key creditDetailManualFee = Key('creditDetailManualFee');

  //===========================================================
  //  Account Summary Page - Full summary
  //============================================================
  static const Key allSummaryPage = Key('allSummaryPage');
  static const Key summaryExpandableSection = Key('summaryExpandableSection');
  static const Key invoiceCreditItem = Key('invoiceCreditItem');

  //===========================================================
  //  Intro Page
  //============================================================
  static const Key introGetStartedButton = Key('getStarted');
  static const Key introSkipButton = Key('skipButton');

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
  static Key viewByItemsOrderDetailOrderCode =
      const Key('viewByItemsOrderDetailOrderCode');
  static Key viewByItemsOrderDetailOrderDate =
      const Key('viewByItemsOrderDetailOrderDate');
  static Key viewByItemsOrderDetailsInvoiceNumberLoading =
      const Key('viewByItemsOrderDetailsInvoiceNumberLoading');
  static Key viewByItemsOrderDetailsInvoiceNumberButton =
      const Key('viewByItemsOrderDetailsInvoiceNumberButton');
  static Key viewByItemsOrderDetailInvoiceNumber =
      const Key('viewByItemsOrderDetailInvoiceNumber');
  static Key viewByItemsOrderDetailPoReference =
      const Key('viewByItemsOrderDetailPoReference');
  static Key viewByItemsOrderDetailsContactPerson =
      const Key('viewByItemsOrderDetailsContactPerson');
  static Key viewByItemsOrderDetailsRequestedDeliveryDate =
      const Key('viewByItemsOrderDetailsRequestedDeliveryDate');
  static Key viewByItemsOrderDetailsContactNumber =
      const Key('viewByItemsOrderDetailsContactNumber');
  static Key viewByItemsOrderDetailsNoAttachments =
      const Key('viewByItemsOrderDetailsNoAttachments');
  static Key viewByItemsOrderDetailsShowMoreAttachments =
      const Key('viewByItemsOrderDetailsShowMoreAttachments');
  static Key viewByItemDetailBuyAgainButton =
      const Key('viewByItemDetailBuyAgainButton');
  static Key viewByItemDetailExpandButton =
      const Key('viewByItemDetailExpandButton');
  static const Key materialListPriceStrikeThrough =
      Key('materialListPriceStrikeThrough');
  static const Key viewByItemsOrderDetailsReferenceNote =
      Key('viewByItemsOrderDetailsReferenceNote');

  //============================================================
  // View By Orders
  //============================================================
  static Key viewByOrdersTabKey = const Key('view by orders');
  static Key viewByOrdersGroupKey = const Key('viewByOrdersGroupKey');
  static Key viewByOrdersGroupList = const Key('viewByOrdersGroupList');
  static Key viewByOrdersItemKey = const Key('viewByOrdersItemKey');
  static Key viewByOrdersCodeLabelKey = const Key('viewByOrdersCodeLabelKey');
  static Key viewByOrdersQtyLabelKey = const Key('viewByOrdersItemQtyLabelKey');
  static Key viewByOrderBuyAgainButtonKey =
      const Key('viewByOrderBuyAgainButtonKey');
  static Key viewByOrderSubtotalKey = const Key('viewByOrderSubtotalKey');
  static Key viewByOrderTaxKey = const Key('viewByOrderTaxKey');
  static Key viewByOrderGrandTotalKey = const Key('viewByOrderGrandTotalKey');
  static Key viewByOrderOrderNumberLoading =
      const Key('viewByOrderOrderNumberLoading');
  static Key viewByOrderOrderNumberButton =
      const Key('viewByOrderOrderNumberButton');
  static Key viewByOrderIdSubtotalKey = const Key('viewByOrderIdSubtotalKey');
  static Key viewByOrderIdTaxKey = const Key('viewByOrderIdTaxKey');
  static Key viewByOrderIdGrandTotalKey =
      const Key('viewByOrderIdGrandTotalKey');
  static Key viewByOrderIdTotalSavingsKey =
      const Key('viewByOrderIdTotalSavingsKey');
  static Key viewByOrderIdManualFeeKey = const Key('viewByOrderIdManualFeeKey');
  static Key viewByOrderIdSmallOrderFeeKey =
      const Key('viewByOrderIdSmallOrderFeeKey');
  static Key viewByOrderStatusKey = const Key('viewByOrderStatusKey');
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
  static Key viewByOrderDetailBundleSection =
      const Key('viewByOrderDetailBundleSection');
  static Key viewByOrderDetailItemsSection =
      const Key('viewByOrderDetailItems');
  static Key viewByOrderDetailOrderDate =
      const Key('viewByOrderDetailOrderDate');
  static Key viewByOrderDetailItem(String materialNumber, bool isBonus) =>
      Key('viewByOrderDetailItem$materialNumber$isBonus');

  //===========================================================
  //  Intro Page
  //============================================================
  static const Key profilePageLanguageDropdown =
      Key('profilePageLanguageDropdown');
  // SOA page
  //============================================================
  static const Key soaNotFoundRecordKey = Key('soaNotFoundRecordKey');
  static const Key soaToDateFieldKey = Key('toDateField');
  static const Key soaFromDateFieldKey = Key('fromDateField');
  static const Key soaLoadingAnimationWidgetKey = Key('loadingAnimationWidget');
  static const Key soaHeaderCustomerCodeKey = Key('soaHeaderCustomerCode');
  static const Key soaFilterBottomSheetKey = Key('soaFilterbottomSheet');
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
  //============================================================
  // Confirm bottom sheet
  //============================================================
  static Key confirmBottomSheet = const Key('confirmBottomSheet');

  //============================================================
  // EZPoint Page
  //============================================================
  static Key ezPointWebviewPage = const Key('ezPointWebviewPage');
  static Key ezPointErrorPage = const Key('ezPointErrorPage');
  //============================================================
  // User guide Page
  //============================================================
  static Key userGuideWebviewPage = const Key('userGuideWebviewPage');
  //============================================================
  // Notification Settings Page
  //============================================================
  static Key notificationSettingsPage = const Key('notificationSettingsPage');
  static Key notificationSettingsClearButton =
      const Key('notificationSettingsClearButton');
  static Key notificationSettingsSubmitButton =
      const Key('notificationSettingsSubmitButton');
  static Key notificationSettingsSuccessSnackBar =
      const Key('notificationSettingsSuccessSnackBar');
  static Key orderConfirmationTile = const Key('orderConfirmationTile');
  static Key paymentConfirmationTile = const Key('paymentConfirmationTile');
  static Key returnConfirmationTile = const Key('returnConfirmationTile');
  //============================================================
  // About Us Page
  //============================================================
  static Key aboutUsHeaderSection = const Key('aboutUsHeaderSection');
  static Key aboutUsCertificationsSection =
      const Key('aboutUsCertificationsSection');
  static Key aboutUsWhoWeAreSection = const Key('aboutUsWhoWeAreSection');
  static Key aboutUsWhyUsSection = const Key('aboutUsWhyUsSection');
  static Key aboutUsOutPartnersSection = const Key('aboutUsOutPartnersSection');
  static Key aboutUsReachUsSection = const Key('aboutUsReachUsSection');
  static Key aboutUsListContent = const Key('aboutUsListContent');
  //============================================================
  // Chat Bot Widget
  //============================================================
  static Key chatBotFloatingActionButton =
      const Key('chatBotFloatingActionButton');

  //============================================================
  // Payment advice Page
  //============================================================
  static Key paymentAdviceScreenLoader = const Key('paymentAdviceScreenLoader');
  static Key paymentBankInAdviceMessage =
      const Key('paymentBankInAdviceMessage');
  static Key paymentGatewayAdviceMessage =
      const Key('paymentGatewayAdviceMessage');
  static Key paymentNeedOpenWebViewIcon =
      const Key('paymentNeedOpenWebViewIcon');
  static Key paymentAdvicePleaseNote = const Key('paymentAdvicePleaseNote');
  static Key paymentAdviceButton = const Key('paymentAdviceButton');
  static Key paymentSummaryButton = const Key('paymentSummaryButton');
  static Key paymentSavePdfButton = const Key('paymentSavePdfButton');
  static Key createAdviceSummary = const Key('createAdviceSummary');
  static Key paymentAdviceNextStep = const Key('paymentAdviceNextStep');
  static Key customerBlockedBanner = const Key('customerBlockedBanner');
  static Key paymentAdviceFailed = const Key('paymentAdviceFailed');
  static Key totalAmountToPay = const Key('totalAmountToPay');

  //============================================================
  // Add Payment Advice Footer
  //============================================================
  static Key addPaymentAdvice = const Key('addPaymentAdvice');
  static Key addPaymentAdviceSaleOrg(String saleOrg) => Key('salesOrg$saleOrg');
  static Key addPaymentAdviceUploadDialog =
      const Key('addPaymentAdviceUploadDialog');
  static Key addPaymentAdvicePhotoUploadButton =
      const Key('addPaymentAdvicePhotoUploadButton');
  static Key addPaymentAdviceFileUploadButton =
      const Key('addPaymentAdviceFileUploadButton');

  //============================================================
  // Edit Payment Advice Footer
  //============================================================

  static Key editPaymentAdviceUploadDialog =
      const Key('editPaymentAdviceUploadDialog');
  static Key editPaymentAdvicePhotoUploadButton =
      const Key('editPaymentAdvicePhotoUploadButton');
  static Key editPaymentAdviceFileUploadButton =
      const Key('editPaymentAdviceFileUploadButton');
  static Key paymentAdviceFooter(int key) => Key('paymentAdviceFooter$key');

  //============================================================
  // Term and Condition dialog
  //============================================================
  static const Key tncDialogAppBar = Key('auptcappBar');
  static const Key tncContentBox = Key('tncConsentBox');
  static const Key privacyContentBox = Key('privacyConsentBox');
  static const Key tncCheckBox = Key('tncCheckBox');
  static const Key privacyCheckBox = Key('privacyCheckBox');
  static const Key tncDialogAcceptButton = Key('auptcAcceptButton');
  static const Key tncDialogCancelButton = Key('tncDialogCancelButton');
}
