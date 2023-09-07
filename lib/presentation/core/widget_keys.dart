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
  static const Key scrollToTopArrowIcon = Key('scrollToTopArrowIconKey');
  static const Key nextButton = Key('nextButton');
  static const Key backButton = Key('backButton');

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

  //============================================================
  //  MORE TAB BAR
  //============================================================
  static const Key profileTile = Key('profileTile');
  static const Key paymentsTile = Key('paymentsTile');
  static const Key proxyLoginUserNameField = Key('proxyLoginUserNameField');
  static const Key proxyLoginButton = Key('proxyLoginButton');
  static const Key proxyLoginSheet = Key('proxyLoginSheet');

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
  static Key cartMaterialItemTile(String cartMaterialItemTileKey) =>
      Key(cartMaterialItemTileKey);
  static const Key cartButton = Key('cartButton');
  static const Key counterOfferPriceField = Key('counterOfferPriceField');
  static const Key counterOfferRemarksField = Key('counterOfferRemarksField');
  static const Key bonusSampleItemButtonKey = Key('bonusSampleItemButtonKey');
  static const Key counterOfferPriceButtonKey =
      Key('counterOfferPriceButtonKey');
  static const Key preOrderModel = Key('preOrderModel');

  static const Key bonusOfferItemAddKey = Key('bonusOfferItemAddKey');
  static const Key bonusOfferItemDeleteKey = Key('bonusOfferItemDeleteKey');
  static const Key bonusOfferItemInputKey = Key('bonusOfferItemInputKey');

  static const Key counterOfferDiscountField = Key('counterOfferDiscountField');
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
  static Key searchedProduct(String materialNumber) =>
      Key('searchedProduct$materialNumber');

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
  static const Key invoiceDetailsPageListView =
      Key('invoiceDetailsPageListView');

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
  static const Key orderSuccess = Key('orderSuccessKey');

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
  static const Key materialDetailsAddToCartSnackBar =
      Key('materialDetailsAddToCartSnackBar');
  static const Key materialDetailsSimilarProductItem =
      Key('materialDetailsSimilarProductItem');
  static const Key materialDetailsSimilarProductsSection =
      Key('materialDetailsSimilarProductsSection');
  static const Key materialDetailsCarouselImage =
      Key('materialDetailsCarouselImage');

  //============================================================
  //  bundle Details
  //============================================================
  static const Key bundleImage = Key('bundleImage');
  static const Key bundleDetailsCarousel = Key('bundleDetailsCarousel');

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
  static const Key paymentSummaryAppBar = Key('paymentSummaryAppBar');

  //============================================================
  //  New Payment
  //============================================================
  static const Key newPaymentPage = Key('newPaymentPage');
  static const Key payButton = Key('payButton');
  
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

  //============================================================
  //  Return By Item Page
  //============================================================
  static Key returnItem(String index) => Key('returnItem$index');
  static const Key returnItemTile = Key('returnItemTile');
//============================================================
  //  Return By Request Page
  //============================================================
  static Key returnRequest(String index) => Key('returnRequest$index');
  static const Key headsetMicOutlined = Key('headsetMicOutlined');
  //============================================================
  //  SalesOrgSelection
  //============================================================
  static const Key salesOrgSearch = Key('SalesOrgSearch');

  //  Change Password
  //============================================================
  static const Key currentPasswordField = Key('currentPasswordField');
  static const Key newPasswordTextField = Key('newPasswordTextField');
  static const Key confirmPasswordField = Key('confirmPasswordField');
  static const Key currentPasswordToggle = Key('currentPasswordToggle');
  static const Key newPasswordToggle = Key('newPasswordToggle');
  static const Key confirmPasswordToggle = Key('confirmPasswordToggle');
  static const Key changePasswordButton = Key('changePasswordButton');
  static const Key changePasswordForm = Key('changePasswordForm');

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

  //============================================================
  //  Contact Us Page
  //============================================================
  static const Key userNameKey = Key('userNameKey');
  static const Key emailKey = Key('emailKey');
  static const Key phoneNumberKey = Key('phoneNumberKey');
  static const Key contactMessageKey = Key('contactMessageKey');
  static const Key sendMessageButtonKey = Key('sendMessageButtonKey');

  //============================================================
  //  Payment summary details page
  //============================================================
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


}
