import 'package:flutter/material.dart';

class WidgetKeys {
  //============================================================
  //  LOGIN
  //============================================================

  static const Key loginUsernameField = Key('loginUsernameField');
  static const Key loginPasswordField = Key('loginPasswordField');
  static const Key loginPasswordFieldSuffixIcon =
      Key('loginPasswordFieldSuffixIcon');
  static const Key loginRememberPasswordCheckbox =
      Key('loginRememberPasswordCheckbox');
  static const Key loginSubmitButton = Key('loginSubmitButton');
  static const Key ssoLoginButton = Key('ssoLoginButton');

  //============================================================
  //  HOME TAB BAR
  //============================================================

  static const Key homeTabBar = Key('homeTabBar');
  static const Key homeTab = Key('homeTab');
  static const Key productsTab = Key('productsTab');
  static const Key ordersTab = Key('ordersTab');
  static const Key paymentsTab = Key('paymentsTab');
  static const Key moreTab = Key('moreTab');
  static const Key aupTcScreen = Key('aupTcScreen');
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
  //  MaterialListSearch Page Keys
  //============================================================

  static Key materialSearchField(String searchKey) =>
      Key('materialSearchField$searchKey');

  //============================================================
  //  MaterialFilterSearch Page Keys
  //============================================================

  static const Key materialFilterSearchField = Key('materialFilterSearchField');

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
  //  Payment TAB BAR
  //============================================================
  static const Key paymentsTabPage = Key('paymentsTabPage');
  static const Key accountSummaryTab = Key('accountSummaryPage');
  static const Key paymentsSummaryTab = Key('paymentsSummaryPage');
  static const Key statementSummaryTab = Key('statementSummaryPage');

  //============================================================
  //  SearchBar Keys
  //============================================================
  static const Key clearIconKey = Key('clearIconKey');
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
  //  Reset Password
  //============================================================

  static const Key forgotUsernameField = Key('forgotUsernameField');

  //============================================================
  //  BANNER
  //============================================================

  static const Key visibilityDetector = Key('visibilityDetector');

  static const Key homeBanner = Key('homeBanner');
}
