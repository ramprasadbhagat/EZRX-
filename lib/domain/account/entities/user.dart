import 'package:ezrxmobile/domain/account/entities/access_right.dart';
import 'package:ezrxmobile/domain/account/entities/full_name.dart';
import 'package:ezrxmobile/domain/account/entities/payment_notification.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/settings.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const User._();

  const factory User({
    required String id,
    required Username username,
    required EmailAddress email,
    required FullName fullName,
    required Role role,
    required CustomerCode customerCode,
    required List<SalesOrganisation> userSalesOrganisations,
    required List<SalesOrg> salesOrganisations,
    required AccessRight accessRight,
    required Settings settings,
    required bool acceptPrivacyPolicy,
    required bool enableOrderType,
    required bool hasBonusOverride,
    required bool disableCreateOrder,
    required bool disableReturns,
    required bool disablePaymentAccess,
    required bool hasPriceOverride,
    required Language preferredLanguage,
    required List<Language> supportedLanguages,
    required MobileNumber mobileNumber,
  }) = _User;

  factory User.empty() => User(
        id: '',
        username: Username(''),
        email: EmailAddress(''),
        fullName: FullName.empty(),
        role: Role(id: '', name: '', type: RoleType(''), description: ''),
        customerCode: CustomerCode(''),
        userSalesOrganisations: <SalesOrganisation>[],
        salesOrganisations: <SalesOrg>[],
        accessRight: AccessRight.empty(),
        settings: Settings(
          emailNotifications: false,
          mobileNotifications: false,
          languagePreference: Language.english(),
          paymentNotification: PaymentNotification.empty(),
        ),
        acceptPrivacyPolicy: false,
        enableOrderType: false,
        hasBonusOverride: false,
        disableCreateOrder: false,
        disableReturns: false,
        disablePaymentAccess: false,
        hasPriceOverride: false,
        preferredLanguage: Language.english(),
        supportedLanguages: <Language>[],
        mobileNumber: MobileNumber(''),
      );

  bool get userCanCreateOrder {
    // For Root / ZP admin the it will always return true
    if (role.type.hasAdminAccess) {
      return true;
    }
    // For Return admin/ requestor/ approver the it will always return false
    if (role.type.isReturnRole) {
      return false;
    }
    // For Client admin/user we check the flags
    // [accessRight.orders] should be true & disableCreateOrder should be false
    if (role.type.isCustomer) {
      return !disableCreateOrder;
    }

    // For Other user we check only [accessRight.orders]
    return true;
  }

  bool get userCanAccessOrderHistory {
    // For Root / ZP admin the it will always return true
    if (role.type.hasAdminAccess) {
      return true;
    }
    // For Return admin/ requestor/ approver it will always return false
    if (role.type.isReturnRole) {
      return false;
    }

    // For Client admin/user and Other user we only check the flag
    // [accessRight.orders]  should be true
    return accessRight.orders;
  }

  bool get userCanAccessProducts {
    // For Root / ZP admin the it will always return true
    if (role.type.hasAdminAccess) {
      return true;
    }
    // For Return admin/ requestor/ approver it will always return false
    if (role.type.isReturnRole) {
      return false;
    }

    // For Client admin/user and Other user we only check the flag
    // [accessRight.products]  should be true
    return accessRight.products;
  }

  bool get supportMultipleLanguage => supportedLanguages.length > 1;

  String get userPreferredLanguageCode => preferredLanguage.languageCode;

  List<String> get _supportedMarketsForStaticFiles => <String>[
        'ID',
        'KH',
        'VN',
        //TODO: Cover in another ticket
        // 'TW',
        // 'KR',
        // 'TH',
        // 'MM',
      ];

  String get tncFile {
    if (_supportedMarketsForStaticFiles.contains(_userCountry)) {
      return userPreferredLanguageCode == _userCountryLanguage
          ? 'assets/html/${_userCountry.toLowerCase()}/eZRxTermsOfUse${_userCountry}MarketTranslated.html'
          : 'assets/html/${_userCountry.toLowerCase()}/eZRxTermsOfUse${_userCountry}Market.html';
    }

    return 'assets/html/eZRxTermsOfUse.html';
  }

  String get tncStaticFile {
    if (_supportedMarketsForStaticFiles.contains(_userCountry)) {
      return userPreferredLanguageCode == _userCountryLanguage
          ? 'assets/html/${_userCountry.toLowerCase()}/eZRxTermsOfUse${_userCountry}MarketTranslatedStatic.html'
          : 'assets/html/${_userCountry.toLowerCase()}/eZRxTermsOfUse${_userCountry}MarketStatic.html';
    }

    return 'assets/html/eZRxTermsOfUseStatic.html';
  }

  String get privacyPolicyFile {
    if (_supportedMarketsForStaticFiles.contains(_userCountry)) {
      return userPreferredLanguageCode == _userCountryLanguage
          ? 'assets/html/${_userCountry.toLowerCase()}/eZRxPrivacyPolicy${_userCountry}MarketTranslated.html'
          : 'assets/html/${_userCountry.toLowerCase()}/eZRxPrivacyPolicy${_userCountry}Market.html';
    }

    return 'assets/html/eZRxPrivacyPolicy.html';
  }

  String get privacyPolicyStaticFile {
    if (_supportedMarketsForStaticFiles.contains(_userCountry)) {
      return userPreferredLanguageCode == _userCountryLanguage
          ? 'assets/html/${_userCountry.toLowerCase()}/eZRxPrivacyPolicy${_userCountry}MarketTranslatedStatic.html'
          : 'assets/html/${_userCountry.toLowerCase()}/eZRxPrivacyPolicy${_userCountry}MarketStatic.html';
    }

    return 'assets/html/eZRxPrivacyPolicyStatic.html';
  }

  String get _userCountry => userSalesOrganisations.first.salesOrg.country;

  String get _userCountryLanguage =>
      userSalesOrganisations.first.salesOrg.languageCode.toUpperCase();
}
