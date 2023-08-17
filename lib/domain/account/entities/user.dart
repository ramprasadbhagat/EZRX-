import 'package:ezrxmobile/domain/account/entities/access_right.dart';
import 'package:ezrxmobile/domain/account/entities/full_name.dart';
import 'package:ezrxmobile/domain/account/entities/payment_notification.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/settings.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/entities/language.dart';
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
    required AccessRight accessRight,
    required Settings settings,
    required bool acceptPrivacyPolicy,
    required bool enableOrderType,
    required bool hasBonusOverride,
    required bool disableCreateOrder,
    required bool disableReturns,
    required bool hasPriceOverride,
    required LanguageValue preferredLanguage,
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
        accessRight: AccessRight.empty(),
        settings: Settings(
          emailNotifications: false,
          mobileNotifications: false,
          languagePreference: LanguageValue(''),
          paymentNotification: PaymentNotification.empty(),
        ),
        acceptPrivacyPolicy: false,
        enableOrderType: false,
        hasBonusOverride: false,
        disableCreateOrder: false,
        disableReturns: false,
        hasPriceOverride: false,
        preferredLanguage: LanguageValue(''),
        supportedLanguages: <Language>[],
        mobileNumber: MobileNumber(''),
      );

  bool get userCanCreateOrder {
    // For Root / ZP admin the it will always return true
    if (role.type.adminOrderAccess) {
      return true;
    }
    // For Return admin/ requestor/ approver the it will always return false
    if (role.type.isReturnRole) {
      return false;
    }
    // For Client admin/user we check the flags
    // [accessRight.orders] should be true & disableCreateOrder should be false
    if (role.type.isCustomer) {
      return accessRight.orders && !disableCreateOrder;
    }

    // For Other user we check only [accessRight.orders]
    return accessRight.orders;
  }

  bool get userCanAccessOrderHistory {
    // For Root / ZP admin the it will always return true
    if (role.type.adminOrderAccess) {
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

  Language get defaultLanguage => Language(subTag: preferredLanguage);
}
