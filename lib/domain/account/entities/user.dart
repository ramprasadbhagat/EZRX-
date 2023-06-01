import 'package:ezrxmobile/domain/account/entities/access_right.dart';
import 'package:ezrxmobile/domain/account/entities/full_name.dart';
import 'package:ezrxmobile/domain/account/entities/payment_notification.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/setting_tc.dart';
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
    required AccessRight accessRight,
    required Settings settings,
    required SettingTc settingTc,
    required bool enableOrderType,
    required bool hasBonusOverride,
    required bool disableCreateOrder,
    required bool disableReturns,
    required bool hasPriceOverride,
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
        settingTc: SettingTc(
          acceptPrivacyPolicy: false,
          acceptPrivacyPolicyTime: DateTime.parse('1970-01-01 00:00:00'),
          privacyPolicyAcceptedPlatform: '',
        ),
        enableOrderType: false,
        hasBonusOverride: false,
        disableCreateOrder: false,
        disableReturns: false,
        hasPriceOverride: false,
      );
}
